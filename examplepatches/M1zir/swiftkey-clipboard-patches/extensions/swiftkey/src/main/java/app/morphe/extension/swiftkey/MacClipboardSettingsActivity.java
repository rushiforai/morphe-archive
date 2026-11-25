package app.morphe.extension.swiftkey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.IOException;
import java.security.GeneralSecurityException;

/** Private activity, reached from SwiftKey settings, that pairs the keyboard with the Mac. */
public final class MacClipboardSettingsActivity extends Activity {
    private boolean dark;
    private int textColor;
    private int mutedColor;
    private TextView status;

    @Override public void onCreate(Bundle state) {
        dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
            == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        textColor = dark ? Color.rgb(237, 242, 245) : Color.rgb(26, 37, 44);
        mutedColor = dark ? Color.rgb(167, 182, 191) : Color.rgb(88, 106, 116);
        buildScreen();
        testConnection();
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private TextView text(String label, int size, boolean strong) {
        TextView view = new TextView(this);
        view.setText(label);
        view.setTextSize(size);
        view.setTextColor(textColor);
        if (strong) view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        view.setPadding(0, dp(8), 0, dp(8));
        return view;
    }

    private Button button(String label, View.OnClickListener click) {
        Button button = new Button(this);
        button.setText(label);
        button.setAllCaps(false);
        button.setMinHeight(dp(48));
        button.setOnClickListener(click);
        return button;
    }

    private void buildScreen() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(dark ? Color.rgb(16, 24, 31) : Color.WHITE);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(dp(20) + insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                dp(20) + insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        LinearLayout header = new LinearLayout(this);
        header.setGravity(Gravity.CENTER_VERTICAL);
        Button back = button("‹", view -> finish());
        back.setContentDescription("Back");
        header.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        header.addView(text("Mac clipboard sync", 21, true), new LinearLayout.LayoutParams(0, -2, 1));
        root.addView(header);

        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        TextView intro = text("Text you copy on this phone appears on your Mac. Text you copy on the Mac is ready "
            + "to paste here when the keyboard opens. Clips that Android marks as sensitive, such as passwords "
            + "from a password manager, stay on the phone. Works on the same Wi-Fi or through Tailscale.", 15, false);
        intro.setTextColor(mutedColor);
        body.addView(intro);
        status = text("", 16, true);
        body.addView(status);
        body.addView(button("Paste pairing code", view -> pasteCode()));
        body.addView(button("Test connection", view -> testConnection()));
        body.addView(button("Unpair", view -> new AlertDialog.Builder(this)
            .setTitle("Unpair from the Mac?")
            .setMessage("Copies stop syncing until you paste a pairing code again.")
            .setNegativeButton("Cancel", null)
            .setPositiveButton("Unpair", (dialog, which) -> unpair())
            .show()));
        TextView help = text("To pair, open the pairing QR code on your Mac, scan it with the phone camera, "
            + "copy the text, then tap Paste pairing code. The phone removes the code from the clipboard after "
            + "pairing. Delete it from SwiftKey's clipboard history too.", 14, false);
        help.setTextColor(mutedColor);
        body.addView(help);
        ScrollView scroll = new ScrollView(this);
        scroll.addView(body);
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        setContentView(root);
        root.requestApplyInsets();
    }

    private void pasteCode() {
        ClipboardManager clipboard = getSystemService(ClipboardManager.class);
        ClipData clip = clipboard.getPrimaryClip();
        CharSequence code = clip == null || clip.getItemCount() == 0 ? null : clip.getItemAt(0).getText();
        try {
            MacClipboardPairing.parse(code == null ? null : code.toString()).save(this);
        } catch (IllegalArgumentException error) {
            status.setText(error.getMessage());
            return;
        } catch (IOException | GeneralSecurityException error) {
            status.setText("Could not save the pairing on this phone.");
            return;
        }
        // The code holds the Mac password. Remove it from the clipboard now that it is stored.
        if (Build.VERSION.SDK_INT >= 28) clipboard.clearPrimaryClip();
        MacClipboardSync.reload();
        testConnection();
    }

    private void unpair() {
        MacClipboardPairing.clear(this);
        MacClipboardSync.reload();
        status.setText("Not paired.");
    }

    private void testConnection() {
        status.setText("Connecting to your Mac…");
        new Thread(() -> {
            String result;
            try {
                MacClipboardPairing pairing = MacClipboardPairing.load(this);
                if (pairing == null) {
                    result = "Not paired.";
                } else {
                    MacClipboardClient client = new MacClipboardClient(pairing);
                    client.fetch();
                    result = "Connected to your Mac at " + client.currentHost() + ".";
                }
            } catch (IOException | GeneralSecurityException error) {
                result = "Could not reach your Mac: " + error.getMessage()
                    + ". Check that the Mac is awake and on the same Wi-Fi, or that Tailscale is on.";
            }
            String message = result;
            runOnUiThread(() -> status.setText(message));
        }, "mac-clipboard-test").start();
    }
}
