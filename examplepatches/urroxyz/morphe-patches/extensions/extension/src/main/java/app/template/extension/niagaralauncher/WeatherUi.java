package app.template.extension.niagaralauncher;

import android.app.Activity;
import android.content.*;
import android.graphics.Typeface;
import android.os.*;
import android.text.InputType;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;

import org.json.*;

import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.time.*;
import java.util.*;
import java.util.function.*;

/** Uses Niagara's own sheet factory and layouts; no exported component or separate activity. */
public final class WeatherUi {
    private static final ThreadLocal<Boolean> ORIGINAL = new ThreadLocal<>();
    private static WeakReference<Object> controller = new WeakReference<>(null);

    interface Action {
        Object run(Object[] args) throws Exception;
    }

    interface Sheet {
        void build(Object builder) throws Exception;
    }

    private static final String RHK = "b.RHKshKi0YV2YnJFF";

    static Class<?> type(String name) throws Exception {
        return Class.forName(name);
    }

    static Object unit() throws Exception {
        return type("b.L57JP52yF8jG79j").getField("aJjcCDwdQ7n").get(null);
    }

    static Object proxy(String name, Action action) throws Exception {
        return Proxy.newProxyInstance(
                WeatherUi.class.getClassLoader(),
                new Class[] {type(name)},
                (p, m, a) -> {
                    if (m.getDeclaringClass() == Object.class) {
                        if (m.getName().equals("toString")) return "NiagaraWeatherCallback";
                        if (m.getName().equals("hashCode")) return System.identityHashCode(p);
                        return p == a[0];
                    }
                    return action.run(a == null ? new Object[0] : a);
                });
    }

    static Object f(Object o, String n) throws Exception {
        return WeatherBridge.field(o, n);
    }

    static void set(Object o, String n, Object v) throws Exception {
        WeatherBridge.set(o, n, v);
    }

    static Object call(Object o, String n, Object... a) throws Exception {
        return WeatherBridge.invoke(o, n, a);
    }

    static Context ctx(Object b) throws Exception {
        return (Context) f(b, "aJjcCDwdQ7n");
    }

    static Object uiService() throws Exception {
        Object c = controller.get();
        if (c == null) throw new IllegalStateException("Weather settings controller unavailable");
        return f(c, "EdXckqe0ZBqEnrIhrGab");
    }

    public static void remember(Object c) {
        controller = new WeakReference<>(c);
    }

    public static void settings(Object owner) {
        new Handler(Looper.getMainLooper())
                .post(
                        () -> {
                            try {
                                set(owner, "P9mG6zzKCjetBzaEoHhOBW4q0Xuhy", null);
                            } catch (Exception ignored) {
                            }
                        });
    }

    public static boolean interceptOpen(Object c) {
        if (Boolean.TRUE.equals(ORIGINAL.get())) return false;
        open(c);
        return true;
    }

    public static Object preference(Object builder, Object original) {
        try {
            if (!"weather".equals(f(original, "aJjcCDwdQ7n"))
                    || !original.getClass().getName().equals("b.cD6WKiJ7Jdh83vRQNXije"))
                return original;
            Object row =
                    type("b.jPpbnQHvdQGvrqmc").getConstructor(String.class).newInstance("weather");
            for (String k :
                    new String[] {
                        "cileMK8iL9T",
                        "BU3xaJxCSBOq",
                        "tGxuW2FhK5LXFnPrr4plnTpS",
                        "rUdvo0IC9dOZIZ1ZO",
                        "edMq5DLJ3GLh4TCmscO2HkeJ9rso"
                    }) set(row, k, f(original, k));
            set(
                    row,
                    "UztznoJ3Uzs44xWBGv2j6WRw8Rs",
                    proxy(
                            "b.Bo0brtawy2D",
                            a -> {
                                Object c = controller.get();
                                if (c != null) open(c);
                                return true;
                            }));
            return row;
        } catch (Exception e) {
            android.util.Log.w("UrroWeather", "Native preference bridge unavailable");
            return original;
        }
    }

