package org.fdroid.fdroid.installer;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;

import org.fdroid.fdroid.data.App;
import org.fdroid.fdroid.data.Apk;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import app.fdroidbackends.extension.shizuku.IShizukuInstallService;
import app.fdroidbackends.extension.shizuku.ShizukuInstallService;
import rikka.shizuku.Shizuku;

/**
 * Installs silently through Shizuku (adb/root shell privileges), bypassing F-Droid's own
 * {@code PrivilegedInstaller}/{@code SessionInstaller} entirely. Declared in the same package
 * as {@link Installer} for the same reason as {@link ExternalInstaller}: its constructor and
 * abstract methods are package-private/protected there.
 *
 * {@link InstallerService} runs as a {@code JobIntentService}, so {@link #installPackageInternal}
 * already executes off the main thread and can block synchronously while Shizuku's user service
 * binds and installs.
 */
public class ShizukuInstaller extends Installer {
    private static final int SHIZUKU_PERMISSION_REQUEST_CODE = 0xF6D; // arbitrary, unique-enough
    private static final long BIND_TIMEOUT_SECONDS = 15;
    private static final long PERMISSION_TIMEOUT_SECONDS = 60;

    private static final String DEFAULT_INSTALLER_ACTIVITY =
            "org.fdroid.fdroid.installer.DefaultInstallerActivity";
    private static final String ACTION_UNINSTALL_PACKAGE =
            "org.fdroid.fdroid.installer.DefaultInstaller.action.UNINSTALL_PACKAGE";

    public ShizukuInstaller(Context context, App app, Apk apk) {
        super(context, app, apk);
    }

    @Override
    protected void installPackageInternal(Uri localApkUri, Uri canonicalUri) {
        if (!Shizuku.pingBinder()) {
            sendBroadcastInstall(canonicalUri, ACTION_INSTALL_INTERRUPTED,
                    "Shizuku is not running. Start Shizuku, then retry the install.");
            return;
        }

        if (Shizuku.checkSelfPermission() != PackageManager.PERMISSION_GRANTED) {
            // Block for the result instead of reporting "interrupted" and returning immediately:
            // F-Droid reacts to ACTION_INSTALL_INTERRUPTED by showing its own ErrorDialogActivity,
            // which — launched in the same instant as Shizuku's own permission prompt — steals
            // focus and covers it, so the user never actually sees the Shizuku dialog. Waiting
            // here keeps this JobIntentService's background thread busy (never the main thread)
            // until the user has answered it.
            if (!awaitShizukuPermission()) {
                sendBroadcastInstall(canonicalUri, ACTION_INSTALL_INTERRUPTED,
                        "Shizuku permission was denied or timed out.");
                return;
            }
        }

        String error = installViaShizuku(localApkUri);
        if (error == null) {
            sendBroadcastInstall(canonicalUri, ACTION_INSTALL_COMPLETE);
        } else {
            sendBroadcastInstall(canonicalUri, ACTION_INSTALL_INTERRUPTED, error);
        }
    }

    /** Requests the Shizuku permission and blocks until the user answers it (or times out). */
    private boolean awaitShizukuPermission() {
        CountDownLatch answered = new CountDownLatch(1);
        AtomicReference<Boolean> granted = new AtomicReference<>(false);

        Shizuku.OnRequestPermissionResultListener listener = (requestCode, grantResult) -> {
            if (requestCode == SHIZUKU_PERMISSION_REQUEST_CODE) {
                granted.set(grantResult == PackageManager.PERMISSION_GRANTED);
                answered.countDown();
            }
        };

        Shizuku.addRequestPermissionResultListener(listener);
        try {
            Shizuku.requestPermission(SHIZUKU_PERMISSION_REQUEST_CODE);
            answered.await(PERMISSION_TIMEOUT_SECONDS, TimeUnit.SECONDS);
            return granted.get();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        } finally {
            Shizuku.removeRequestPermissionResultListener(listener);
        }
    }

    private String installViaShizuku(Uri localApkUri) {
        CountDownLatch bound = new CountDownLatch(1);
        AtomicReference<IShizukuInstallService> serviceRef = new AtomicReference<>();

        Shizuku.UserServiceArgs args = new Shizuku.UserServiceArgs(
                new ComponentName(context.getPackageName(), ShizukuInstallService.class.getName()))
                .daemon(false)
                .processNameSuffix("fdroidbackends_shizuku")
                .debuggable(false)
                .version(1);

        ServiceConnection connection = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                serviceRef.set(IShizukuInstallService.Stub.asInterface(binder));
                bound.countDown();
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
                serviceRef.set(null);
            }
        };

        try {
            Shizuku.bindUserService(args, connection);

            if (!bound.await(BIND_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
                return "Timed out connecting to the Shizuku install service.";
            }
            IShizukuInstallService service = serviceRef.get();
            if (service == null) {
                return "Could not connect to the Shizuku install service.";
            }

            try (android.content.res.AssetFileDescriptor afd =
                         context.getContentResolver().openAssetFileDescriptor(localApkUri, "r")) {
                if (afd == null) {
                    return "Could not open the downloaded APK.";
                }
                long size = afd.getLength();
                ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createPipe();

                Thread writer = new Thread(() -> {
                    try (OutputStream pipeOut = new ParcelFileDescriptor.AutoCloseOutputStream(pipe[1]);
                         InputStream apkIn = afd.createInputStream()) {
                        byte[] buffer = new byte[1 << 16];
                        int read;
                        while ((read = apkIn.read(buffer)) != -1) {
                            pipeOut.write(buffer, 0, read);
                        }
                    } catch (IOException ignored) {
                        // The reading side reports failures via its own return value.
                    }
                }, "fdroidbackends-shizuku-writer");
                writer.start();

                String result = service.installFromDescriptor(pipe[0], size, apk.packageName);
                writer.join(BIND_TIMEOUT_SECONDS * 1000);
                return result;
            }
        } catch (Exception e) {
            return "Shizuku install failed: " + e.getMessage();
        } finally {
            try {
                IShizukuInstallService service = serviceRef.get();
                if (service != null) {
                    service.destroy();
                }
            } catch (Exception ignored) {
            }
            Shizuku.unbindUserService(args, connection, true);
        }
    }

    @Override
    protected boolean isUnattended() {
        return true;
    }

    @Override
    protected void uninstallPackage() {
        // Uninstall is unaffected by the chosen install backend; always goes through F-Droid's
        // own system uninstall flow.
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), DEFAULT_INSTALLER_ACTIVITY);
        intent.setAction(ACTION_UNINSTALL_PACKAGE);
        intent.putExtra(EXTRA_APP, app);
        intent.putExtra(EXTRA_APK, apk);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
}
