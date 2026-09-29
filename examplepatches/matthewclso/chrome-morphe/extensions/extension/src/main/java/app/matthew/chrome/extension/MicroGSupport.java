package app.matthew.chrome.extension;

import android.Manifest;
import android.accounts.Account;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcelable;
import android.os.RemoteException;
import android.provider.Settings;
import android.util.Log;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Account transport only. Chrome remains responsible for scopes, tokens and consent. */
public final class MicroGSupport {
    public static final String PACKAGE = "app.revanced.android.gms";
    public static final String ACCOUNT_TYPE = "app.revanced";
    public static final int PERMISSION_REQUEST = 4812;
    private static final String TAG = "ChromeMorpheAuth";
    private static final ComponentName TOKEN_SERVICE =
            new ComponentName(PACKAGE, "com.google.android.gms.auth.GetToken");
    private MicroGSupport() {}

    // Only the optional MicroG patch enables this entry point.
    public static boolean isPatched() { return false; }

    public static boolean isInstalled(Context context) {
        try {
            return context.getPackageManager().getServiceInfo(TOKEN_SERVICE, 0).enabled;
        } catch (PackageManager.NameNotFoundException ignored) { return false; }
    }

    public static boolean hasAccountPermission(Context context) {
        return context.checkSelfPermission(Manifest.permission.GET_ACCOUNTS) == PackageManager.PERMISSION_GRANTED;
    }

    public static boolean isSupported(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(PACKAGE, 0).getLongVersionCode() >= 255070107L
                    && hasKeyRetrieval(context);
        } catch (PackageManager.NameNotFoundException ignored) { return false; }
    }

    public static boolean hasKeyRetrieval(Context context) {
        return !context.getPackageManager().queryIntentServices(new Intent(
                PACKAGE + ".auth.key.retrieval.service.START").setPackage(PACKAGE), 0).isEmpty();
    }

    public static void ensureAvailable(Context context) throws IOException {
        if (!isInstalled(context)) throw new IOException("MicroG account service is unavailable");
        if (!isSupported(context)) throw new IOException("Morphe MicroG 7.1.1 or newer is required");
    }

    public static void requestAccountPermission(Activity activity) {
        activity.requestPermissions(new String[] {Manifest.permission.GET_ACCOUNTS}, PERMISSION_REQUEST);
    }

    public static Account providerAccount(Account account) {
        return new Account(account.name, ACCOUNT_TYPE);
    }

    public static void showPasswordManager(Context context) {
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle("Google Password Manager")
                .setMessage("Open Android password settings, select Google, then Google Password Manager to view or manage saved passwords. You can also use Google's password website.")
                .setPositiveButton("Android settings", (d, which) -> {
                    // Android's settings app opens the provider's protected management
                    // UI with its own authority. Do not call that activity directly.
                    Intent intent = new Intent(Settings.ACTION_CREDENTIAL_PROVIDER,
                            Uri.parse("package:com.google.android.gms"))
                            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    try {
                        context.startActivity(intent);
                    } catch (ActivityNotFoundException unavailable) {
                        context.startActivity(new Intent(Settings.ACTION_SETTINGS)
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    }
                })
                .setNeutralButton("Open website", (d, which) -> {
                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://passwords.google.com/"))
                            .setPackage(context.getPackageName()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                })
                .setNegativeButton(android.R.string.cancel, null).create();
        BlackTheme.showDialog(dialog);
    }

    public static Account[] accounts(Context context) throws RemoteException {
        if (!hasAccountPermission(context)) return new Account[0];
        if (!isInstalled(context)) throw new RemoteException("MicroG account service is unavailable");
        if (!isSupported(context)) throw new RemoteException("Morphe MicroG 7.1.1 or newer is required");
        try {
            Bundle result = context.getContentResolver().call(
                    Uri.parse("content://" + PACKAGE + ".auth.accounts"), "get_accounts", ACCOUNT_TYPE, null);
            if (result == null) throw new RemoteException("Missing MicroG account response");
            Parcelable[] values = result.getParcelableArray("accounts");
            if (values == null) throw new RemoteException("Missing MicroG accounts field");
            ArrayList<Account> accounts = new ArrayList<>();
            for (Parcelable value : values) {
                if (value instanceof Account && ACCOUNT_TYPE.equals(((Account) value).type)) {
                    // Chromium's identity model uses com.google. Only Android authenticator
                    // operations use the provider's account type; names and real Gaia IDs stay intact.
                    accounts.add(new Account(((Account) value).name, "com.google"));
                } else throw new RemoteException("Unexpected MicroG account type");
            }
            return accounts.toArray(new Account[0]);
        } catch (RuntimeException failure) {
            // Provider exceptions can contain account details: never log their messages or bundles.
            Log.w(TAG, "MicroG account lookup failed: " + failure.getClass().getSimpleName());
            // Chrome retries RemoteException and retains its previous account list. A failed
            // provider request must not look like an intentional removal of every account.
            throw new RemoteException("MicroG account lookup failed");
        }
    }

    public static Object withAuth(Context context, Object request) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) throw new IOException("Account requests require a worker thread");
        Context app = context.getApplicationContext();
        ensureAvailable(app);
        CountDownLatch ready = new CountDownLatch(1);
        IBinder[] service = new IBinder[1];
        ServiceConnection connection = new ServiceConnection() {
            @Override public void onServiceConnected(ComponentName name, IBinder binder) {
                service[0] = binder;
                ready.countDown();
            }
            @Override public void onServiceDisconnected(ComponentName name) {}
            @Override public void onNullBinding(ComponentName name) { ready.countDown(); }
            @Override public void onBindingDied(ComponentName name) { ready.countDown(); }
        };
        boolean bound = false;
        try {
            bound = app.bindService(new Intent().setComponent(TOKEN_SERVICE), connection, Context.BIND_AUTO_CREATE);
            if (!bound) throw new IOException("Could not bind MicroG account service");
            if (!ready.await(15, TimeUnit.SECONDS) || service[0] == null) {
                throw new IOException("MicroG account service did not connect");
            }
            // The original Chrome callback keeps parcel decoding and recoverable consent errors.
            return NativeBridge.microGAuthRequest(request, service[0]);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new IOException("MicroG connection interrupted");
        } catch (SecurityException denied) {
            throw new IOException("MicroG account service denied access");
        } catch (RemoteException disconnected) {
            // Match GoogleAuthUtil's transport contract so Chrome retries binder loss.
            throw new IOException("MicroG account service disconnected");
        } finally {
            if (bound) app.unbindService(connection);
        }
    }
}
