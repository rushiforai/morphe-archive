package pl.dudek.extension.calendar;

import android.accounts.AccountManager;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

/** Ask Android to reveal an existing account before native Calendar lists it. */
public final class CalendarAccountAccessActivity extends Activity {
    private static final int CHOOSE_ACCOUNT = 6104;
    private static final String WAITING = "dudeks.waitingForAccount";
    private boolean waiting;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        waiting = state != null && state.getBoolean(WAITING, false);
        if (!waiting) route();
    }

    @Override protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        if (!waiting) route();
    }

    private boolean hasVisibleGoogleAccount() {
        try {
            return AccountManager.get(this).getAccountsByType("com.google").length != 0;
        } catch (RuntimeException exception) {
            return false;
        }
    }

    private void route() {
        if (hasVisibleGoogleAccount()) {
            openCalendar();
            return;
        }
        try {
            Intent chooser = AccountManager.newChooseAccountIntent(
                null, null, new String[]{"com.google"}, null, null, null, null);
            waiting = true;
            startActivityForResult(chooser, CHOOSE_ACCOUNT);
        } catch (RuntimeException exception) {
            // A broken/unavailable system chooser must not prevent native use.
            waiting = false;
            openCalendar();
        }
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean(WAITING, waiting);
        super.onSaveInstanceState(state);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != CHOOSE_ACCOUNT) return;
        waiting = false;
        // A success-looking result alone is not proof of account visibility.
        if (result == RESULT_OK && hasVisibleGoogleAccount()) {
            openCalendar();
        } else {
            if (result == RESULT_OK) {
                Toast.makeText(this, "Nie udalo sie udostepnic konta Kalendarzowi.", Toast.LENGTH_LONG).show();
            }
            finish();
        }
    }

    private void openCalendar() {
        if (CalendarMicroGAccessActivity.launchIfEnabled(this, getIntent())) {
            finish();
            return;
        }
        Intent original = new Intent(getIntent());
        original.setComponent(new ComponentName(this, "com.android.calendar.event.LaunchInfoActivity"));
        startActivity(original);
        finish();
    }
}
