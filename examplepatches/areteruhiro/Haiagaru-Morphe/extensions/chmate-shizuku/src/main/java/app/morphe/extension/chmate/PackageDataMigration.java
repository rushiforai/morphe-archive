package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Locale;

import rikka.shizuku.Shizuku;

/** UI and client side of the optional Shizuku data migration. */
public final class PackageDataMigration {
    private static final String LOG_TAG = "HaiagaruMigration";
    private static final String LEGACY_EXTERNAL_DATA =
            "/storage/emulated/0/Android/data/jp.co.airfront.android.a2chMate";
    private static final int PERMISSION_REQUEST = 0x4841;

    private PackageDataMigration() {
    }

    public static void addControl(Activity activity, LinearLayout layout) {
        if (originalPackageName().equals(activity.getPackageName())) return;

        TextView description = new TextView(activity);
        description.setText(text(
                "chmate本来のバックアップ/復元を推奨しています。",
                "Using ChMate's built-in backup/restore is recommended."
        ));
        description.setTextSize(13);
        LinearLayout.LayoutParams descriptionParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        descriptionParams.topMargin = dp(activity, 20);
        layout.addView(description, descriptionParams);

        Button button = new Button(activity);
        button.setAllCaps(false);
        resetButton(button);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.topMargin = dp(activity, 8);
        layout.addView(button, params);
        button.setOnClickListener(view -> requestMigration(activity, button));
    }

    private static void requestMigration(Activity activity, Button button) {
        if (!Shizuku.pingBinder()) {
            showMessage(activity, "Shizukuを起動してください", "Start Shizuku first");
            return;
        }
        if (Shizuku.getVersion() < 11) {
            showMessage(activity, "Shizukuを更新してください", "Update Shizuku first");
            return;
        }
        if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
            bindMigrationService(activity, button);
            return;
        }
        if (Shizuku.shouldShowRequestPermissionRationale()) {
            showMessage(activity, "Shizuku権限が拒否されています", "Shizuku permission was denied");
            return;
        }