    static void sheet(String id, String title, Sheet body) {
        try {
            Object callback =
                    proxy(
                            "b.NguYYsOGM8Q",
                            args -> {
                                Object b = args[0];
                                call(type(RHK), "tGxuW2FhK5LXFnPrr4plnTpS", 6, b, id);
                                call(b, "UDIGMFObXqJSCsXenXqs2E6Ngg", title, null);
                                body.build(b);
                                return unit();
                            });
            call(uiService(), "edMq5DLJ3GLh4TCmscO2HkeJ9rso", callback);
        } catch (Exception e) {
            android.util.Log.e(
                    "UrroWeather", "Native weather sheet failed: " + e.getClass().getSimpleName());
        }
    }

    static int res(Context c, String kind, String name) {
        try {
            return type("app.morphe.extension.R$" + kind).getField(name).getInt(null);
        } catch (Exception e) {
            return c.getResources().getIdentifier(name, kind, c.getPackageName());
        }
    }

    static void message(Object b, String text) throws Exception {
        call(type(RHK), "g2V787D7LKwyQLRYtqUwox", b, text, false, 14);
    }

    static void button(
            Object b, String id, String title, String summary, String icon, Runnable click)
            throws Exception {
        Object image =
                icon == null ? null : call(type(RHK), "agLvrubapEM", res(ctx(b), "drawable", icon));
        Object cb =
                proxy(
                        "b.WPu7bRzLttA",
                        a -> {
                            click.run();
                            return unit();
                        });
        call(type(RHK), "rUdvo0IC9dOZIZ1ZO", b, id, title, summary, image, cb, 464);
    }

    static void toggle(
            Object b,
            String id,
            String title,
            String subtitle,
            boolean value,
            Consumer<Boolean> changed)
            throws Exception {
        Object cb =
                proxy(
                        "b.YhxyuWk7aOGeTd",
                        a -> {
                            changed.accept((Boolean) a[2]);
                            return unit();
                        });
        call(type(RHK), "GbP5Ynn36mAJP", b, id, title, subtitle, null, cb, value, 428);
    }

    static void positive(Object b, String title, Runnable save) throws Exception {
        Object cb =
                proxy(
                        "b.YhxyuWk7aOGeTd",
                        a -> {
                            save.run();
                            return unit();
                        });
        call(type(RHK), "lb6jBrguHBDnOcszCTilHFD5j", b, title, null, null, cb, 6);
    }

    static void cancel(Object b) throws Exception {
        call(type(RHK), "hqeUl3vnFtJ3oy0iHAVpZ", b);
    }

    static void content(Object b, Consumer<LinearLayout> render) throws Exception {
        Object binder =
                proxy(
                        "b.WPu7bRzLttA",
                        a -> {
                            View root = (View) a[1];
                            if (!(root instanceof ViewGroup))
                                throw new IllegalStateException(
                                        "Expected Niagara content container");
                            ViewGroup parent = (ViewGroup) root;
                            parent.removeAllViews();
                            parent.setPadding(0, 0, 0, 0);
                            LinearLayout child = new LinearLayout(root.getContext());
                            child.setOrientation(LinearLayout.VERTICAL);
                            child.setPadding(
                                    dp(root.getContext(), 24),
                                    dp(root.getContext(), 8),
                                    dp(root.getContext(), 24),
                                    dp(root.getContext(), 8));
                            parent.addView(child, new ViewGroup.LayoutParams(-1, -2));
                            render.accept(child);
                            return unit();
                        });
        call(b, "BU3xaJxCSBOq", res(ctx(b), "layout", "dialog_sheet_padded_image"), binder);
    }

