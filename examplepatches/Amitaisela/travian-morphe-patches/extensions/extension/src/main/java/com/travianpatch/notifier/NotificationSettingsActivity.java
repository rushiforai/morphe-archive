package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Kept only as the target of a notification's "Alert settings" button (older notifications point here):
 * opens Travian Tools on its Alerts tab and closes itself.
 */
public class NotificationSettingsActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        startActivity(new Intent(this, HubActivity.class)
                .putExtra(HubActivity.EXTRA_TAB, HubActivity.TAB_ALERTS)
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        finish();
    }
}