        final Shizuku.OnRequestPermissionResultListener[] listener =
                new Shizuku.OnRequestPermissionResultListener[1];
        listener[0] = (requestCode, grantResult) -> {
            if (requestCode != PERMISSION_REQUEST) return;
            Shizuku.removeRequestPermissionResultListener(listener[0]);
            if (grantResult == PackageManager.PERMISSION_GRANTED) {
                bindMigrationService(activity, button);
            } else {
                showMessage(
                        activity,
                        "Shizuku権限がありません",
                        "Shizuku permission was not granted"
                );
            }
        };
        Shizuku.addRequestPermissionResultListener(listener[0]);
        Shizuku.requestPermission(PERMISSION_REQUEST);
    }

    private static void bindMigrationService(Activity activity, Button button) {
        File externalFiles = activity.getExternalFilesDir(null);
        File targetRoot = externalFiles == null ? null : externalFiles.getParentFile();
        if (targetRoot == null) {
            showFailure(activity, button, null);
            return;
        }

        button.setEnabled(false);
        button.setText(text("移行中…", "Importing..."));
        Shizuku.UserServiceArgs serviceArgs = new Shizuku.UserServiceArgs(
                new ComponentName(activity, LegacyDataMigrationService.class)
        )
                .processNameSuffix("haiagaru_migration")
                .tag("haiagaru-data-migration")
                .version(1)
                .daemon(false);

        ServiceConnection connection = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                new Thread(() -> {
                    try {
                        ILegacyDataMigrationService service =
                                ILegacyDataMigrationService.Stub.asInterface(binder);
                        service.repairDestinationOwnership(targetRoot.getAbsolutePath());
                        long[] copiedFiles = {0};
                        copyRecursively(service, "", targetRoot.getCanonicalFile(), copiedFiles);
                        Log.i(LOG_TAG, "Imported " + copiedFiles[0] + " shared-data files");
                        activity.runOnUiThread(() -> {
                            showMessage(
                                    activity,
                                    "旧ChMateの共有データをコピーしました",
                                    "Old ChMate shared data was imported"
                            );
                            restart(activity);
                        });
                    } catch (Throwable error) {
                        showFailure(activity, button, error);
                    } finally {
                        try {
                            Shizuku.unbindUserService(serviceArgs, this, true);
                        } catch (Throwable error) {
                            Log.w(LOG_TAG, "Unable to stop the migration user service", error);
                        }
                    }
                }, "Haiagaru-data-migration").start();
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
            }
        };

        try {
            Shizuku.bindUserService(serviceArgs, connection);
        } catch (Throwable error) {
            showFailure(activity, button, error);
        }
    }

    private static void copyRecursively(
            ILegacyDataMigrationService service,
            String relativePath,
            File destinationRoot,
            long[] copiedFiles
    ) throws Exception {
        if (service.isDirectory(relativePath)) {
            File directory = resolveDestination(destinationRoot, relativePath);
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Unable to create " + directory);
            }
            for (String child : service.listChildren(relativePath)) {
                if (child == null || child.isEmpty() || child.equals(".") || child.equals("..")
                        || child.contains("/") || child.contains("\\")) {
                    throw new SecurityException("Unexpected source entry name");
                }
                String childPath = relativePath.isEmpty() ? child : relativePath + "/" + child;
                copyRecursively(service, childPath, destinationRoot, copiedFiles);
            }
            directory.setLastModified(service.lastModified(relativePath));
            return;
        }

        File destination = resolveDestination(destinationRoot, relativePath);
        File parent = destination.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IOException("Unable to create " + parent);
        }
        ParcelFileDescriptor descriptor = service.openFile(relativePath);
        if (descriptor == null) throw new IOException("Unable to open " + relativePath);
        try (BufferedInputStream input = new BufferedInputStream(
                new ParcelFileDescriptor.AutoCloseInputStream(descriptor));
             BufferedOutputStream output = new BufferedOutputStream(
                     new FileOutputStream(destination))) {
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) {
                output.write(buffer, 0, count);
            }
        }
        destination.setLastModified(service.lastModified(relativePath));
        copiedFiles[0]++;
    }

    private static File resolveDestination(File root, String relativePath) throws IOException {
        File destination = relativePath.isEmpty()
                ? root
                : new File(root, relativePath).getCanonicalFile();
        String rootPrefix = root.getPath() + File.separator;
        if (!destination.getPath().equals(root.getPath())
                && !destination.getPath().startsWith(rootPrefix)) {
            throw new SecurityException("Unexpected migration destination");
        }
        return destination;
    }

    private static void showFailure(Activity activity, Button button, Throwable error) {
        if (error != null) Log.e(LOG_TAG, "Legacy external-data migration failed", error);
        activity.runOnUiThread(() -> {
            button.setEnabled(true);
            resetButton(button);
            showMessage(activity, "データ移行に失敗しました", "Data import failed");
        });
    }

    private static void resetButton(Button button) {
        button.setText(text(
                "旧ChMateの共有データを移行 (Shizuku)",
                "Import old ChMate shared data (Shizuku)"
        ));
    }

    private static void restart(Activity activity) {
        Intent intent = new Intent();
        intent.setClassName(activity.getPackageName(), "jp.syoboi.a2chMate.activity.HomeActivity");
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        activity.startActivity(intent);
        new Handler(Looper.getMainLooper()).postDelayed(
                () -> Process.killProcess(Process.myPid()),
                200
        );
    }

    private static void showMessage(Activity activity, String japanese, String english) {
        Toast.makeText(activity, text(japanese, english), Toast.LENGTH_LONG).show();
    }

    private static String text(String japanese, String english) {
        return Locale.JAPANESE.getLanguage().equals(Locale.getDefault().getLanguage())
                ? japanese
                : english;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static String originalPackageName() {
        return new StringBuilder("jp.co.airfront.android.a2ch")
                .append("Mate")
                .toString();
    }
}
