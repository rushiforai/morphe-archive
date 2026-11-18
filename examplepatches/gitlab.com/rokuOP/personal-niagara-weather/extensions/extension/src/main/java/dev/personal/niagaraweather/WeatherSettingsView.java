package dev.personal.niagaraweather;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** Resource-free native UI so the extension merges without replacing Niagara's theme. */
final class WeatherSettingsView {
  static final int BACKGROUND = 0xff11121b;
  private static final int SURFACE = 0xff1c1e2b;
  private static final int TEXT = 0xfff3f0ff;
  private static final int MUTED = 0xffa7a9bf;
  private static final int ACCENT = 0xffc6b5ff;
  private static final int STROKE = 0xff323545;
  private final Activity activity;
  private final List<View> controls = new ArrayList<>();
  private final LinearLayout statusCard;
  private final TextView statusLabel;
  private final TextView keyBadge;
  private final TextView reveal;
  final EditText apiKey;
  final EditText city;
  final Switch enabled;
  final RadioButton fahrenheit;
  final RadioButton celsius;
  final TextView status;
  final Button save;
  final Button clear;
  final Button done;
  final ProgressBar progress;
  private boolean visible;

  WeatherSettingsView(Activity activity, SharedPreferences preferences) {
    this.activity = activity;
    FrameLayout root = new FrameLayout(activity);
    root.setBackgroundColor(BACKGROUND);
    LinearLayout dock = column();
    dock.setBackgroundColor(BACKGROUND);
    ScrollView scroll = new ScrollView(activity);
    scroll.setFillViewport(true);
    scroll.setClipToPadding(false);
    root.addView(scroll, new FrameLayout.LayoutParams(-1, -1));
    LinearLayout body = column();
    body.setPadding(dp(24), dp(12), dp(24), dp(28));
    scroll.addView(body, new ScrollView.LayoutParams(-1, -2));
    root.setOnApplyWindowInsetsListener(
        (view, insets) -> {
          body.setPadding(dp(24), dp(12) + insets.getSystemWindowInsetTop(), dp(24), dp(28));
          scroll.setPadding(0, 0, 0, dp(100) + insets.getSystemWindowInsetBottom());
          dock.setPadding(dp(24), dp(12), dp(24), dp(16) + insets.getSystemWindowInsetBottom());
          return insets;
        });

    LinearLayout toolbar = horizontal();
    done = new Button(activity);
    done.setText("‹");
    done.setTextSize(32);
    done.setTextColor(TEXT);
    done.setAllCaps(false);
    done.setPadding(0, 0, 0, dp(3));
    done.setBackground(ripple(SURFACE, 18));
    done.setContentDescription("Back to Niagara");
    toolbar.addView(done, new LinearLayout.LayoutParams(dp(48), dp(48)));
    TextView toolbarTitle = text("WEATHER", 12, MUTED);
    toolbarTitle.setLetterSpacing(.14f);
    LinearLayout.LayoutParams toolbarTitleParams = new LinearLayout.LayoutParams(-2, -2);
    toolbarTitleParams.leftMargin = dp(14);
    toolbar.addView(toolbarTitle, toolbarTitleParams);
    body.addView(toolbar, space(0, 22));

    WeatherMark mark = new WeatherMark(activity);
    body.addView(mark, new LinearLayout.LayoutParams(dp(70), dp(58)));
    TextView title = text("Your weather.\nYour key.", 34, TEXT);
    title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
    title.setLineSpacing(0, 1.02f);
    body.addView(title, space(12, 8));
    body.addView(text("A little more sky on your home screen.", 15, MUTED), space(0, 24));

    LinearLayout visibility = card();
    LinearLayout visibilityRow = horizontal();
    LinearLayout visibilityText = column();
    visibilityText.addView(text("Home-screen weather", 16, TEXT));
    visibilityText.addView(text("Beside the date, at a glance", 13, MUTED), space(4, 0));
    visibilityRow.addView(visibilityText, new LinearLayout.LayoutParams(0, -2, 1));
    enabled = new Switch(activity);
    enabled.setContentDescription("Show weather on home screen");
    enabled.setChecked(
        !preferences.contains(WeatherPatch.READY)
            || preferences.getBoolean(WeatherPatch.ENABLED, false));
    enabled.setThumbTintList(
        new ColorStateList(
            new int[][] {{android.R.attr.state_checked}, {}}, new int[] {ACCENT, 0xff9597a8}));
    enabled.setTrackTintList(
        new ColorStateList(
            new int[][] {{android.R.attr.state_checked}, {}}, new int[] {0xff67588f, 0xff3e4152}));
    visibilityRow.addView(enabled, new LinearLayout.LayoutParams(-2, dp(48)));
    visibility.addView(visibilityRow);
    body.addView(visibility, space(0, 14));

    LinearLayout connection = card();
    LinearLayout connectionHeading = horizontal();
    TextView connectionTitle = text("OpenWeather", 17, TEXT);
    connectionTitle.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
    connectionHeading.addView(connectionTitle, new LinearLayout.LayoutParams(0, -2, 1));
    keyBadge = text("NOT CONNECTED", 10, MUTED);
    keyBadge.setLetterSpacing(.06f);
    keyBadge.setPadding(dp(9), dp(6), dp(9), dp(6));
    connectionHeading.addView(keyBadge);
    connection.addView(connectionHeading, space(0, 20));
    connection.addView(text("API key", 12, MUTED), space(0, 8));
    LinearLayout keyField = horizontal();
    keyField.setBackground(shape(BACKGROUND, 14, STROKE));
    apiKey = input("Paste your API key", true);
    keyField.addView(apiKey, new LinearLayout.LayoutParams(0, dp(54), 1));
    reveal = text("Show", 13, ACCENT);
    reveal.setGravity(Gravity.CENTER);
    reveal.setContentDescription("Show entered API key");
    reveal.setBackground(ripple(Color.TRANSPARENT, 12));
    reveal.setOnClickListener(
        view -> {
          visible = !visible;
          int cursor = apiKey.getSelectionStart();
          apiKey.setInputType(
              InputType.TYPE_CLASS_TEXT
                  | (visible
                      ? InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                      : InputType.TYPE_TEXT_VARIATION_PASSWORD));
          apiKey.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
          apiKey.setSelection(Math.max(0, cursor));
          reveal.setText(visible ? "Hide" : "Show");
          reveal.setContentDescription(visible ? "Hide entered API key" : "Show entered API key");
        });
    keyField.addView(reveal, new LinearLayout.LayoutParams(dp(62), dp(54)));
    connection.addView(keyField);
    TextView keyHelp = text("Encrypted on this phone. Sent only to OpenWeather.", 12, MUTED);
    keyHelp.setLineSpacing(dp(2), 1);
    connection.addView(keyHelp, space(9, 20));
    connection.addView(text("Location", 12, MUTED), space(0, 8));
    city = input("City, country code", false);
    city.setBackground(shape(BACKGROUND, 14, STROKE));
    city.setText(
        WeatherPatch.secrets(activity)
            .getString(
                "city", preferences.getString("bitpit.launcher.key.WEATHER_LOCATION_NAME", "")));
    connection.addView(city, new LinearLayout.LayoutParams(-1, dp(54)));
    connection.addView(
        text("For example, Toronto, CA. Leave blank to keep your coordinates.", 12, MUTED),
        space(9, 0));
    body.addView(connection, space(0, 14));

    LinearLayout units = card();
    units.addView(text("Temperature", 15, TEXT), space(0, 14));
    RadioGroup group = new RadioGroup(activity);
    group.setOrientation(LinearLayout.HORIZONTAL);
    group.setPadding(dp(4), dp(4), dp(4), dp(4));
    group.setBackground(shape(BACKGROUND, 15, Color.TRANSPARENT));
    celsius = unit("°C  Celsius");
    fahrenheit = unit("°F  Fahrenheit");
    group.addView(celsius, new RadioGroup.LayoutParams(0, dp(44), 1));
    group.addView(fahrenheit, new RadioGroup.LayoutParams(0, dp(44), 1));
    group.check(
        preferences.getInt("bitpit.launcher.key.WEATHER_TEMPERATURE_UNIT", 0) == 1
            ? fahrenheit.getId()
            : celsius.getId());
    units.addView(group);
    body.addView(units, space(0, 16));

    statusCard = column();
    statusCard.setPadding(dp(16), dp(14), dp(16), dp(14));
    statusLabel = text("READY WHEN YOU ARE", 10, ACCENT);
    statusLabel.setLetterSpacing(.1f);
    statusCard.addView(statusLabel, space(0, 5));
    status = text("Save to check your connection and update the forecast.", 13, MUTED);
    status.setLineSpacing(dp(2), 1);
    status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
    statusCard.addView(status);
    setStatusTone(0);
    body.addView(statusCard, space(0, 16));

    FrameLayout action = new FrameLayout(activity);
    save = new Button(activity);
    save.setText("Save & test weather");
    save.setTextSize(16);
    save.setTextColor(BACKGROUND);
    save.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
    save.setAllCaps(false);
    save.setBackground(ripple(ACCENT, 18));
    save.setMinHeight(dp(56));
    action.addView(save, new FrameLayout.LayoutParams(-1, dp(56)));
    progress = new ProgressBar(activity);
    progress.setIndeterminateTintList(ColorStateList.valueOf(BACKGROUND));
    FrameLayout.LayoutParams progressParams =
        new FrameLayout.LayoutParams(dp(22), dp(22), Gravity.CENTER_VERTICAL | Gravity.END);
    progressParams.rightMargin = dp(22);
    action.addView(progress, progressParams);
    progress.setVisibility(View.GONE);
    dock.addView(action);
    root.addView(dock, new FrameLayout.LayoutParams(-1, -2, Gravity.BOTTOM));
    clear = new Button(activity);
    clear.setText("Remove saved key");
    clear.setTextSize(13);
    clear.setTextColor(MUTED);
    clear.setAllCaps(false);
    clear.setBackground(ripple(Color.TRANSPARENT, 14));
    body.addView(clear, new LinearLayout.LayoutParams(-1, dp(48)));
    TextView coverage = text("CURRENT CONDITIONS · 5-DAY OUTLOOK", 10, MUTED);
    coverage.setGravity(Gravity.CENTER);
    coverage.setLetterSpacing(.06f);
    body.addView(coverage, space(12, 5));
    TextView details =
        text("Forecasts update in 3-hour steps. Minute-by-minute rain is not included.", 12, MUTED);
    details.setGravity(Gravity.CENTER);
    body.addView(details, space(0, 8));
    controls.add(apiKey);
    controls.add(city);
    controls.add(enabled);
    controls.add(celsius);
    controls.add(fahrenheit);
    controls.add(reveal);
    controls.add(clear);
    controls.add(save);
    setSavedKey(WeatherPatch.secrets(activity).contains("encrypted_key"));
    activity.setContentView(root);
  }

