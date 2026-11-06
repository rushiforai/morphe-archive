package com.openbubbles.wear.patch;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/** An app-private screen reached from OpenBubbles Settings → Morphe patches. */
public final class PatchSettingsActivity extends Activity {
    private Switch readyNotificationToggle;

    @Override
    public void onCreate(Bundle state) {
        boolean dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        setTitle("Morphe patches");
        int padding = Math.round(24 * getResources().getDisplayMetrics().density);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(padding, padding, padding, padding);
        content.setOnApplyWindowInsetsListener((view, insets) -> {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            view.setPadding(padding + bars.left, padding + bars.top, padding + bars.right, padding + bars.bottom);
            return insets;
        });
        Button back = new Button(this);
        back.setText("Back to OpenBubbles");
        back.setOnClickListener(view -> finish());
        content.addView(back);
        TextView title = new TextView(this);
        title.setText("Morphe patches");
        title.setTextSize(26);
        title.setPadding(0, padding, 0, padding);
        content.addView(title);
        boolean hasBridge;
        try {
            getPackageManager().getServiceInfo(new android.content.ComponentName(this,
                    "com.openbubbles.wear.bridge.WearBridgeService"), 0);
            hasBridge = true;
        } catch (android.content.pm.PackageManager.NameNotFoundException e) {
            hasBridge = false;
        }
        if (hasBridge) {
        Switch toggle = new Switch(this);
        toggle.setText("Wear companion bridge");
        toggle.setTextSize(18);
        toggle.setMinHeight(Math.round(56 * getResources().getDisplayMetrics().density));
        toggle.setChecked(PatchSettings.isEnabled(this));
        toggle.setOnCheckedChangeListener((button, enabled) -> PatchSettings.setEnabled(this, enabled));
        content.addView(toggle);
        TextView detail = new TextView(this);
        detail.setText("Show OpenBubbles chats and recent history on your watch, view downloaded images, and send replies through your phone. Changes apply immediately.");
        detail.setTextSize(16);
        detail.setPadding(0, padding, 0, 0);
        content.addView(detail);
        }
        readyNotificationToggle = new Switch(this);
        readyNotificationToggle.setText("Hide ready-to-receive notification");
        readyNotificationToggle.setTextSize(18);
        readyNotificationToggle.setMinHeight(Math.round(56 * getResources().getDisplayMetrics().density));
        readyNotificationToggle.setChecked(PatchSettings.isReadyNotificationHidden(this));
        readyNotificationToggle.setOnClickListener(view -> {
            readyNotificationToggle.setChecked(PatchSettings.isReadyNotificationHidden(this));
            try {
                PatchSettings.openReadyNotificationSettings(this);
            } catch (android.content.ActivityNotFoundException error) {
                android.widget.Toast.makeText(this, "Notification channel settings are unavailable on this device.",
                        android.widget.Toast.LENGTH_LONG).show();
            }
        });
        content.addView(readyNotificationToggle);
        TextView notificationDetail = new TextView(this);
        notificationDetail.setText("Opens Android's Background connection settings. Turn that channel off to hide \"Ready for messages\", or on to show it. This switch reflects Android's setting. Message notifications and the Wear bridge have separate controls.");
        notificationDetail.setTextSize(16);
        notificationDetail.setPadding(0, padding, 0, padding);
        content.addView(notificationDetail);
        if (hasBridge) {
        Button contacts = new Button(this);
        contacts.setText("Allow contacts access");
        contacts.setOnClickListener(view -> requestPermissions(new String[]{android.Manifest.permission.READ_CONTACTS}, 42));
        content.addView(contacts);
        Button clearCache = new Button(this);
        clearCache.setText("Clear bridge cache");
        clearCache.setOnClickListener(view -> {
            try {
                PatchSettings.clearCache(this);
                android.widget.Toast.makeText(this, "Bridge cache cleared", android.widget.Toast.LENGTH_SHORT).show();
            } catch (RuntimeException error) {
                android.util.Log.w("OBWearPatch", "Unable to clear bridge cache", error);
            }
        });
        content.addView(clearCache);
        TextView diagnostics = new TextView(this);
        diagnostics.setText(PatchSettings.diagnostics(this));
        diagnostics.setTextSize(14);
        diagnostics.setPadding(0, padding, 0, 0);
        content.addView(diagnostics);
        TextView testNotificationDetail = new TextView(this);
        testNotificationDetail.setText("Shows a fake message in 10 seconds. Lock your phone to test watch alerts, or leave it unlocked to test watch silence. No message is sent.");
        testNotificationDetail.setTextSize(16);
        testNotificationDetail.setPadding(0, padding, 0, 0);
        content.addView(testNotificationDetail);
        Button testNotification = new Button(this);
        testNotification.setText("Send test notification");
        testNotification.setOnClickListener(view -> android.widget.Toast.makeText(this,
                TestNotifications.schedule(this), android.widget.Toast.LENGTH_LONG).show());
        content.addView(testNotification);
        }
        ScrollView scroll = new ScrollView(this);
        scroll.addView(content);
        setContentView(scroll);
    }

    @Override
    protected void onResume() {
        super.onResume();
        readyNotificationToggle.setChecked(PatchSettings.isReadyNotificationHidden(this));
    }
}
