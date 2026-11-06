package slick.android;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

public final class CrashReportActivity extends Activity {
  private static final int BACKGROUND = 0xff121212;
  private static final int FOREGROUND = 0xffeeeeee;

  @Override
  public void onCreate(Bundle state) {
    setTheme(android.R.style.Theme_Material_NoActionBar);
    requestWindowFeature(Window.FEATURE_NO_TITLE);
    super.onCreate(state);
    Window window = getWindow();
    window.setBackgroundDrawable(new ColorDrawable(BACKGROUND));
    window.setStatusBarColor(BACKGROUND);
    window.setNavigationBarColor(BACKGROUND);

    LinearLayout root = new LinearLayout(this);
    root.setOrientation(LinearLayout.VERTICAL);
    root.setBackgroundColor(BACKGROUND);
    setContentView(root);
    window
        .getInsetsController()
        .setSystemBarsAppearance(
            0,
            WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
    TextView title = text("Java crash report", 22);
    title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
    title.setAccessibilityHeading(true);
    root.addView(title);

    String report = CrashReports.latest(this);
    TextView trace = text(report, 13);
    trace.setTypeface(Typeface.MONOSPACE);
    trace.setTextIsSelectable(true);
    ScrollView scroll = new ScrollView(this);
    scroll.setFillViewport(true);
    scroll.addView(trace);
    root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

    LinearLayout actions = new LinearLayout(this);
    actions.setPadding(dp(12), dp(8), dp(12), dp(8));
    actions.addView(
        button(
            "Copy error",
            view -> {
              try {
                ClipboardManager clipboard = getSystemService(ClipboardManager.class);
                if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
                ClipData clip = ClipData.newPlainText("Slick Java crash report", report);
                android.os.PersistableBundle e = new android.os.PersistableBundle();
                e.putBoolean("android.content.extra.IS_SENSITIVE", true);
                clip.getDescription().setExtras(e);
                clipboard.setPrimaryClip(clip);
                Toast.makeText(this, "Error copied", Toast.LENGTH_SHORT).show();
              } catch (RuntimeException e) {
                Toast.makeText(this, "Could not copy error", Toast.LENGTH_SHORT).show();
              }
            }),
        new LinearLayout.LayoutParams(0, -2, 1));
    actions.addView(button("Close", view -> finish()), new LinearLayout.LayoutParams(0, -2, 1));
    root.addView(actions);
    root.setOnApplyWindowInsetsListener((view, insets) -> {
      android.graphics.Insets bars =
          insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
      view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
      return insets;
    });
    root.requestApplyInsets();
  }

  private int dp(int value) {
    return Math.round(value * getResources().getDisplayMetrics().density);
  }

  private TextView text(String value, int size) {
    TextView t = new TextView(this);
    t.setText(value);
    t.setTextSize(size);
    t.setTextColor(FOREGROUND);
    t.setPadding(dp(16), dp(12), dp(16), dp(12));
    return t;
  }

  private Button button(String label, android.view.View.OnClickListener click) {
    Button b = new Button(this);
    b.setText(label);
    b.setAllCaps(false);
    b.setTextColor(FOREGROUND);
    b.setBackgroundTintList(ColorStateList.valueOf(0xff333333));
    b.setMinimumHeight(dp(48));
    b.setOnClickListener(click);
    return b;
  }
}
