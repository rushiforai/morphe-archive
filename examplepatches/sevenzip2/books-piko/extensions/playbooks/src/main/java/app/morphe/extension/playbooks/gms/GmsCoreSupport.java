package app.morphe.extension.playbooks.gms;

import static app.morphe.extension.playbooks.shared.Text.t;

import android.Manifest;
import android.accounts.Account;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;
import android.widget.Toast;

@SuppressWarnings("unused")
public final class GmsCoreSupport {
    private static final String TAG = "BooksPiko";
    private static final String GOOGLE_ACCOUNT_TYPE = "com.google";
    private static final String GOOGLE_PLAY_SERVICES_PACKAGE = "com.google.android.gms";
    private static final int REQUEST_GET_ACCOUNTS = 0x5b0c;

    private static volatile boolean requestedThisProcess;
    private static volatile Context appContext;

    private GmsCoreSupport() {
    }

    /**
     * Injected at the start of AppSingleton.getAccountComponent(Account).
     * Google and GmsCore accounts with the same e-mail must share one account component,
     * because the component's DataStore files are keyed by e-mail only.
     */
    public static Account normalizeAccount(Account account, String gmsCoreAccountType) {
        if (account != null && GOOGLE_ACCOUNT_TYPE.equals(account.type)) {
            return new Account(account.name, gmsCoreAccountType);
        }
        return account;
    }

    /**
     * Replaces the app's query for supervised (Family Link) accounts.
     * Google Play services refuses that query from the re-signed app, and the app then assumes a
     * supervised account and hides Shop, Wishlist and the Shelves tab. GmsCore cannot tell
     * supervised accounts apart, so report none.
     */
    public static Account[] supervisedAccounts() {
        return new Account[0];
    }

    /** Package of the GmsCore the app was patched for. Replaced by the patch. */
    static String gmsCorePackage() {
        return "app.revanced.android.gms";
    }

    /**
     * Injected where the account picker intent is built, for its CHOOSE_ACCOUNT actions.
     * ReVanced GmsCore handles Google's action; MicroG RE handles it only under its own package
     * ("app.revanced.android.gms.common.account.CHOOSE_ACCOUNT"). Use whichever GmsCore handles.
     */
    public static String accountPickerAction(String action) {
        try {
            Context context = context();
            if (context == null || action == null || !action.startsWith(GOOGLE_PLAY_SERVICES_PACKAGE + ".")) {
                return action;
            }
            String gmsCore = gmsCorePackage();
            if (handles(context, gmsCore, action)) return action;
            String vendorAction = gmsCore + action.substring(GOOGLE_PLAY_SERVICES_PACKAGE.length());
            if (handles(context, gmsCore, vendorAction)) {
                Log.i(TAG, "Account picker action: " + vendorAction);
                return vendorAction;
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "Account picker action lookup failed", throwable);
        }
        return action;
    }

    /** The application context, also before the first activity resumed. */
    private static Context context() {
        Context context = appContext;
        if (context != null) return context;
        try {
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (application instanceof Context) appContext = (Context) application;
        } catch (Throwable throwable) {
            Log.w(TAG, "Application context not available", throwable);
        }
        return appContext;
    }

    private static boolean handles(Context context, String packageName, String action) {
        Intent intent = new Intent(action).setPackage(packageName);
        return !context.getPackageManager()
                .queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY).isEmpty();
    }

    /**
     * Injected after super.onResume() of the base activity.
     * GmsCore only lists accounts to apps holding GET_ACCOUNTS, a runtime permission.
     * Without it the app finds no account and stays on the sign-in screen.
     *
     * @return true if the permission was just requested. The caller then skips the rest of
     * onResume(), which would otherwise open the account picker on top of the permission dialog.
     * onResume() runs again once the dialog closes. The permission is requested once per process,
     * so a denial does not block the app.
     */
    public static boolean onActivityResumed(Activity activity) {
        try {
            if (appContext == null) appContext = activity.getApplicationContext();
            if (activity.checkSelfPermission(Manifest.permission.GET_ACCOUNTS)
                    == PackageManager.PERMISSION_GRANTED) {
                return false;
            }
            if (requestedThisProcess) return false;
            requestedThisProcess = true;

            Toast.makeText(activity, t(
                    "GmsCore 계정으로 로그인하려면 '연락처' 권한을 허용하세요.",
                    "Allow the Contacts permission to sign in with your GmsCore account."),
                    Toast.LENGTH_LONG).show();
            activity.requestPermissions(new String[]{Manifest.permission.GET_ACCOUNTS}, REQUEST_GET_ACCOUNTS);
            return true;
        } catch (Throwable throwable) {
            Log.e(TAG, "GET_ACCOUNTS request failed", throwable);
            return false;
        }
    }
}
