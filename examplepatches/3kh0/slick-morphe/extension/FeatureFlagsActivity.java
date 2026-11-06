package slick.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Lists Slack's feature flags and overrides them. Framework views only, like the crash screen. */
public final class FeatureFlagsActivity extends Activity {
  private final List<FeatureFlags.Flag> flags = new ArrayList<>(), shown = new ArrayList<>();
  private final Adapter adapter = new Adapter();
  private String query = "";
  private Button reset;

  @Override
  public void onCreate(Bundle state) {
    boolean night = Appearance.night(this);
    setTheme(
        night
            ? android.R.style.Theme_DeviceDefault_NoActionBar
            : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
    super.onCreate(state);
    if (!night)
      getWindow()
          .getInsetsController()
          .setSystemBarsAppearance(
              WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                  | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS,
              WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                  | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);

    LinearLayout root = new LinearLayout(this);
    root.setOrientation(LinearLayout.VERTICAL);
    TextView title = text("Feature flags", 22);
    title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
    title.setAccessibilityHeading(true);
    root.addView(title);
    TextView note =
        text(
            Settings.enabled("feature_flags")
                ? "Turning on a flag the server doesn't offer can break Slack. Restart Slack after"
                    + " a change."
                : "These overrides are currently inactive. Turn on Apply feature flags in Slick"
                    + " settings to activate them.",
            14);
    note.setPadding(dp(16), 0, dp(16), dp(8));
    root.addView(note);

    EditText search = new EditText(this);
    search.setHint("Search flags");
    search.setSingleLine(true);
    search.addTextChangedListener(
        new TextWatcher() {
          @Override
          public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

          @Override
          public void onTextChanged(CharSequence s, int start, int before, int count) {}

          @Override
          public void afterTextChanged(Editable s) {
            query = s.toString().trim().toLowerCase(Locale.ROOT);
            filter();
          }
        });
    LinearLayout.LayoutParams margins = new LinearLayout.LayoutParams(-1, -2);
    margins.setMargins(dp(16), 0, dp(16), 0);
    root.addView(search, margins);

    ListView list = new ListView(this);
    list.setAdapter(adapter);
    list.setOnItemClickListener((parent, view, position, id) -> choose(shown.get(position)));
    TextView empty = text("Flags appear once Slack has loaded a workspace.", 14);
    root.addView(empty, new LinearLayout.LayoutParams(-1, -2));
    list.setEmptyView(empty);
    root.addView(list, new LinearLayout.LayoutParams(-1, 0, 1));

    LinearLayout actions = new LinearLayout(this);
    actions.setPadding(dp(12), dp(8), dp(12), dp(8));
    reset = button("", view -> confirmReset());
    actions.addView(reset, new LinearLayout.LayoutParams(0, -2, 1));
    actions.addView(
        button("Restart Slack", view -> Restart.offer(this)),
        new LinearLayout.LayoutParams(0, -2, 1));
    root.addView(actions);

    root.setOnApplyWindowInsetsListener((view, insets) -> {
      android.graphics.Insets bars =
          insets.getInsets(
              WindowInsets.Type.systemBars()
                  | WindowInsets.Type.displayCutout()
                  | WindowInsets.Type.ime());
      view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
      return insets;
    });
    setContentView(root);
    root.requestApplyInsets();

    flags.addAll(FeatureFlags.flags());
    filter();
  }

  /** Overridden flags first, so they are easy to find again. */
  private void filter() {
    shown.clear();
    for (boolean overridden : new boolean[] {true, false})
      for (FeatureFlags.Flag f : flags)
        if ((FeatureFlags.get(f.key) != null) == overridden
            && (query.isEmpty() || f.key.contains(query))) shown.add(f);
    refresh();
  }

  private void refresh() {
    int n = FeatureFlags.count();
    reset.setText("Reset " + n + (n == 1 ? " override" : " overrides"));
    reset.setEnabled(n > 0);
    adapter.notifyDataSetChanged();
  }

  private void choose(FeatureFlags.Flag flag) {
    Boolean current = FeatureFlags.get(flag.key);
    new AlertDialog.Builder(this)
        .setTitle(flag.key)
        .setSingleChoiceItems(
            new String[] {"Slack's value (" + (flag.value ? "on" : "off") + ")", "On", "Off"},
            current == null ? 0 : current ? 1 : 2,
            (dialog, which) -> {
              FeatureFlags.set(flag.key, which == 0 ? null : which == 1);
              refresh();
              dialog.dismiss();
            })
        .show();
  }

  private void confirmReset() {
    new AlertDialog.Builder(this)
        .setTitle("Reset all overrides?")
        .setMessage("Every flag goes back to Slack's value after a restart.")
        .setNegativeButton(android.R.string.cancel, null)
        .setPositiveButton(
            "Reset",
            (dialog, which) -> {
              FeatureFlags.clear();
              filter();
            })
        .show();
  }

  private int dp(int value) {
    return Math.round(value * getResources().getDisplayMetrics().density);
  }

  private TextView text(String value, int size) {
    TextView t = new TextView(this);
    t.setText(value);
    t.setTextSize(size);
    t.setPadding(dp(16), dp(12), dp(16), dp(12));
    return t;
  }

  private Button button(String label, View.OnClickListener click) {
    Button b = new Button(this);
    b.setText(label);
    b.setAllCaps(false);
    b.setMinimumHeight(dp(48));
    b.setOnClickListener(click);
    return b;
  }

  private final class Adapter extends BaseAdapter {
    @Override
    public int getCount() {
      return shown.size();
    }

    @Override
    public Object getItem(int position) {
      return shown.get(position);
    }

    @Override
    public long getItemId(int position) {
      return position;
    }

    @Override
    public View getView(int position, View row, ViewGroup parent) {
      if (row == null)
        row = getLayoutInflater().inflate(android.R.layout.simple_list_item_2, parent, false);
      FeatureFlags.Flag f = shown.get(position);
      Boolean o = FeatureFlags.get(f.key);
      String value = f.value ? "on" : "off";
      ((TextView) row.findViewById(android.R.id.text1)).setText(f.key);
      ((TextView) row.findViewById(android.R.id.text2))
          .setText(
              o == null
                  ? "Slack: " + value
                  : (o ? "Forced on" : "Forced off") + " (Slack: " + value + ")");
      return row;
    }
  }
}