  void setSavedKey(boolean saved) {
    keyBadge.setText(saved ? "KEY SAVED" : "NOT CONNECTED");
    keyBadge.setTextColor(saved ? 0xff9be0be : MUTED);
    keyBadge.setBackground(shape(saved ? 0xff223a33 : 0xff2b2d3b, 8, Color.TRANSPARENT));
    apiKey.setHint(saved ? "Leave blank to keep saved key" : "Paste your API key");
    clear.setVisibility(saved ? View.VISIBLE : View.GONE);
  }

  void setBusy(boolean busy) {
    for (View control : controls) {
      control.setEnabled(!busy);
      control.setAlpha(busy ? .65f : 1f);
    }
    save.setText(busy ? "Checking weather…" : "Save & test weather");
    progress.setVisibility(busy ? View.VISIBLE : View.GONE);
  }

  void setStatusTone(int tone) {
    int color = tone == 1 ? 0xff9be0be : tone == 3 ? 0xffffb4ab : ACCENT;
    statusLabel.setText(
        tone == 1
            ? "CONNECTED"
            : tone == 2
                ? "CHECKING CONNECTION"
                : tone == 3 ? "LET’S FIX THAT" : "READY WHEN YOU ARE");
    statusLabel.setTextColor(color);
    statusCard.setBackground(
        shape(tone == 1 ? 0xff1b302b : tone == 3 ? 0xff35262c : 0xff252239, 16, Color.TRANSPARENT));
  }

