package app.morphe.extension.playbooks.gms;

import static app.morphe.extension.playbooks.shared.Text.t;

import android.Manifest;
import android.accounts.Account;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.util.Log;
import android.widget.Toast;

@SuppressWarnings("unused")
public final class GmsCoreSupport {
    private static final String TAG = "BooksPiko";
    private static final String GOOGLE_ACCOUNT_TYPE = "com.google";
    private static final int REQUEST_GET_ACCOUNTS = 0x5b0c;

    private static volatile boolean requestedThisProcess;

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