    public static void open(Object c) {
        remember(c);
        sheet(
                "urro_weather",
                "Weather Forecast",
                b -> {
                    Context context = ctx(b);
                    message(b, "View weekly weather forecast by tapping the date");
                    toggle(
                            b,
                            "show_weather",
                            "Show weather",
                            null,
                            WeatherSources.shown(context),
                            value -> {
                                WeatherSources.nativePreferences(context)
                                        .edit()
                                        .putBoolean("bitpit.launcher.key.WEATHER_ENABLED", value)
                                        .apply();
                                WeatherSources.GENERATION.incrementAndGet();
                                WeatherBridge.invalidate();
                            });
                    toggle(
                            b,
                            "aggregate_weather",
                            "Aggregate data",
                            "Average enabled sources; majority weather condition",
                            WeatherSources.aggregate(context),
                            value -> WeatherSources.aggregate(context, value));
                    button(
                            b,
                            "filter_sources",
                            "Filter sources",
                            null,
                            "ic_ip_act_filter",
                            () -> sources(context));
                    button(
                            b,
                            "weather_location",
                            "Location and units",
                            null,
                            "ic_ip_act_location",
                            () -> {
                                try {
                                    ORIGINAL.set(true);
                                    try {
                                        call(c, "UztznoJ3Uzs44xWBGv2j6WRw8Rs");
                                    } finally {
                                        ORIGINAL.remove();
                                    }
                                } catch (Exception e) {
                                    Toast.makeText(
                                                    context,
                                                    "Native weather options unavailable",
                                                    Toast.LENGTH_SHORT)
                                            .show();
                                }
                            });
                });
    }

    static int dp(Context c, int n) {
        return Math.round(c.getResources().getDisplayMetrics().density * n);
    }

