package app.fakh.extension.smartlife;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.fakh.extension.shared.AppRuntime;

/**
 * The switches of these patches: their state, the Fakh Patches row in Settings that opens their page, and the hooks
 * of the patches that ask whether their switch is on. A switch only counts when its patch is in the app: each patch
 * lists its switch in {@code assets/fakh_switches.txt}.
 */
public final class Switches {
    /** Glass navigation bar and glass cards. */
    static final String LIQUID_GLASS = "fakh_liquid_glass";
    /** Dark device panels. */
    static final String DARK_PANELS = "fakh_dark_panels";
    private static final String PLUS = "fakh_hide_plus";
    private static final String EXPLORE = "fakh_hide_explore";
    private static final String MALL_TAB = "fakh_hide_mall_tab";
    private static final String PREFS = "fakh_patches";

    /** What a switch does, for the switches whose title does not say. */
    static final Map<String, String> DESCRIPTIONS = new LinkedHashMap<>();

    /** The title of each switch, the name of its patch, by section in the order the page shows them. */
    static final Map<String, Map<String, String>> SECTIONS = new LinkedHashMap<>();

    static {
        Map<String, String> home = section("Home");
        home.put(PLUS, "Hide Plus button");
        home.put("fakh_hide_recommended", "Hide Recommended for you");
        home.put("fakh_hide_ai_bar", "Hide AI ask bar");
        Map<String, String> bar = section("Navigation bar");
        bar.put(EXPLORE, "Hide Explore tab");
        bar.put(MALL_TAB, "Hide Mall tab");
        Map<String, String> me = section("Me");
        me.put("fakh_hide_rewards", "Hide Rewards Hub");
        me.put("fakh_hide_orders", "Hide My Orders");
        me.put("fakh_hide_ai_web", "Hide Tuya AI Web Version");
        me.put("fakh_hide_me_banner", "Hide Me banner");
        me.put("fakh_hide_app_mall", "Hide App Mall");
        Map<String, String> look = section("Appearance");
        look.put(LIQUID_GLASS, "Liquid Glass");
        look.put(DARK_PANELS, "Dark Device Panels");
        DESCRIPTIONS.put(DARK_PANELS, "Force dark on device control panels that have no dark mode. Applies when you open a panel, and only in dark mode.");
        section("Ads").put("fakh_hide_ads", "Hide ads");
    }

    /** The switches of the patches in the app. */
    private static List<String> present;
    /** The About cell that is the Fakh Patches row, for each Settings page. */
    private static final Map<Context, Object> rows = new WeakHashMap<>();

    private Switches() {
    }

    private static Map<String, String> section(String title) {
        Map<String, String> switches = new LinkedHashMap<>();
        SECTIONS.put(title, switches);
        return switches;
    }

    /**
     * Whether the switch {@code key} is on: on until turned off, and off when its patch is not in the app. Asked by
     * the patches' code before it hides or changes anything.
     *
     * @param key the switch's key
     * @return the switch's state
     */
    public static boolean on(String key) {
        return present(key) && prefs().getBoolean(key, true);
    }

    /** Whether the patch of the switch {@code key} is in the app. */
    static boolean present(String key) {
        if (present == null) present = lines(asset("fakh_switches.txt"));
        return present.contains(key);
    }

    /** Turns the switch {@code key} on or off. */
    static void set(String key, boolean on) {
        prefs().edit().putBoolean(key, on).apply();
    }

    /** Whether the glass navigation bar and glass cards are on. */
    static boolean liquidGlass(Context context) {
        return on(LIQUID_GLASS);
    }

    /** Whether dark device panels are on. */
    static boolean darkPanels(Context context) {
        return on(DARK_PANELS);
    }

    /**
     * Injected before each return of the navigation bar's tab config loader: drops the tabs whose hide switch is on.
     * The loader caches what it returns, so a change applies after a restart.
     *
     * @param module the loaded TabModule, or null
     */
    @SuppressWarnings("unchecked")
    public static void tabs(Object module) {
        if (module == null) return;
        try {
            List<Object> tabs = (List<Object>) module.getClass().getField("tabList").get(module);
            if (tabs == null) return;
            for (Iterator<Object> it = tabs.iterator(); it.hasNext(); ) {
                Object name = it.next();
                name = name.getClass().getField("name").get(name);
                if ("thing_smart_tab".equals(name) && on(EXPLORE) || "mall".equals(name) && on(MALL_TAB)) it.remove();
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            // The tabs stay as the app loaded them.
        }
    }

    /**
     * Injected at the end of the Plus pill's constructor: hides the pill while its switch is on.
     *
     * @param menu the AIPlusMenuView
     */
    public static void plus(View menu) {
        if (!on(PLUS)) return;
        View pill = menu.findViewById(menu.getResources().getIdentifier("iv_plus", "id", menu.getContext().getPackageName()));
        if (pill != null) pill.setVisibility(View.GONE);
    }

    private static SharedPreferences prefs() {
        return AppRuntime.application().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Injected at the end of the About cell's bind: the Fakh Patches row gets its title and opens the switches' page.
     * The row is in Settings only when a patch with a switch is in the app.
     *
     * @param cell   the AboutCell being bound
     * @param holder its view holder, or the holder's item view
     */
    public static void bound(Object cell, Object holder) {
        View row;
        try {
            // R8 reuses the holder's register for its item view by the end of the bind.
            row = holder instanceof View ? (View) holder : (View) holder.getClass().getField("itemView").get(holder);
        } catch (ReflectiveOperationException failure) {
            return;
        }
        Context context = row.getContext();
        // The page binds its rows from the top, and the Fakh Patches row is above About: the first About cell bound
        // on a Settings page is the Fakh Patches row, and stays it on every bind after.
        if (!rows.containsKey(context)) rows.put(context, cell);
        if (rows.get(context) != cell) return;
        TextView title = row.findViewById(context.getResources().getIdentifier("menu_list_title", "id", context.getPackageName()));
        if (title != null) title.setText("Fakh Patches");
        row.setOnClickListener(view -> context.startActivity(new Intent(context, FakhPatchesActivity.class)));
    }

    /** The text of the app's asset {@code name}, or an empty text when it has none. */
    private static String asset(String name) {
        try (InputStream in = AppRuntime.application().getAssets().open(name)) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            for (int read; (read = in.read(buffer)) > 0; ) bytes.write(buffer, 0, read);
            return bytes.toString("UTF-8");
        } catch (Exception failure) {
            return "";
        }
    }

    /** The non-empty lines of {@code text}. */
    private static List<String> lines(String text) {
        List<String> lines = new ArrayList<>();
        for (String line : text.split("\n")) {
            if (!line.trim().isEmpty()) lines.add(line.trim());
        }
        return lines;
    }
}
