package app.noam.extension.chesscom.crash;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.net.URLEncoder;

/** The screen the crash handler opens: the stack trace, a Copy button and a link to the issues. */
public final class CrashActivity extends Activity {
    private static final String ISSUES = "https://github.com/quwi26/Quwis-Patches/issues/new";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String trace = getIntent().getStringExtra("trace");
        if (trace == null || trace.isEmpty()) trace = "No crash details were saved.";
        final String details = trace;

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xFF121212);
        root.setPadding(dp(20), dp(28), dp(20), dp(20));

        TextView title = new TextView(this);
        title.setText("Chess.com stopped");
        title.setTextColor(0xFFFF6B6B);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText("A patch or the app ran into an error. The details below can be copied into a report.");
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
        TextView text = new TextView(this);
        text.setText(details);
        text.setTextColor(0xFF8FC7F0);
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
            copy(details);
            Toast.makeText(this, "Copied", Toast.LENGTH_SHORT).show();
        });
        buttons.addView(copy);

        Button report = button("Report");
        LinearLayout.LayoutParams reportParams = new LinearLayout.LayoutParams(0, dp(48), 1.2f);
        reportParams.leftMargin = dp(6);
        report.setLayoutParams(reportParams);
        report.setBackground(rounded(0xFF2E7D32));
        report.setTextColor(Color.WHITE);
        report.setTextSize(14);
        report.setTypeface(Typeface.DEFAULT_BOLD);
        report.setOnClickListener(view -> {
            copy(details);
            String url = ISSUES;
            try {
                url += "?title=" + URLEncoder.encode("[Crash] ", "UTF-8");
            } catch (Throwable ignored) {
                // The plain link still works.
            }
            Toast.makeText(this, "Copied. Paste it into the report.", Toast.LENGTH_LONG).show();
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        });
        buttons.addView(report);

        setContentView(root);
    }

    private Button button(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setAllCaps(false);
        return button;
    }

    private GradientDrawable rounded(int color) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(color);
        background.setCornerRadius(dp(8));
        return background;
    }

    private void copy(String text) {
        ClipboardManager manager = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (manager != null) manager.setPrimaryClip(ClipData.newPlainText("Chess.com crash", text));
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}

