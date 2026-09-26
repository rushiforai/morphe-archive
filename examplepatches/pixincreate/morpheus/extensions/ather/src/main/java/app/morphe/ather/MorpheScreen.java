package app.morphe.ather;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Shared look for the patch screens. Both screens are built with the framework View toolkit, so
 * they need no Compose runtime of their own.
 *
 * <p>Sections are an accordion: opening one closes the others, so a screen never grows longer than
 * one open section plus its headings.
 */
abstract class MorpheScreen extends Activity {

    /** The arrow that separates a start value from an end value. */
    private static final String ARROW = "\u2192";

    /**
     * Material 3 surface colours, seeded from the Ather teal. The values are chosen at runtime from
     * the system night setting, so the screens look deliberate in both modes instead of being
     * inverted by the platform.
     */
    protected int SURFACE;
    protected int CONTAINER;
    protected int TEXT;
    protected int MUTED;
    protected int STROKE;
    protected int ACCENT;

    /** True when the system is in night mode. */
    private boolean night;

    /** Every section on the screen, so that opening one can close the rest. */
    private final List<Section> sections = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        night = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        // Take the colours from the system's own theme, so the screens follow the device accent
        // and its light or dark choice instead of a hand-picked one. The theme is applied through
        // a wrapper because the activity's own theme cannot be replaced once it has started.
        Context themed = new ContextThemeWrapper(this, android.R.style.Theme_DeviceDefault_DayNight);
        SURFACE = attribute(themed, android.R.attr.colorBackground, night ? 0xFF111413 : 0xFFFBFDFC);
        TEXT = attribute(themed, android.R.attr.textColorPrimary, night ? 0xFFE1E3E2 : 0xFF191C1C);
        MUTED = attribute(themed, android.R.attr.textColorSecondary, night ? 0xFFBFC9C7 : 0xFF3F4948);
        ACCENT = attribute(themed, android.R.attr.colorAccent, night ? 0xFF4DD9DB : 0xFF00696B);
        // Cards and dividers are the surface nudged towards the text colour, so they stay legible
        // whatever the system palette turns out to be.
        CONTAINER = blend(SURFACE, TEXT, night ? 0.06f : 0.04f);
        STROKE = blend(SURFACE, TEXT, night ? 0.12f : 0.08f);

