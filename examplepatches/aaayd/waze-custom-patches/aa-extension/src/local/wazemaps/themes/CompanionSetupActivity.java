package local.wazemaps.themes;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.view.*;
import android.widget.*;

/** Visible, cancellable Android confirmation flow; no silent package installs. */
public final class CompanionSetupActivity extends Activity {
    private static final int ALLOW = 41, INSTALL = 42;
    private TextView status;
    private Button action;
    private boolean busy;
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(24 * getResources().getDisplayMetrics().density);
        content.setPadding(pad, pad, pad, pad);
        ScrollView scroll = new ScrollView(this); scroll.addView(content); setContentView(scroll);
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            }
            return insets;
        });
        TextView title = new TextView(this); title.setText("Android Auto setup"); title.setTextSize(26); content.addView(title);
        status = new TextView(this); status.setTextSize(17); status.setPadding(0, pad, 0, pad); content.addView(status);
        action = new Button(this); action.setAllCaps(false); content.addView(action);
        action.setOnClickListener(view -> proceed());
        TextView note = new TextView(this);
        note.setText("The companion is included in this Waze patch. Android will ask you to confirm its installation.\n\nIn Waze AA Installer, start or authorise Shizuku and tap Repair Android Auto visibility. Confirm the Waze update, then check Android Auto’s launcher.\n\nFor future patches, choose Waze AA Installer in Morphe’s installer chooser.");
        note.setPadding(0, pad, 0, pad); content.addView(note);
        Button done = new Button(this); done.setText("Back to Waze"); done.setAllCaps(false);
        done.setOnClickListener(view -> finish()); content.addView(done);
    }
    protected void onResume() { super.onResume(); if (!busy) render(null); }
    private void render(String message) {
        long installed = CompanionInstaller.installed(this);
        status.setText(message != null ? message : installed == -2 ? "An installer with a different signing key is already installed. It cannot be updated with this copy." :
            installed >= CompanionInstaller.VERSION ? "Waze AA Installer is installed. Open it to finish Android Auto setup." :
            installed >= 0 ? "An updated Waze AA Installer is included." : "Install the included Waze AA Installer to continue.");
        action.setText(installed >= CompanionInstaller.VERSION ? "Open Waze AA Installer" : installed >= 0 ? "Update Waze AA Installer" : "Install Waze AA Installer");
        action.setEnabled(!busy && installed != -2 && Build.VERSION.SDK_INT >= 30);
        if (Build.VERSION.SDK_INT < 30) status.setText("Phone-only setup requires Android 11 or later.");
    }
    private void openCompanion() {
        if (CompanionInstaller.installed(this) < CompanionInstaller.VERSION) { render(null); return; }
        try {
            startActivity(new Intent().setComponent(new ComponentName(CompanionInstaller.PACKAGE, "local.waze.aainstaller.InstallerActivity")));
            finish();
        } catch (Exception error) { render("Could not open Waze AA Installer. Try its app icon."); }
    }
    private void proceed() {
        if (busy) return;
        long installed = CompanionInstaller.installed(this);
        if (installed == -2) { render(null); return; }
        if (installed >= CompanionInstaller.VERSION) { openCompanion(); return; }
        if (!getPackageManager().canRequestPackageInstalls()) {
            try {
                startActivityForResult(new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:" + getPackageName())), ALLOW);
            } catch (Exception error) { render("Allow Waze to install apps in Android settings, then retry."); }
            return;
        }
        busy = true; render("Preparing the included installer…");
        new Thread(() -> {
            try {
                CompanionApkProvider.stage(this);
                runOnUiThread(() -> {
                    busy = false;
                    if (isFinishing() || isDestroyed()) return;
                    try {
                        Intent intent = new Intent(Intent.ACTION_INSTALL_PACKAGE)
                            .setDataAndType(CompanionApkProvider.URI, CompanionApkProvider.MIME)
                            .setPackage("com.google.android.packageinstaller")
                            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            .putExtra(Intent.EXTRA_RETURN_RESULT, true);
                        intent.setClipData(ClipData.newRawUri("Waze AA Installer", CompanionApkProvider.URI));
                        startActivityForResult(intent, INSTALL);
                    } catch (Exception error) { render("Could not open Android’s installer. Try again."); }
                });
            } catch (Exception error) { runOnUiThread(() -> { busy = false; render("The embedded installer could not be verified. Repatch Waze with the current bundle."); }); }
        }, "morphe-companion").start();
    }
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request == ALLOW && getPackageManager().canRequestPackageInstalls()) proceed();
        if (request == INSTALL) {
            if (CompanionInstaller.installed(this) >= CompanionInstaller.VERSION) openCompanion();
            else render("Installation was not completed. Tap Install to retry, or return to Waze.");
        }
    }
}