    static TextView text(Context c, String s) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(16);
        t.setPadding(0, dp(c, 8), 0, dp(c, 8));
        return t;
    }

    static EditText edit(LinearLayout parent, String label, String value) {
        Context c = parent.getContext();
        parent.addView(text(c, label));
        EditText e = new EditText(c);
        e.setText(value);
        e.setSingleLine(false);
        e.setMaxLines(4);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        parent.addView(e, new LinearLayout.LayoutParams(-1, -2));
        return e;
    }

    static void back(Context c) {
        for (int i = 0; i < 12 && c instanceof ContextWrapper; i++) {
            if (c instanceof Activity) {
                ((Activity) c).onBackPressed();
                return;
            }
            c = ((ContextWrapper) c).getBaseContext();
        }
    }

    static void sources(Context context) {
        List<WeatherSource> draft = new ArrayList<>();
        for (WeatherSource s : WeatherSources.load(context)) draft.add(s.copy());
        sheet(
                "urro_weather_sources",
                "Filter sources",
                b -> {
                    message(
                            b,
                            "Higher sources have priority. Hold the reorder handle to move a"
                                + " source.");
                    content(b, view -> new SourceList(view, draft).rebuild());
                    positive(b, "Okay", () -> WeatherSources.save(context, draft));
                    cancel(b);
                });
    }

    static final class SourceList {
        final LinearLayout view;
        final List<WeatherSource> draft;

        SourceList(LinearLayout v, List<WeatherSource> d) {
            view = v;
            draft = d;
        }

        void move(int from, int to) {
            if (from < 0 || to < 0 || from >= draft.size() || to >= draft.size() || from == to)
                return;
            WeatherSource s = draft.remove(from);
            draft.add(to, s);
            rebuild();
            view.announceForAccessibility("Source moved to position " + (to + 1));
        }

        void rebuild() {
            view.removeAllViews();
            Context c = view.getContext();
            for (int index = 0; index < draft.size(); index++) {
                WeatherSource source = draft.get(index);
                LinearLayout row = new LinearLayout(c);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinimumHeight(dp(c, 64));
                row.setTag(source.id);
                View tile =
                        LayoutInflater.from(c)
                                .inflate(
                                        res(c, "layout", "dialog_sheet_tile_checkbox"), row, false);
                TextView title = tile.findViewById(res(c, "id", "header_text_view"));
                CompoundButton check = tile.findViewById(res(c, "id", "compound_button"));
                String displayName = source.name;
                try {
                    double[] ll = coordinates(c);
                    displayName =
                            WeatherTemplate.render(
                                    source.name, new WeatherTemplate.Vars(ll[0], ll[1], 0), false);
                } catch (Exception ignored) {
                }
                title.setText(displayName);
                check.setChecked(source.enabled);
                check.setContentDescription(displayName + " enabled");
                check.setOnCheckedChangeListener((v, enabled) -> source.enabled = enabled);
                View icon = tile.findViewById(res(c, "id", "icon_image_view"));
                if (icon != null) icon.setVisibility(View.GONE);
                TextView status = tile.findViewById(res(c, "id", "secondary_text_view"));
                String state = WeatherEngine.STATUS.get(source.id);
                if (status != null) {
                    status.setText(state);
                    status.setVisibility(state == null ? View.GONE : View.VISIBLE);
                }
                String background =
                        draft.size() == 1
                                ? "box_background_secondary_rounded_clickable"
                                : index == 0
                                        ? "box_background_secondary_group_first"
                                        : index == draft.size() - 1
                                                ? "box_background_secondary_group_last"
                                                : "box_background_secondary_group_middle";
                tile.setBackgroundResource(res(c, "drawable", background));
                tile.setOnClickListener(v -> check.setChecked(!check.isChecked()));
                row.addView(tile, new LinearLayout.LayoutParams(0, -2, 1));
                if (source.kind.equals("custom")) {
                    ImageButton edit = new ImageButton(c);
                    edit.setImageResource(res(c, "drawable", "ic_ip_act_edit"));
                    edit.setBackgroundColor(android.graphics.Color.TRANSPARENT);
                    edit.setColorFilter(title.getCurrentTextColor());
                    edit.setContentDescription("Edit " + source.name);
                    edit.setOnClickListener(
                            v ->
                                    editor(
                                            c,
                                            source.copy(),
                                            updated -> {
                                                int at = draft.indexOf(source);
                                                if (at >= 0) {
                                                    if (updated == null) draft.remove(at);
                                                    else draft.set(at, updated);
                                                }
                                                rebuild();
                                            }));
                    row.addView(edit, new LinearLayout.LayoutParams(dp(c, 48), dp(c, 48)));
                }
                ImageButton handle = new ImageButton(c);
                handle.setImageResource(res(c, "drawable", "ic_ip_act_unfold_more"));
                handle.setBackgroundColor(android.graphics.Color.TRANSPARENT);
                handle.setColorFilter(title.getCurrentTextColor());
                handle.setContentDescription("Reorder " + source.name);
                handle.setOnLongClickListener(
                        v -> {
                            v.startDragAndDrop(
                                    ClipData.newPlainText("weather-source", source.id),
                                    new View.DragShadowBuilder(row),
                                    source.id,
                                    0);
                            return true;
                        });
                row.addView(handle, new LinearLayout.LayoutParams(dp(c, 48), dp(c, 48)));
                row.setOnDragListener(
                        (v, event) -> {
                            if (!(event.getLocalState() instanceof String)) return false;
                            if (event.getAction() == DragEvent.ACTION_DRAG_ENTERED)
                                v.setAlpha(0.5f);
                            if (event.getAction() == DragEvent.ACTION_DRAG_EXITED
                                    || event.getAction() == DragEvent.ACTION_DRAG_ENDED)
                                v.setAlpha(1f);
                            if (event.getAction() == DragEvent.ACTION_DROP) {
                                String id = (String) event.getLocalState();
                                int from = -1;
                                for (int n = 0; n < draft.size(); n++)
                                    if (draft.get(n).id.equals(id)) from = n;
                                move(from, draft.indexOf(source));
                            }
                            return true;
                        });
                row.setAccessibilityDelegate(
                        new View.AccessibilityDelegate() {
                            public void onInitializeAccessibilityNodeInfo(
                                    View host, AccessibilityNodeInfo info) {
                                super.onInitializeAccessibilityNodeInfo(host, info);
                                info.addAction(
                                        new AccessibilityNodeInfo.AccessibilityAction(
                                                0x01020001, "Move up"));
                                info.addAction(
                                        new AccessibilityNodeInfo.AccessibilityAction(
                                                0x01020002, "Move down"));
                            }

                            public boolean performAccessibilityAction(
                                    View host, int action, Bundle args) {
                                int from = draft.indexOf(source);
                                if (action == 0x01020001 || action == 0x01020002) {
                                    move(from, from + (action == 0x01020001 ? -1 : 1));
                                    return true;
                                }
                                return super.performAccessibilityAction(host, action, args);
                            }
                        });
                view.addView(row, new LinearLayout.LayoutParams(-1, -2));
            }
            // Labelled, tinted row: an untinted ImageButton rendered invisibly on Niagara's sheet.
            android.widget.TextView add = new android.widget.TextView(c);
            add.setText("Add custom source");
            add.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 15);
            add.setGravity(android.view.Gravity.CENTER);
            int plusId = res(c, "drawable", "ic_ip_act_add");
            if (plusId != 0) {
                android.graphics.drawable.Drawable plus = c.getDrawable(plusId);
                if (plus != null) {
                    plus = plus.mutate();
                    plus.setTint(add.getCurrentTextColor());
                    plus.setBounds(0, 0, dp(c, 24), dp(c, 24));
                    add.setCompoundDrawablesRelative(plus, null, null, null);
                    add.setCompoundDrawablePadding(dp(c, 8));
                }
            }
            android.util.TypedValue ripple = new android.util.TypedValue();
            if (c.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true))
                add.setBackgroundResource(ripple.resourceId);
            add.setClickable(true);
            add.setFocusable(true);
            add.setContentDescription("Add custom weather source");
            add.setOnClickListener(
                    v -> {
                        if (draft.size() >= 16) {
                            Toast.makeText(c, "Maximum 16 sources", Toast.LENGTH_SHORT).show();
                            return;
                        }
                        WeatherSource source =
                                new WeatherSource(
                                        UUID.randomUUID().toString(), "Custom source", "custom");
                        editor(
                                c,
                                source,
                                updated -> {
                                    if (updated != null) draft.add(updated);
                                    rebuild();
                                });
                    });
            add.setPadding(dp(c, 16), 0, dp(c, 16), 0);
            LinearLayout.LayoutParams addParams = new LinearLayout.LayoutParams(-2, dp(c, 56));
            addParams.gravity = Gravity.CENTER_HORIZONTAL;
            view.addView(add, addParams);
        }
    }

    static void choice(
            LinearLayout parent,
            String title,
            String[] values,
            String[] labels,
            Supplier<String> get,
            Consumer<String> set) {
        Context c = parent.getContext();
        TextView row = text(c, title + ": " + choiceLabel(values, labels, get.get()) + "  ›");
        row.setContentDescription(title + ": " + get.get());
        row.setOnClickListener(
                v ->
                        sheet(
                                "urro_weather_format",
                                title,
                                b -> {
                                    for (int i = 0; i < values.length; i++) {
                                        final String value = values[i];
                                        button(
                                                b,
                                                "choice_" + i,
                                                labels[i] + (value.equals(get.get()) ? " ✓" : ""),
                                                null,
                                                null,
                                                () -> {
                                                    set.accept(value);
                                                    row.setText(
                                                            title
                                                                    + ": "
                                                                    + choiceLabel(
                                                                            values, labels, value)
                                                                    + "  ›");
                                                    row.setContentDescription(title + ": " + value);
                                                    back(c);
                                                });
                                    }
                                    cancel(b);
                                }));
        parent.addView(row);
    }

    static void buttonText(View root, String value) {
        if (root instanceof TextView) {
            ((TextView) root).setText(value);
            return;
        }
        if (root instanceof ViewGroup)
            for (int i = 0; i < ((ViewGroup) root).getChildCount(); i++)
                buttonText(((ViewGroup) root).getChildAt(i), value);
    }

    static View formButton(LinearLayout form, String title, boolean primary) {
        View v =
                LayoutInflater.from(form.getContext())
                        .inflate(
                                res(
                                        form.getContext(),
                                        "layout",
                                        primary
                                                ? "dialog_sheet_button_primary"
                                                : "dialog_sheet_button_secondary"),
                                form,
                                false);
        buttonText(v, title);
        v.setContentDescription(title);
        v.setClickable(true);
        return v;
    }

    static String choiceLabel(String[] values, String[] labels, String value) {
        for (int i = 0; i < values.length; i++) if (values[i].equals(value)) return labels[i];
        return value;
    }

    static String label(String field) {
        switch (field) {
            case "dt":
                return "Date and time";
            case "temp":
                return "Temperature";
            case "feels_like":
                return "Feels-like temperature";
            case "id":
                return "Weather condition code";
            case "description":
                return "Weather description";
            case "icon":
                return "Weather icon code";
            case "pop":
                return "Precipitation probability";
            case "min":
                return "Minimum temperature";
            case "max":
                return "Maximum temperature";
            case "morn":
                return "Morning temperature";
            case "eve":
                return "Evening temperature";
            case "day":
                return "Day temperature";
            case "night":
                return "Night temperature";
            case "sunrise":
                return "Sunrise";
            case "sunset":
                return "Sunset";
            default:
                return field;
        }
    }

    static void editor(Context c, WeatherSource source, Consumer<WeatherSource> saved) {
        sheet(
                "urro_weather_custom",
                "Custom weather source",
                b -> {
                    message(
                            b,
                            "Use {lat}, {lon}, {n}, arithmetic and Kotlin-style if/else in URLs and"
                                + " JSON pointers. n is the source record/request index. Mapped"
                                + " timestamps determine forecast dates.");
                    content(
                            b,
                            form -> {
                                Context theme = form.getContext();
                                EditText name = edit(form, "Source name", source.name),
                                        url = edit(form, "URL", source.url);
                                url.setHint("https://example.org/weather?lat={lat}&lon={lon}");
                                Map<String, EditText> fields = new LinkedHashMap<>();
                                choice(
                                        form,
                                        "Request mode",
                                        new String[] {"once", "daily", "hourly"},
                                        new String[] {
                                            "One request · n = 0",
                                            "Indexed daily requests",
                                            "Indexed hourly requests"
                                        },
                                        () -> source.mode,
                                        v -> {
                                            source.mode = v;
                                        });
                                EditText count =
                                        edit(
                                                form,
                                                "Indexed request count (1–168)",
                                                Integer.toString(source.count));
                                count.setInputType(InputType.TYPE_CLASS_NUMBER);
                                choice(
                                        form,
                                        "Temperature units",
                                        new String[] {"C", "F", "K"},
                                        new String[] {"Celsius", "Fahrenheit", "Kelvin"},
                                        () -> source.temperature,
                                        v -> source.temperature = v);
                                choice(
                                        form,
                                        "Timestamp format",
                                        new String[] {"seconds", "milliseconds", "iso"},
                                        new String[] {
                                            "Unix seconds", "Unix milliseconds", "ISO 8601 / date"
                                        },
                                        () -> source.time,
                                        v -> source.time = v);
                                choice(
                                        form,
                                        "Probability format",
                                        new String[] {"fraction", "percent"},
                                        new String[] {"Fraction (0–1)", "Percent (0–100)"},
                                        () -> source.probability,
                                        v -> source.probability = v);
                                choice(
                                        form,
                                        "Condition codes",
                                        new String[] {"OWM", "WMO"},
                                        new String[] {"OpenWeather-style IDs", "WMO weather codes"},
                                        () -> source.codes,
                                        v -> source.codes = v);
                                for (String group : new String[] {"current", "hourly", "daily"}) {
                                    TextView heading =
                                            text(
                                                    theme,
                                                    group.equals("current")
                                                            ? "Current conditions ▾"
                                                            : group.equals("hourly")
                                                                    ? "Hourly forecast ▸"
                                                                    : "Daily forecast ▸");
                                    heading.setTypeface(null, Typeface.BOLD);
                                    form.addView(heading);
                                    LinearLayout section = new LinearLayout(theme);
                                    section.setOrientation(LinearLayout.VERTICAL);
                                    section.setVisibility(
                                            group.equals("current") ? View.VISIBLE : View.GONE);
                                    heading.setOnClickListener(
                                            v ->
                                                    section.setVisibility(
                                                            section.getVisibility() == View.VISIBLE
                                                                    ? View.GONE
                                                                    : View.VISIBLE));
                                    form.addView(section);
                                    if (!group.equals("current"))
                                        section.addView(
                                                text(
                                                        theme,
                                                        "n iterates over source entries. Map each"
                                                            + " record's timestamp; unavailable"
                                                            + " forecast sections are omitted."));
                                    String[] keys =
                                            group.equals("current")
                                                    ? WeatherData.CURRENT
                                                    : group.equals("hourly")
                                                            ? WeatherData.HOURLY
                                                            : WeatherData.DAILY;
                                    for (String key : keys) {
                                        String id = group + "." + key;
                                        section.addView(text(theme, label(key)));
                                        LinearLayout pointer = new LinearLayout(theme);
                                        pointer.setGravity(Gravity.CENTER_VERTICAL);
                                        TextView root = text(theme, "x");
                                        root.setContentDescription("JSON root, fixed");
                                        pointer.addView(root);
                                        EditText value = new EditText(theme);
                                        String path = source.mappings.optString(id, "");
                                        value.setText(
                                                path.startsWith("x") ? path.substring(1) : path);
                                        value.setHint(".weather[{n}]." + key);
                                        value.setInputType(
                                                InputType.TYPE_CLASS_TEXT
                                                        | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
                                        value.setSingleLine(false);
                                        pointer.addView(
                                                value, new LinearLayout.LayoutParams(0, -2, 1));
                                        section.addView(pointer);
                                        fields.put(id, value);
                                    }
                                }
                                TextView result = text(theme, "");
                                result.setTextIsSelectable(true);
                                form.addView(result);
                                Runnable collect =
                                        () -> {
                                            try {
                                                source.name = name.getText().toString().trim();
                                                source.url = url.getText().toString().trim();
                                                WeatherTemplate.render(
                                                        source.name,
                                                        new WeatherTemplate.Vars(44.98, -93.27, 0),
                                                        false);
                                                if (source.name.isEmpty()
                                                        || source.name.length() > 80)
                                                    throw new IllegalArgumentException(
                                                            "Source name must have 1–80"
                                                                + " characters");
                                                source.count =
                                                        Integer.parseInt(
                                                                count.getText().toString());
                                                if (source.count < 1 || source.count > 168)
                                                    throw new IllegalArgumentException(
                                                            "Request count must be 1–168");
                                                if (source.mode.equals("once")) source.count = 1;
                                                for (int n : new int[] {0, 1}) {
                                                    double[] ll = coordinates(theme);
                                                    String expanded =
                                                            WeatherTemplate.render(
                                                                    source.url,
                                                                    new WeatherTemplate.Vars(
                                                                            ll[0], ll[1], n),
                                                                    true);
                                                    java.net.URL endpoint =
                                                            new java.net.URL(expanded);
                                                    if (!endpoint.getProtocol().equals("https")
                                                            || endpoint.getUserInfo() != null)
                                                        throw new IllegalArgumentException(
                                                                "Use an HTTPS URL without"
                                                                    + " user-info");
                                                }
                                                JSONObject mapping = new JSONObject();
                                                for (Map.Entry<String, EditText> e :
                                                        fields.entrySet()) {
                                                    String suffix =
                                                            e.getValue()
                                                                    .getText()
                                                                    .toString()
                                                                    .trim();
                                                    String path = "x" + suffix;
                                                    for (int n : new int[] {0, 1, 6})
                                                        WeatherTemplate.validatePointer(
                                                                path,
                                                                new WeatherTemplate.Vars(
                                                                        44.98, -93.27, n));
                                                    if (!suffix.isEmpty())
                                                        mapping.put(e.getKey(), path);
                                                }
                                                source.mappings = mapping;
                                            } catch (Exception e) {
                                                throw new IllegalArgumentException(
                                                        e instanceof java.net.MalformedURLException
                                                                ? "Invalid URL"
                                                                : e.getMessage());
                                            }
                                        };
                                View test = formButton(form, "Test source", false);
                                test.setOnClickListener(
                                        v -> {
                                            try {
                                                collect.run();
                                                test.setEnabled(false);
                                                result.setText("Testing configured source…");
                                                WeatherSource snapshot = source.copy();
                                                double[] ll = coordinates(theme);
                                                Thread worker =
                                                        new Thread(
                                                                () -> {
                                                                    String output;
                                                                    try {
                                                                        WeatherData d =
                                                                                WeatherEngine
                                                                                        .source(
                                                                                                theme,
                                                                                                snapshot,
                                                                                                ll[
                                                                                                        0],
                                                                                                ll[
                                                                                                        1],
                                                                                                ZoneId
                                                                                                        .systemDefault(),
                                                                                                WeatherSources
                                                                                                        .GENERATION
                                                                                                        .get(),
                                                                                                true);
                                                                        StringBuilder s =
                                                                                new StringBuilder(
                                                                                        "Valid"
                                                                                            + " mapped"
                                                                                            + " data\n");
                                                                        s.append(
                                                                                        "Current"
                                                                                            + " temperature:"
                                                                                            + " ")
                                                                                .append(
                                                                                        d.current
                                                                                                        == null
                                                                                                ? "unavailable"
                                                                                                : d
                                                                                                        .current
                                                                                                        .numbers
                                                                                                        .get(
                                                                                                                "temp"))
                                                                                .append(
                                                                                        " °C\n"
                                                                                            + "Hourly"
                                                                                            + " entries:"
                                                                                            + " ")
                                                                                .append(
                                                                                        d.hourly
                                                                                                .size())
                                                                                .append(
                                                                                        "\n"
                                                                                            + "Daily"
                                                                                            + " entries:"
                                                                                            + " ")
                                                                                .append(
                                                                                        d.daily
                                                                                                .size());
                                                                        for (String w : d.warnings)
                                                                            s.append('\n')
                                                                                    .append(w);
                                                                        for (Map.Entry<
                                                                                        String,
                                                                                        String>
                                                                                path :
                                                                                        paths(
                                                                                                        snapshot)
                                                                                                .entrySet()) {
                                                                            if (path.getKey()
                                                                                            .endsWith(
                                                                                                    "description")
                                                                                    || path.getKey()
                                                                                            .endsWith(
                                                                                                    "temp"))
                                                                                s.append('\n')
                                                                                        .append(
                                                                                                path
                                                                                                        .getKey())
                                                                                        .append(
                                                                                                ": ")
                                                                                        .append(
                                                                                                WeatherTemplate
                                                                                                        .render(
                                                                                                                path
                                                                                                                        .getValue(),
                                                                                                                new WeatherTemplate
                                                                                                                        .Vars(
                                                                                                                        ll[
                                                                                                                                0],
                                                                                                                        ll[
                                                                                                                                1],
                                                                                                                        0),
                                                                                                                false));
                                                                        }
                                                                        output = s.toString();
                                                                    } catch (Exception e) {
                                                                        output =
                                                                                "Source test"
                                                                                    + " failed: "
                                                                                        + (e
                                                                                                                        .getMessage()
                                                                                                                != null
                                                                                                        && e.getMessage()
                                                                                                                .startsWith(
                                                                                                                        "HTTP ")
                                                                                                ? e
                                                                                                        .getMessage()
                                                                                                : e.getClass()
                                                                                                        .getSimpleName());
                                                                    }
                                                                    final String message = output;
                                                                    new Handler(
                                                                                    Looper
                                                                                            .getMainLooper())
                                                                            .post(
                                                                                    () -> {
                                                                                        if (result
                                                                                                .isAttachedToWindow()) {
                                                                                            result
                                                                                                    .setText(
                                                                                                            message);
                                                                                            test
                                                                                                    .setEnabled(
                                                                                                            true);
                                                                                        }
                                                                                    });
                                                                },
                                                                "Niagara-weather-test");
                                                worker.setDaemon(true);
                                                worker.start();
                                            } catch (Exception e) {
                                                result.setText(e.getMessage());
                                            }
                                        });
                                form.addView(test);
                                View save = formButton(form, "Save source", true);
                                save.setOnClickListener(
                                        v -> {
                                            try {
                                                collect.run();
                                                saved.accept(source.copy());
                                                back(theme);
                                            } catch (Exception e) {
                                                result.setText(e.getMessage());
                                            }
                                        });
                                form.addView(save);
                                View remove = formButton(form, "Remove source", false);
                                remove.setOnClickListener(
                                        v -> {
                                            saved.accept(null);
                                            back(theme);
                                        });
                                form.addView(remove);
                            });
                    cancel(b);
                });
    }

    static Map<String, String> paths(WeatherSource s) {
        Map<String, String> r = new LinkedHashMap<>();
        Iterator<String> it = s.mappings.keys();
        while (it.hasNext()) {
            String k = it.next();
            r.put(k, s.mappings.optString(k));
        }
        return r;
    }

    static double[] coordinates(Context c) {
        SharedPreferences p = WeatherSources.nativePreferences(c);
        double lat = p.getFloat("bitpit.launcher.key.WEATHER_LOCATION_LAT", 0),
                lon = p.getFloat("bitpit.launcher.key.WEATHER_LOCATION_LONG", 0);
        return new double[] {Math.rint(lat * 100) / 100, Math.rint(lon * 100) / 100};
    }
}
