package app.matthew.chrome.extension;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/** A private in-app settings destination reachable even when the toolbar button is hidden. */
public final class MorpheSettingsActivity extends Activity {
    private int foreground, secondary;
    private TextView microGStatus;
    @Override public void onCreate(Bundle state) {
        boolean dark = NativeBridge.themeSetting() == 2 || (NativeBridge.themeSetting() == 0
                && (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        foreground = dark ? Color.WHITE : Color.rgb(32,33,36);
        secondary = dark ? Color.LTGRAY : Color.DKGRAY;
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(dark ? (PatchSettings.enabled(PatchSettings.BLACK) ? Color.BLACK : Color.rgb(32,33,36)) : Color.WHITE);
        page.setOnApplyWindowInsetsListener((v, insets) -> {
            android.graphics.Insets edges = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            v.setPadding(edges.left, edges.top, edges.right, edges.bottom);
            return insets;
        });
        LinearLayout bar = new LinearLayout(this);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        Button back = new Button(this);
        back.setText("‹"); back.setTextSize(28); back.setContentDescription("Back");
        back.setTextColor(foreground);
        android.util.TypedValue feedback = new android.util.TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, feedback, true);
        back.setBackgroundResource(feedback.resourceId);
        back.setOnClickListener(v -> finish());
        bar.addView(back, new LinearLayout.LayoutParams(dp(56), dp(56)));
        TextView heading = new TextView(this); heading.setText("Morphe settings");
        heading.setTextSize(22); heading.setTextColor(foreground);
        bar.addView(heading); page.addView(bar);
        ScrollView scroll = new ScrollView(this);
        LinearLayout rows = new LinearLayout(this); rows.setOrientation(LinearLayout.VERTICAL);
        rows.setPadding(dp(20), dp(12), dp(20), dp(20));
        add(rows, "Incognito address bar button", "Switch between regular and Incognito tabs from the address bar.", PatchSettings.BUTTON);
        add(rows, "Black mode", "Use pure black backgrounds with Chrome’s dark theme.", PatchSettings.BLACK);
        add(rows, "True bottom address bar", "Keep the address bar, tab-view controls and tab search at the bottom.", PatchSettings.BOTTOM);
        add(rows, "Remember last browsing mode", "Reopen Chrome and full-browser links in the mode you last used: regular or Incognito. Embedded browser windows keep their usual behavior.", PatchSettings.REMEMBER_MODE);
        if (MicroGSupport.isPatched()) {
            TextView title = new TextView(this);
            title.setText("MicroG sign-in"); title.setTextSize(18); title.setTextColor(foreground);
            rows.addView(title);
            microGStatus = new TextView(this);
            microGStatus.setTextColor(secondary); microGStatus.setPadding(0, dp(8), 0, dp(8));
            rows.addView(microGStatus);
            Button setup = new Button(this); setup.setText("Allow account access");
            setup.setOnClickListener(v -> {
                if (!MicroGSupport.hasAccountPermission(this)) MicroGSupport.requestAccountPermission(this);
                else { NativeBridge.refreshMicroGAccounts(); updateMicroGStatus(); }
            });
            rows.addView(setup);
        }
        scroll.addView(rows); page.addView(scroll); setContentView(page);
    }
    @Override public void onResume() {
        super.onResume();
        if (microGStatus != null) {
            updateMicroGStatus();
            if (MicroGSupport.hasAccountPermission(this)) NativeBridge.refreshMicroGAccounts();
        }
    }
    @Override public void onRequestPermissionsResult(int request, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(request, permissions, results);
        if (request == MicroGSupport.PERMISSION_REQUEST) {
            updateMicroGStatus();
            if (MicroGSupport.hasAccountPermission(this)) NativeBridge.refreshMicroGAccounts();
        }
    }
    private void updateMicroGStatus() {
        if (microGStatus == null) return;
        microGStatus.setText(!MicroGSupport.isInstalled(this)
                ? "Install Morphe MicroG before signing in."
                : !MicroGSupport.isSupported(this)
                ? "Update Morphe MicroG to 7.1.1 or newer before signing in. Older versions return incorrect account capabilities and lack encrypted-data verification."
                : !MicroGSupport.hasAccountPermission(this)
                ? "Allow account access, then return to Chrome settings and choose Sign in. Android lists this permission under Contacts."
                : "Account access is enabled. Return to Chrome settings and choose Sign in. Add account uses MicroG and may require a separate Google login.");
    }
    private void add(LinearLayout parent, String title, String summary, String key) {
        Switch control = new Switch(this);
        control.setText(title); control.setTextSize(17); control.setTextColor(foreground);
        control.setMinHeight(dp(56)); control.setChecked(PatchSettings.enabled(key));
        control.setOnCheckedChangeListener((button, checked) -> {
            PatchSettings.set(key, checked);
            if (PatchSettings.BLACK.equals(key)) recreate();
        });
        parent.addView(control, new LinearLayout.LayoutParams(-1, -2));
        TextView detail = new TextView(this); detail.setText(summary); detail.setTextColor(secondary);
        detail.setTextSize(14); detail.setPadding(0, 0, 0, dp(24)); parent.addView(detail);
    }
    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
