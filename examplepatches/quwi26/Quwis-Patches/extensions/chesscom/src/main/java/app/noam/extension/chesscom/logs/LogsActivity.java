package app.noam.extension.chesscom.logs;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** The log screen: what this app logged, with Copy, Share and Refresh. */
public final class LogsActivity extends Activity {
    private TextView text;
    private String shown = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xFF121212);
        root.setPadding(dp(20), dp(28), dp(20), dp(20));

        TextView title = new TextView(this);
        title.setText("App logs");
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText("This app's own entries, newest last. Android hands an app only its own logs, "
            + "so other apps do not appear here.");
        subtitle.setTextColor(0xFFB3B3B3);
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        subtitle.setPadding(0, dp(8), 0, dp(18));
        root.addView(subtitle);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable boxBackground = new GradientDrawable();
        boxBackground.setColor(0xFF1A1A1A);
        boxBackground.setCornerRadius(dp(12));
        boxBackground.setStroke(dp(1), 0xFF2E2E2E);
        box.setBackground(boxBackground);
        box.setPadding(dp(14), dp(14), dp(14), dp(14));
        LinearLayout.LayoutParams boxParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        boxParams.bottomMargin = dp(18);
        box.setLayoutParams(boxParams);

        ScrollView vertical = new ScrollView(this);
        HorizontalScrollView horizontal = new HorizontalScrollView(this);
        text = new TextView(this);
        text.setTextColor(0xFF9FD3A0);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        text.setTypeface(Typeface.MONOSPACE);
        text.setHorizontallyScrolling(true);
        text.setMovementMethod(new ScrollingMovementMethod());
        horizontal.addView(text);
        vertical.addView(horizontal);
        box.addView(vertical);
        root.addView(box);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        root.addView(buttons);

        Button copy = button("Copy");
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(0, dp(48), 1f);
        copyParams.rightMargin = dp(6);
        copy.setLayoutParams(copyParams);
        copy.setBackground(rounded(0xFF34495E));
        copy.setTextColor(Color.WHITE);
        copy.setTextSize(14);
        copy.setTypeface(Typeface.DEFAULT_BOLD);
        copy.setOnClickListener(view -> {
            copy(shown);
            Toast.makeText(this, "Copied", Toast.LENGTH_SHORT).show();
        });
        buttons.addView(copy);

        Button share = button("Share");
        LinearLayout.LayoutParams shareParams = new LinearLayout.LayoutParams(0, dp(48), 1f);
        shareParams.leftMargin = dp(6);
        shareParams.rightMargin = dp(6);
        share.setLayoutParams(shareParams);
        share.setBackground(rounded(0xFF2E7D32));
        share.setTextColor(Color.WHITE);
        share.setTextSize(14);
        share.setTypeface(Typeface.DEFAULT_BOLD);
        share.setOnClickListener(view -> share(shown));
        buttons.addView(share);

        Button refresh = button("Refresh");
        LinearLayout.LayoutParams refreshParams = new LinearLayout.LayoutParams(0, dp(48), 1f);
        refreshParams.leftMargin = dp(6);
        refresh.setLayoutParams(refreshParams);
        refresh.setBackground(rounded(0xFF3A3A3A));
        refresh.setTextColor(Color.WHITE);
        refresh.setTextSize(14);
        refresh.setTypeface(Typeface.DEFAULT_BOLD);
        refresh.setOnClickListener(view -> load());
        buttons.addView(refresh);

        setContentView(root);
        load();
    }

    /** Reads the file off the main thread: it is small, but the screen should not wait for it. */
    private void load() {
        text.setText("Reading...");
        new Thread(() -> {
            String read = AppLog.text();
            runOnUiThread(() -> {
                if (isFinishing()) return;
                shown = read;
                text.setText(read);
            });
        }, "morphe-logs-read").start();
    }

    private void copy(String text) {
        ClipboardManager manager = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (manager != null) manager.setPrimaryClip(ClipData.newPlainText("Chess.com logs", text));
    }

    private void share(String text) {
        Intent send = new Intent(Intent.ACTION_SEND);
        send.setType("text/plain");
        send.putExtra(Intent.EXTRA_SUBJECT, "Chess.com logs");
        send.putExtra(Intent.EXTRA_TEXT, text);
        startActivity(Intent.createChooser(send, "Share the log"));
    }

    private Button button(String value) {
        Button button = new Button(this);
        button.setText(value);
        button.setAllCaps(false);
        return button;
    }

    private GradientDrawable rounded(int color) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(color);
        background.setCornerRadius(dp(8));
        return background;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
