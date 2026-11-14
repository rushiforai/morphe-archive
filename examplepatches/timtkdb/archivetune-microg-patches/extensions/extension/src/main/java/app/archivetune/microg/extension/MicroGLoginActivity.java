package app.archivetune.microg.extension;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.OperationCanceledException;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

/**
 * Transparent activity: shows microG's account picker, then asks microG for a "weblogin:" token for the
 * chosen account (microG shows its consent screen the first time) and hands the resulting URL back to
 * the login WebView.
 */
public final class MicroGLoginActivity extends Activity {
    private static final int REQUEST_CHOOSE_ACCOUNT = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            // Re-created after process death: the login WebView is gone, nothing to continue.
            finish();
            return;
        }

        String accountType = MicroGAuth.findAccountType(this);
        if (accountType == null) {
            Toast.makeText(this, "microG not found", Toast.LENGTH_LONG).show();
            finish();
            return;
        }

        Intent chooser = AccountManager.newChooseAccountIntent(
                null, null, new String[]{accountType}, null, null, null, null);
        startActivityForResult(chooser, REQUEST_CHOOSE_ACCOUNT);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_CHOOSE_ACCOUNT || resultCode != RESULT_OK || data == null) {
            finish(); // Picker dismissed: leave the login screen as it is.
            return;
        }

        String name = data.getStringExtra(AccountManager.KEY_ACCOUNT_NAME);
        String type = data.getStringExtra(AccountManager.KEY_ACCOUNT_TYPE);
        if (name == null || type == null) {
            finish();
            return;
        }
        requestWebLogin(new Account(name, type), 0);
    }

    private void requestWebLogin(Account account, int serviceIndex) {
        String[] services = MicroGAuth.webLoginServices();
        if (serviceIndex >= services.length) {
            MicroGAuth.onWebLoginFailed(this, "microG did not provide a sign-in");
            finish();
            return;
        }

        AccountManager.get(this).getAuthToken(account, services[serviceIndex], null, this, future -> {
            String url = null;
            try {
                url = future.getResult().getString(AccountManager.KEY_AUTHTOKEN);
            } catch (OperationCanceledException e) {
                MicroGAuth.onWebLoginFailed(this, "cancelled");
                finish();
                return;
            } catch (Exception e) {
                Log.w(MicroGAuth.TAG, "weblogin request " + serviceIndex + " failed", e);
            }

            if (url != null && url.startsWith("http") && !url.contains("WILL_NOT_SIGN_IN")) {
                MicroGAuth.onWebLoginUrl(url);
                finish();
            } else {
                requestWebLogin(account, serviceIndex + 1); // try the next token form
            }
        }, null);
    }
}
