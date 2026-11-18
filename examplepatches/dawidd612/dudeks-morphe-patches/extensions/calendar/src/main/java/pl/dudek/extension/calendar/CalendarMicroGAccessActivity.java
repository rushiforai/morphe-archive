package pl.dudek.extension.calendar;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.app.Activity;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;
import java.util.ArrayList;

/** Obtain real Calendar consent, rather than adding an already-existing Google account. */
public final class CalendarMicroGAccessActivity extends Activity {
    private static final String MICROG = "app.revanced.android.gms";
    private static final String ACCOUNT_TYPE = "app.revanced";
    private static final String SCOPE = "oauth2:https://www.googleapis.com/auth/calendar";
    private static final String NATIVE = "com.android.calendar.event.LaunchInfoActivity";
    private static final int CHOOSE = 6105;
    private static final String CHOOSING = "dudeks.microgChoosing";
    private Flow flow;

    private static final class Flow {
        CalendarMicroGAccessActivity owner;
        Account account;
        AccountManagerFuture<Bundle> future;
        boolean complete;
        boolean choosing;
    }

    public static boolean launchIfEnabled(Activity activity, Intent original) {
        try {
            Bundle meta = activity.getPackageManager().getApplicationInfo(
                activity.getPackageName(), PackageManager.GET_META_DATA).metaData;
            if (meta == null || !MICROG.equals(meta.getString("app.revanced.MICROG_PACKAGE_NAME"))) return false;
            Intent intent = new Intent(original);
            intent.setComponent(new ComponentName(activity, CalendarMicroGAccessActivity.class));
            activity.startActivity(intent);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    /** Selected by the MicroG patch only; replaces both branches of the native sign-in button. */
    public static void signIn(View view) {
        Context context = view.getContext();
        Intent intent = new Intent(context, CalendarMicroGAccessActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        flow = (Flow) getLastNonConfigurationInstance();
        if (flow != null) {
            flow.owner = this;
            if (flow.complete) complete();
            return;
        }
        flow = new Flow();
        flow.owner = this;
        flow.choosing = state != null && state.getBoolean(CHOOSING, false);
        if (flow.choosing) return;
        chooseOrAuthorize();
    }

    @Override public Object onRetainNonConfigurationInstance() { return flow; }
    @Override protected void onDestroy() {
        if (flow != null && flow.owner == this) flow.owner = null;
        super.onDestroy();
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean(CHOOSING, flow.choosing);
        super.onSaveInstanceState(state);
    }

    private ArrayList<Account> matchingAccounts() {
        ArrayList<Account> allowed = new ArrayList<>();
        for (Account account : AccountManager.get(this).getAccountsByType("com.google")) {
            allowed.add(new Account(account.name, ACCOUNT_TYPE));
        }
        return allowed;
    }

    private void chooseOrAuthorize() {
        try {
            getPackageManager().getApplicationInfo(MICROG, 0);
            ArrayList<Account> allowed = matchingAccounts();
            if (allowed.isEmpty()) {
                fail("Najpierw wybierz konto Google w Kalendarzu.");
                return;
            }
            Account selected = null;
            int count = 0;
            for (Account candidate : AccountManager.get(this).getAccountsByType(ACCOUNT_TYPE)) {
                if (allowed.contains(candidate)) { selected = candidate; count++; }
            }
            if (count == 1) { authorize(selected); return; }
            flow.choosing = true;
            // Constructed accounts restrict the framework picker even when MicroG
            // account visibility has not yet been granted to this application.
            startActivityForResult(AccountManager.newChooseAccountIntent(null, allowed,
                new String[]{ACCOUNT_TYPE}, "Wybierz to samo konto w microG-RE", null, null, null), CHOOSE);
        } catch (PackageManager.NameNotFoundException exception) {
            fail("Wymagane jest microG-RE 7.1.1 lub nowsze.");
        } catch (RuntimeException exception) {
            fail("Nie mozna otworzyc konta microG: " + exception.getClass().getSimpleName());
        }
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != CHOOSE) return;
        flow.choosing = false;
        if (result != RESULT_OK || data == null) { finish(); return; }
        String name = data.getStringExtra(AccountManager.KEY_ACCOUNT_NAME);
        String type = data.getStringExtra(AccountManager.KEY_ACCOUNT_TYPE);
        if (name == null || !ACCOUNT_TYPE.equals(type)) { fail("Nie wybrano konta microG."); return; }
        Account selected = new Account(name, type);
        try {
            boolean visible = false;
            for (Account account : AccountManager.get(this).getAccountsByType(ACCOUNT_TYPE)) {
                if (selected.equals(account)) visible = true;
            }
            if (!visible || !matchingAccounts().contains(selected)) {
                fail("Konto microG musi odpowiadac kontu Google w Kalendarzu.");
                return;
            }
            authorize(selected);
        } catch (RuntimeException exception) {
            fail("Nie udostepniono konta microG Kalendarzowi.");
        }
    }

    private void authorize(Account account) {
        flow.account = account;
        Flow pending = flow;
        try {
            // AccountManager launches the authenticator's real consent/recovery UI.
            // Never log or persist the token, account name or exception message.
            flow.future = AccountManager.get(this).getAuthToken(account, SCOPE, null, this, future -> {
                pending.future = future;
                pending.complete = true;
                if (pending.owner != null) pending.owner.complete();
            }, null);
        } catch (RuntimeException exception) {
            fail("microG: nie mozna uzyskac zgody: " + exception.getClass().getSimpleName());
        }
    }

    private void complete() {
        if (isFinishing()) return;
        try {
            Bundle result = flow.future.getResult();
            String token = result == null ? null : result.getString(AccountManager.KEY_AUTHTOKEN);
            if (token == null || token.isEmpty()) { fail("microG nie zwrocilo tokenu Kalendarza."); return; }
            // Request real synchronization; don't modify sync settings or local data.
            Bundle extras = new Bundle();
            extras.putBoolean(ContentResolver.SYNC_EXTRAS_MANUAL, true);
            Account google = new Account(flow.account.name, "com.google");
            ContentResolver.requestSync(google, "com.android.calendar", extras);
            ContentResolver.requestSync(google, "com.google.android.calendar", extras);
            Toast.makeText(this, "microG: uzyskano dostep do Kalendarza.", Toast.LENGTH_LONG).show();
            openNative();
        } catch (Exception exception) {
            // Only the category is shown; provider messages may contain credentials.
            fail("Autoryzacja microG nie powiodla sie: " + exception.getClass().getSimpleName());
        }
    }

    private void openNative() {
        Intent intent = new Intent(getIntent());
        intent.setComponent(new ComponentName(this, NATIVE));
        startActivity(intent);
        finish();
    }

    private void fail(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
        // Authentication failure must leave independent native/offline use available.
        openNative();
    }
}
