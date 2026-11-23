package app.jofslash.extension.booking;

import android.app.Activity;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Date;
import java.util.Locale;

/**
 * The full-screen panel the property page buttons open. It has a tab for each patch that is on:
 * "Price watch" (the stays watched for price drops), "Official site" (Google Hotels in a WebView) and
 * "Contact" (the property's address and contact details).
 */
final class Panel {
    /** Colors for the light and dark theme. */
    static final class Colors {
        int background, surface, text, secondaryText, divider, accent, onAccent, good, bad;

        static Colors of(Activity activity) {
            boolean dark = (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            Colors c = new Colors();
            if (dark) {
                c.background = 0xFF121212;
                c.surface = 0xFF1E1E1E;
                c.text = 0xFFF2F2F2;
                c.secondaryText = 0xFFB0B0B0;
                c.divider = 0xFF3A3A3A;
                c.accent = 0xFF57A6FF;
                c.onAccent = 0xFF00224D;
                c.good = 0xFF6BD18A;
                c.bad = 0xFFFF8A80;
            } else {
                c.background = 0xFFFFFFFF;
                c.surface = 0xFFF2F6FC;
                c.text = 0xFF1A1A1A;
                c.secondaryText = 0xFF595959;
                c.divider = 0xFFDDDDDD;
                c.accent = 0xFF006CE4;
                c.onAccent = 0xFFFFFFFF;
                c.good = 0xFF008234;
                c.bad = 0xFFD4111E;
            }
            return c;
        }
    }

    /** The tab the panel opens on. */
    static final int TAB_WATCH = 0, TAB_OFFICIAL = 1, TAB_CONTACT = 2;

    private final Activity activity;
    private final Colors colors;
    private final HotelInfo hotel;
    private final Stay stay;
    private final boolean showWatch;
    private final boolean showOfficial;
    private final boolean showContact;
    private final int firstTab;
    private final float density;
    private Dialog dialog;
    private OfficialSiteTab officialTab;

    Panel(Activity activity, HotelInfo hotel, Stay stay, boolean showWatch, boolean showOfficial,
          boolean showContact, int firstTab) {
        this.activity = activity;
        this.colors = Colors.of(activity);
        this.hotel = hotel;
        this.stay = stay;
        this.showWatch = showWatch;
        this.showOfficial = showOfficial;
        this.showContact = showContact;
        this.firstTab = firstTab;
        this.density = activity.getResources().getDisplayMetrics().density;
    }