  private RadioButton unit(String label) {
    RadioButton view = new RadioButton(activity);
    view.setId(View.generateViewId());
    view.setText(label);
    view.setTextSize(14);
    view.setGravity(Gravity.CENTER);
    view.setButtonDrawable(null);
    view.setPadding(dp(8), 0, dp(8), 0);
    view.setTextColor(
        new ColorStateList(
            new int[][] {{android.R.attr.state_checked}, {}}, new int[] {TEXT, MUTED}));
    StateListDrawable background = new StateListDrawable();
    background.addState(
        new int[] {android.R.attr.state_checked}, shape(0xff454057, 12, Color.TRANSPARENT));
    background.addState(new int[] {}, shape(Color.TRANSPARENT, 12, Color.TRANSPARENT));
    view.setBackground(background);
    return view;
  }

  private EditText input(String hint, boolean secret) {
    EditText view = new EditText(activity);
    view.setTextSize(14);
    view.setTextColor(TEXT);
    view.setHintTextColor(0xff777b93);
    view.setSingleLine(true);
    view.setHint(hint);
    view.setPadding(dp(14), 0, dp(10), 0);
    view.setBackgroundColor(Color.TRANSPARENT);
    view.setInputType(
        InputType.TYPE_CLASS_TEXT | (secret ? InputType.TYPE_TEXT_VARIATION_PASSWORD : 0));
    if (secret) {
      view.setSaveEnabled(false);
      view.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
      view.setImeOptions(android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
    }
    return view;
  }

  private LinearLayout card() {
    LinearLayout view = column();
    view.setPadding(dp(18), dp(18), dp(18), dp(18));
    view.setBackground(shape(SURFACE, 22, Color.TRANSPARENT));
    return view;
  }

  private LinearLayout column() {
    LinearLayout view = new LinearLayout(activity);
    view.setOrientation(1);
    return view;
  }

  private LinearLayout horizontal() {
    LinearLayout view = new LinearLayout(activity);
    view.setGravity(Gravity.CENTER_VERTICAL);
    view.setOrientation(0);
    return view;
  }

  private TextView text(String value, int size, int color) {
    TextView view = new TextView(activity);
    view.setText(value);
    view.setTextSize(size);
    view.setTextColor(color);
    return view;
  }

  private GradientDrawable shape(int fill, int radius, int border) {
    GradientDrawable shape = new GradientDrawable();
    shape.setColor(fill);
    shape.setCornerRadius(dp(radius));
    if (border != Color.TRANSPARENT) shape.setStroke(dp(1), border);
    return shape;
  }

  private RippleDrawable ripple(int fill, int radius) {
    return new RippleDrawable(
        ColorStateList.valueOf(0x25ffffff),
        shape(fill, radius, Color.TRANSPARENT),
        shape(Color.WHITE, radius, Color.TRANSPARENT));
  }

  private LinearLayout.LayoutParams space(int top, int bottom) {
    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
    params.topMargin = dp(top);
    params.bottomMargin = dp(bottom);
    return params;
  }

  private int dp(int value) {
    return Math.round(value * activity.getResources().getDisplayMetrics().density);
  }

  private static final class WeatherMark extends View {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    WeatherMark(Activity activity) {
      super(activity);
      setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    @Override
    protected void onDraw(Canvas canvas) {
      float scale = getWidth() / 70f;
      canvas.save();
      canvas.scale(scale, scale);
      paint.setColor(0xffeec675);
      canvas.drawCircle(44, 21, 15, paint);
      paint.setColor(ACCENT);
      canvas.drawCircle(22, 34, 15, paint);
      canvas.drawCircle(39, 35, 12, paint);
      canvas.drawRoundRect(new RectF(8, 32, 56, 50), 9, 9, paint);
      canvas.restore();
    }
  }
}