        // From Android 13 the platform routes back through the dispatcher, so onBackPressed() is
        // not called for a plain Activity. Register there as well, or back would skip goBack().
        if (Build.VERSION.SDK_INT >= 33) {
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                    new OnBackInvokedCallback() {
                        @Override
                        public void onBackInvoked() {
                            goBack();
                        }
                    });
        }
    }

    @Override
    public void onBackPressed() {
        goBack();
    }

    /** Leaves this screen, landing in the app rather than on the launcher. */
    private void goBack() {
        // A screen that is the only activity in its task would otherwise finish the whole task and
        // drop the user out of the app.
        if (isTaskRoot()) {
            try {
                Intent intent = new Intent();
                intent.setClassName(this, "com.athermobileapp.ui.main.MainActivity");
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
                startActivity(intent);
            } catch (Throwable t) {
                // Fall through to finish().
            }
        }
        finish();
    }

    /** A colour from the system theme, or the fallback when the theme does not define one. */
    private static int attribute(Context themed, int attr, int fallback) {
        try {
            TypedValue value = new TypedValue();
            if (themed.getTheme().resolveAttribute(attr, value, true)) {
                if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                        && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                    return value.data;
                }
                if (value.resourceId != 0) {
                    return themed.getResources().getColor(value.resourceId, themed.getTheme());
                }
            }
        } catch (Throwable t) {
            // Use the fallback.
        }
        return fallback;
    }

    /** One colour moved a fraction of the way towards another. */
    private static int blend(int from, int to, float amount) {
        return Color.rgb(
                Math.round(Color.red(from) + (Color.red(to) - Color.red(from)) * amount),
                Math.round(Color.green(from) + (Color.green(to) - Color.green(from)) * amount),
                Math.round(Color.blue(from) + (Color.blue(to) - Color.blue(from)) * amount));
    }

    /** One collapsible section: its content, its chevron, and its current state. */
    private static final class Section {
        final View content;
        final Chevron chevron;
        boolean expanded;

        Section(View content, Chevron chevron) {
            this.content = content;
            this.chevron = chevron;
        }
    }

    /**
     * A thin chevron that points down when its section is open and right when it is closed. It is
     * drawn rather than loaded from the app's icons, so it stays light and quiet next to the bold
     * section titles.
     */
    private static final class Chevron extends View {

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private boolean expanded = true;

        Chevron(Context context, int color) {
            super(context);
            float density = context.getResources().getDisplayMetrics().density;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(2.2f * density);
            paint.setColor(color);
        }

        void setExpanded(boolean value) {
            if (expanded == value && getRotation() != 0f) {
                return;
            }
            expanded = value;
            animate().rotation(value ? 0f : -90f).setDuration(180).start();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth();
            float h = getHeight();
            float cx = w / 2f;
            float cy = h / 2f;
            float arm = w * 0.26f;
            float drop = arm * 0.58f;
            Path path = new Path();
            path.moveTo(cx - arm, cy - drop);
            path.lineTo(cx, cy + drop);
            path.lineTo(cx + arm, cy - drop);
            canvas.drawPath(path, paint);
        }
    }

    /**
     * Enlarges every arrow in a value, so a transition reads as an arrow instead of a small tick.
     * The arrow glyph uses a smaller part of the font's box than the digits beside it do.
     */
    protected static CharSequence styled(String value) {
        if (value == null || value.indexOf(ARROW) < 0) {
            return value;
        }
        SpannableString span = new SpannableString(value);
        int from = 0;
        while (true) {
            int at = value.indexOf(ARROW, from);
            if (at < 0) {
                break;
            }
            span.setSpan(new RelativeSizeSpan(1.5f), at, at + 1,
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            from = at + 1;
        }
        return span;
    }

    /** A vertical page with the standard background. */
    protected LinearLayout page() {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(SURFACE);
        return page;
    }

    /**
     * Wraps a page in a ScrollView and installs it as the content view. The system bar insets
     * become padding, so nothing scrolls under the status bar or the navigation bar.
     */
    protected void show(LinearLayout page) {
        final ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(SURFACE);
        scroll.setFillViewport(true);
        scroll.addView(page);
        scroll.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View view, WindowInsets insets) {
                view.setPadding(0, insets.getSystemWindowInsetTop(), 0,
                        insets.getSystemWindowInsetBottom());
                return insets;
            }
        });
        setContentView(scroll);
        scroll.requestApplyInsets();
        lightSystemBars();
    }

    /** Status bar and navigation bar icons that stay readable on the current surface. */
    private void lightSystemBars() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            WindowInsetsController controller = getWindow().getInsetsController();
            if (controller != null) {
                int bars = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                controller.setSystemBarsAppearance(night ? 0 : bars, bars);
            }
        } else if (!night) {
            getWindow().getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                            | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        }
    }

    /** The screen title. */
    protected View title(String text) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(20), dp(20), dp(4));

        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 30);
        v.setTextColor(TEXT);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        box.addView(v);
        return box;
    }

    protected TextView sectionLabel(String text) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        v.setTextColor(ACCENT);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setLetterSpacing(0.08f);
        v.setAllCaps(true);
        v.setPadding(dp(20), dp(20), dp(20), dp(8));
        return v;
    }

    /**
     * A rounded card that holds one section's rows on its own, with no heading.
     */
    protected LinearLayout card() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        int p = dp(20);
        box.setPadding(p, p, p, p);
        box.setBackground(rounded(CONTAINER, 24));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        // Match the gap between collapsible sections, so a card that precedes one does not sit
        // closer to it than two sections sit to each other.
        lp.setMargins(dp(16), 0, dp(16), dp(8));
        box.setLayoutParams(lp);
        return box;
    }

    /** The unpadded content column that sits inside a collapsible section. */
    protected LinearLayout body() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), 0, dp(20), dp(20));
        return box;
    }

    /**
     * A collapsible section: a heading with a chevron, and the content below it. Opening a section
     * closes every other section on the screen.
     */
    protected View section(String text, final LinearLayout content, boolean expanded) {
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setBackground(rounded(CONTAINER, 24));
        container.setClipToOutline(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(dp(16), 0, dp(16), dp(8));
        container.setLayoutParams(lp);

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(20), dp(18), dp(18), dp(18));

        TextView label = new TextView(this);
        label.setText(text);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        label.setTextColor(TEXT);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        header.addView(label);

        final Chevron chevron = new Chevron(this, MUTED);
        int size = dp(24);
        LinearLayout.LayoutParams chevronParams = new LinearLayout.LayoutParams(size, size);
        chevronParams.setMarginStart(dp(12));
        chevron.setLayoutParams(chevronParams);
        header.addView(chevron);

        container.addView(header);
        container.addView(content);

        final Section section = new Section(content, chevron);
        sections.add(section);
        setExpanded(section, expanded);

        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                boolean open = !section.expanded;
                for (Section other : sections) {
                    setExpanded(other, false);
                }
                setExpanded(section, open);
            }
        });
        return container;
    }

    private void setExpanded(Section section, boolean expanded) {
        section.expanded = expanded;
        section.content.setVisibility(expanded ? View.VISIBLE : View.GONE);
        section.chevron.setExpanded(expanded);
    }

    protected TextView description(String text) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        v.setTextColor(MUTED);
        v.setLineSpacing(dp(4), 1f);
        return v;
    }

    protected TextView emptyText(String text) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        v.setTextColor(MUTED);
        v.setPadding(0, dp(12), 0, 0);
        return v;
    }

    protected TextView subHeader(String text) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        v.setTextColor(ACCENT);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setLetterSpacing(0.06f);
        v.setAllCaps(true);
        v.setPadding(0, dp(20), 0, dp(4));
        return v;
    }

    protected View kvRow(String label, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(11), 0, dp(11));

        TextView l = new TextView(this);
        l.setText(label);
        l.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        l.setTextColor(MUTED);
        l.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(l);

        TextView r = new TextView(this);
        r.setText(styled(value));
        r.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        r.setTextColor(TEXT);
        r.setGravity(Gravity.END);
        r.setPadding(dp(12), 0, 0, 0);
        row.addView(r);

        LinearLayout wrap = new LinearLayout(this);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.addView(row);
        wrap.addView(divider());
        return wrap;
    }

    /**
     * A compact row for readings: smaller and lighter than a record card, so a long history stays
     * readable.
     */
    protected View dataRow(String label, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(7), 0, dp(7));

        TextView l = new TextView(this);
        l.setText(label);
        l.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        l.setTextColor(MUTED);
        l.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(l);

        TextView r = new TextView(this);
        r.setText(styled(value));
        r.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        r.setTextColor(TEXT);
        r.setGravity(Gravity.END);
        r.setPadding(dp(12), 0, 0, 0);
        row.addView(r);

        LinearLayout wrap = new LinearLayout(this);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.addView(row);
        wrap.addView(divider());
        return wrap;
    }

    /**
     * One recorded entry, as a card: a title and a highlighted value on the first line, then the
     * date and an optional detail line.
     */
    protected View record(String title, String value, String date, String detail) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        int p = dp(16);
        box.setPadding(p, dp(14), p, dp(14));
        box.setBackground(rounded(CONTAINER, 20));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, 0, 0, dp(8));
        box.setLayoutParams(lp);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView t = new TextView(this);
        t.setText(title);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        t.setTextColor(TEXT);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(t);

        TextView v = new TextView(this);
        v.setText(styled(value));
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        v.setTextColor(ACCENT);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setGravity(Gravity.END);
        v.setPadding(dp(12), 0, 0, 0);
        top.addView(v);

        box.addView(top);

        if (date != null && !date.isEmpty()) {
            TextView d = new TextView(this);
            d.setText(date);
            d.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            d.setTextColor(MUTED);
            d.setPadding(0, dp(4), 0, 0);
            box.addView(d);
        }

        if (detail != null && !detail.isEmpty()) {
            TextView x = new TextView(this);
            x.setText(styled(detail));
            x.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            x.setTextColor(MUTED);
            x.setPadding(0, dp(2), 0, 0);
            box.addView(x);
        }
        return box;
    }

    /** A date heading that groups the record cards below it. */
    protected TextView dateHeader(String text) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        v.setTextColor(MUTED);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setPadding(0, dp(14), 0, dp(8));
        return v;
    }

    /**
     * Writes a CSV file where the user can reach it: the shared Downloads collection on Android 10
     * and later, otherwise this app's external files directory. Returns where it landed, or null
     * when the write failed.
     */
    protected String saveCsv(String fileName, String csv) {
        try {
            byte[] bytes = csv.getBytes(StandardCharsets.UTF_8);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, "text/csv");
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
                Uri uri = getContentResolver()
                        .insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri == null) {
                    return null;
                }
                OutputStream out = getContentResolver().openOutputStream(uri);
                if (out == null) {
                    return null;
                }
                out.write(bytes);
                out.close();
                return Environment.DIRECTORY_DOWNLOADS + "/" + fileName;
            }
            File dir = getExternalFilesDir(null);
            if (dir == null) {
                return null;
            }
            FileOutputStream out = new FileOutputStream(new File(dir, fileName));
            out.write(bytes);
            out.close();
            return dir.getAbsolutePath() + "/" + fileName;
        } catch (Throwable t) {
            return null;
        }
    }

    protected void toast(String text) {
        Toast.makeText(this, text, Toast.LENGTH_LONG).show();
    }

    /** A tappable row that opens another screen of this patch. The chevron marks it as a link. */
    protected View linkRow(String text, final Class<?> target, final String page) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(18), 0, dp(6));

        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        v.setTextColor(TEXT);
        v.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(v);

        Chevron arrow = new Chevron(this, MUTED);
        arrow.setRotation(-90f);
        int size = dp(18);
        LinearLayout.LayoutParams arrowParams = new LinearLayout.LayoutParams(size, size);
        arrowParams.setMarginStart(dp(8));
        arrow.setLayoutParams(arrowParams);
        row.addView(arrow);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                Intent intent = new Intent(MorpheScreen.this, target);
                if (page != null) {
                    intent.putExtra("page", page);
                }
                startActivity(intent);
            }
        });
        return row;
    }

    /** A tappable row that runs an action, for example clearing the recorded history. */
    protected View actionRow(String text, View.OnClickListener listener) {
        TextView v = new TextView(this);
        v.setText(text);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        v.setTextColor(ACCENT);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setPadding(dp(20), dp(28), dp(20), dp(16));
        v.setOnClickListener(listener);
        return v;
    }

    protected View divider() {
        View v = new View(this);
        v.setBackgroundColor(STROKE);
        v.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(1)));
        return v;
    }

    protected GradientDrawable rounded(int color, int radiusDp) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(color);
        bg.setCornerRadius(dp(radiusDp));
        return bg;
    }

    /** Whether the system is in night mode. */
    protected boolean isNight() {
        return night;
    }

    protected int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }

    /** The time of day, for example {@code 7:36 PM}. */
    protected static String clock(long millis) {
        return format(millis, "h:mm a");
    }

    /** The day, for example {@code 20 September 2026}. */
    protected static String dayLabel(long millis) {
        return format(millis, "d MMMM yyyy");
    }

    /** A day key a list can be grouped by, for example {@code 2026-09-20}. */
    protected static String dayKey(long millis) {
        return format(millis, "yyyy-MM-dd");
    }

    /** How long something lasted, in words. */
    protected static String duration(long start, long end) {
        if (start <= 0L || end <= 0L || end < start) {
            return "";
        }
        long minutes = Math.round((end - start) / 60000.0);
        if (minutes < 1) {
            return "under a minute";
        }
        if (minutes < 60) {
            return minutes + " min";
        }
        long hours = minutes / 60;
        long rest = minutes % 60;
        return rest == 0 ? hours + " hr" : hours + " hr " + rest + " min";
    }

    /** The value, or a question mark when it is missing. */
    protected static String orUnknown(String value) {
        return value == null || value.isEmpty() ? "?" : value;
    }

    private static String format(long millis, String pattern) {
        if (millis <= 0L) {
            return "";
        }
        return new SimpleDateFormat(pattern, Locale.US).format(new Date(millis));
    }

    protected static long asLong(String value) {
        if (value == null) {
            return 0L;
        }
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return 0L;
        }
    }
}