    void show() {
        dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(colors.background);
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.ime());
                v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });

        root.addView(header());

        // The tabs of the patches that are on, in this order.
        final java.util.List<Integer> ids = new java.util.ArrayList<>();
        final java.util.List<String> labels = new java.util.ArrayList<>();
        final java.util.List<View> views = new java.util.ArrayList<>();
        if (showWatch) {
            ids.add(TAB_WATCH);
            labels.add(Strings.TAB_WATCH);
            views.add(new WatchTab(activity, this, colors, hotel, stay).view());
        }
        if (showOfficial) {
            officialTab = new OfficialSiteTab(activity, this, colors, hotel, stay);
            ids.add(TAB_OFFICIAL);
            labels.add(Strings.TAB_OFFICIAL);
            views.add(officialTab.view());
        }
        if (showContact) {
            ids.add(TAB_CONTACT);
            labels.add(Strings.TAB_CONTACT);
            views.add(new ContactTab(activity, this, colors, hotel).view());
        }

        final FrameLayout content = new FrameLayout(activity);
        int first = Math.max(0, ids.indexOf(firstTab));
        if (views.size() > 1) {
            final TextView[] tabs = new TextView[views.size()];
            LinearLayout tabRow = new LinearLayout(activity);
            tabRow.setOrientation(LinearLayout.HORIZONTAL);
            for (int i = 0; i < tabs.length; i++) {
                final int index = i;
                tabs[i] = tab(labels.get(i));
                tabRow.addView(tabs[i], new LinearLayout.LayoutParams(0, dp(48), 1));
                tabs[i].setOnClickListener(v -> select(index, tabs, views, ids));
            }
            root.addView(tabRow);
            root.addView(divider());
            select(first, tabs, views, ids);
        } else if (officialTab != null) {
            officialTab.start();
        }
        for (View view : views) content.addView(view, matchParent());
        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(colors.background));
            if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            boolean dark = colors.background != 0xFFFFFFFF;
            if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
                int light = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                window.getInsetsController().setSystemBarsAppearance(dark ? 0 : light, light);
            }
        }
        dialog.setOnDismissListener(d -> {
            if (officialTab != null) officialTab.destroy();
        });
        dialog.show();
    }

    private void select(int index, TextView[] tabs, java.util.List<View> views, java.util.List<Integer> ids) {
        for (int i = 0; i < tabs.length; i++) {
            boolean on = i == index;
            tabs[i].setTextColor(on ? colors.accent : colors.secondaryText);
            tabs[i].setBackground(on ? underlineDrawable() : null);
            views.get(i).setVisibility(on ? View.VISIBLE : View.GONE);
        }
        // Google is only loaded when the user opens its tab.
        if (ids.get(index) == TAB_OFFICIAL) officialTab.start();
    }

    private android.graphics.drawable.Drawable underlineDrawable() {
        GradientDrawable line = new GradientDrawable();
        line.setColor(colors.accent);
        android.graphics.drawable.LayerDrawable layer = new android.graphics.drawable.LayerDrawable(
                new android.graphics.drawable.Drawable[]{line});
        layer.setLayerInset(0, 0, dp(45), 0, 0);
        return layer;
    }

    private TextView tab(String label) {
        TextView t = text(label, 15, colors.secondaryText, true);
        t.setGravity(Gravity.CENTER);
        return t;
    }

    private View header() {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(8), dp(4), dp(8));

        LinearLayout titles = new LinearLayout(activity);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = text(hotel.name != null ? hotel.name : Strings.DIALOG_TITLE, 18, colors.text, true);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        titles.addView(title);
        if (stay != null) titles.addView(text(stayText(stay), 13, colors.secondaryText, false));
        row.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        TextView close = text("✕", 20, colors.text, false);
        close.setGravity(Gravity.CENTER);
        close.setContentDescription(Strings.CLOSE);
        close.setOnClickListener(v -> dialog.dismiss());
        row.addView(close, new LinearLayout.LayoutParams(dp(48), dp(48)));
        return row;
    }

    // ---------------------------------------------------------------------------------------
    // Helpers shared with the official site tab

    static String stayText(Stay stay) {
        String adults = stay.adults == 1 ? Strings.ADULTS_ONE : String.format(Locale.getDefault(), Strings.ADULTS_MANY, stay.adults);
        String rooms = stay.rooms == 1 ? Strings.ROOMS_ONE : String.format(Locale.getDefault(), Strings.ROOMS_MANY, stay.rooms);
        return String.format(Strings.STAY, shortDate(stay.checkIn), shortDate(stay.checkOut), adults, rooms);
    }

    static String shortDate(String isoDate) {
        try {
            return new SimpleDateFormat("EEE d MMM", Locale.getDefault()).format(new Date(Stay.utcMillis(isoDate)
                    + 12L * 3600 * 1000));
        } catch (RuntimeException e) {
            return isoDate;
        }
    }

    static String day(long time) {
        return new SimpleDateFormat("d MMM", Locale.getDefault()).format(new Date(time));
    }

    static String money(double value, String currency) {
        boolean whole = Math.abs(value - Math.rint(value)) < 0.005 || value >= 10;
        String app = appMoney(value, currency, whole);
        if (app != null) return app;
        try {
            NumberFormat f = NumberFormat.getCurrencyInstance(Locale.getDefault());
            if (currency != null && !currency.isEmpty()) f.setCurrency(Currency.getInstance(currency));
            f.setMaximumFractionDigits(Math.abs(value - Math.rint(value)) < 0.005 || value >= 10 ? 0 : 2);
            f.setMinimumFractionDigits(f.getMaximumFractionDigits());
            return f.format(value);
        } catch (RuntimeException e) {
            return String.format(Locale.getDefault(), "%.0f %s", value, currency == null ? "" : currency);
        }
    }

    /**
     * The price formatted the way the app shows prices (its own currency symbols and language, such
     * as "854 Kč" or "€ 78"), or null when the app's formatter can't be used. Java's formatter
     * would give "CZK854" for Czech crowns in an English locale.
     */
    private static java.lang.reflect.Method createPrice, formatPrice;
    private static Object roundedOption, fractionsOption;
    private static boolean appFormatterMissing;

    private static String appMoney(double value, String currency, boolean whole) {
        if (currency == null || currency.isEmpty() || appFormatterMissing) return null;
        try {
            if (formatPrice == null) {
                Class<?> simplePrice = Class.forName("com.booking.price.SimplePrice");
                Class<?> options = Class.forName("com.booking.price.FormattingOptions");
                createPrice = simplePrice.getMethod("create", String.class, double.class);
                roundedOption = options.getField("rounded").get(null);
                fractionsOption = options.getField("fractions").get(null);
                formatPrice = simplePrice.getMethod("format", options);
            }
            Object price = createPrice.invoke(null, currency, value);
            Object text = formatPrice.invoke(price, whole ? roundedOption : fractionsOption);
            if (text == null) return null;
            String s = text.toString().trim();
            return s.isEmpty() || !s.matches(".*\\d.*") ? null : s;
        } catch (java.lang.reflect.InvocationTargetException e) {
            return null;
        } catch (ReflectiveOperationException | LinkageError e) {
            appFormatterMissing = true;
            return null;
        } catch (Throwable t) {
            return null;
        }
    }

    void openInBrowser(String url) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (ActivityNotFoundException e) {
            Toast.makeText(activity, Strings.NO_BROWSER, Toast.LENGTH_SHORT).show();
        }
    }

    TextView text(String s, int sp, int color, boolean bold) {
        TextView t = new TextView(activity);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    TextView link(String s, View.OnClickListener onClick) {
        TextView t = text(s, 14, colors.accent, true);
        t.setPadding(0, dp(10), 0, dp(10));
        t.setOnClickListener(onClick);
        return t;
    }

    TextView button(String s, View.OnClickListener onClick) {
        TextView t = text(s, 15, colors.onAccent, true);
        t.setGravity(Gravity.CENTER);
        t.setPadding(dp(16), dp(12), dp(16), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colors.accent);
        bg.setCornerRadius(dp(8));
        t.setBackground(bg);
        t.setOnClickListener(onClick);
        return t;
    }

    View card(View inside) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(12), dp(12), dp(12), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colors.surface);
        bg.setCornerRadius(dp(8));
        box.setBackground(bg);
        box.addView(inside);
        return box;
    }

    View divider() {
        View v = new View(activity);
        v.setBackgroundColor(colors.divider);
        v.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2)));
        return v;
    }

    View spaced(View v, int topDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(topDp);
        v.setLayoutParams(lp);
        return v;
    }

    private static FrameLayout.LayoutParams matchParent() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    int dp(float v) {
        return Math.round(v * density);
    }
}
