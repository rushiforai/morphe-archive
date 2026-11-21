package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.functions.Function0;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class Settings {
    public enum Feature {
        SPONSORED(0, "Sponsored products", "Hide product cards marked as advertisements."),
        ORDER_ADS(0, "Order advertising widgets", "Hide configured ads in order listing, details and confirmation."),
        ORDER_FINANCE(0, "Loan banners in My Orders", "Hide identified promotions; keep repayment-marked banners."),
        CONFIRMATION_AD(0, "Pay Later confirmation banner", "Hide the configured Pay Later promotion after an order."),
        WISHLIST_AD(0, "Wishlist Pay Later banner", "Hide the buy now, pay next month banner in Wishlist."),
        PROMO_POPUP(0, "Floating promotions", "Hide sale popups and floating campaign ads like Locked Deals."),
        PAY_LATER_PRICE(0, "Pay Later price line", "Hide Pay Later prices in listings and the Pay next month product banner."),
        SHOP_RATINGS(1, "Hide shop ratings", "Keep product ratings only. Missing ratings stay missing."),
        AUTO_SORT(1, "Automatic page sorting", "Sort each new search page by product rating count.", false),
        FLOATING_SORT(1, "Floating sort button", "Sort all loaded search or category products when you tap.", false),
        FEED_VIDEOS(2, "Hide videos in feeds", "Remove reel cards from feeds. Keep the video tab.", false),
        PROFILE_LOANS(2, "Hide Loans in profile", "Hide the Loans shortcut without changing payment services.", false),
        REFER_EARN(2, "Hide Refer and Earn", "Remove Refer and Earn from the home header and account screen.", false),
        PROFILE_PAY_LATER(2, "Hide Pay Later in profile", "Hide Pay Later and deferred-payment shortcuts.", false),
        GOLD_TRAY(2, "Hide Gold tray in search", "Remove the Gold Premium Quality row. Gold cards in results stay.", false),
        SUGGESTION_TRAY(2, "Hide You may also like", "Remove the suggested searches row from search results.", false),
        RELATED_TRAY(2, "Hide related category trays", "Remove category rows like Storage Drawer Units from search results.", false),
        RECENT_SHELF(2, "Hide recently viewed categories", "Remove the recently viewed category shelf from the home screen.", false),
        SIMILAR_TRAY(2, "Hide Similar Products", "Remove the row added after returning from a product in search, categories or the home feed.", false),
        TELEMETRY(3, "Block analytics and telemetry", "Stop Meesho events, SMS inbox upload, AppsFlyer, Facebook and Firebase analytics."),
        HEADER_ACCOUNT(2, "Hide Account in header", "Remove the profile button from the home header. Add Account to the Tab bar.", false);

        final int category;
        final String title;
        final String summary;
        final boolean defaultOn;

        Feature(int category, String title, String summary) {
            this(category, title, summary, true);
        }

        Feature(int category, String title, String summary, boolean defaultOn) {
            this.category = category;
            this.title = title;
            this.summary = summary;
            this.defaultOn = defaultOn;
        }

        public boolean available() {
            switch (this) {
                case SPONSORED:
                case ORDER_ADS:
                case ORDER_FINANCE:
                case CONFIRMATION_AD:
                case WISHLIST_AD:
                case PROMO_POPUP: return Unclutter.hideAds();
                case PAY_LATER_PRICE: return Unclutter.hidePayLaterPrice();
                case SHOP_RATINGS: return Unclutter.productRatings();
                case AUTO_SORT: return Unclutter.sortRatings();
                case FLOATING_SORT: return Unclutter.loadedSort();
                case FEED_VIDEOS: return Unclutter.hideFeedVideos();
                case PROFILE_LOANS:
                case PROFILE_PAY_LATER: return Unclutter.hideFinanceProfile();
                case REFER_EARN: return Unclutter.hideReferEarn();
                case GOLD_TRAY:
                case SUGGESTION_TRAY:
                case RELATED_TRAY:
                case RECENT_SHELF:
                case SIMILAR_TRAY: return Unclutter.hideSearchTrays();
                case HEADER_ACCOUNT: return Unclutter.hideNavTabs();
                case TELEMETRY: return Unclutter.blockTelemetry();
                default: throw new IllegalStateException("Unknown Morphe feature");
            }
        }
    }

    // Inline PNG: Meesho's string-image loader cannot decode vector resource URIs.
    private static final String PROFILE_ICON = "data:image/png;base64,"
        + "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAABwklEQVR42u2bwQ3DIAxFMwKjZISMkBEyQkbIJpwq9ZYNygiMkBEY"
        + "IeVApSqijSE2FfQf/qmo4BewwZjufnt0/6wOAMp0pLwWr9XLeDmv/SAXfltDW9USgDli8JnmlgDoDAC6JQAmA4CpAQB1ne6Z4hwD"
        + "O4ApOC5NGIQEABX6dmEsRQEc1/TmNXxoO1wA8O0/Nw6fkTPlbaLnHi8AGBMjik1dEpzGH7/ERGx/Jvs2xTWxveIGoBKNcQyGX/lP"
        + "MgQqACtgkLQsFwBdofFkx0gJdXvlmnIBKKG1XFrumz9oefqTlgHF+28VG7+dRQOKExwqBjBwhcG5QuNn7p2gbin85Z4FXCVeX+Qs"
        + "wLknMCHv9y5TKvbnAuDYDp8lO1/J0yLb4JQoMDIMqE+A3TMAH1OjgAqeUzNPx+QzeuYJlLLsdLBRxQAsQk6pv+en3XqhMS0xAKtk"
        + "Rxck8WHWGAAj0BHH7Y4SGJeJAXBSnfzoXoG0V+BIXUtOf8llAAAAAABwggiD2AhhK4zDEI7DSIggJYakKNLiuBjB1RguR3E9jgIJ"
        + "lMigSAplciiURKksiqVRLo8HE3gyg0dTeDaHh5N4OovH0/+hJ072HQCma4EJAAAAAElFTkSuQmCC";
    private static final String CATEGORY_LIST = "com.meesho.discovery.catalog.impl.list.CatalogListActivity";
    private static volatile SharedPreferences preferences;
    private static WeakReference<Activity> foreground = new WeakReference<>(null);

    private Settings() {}

    public static synchronized void initialize(Context context) {
        if (preferences != null) return;
        Application application = (Application) context.getApplicationContext();
        preferences = application.getSharedPreferences("morphe_settings", Context.MODE_PRIVATE);
        if (Unclutter.blockTelemetry()) Telemetry.configureSdks(application, preferences);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityResumed(Activity activity) {
                foreground = new WeakReference<>(activity);
                String name = activity.getClass().getName();
                if (name.equals("com.meesho.supply.main.HomeActivity")) NavTabs.apply(activity);
                else if (name.equals(CATEGORY_LIST)) LoadedSort.show(activity);
            }
            public void onActivityPaused(Activity activity) {
                if (foreground.get() == activity) foreground.clear();
                if (activity.getClass().getName().equals(CATEGORY_LIST)) LoadedSort.hide(activity);
            }
            public void onActivityCreated(Activity activity, Bundle state) {}
            public void onActivityStarted(Activity activity) {}
            public void onActivityStopped(Activity activity) {}
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
            public void onActivityDestroyed(Activity activity) {}
        });
    }

    public static boolean enabled(Feature feature) {
        SharedPreferences prefs = preferences;
        return feature.available() && (prefs == null ? feature.defaultOn : prefs.getBoolean(feature.name(), feature.defaultOn));
    }

    static boolean save(Feature feature, boolean enabled) {
        if (preferences == null) throw new IllegalStateException("Morphe settings not initialized");
        boolean saved = preferences.edit().putBoolean(feature.name(), enabled).commit();
        if (!saved) Log.e("WindowShopper", "Could not persist setting: " + feature.name());
        return saved;
    }

    // Ordered tab id names, e.g. "action_first_menu,action_account"; empty keeps Meesho's bar.
    static List<String> tabs() {
        String value = preferences == null ? "" : preferences.getString("NAV_TABS", "");
        return value.isEmpty() ? new ArrayList<>() : new ArrayList<>(Arrays.asList(value.split(",")));
    }

    static boolean saveTabs(List<String> tabs) {
        return preferences != null && preferences.edit().putString("NAV_TABS", String.join(",", tabs)).commit();
    }

    static String exportJson() throws JSONException {
        JSONObject features = new JSONObject();
        for (Feature feature : Feature.values()) features.put(feature.name(), enabled(feature));
        return new JSONObject().put("app", "window-shopper-meesho").put("version", 1)
            .put("features", features).put("tabs", new JSONArray(tabs())).toString(2);
    }

    // Validates everything before writing, so a bad file changes nothing. Returns settings applied.
    static int importJson(String text) throws JSONException {
        JSONObject json = new JSONObject(text);
        if (!"window-shopper-meesho".equals(json.optString("app"))) throw new JSONException("Not a Window Shopper Meesho config");
        JSONObject features = json.getJSONObject("features");
        Map<String, Boolean> values = new LinkedHashMap<>();
        for (Feature feature : Feature.values()) {
            if (features.has(feature.name())) values.put(feature.name(), features.getBoolean(feature.name()));
        }
        List<String> tabs = new ArrayList<>();
        JSONArray list = json.optJSONArray("tabs");
        if (list != null) for (int i = 0; i < list.length(); i++) tabs.add(list.getString(i));
        if (tabs.size() > NavTabs.MAX) throw new JSONException("Up to " + NavTabs.MAX + " tabs");
        if (preferences == null) throw new IllegalStateException("Morphe settings not initialized");
        SharedPreferences.Editor edit = preferences.edit();
        for (Map.Entry<String, Boolean> value : values.entrySet()) edit.putBoolean(value.getKey(), value.getValue());
        if (list != null) edit.putString("NAV_TABS", String.join(",", tabs));
        if (!edit.commit()) throw new IllegalStateException("Could not save imported settings");
        return values.size() + (list != null ? 1 : 0);
    }

    // Tabs seen on the home screen (id name -> title), so the picker can list them.
    static LinkedHashMap<String, String> knownTabs() {
        LinkedHashMap<String, String> tabs = new LinkedHashMap<>();
        String value = preferences == null ? "" : preferences.getString("NAV_KNOWN", "");
        for (String entry : value.split("\n")) {
            int split = entry.indexOf('=');
            if (split > 0) tabs.put(entry.substring(0, split), entry.substring(split + 1));
        }
        return tabs;
    }

    static void rememberTabs(Map<String, String> seen) {
        LinkedHashMap<String, String> tabs = knownTabs();
        tabs.putAll(seen);
        StringBuilder value = new StringBuilder();
        for (Map.Entry<String, String> tab : tabs.entrySet()) {
            value.append(tab.getKey()).append('=').append(tab.getValue().replace('\n', ' ')).append('\n');
        }
        if (preferences != null && !value.toString().equals(preferences.getString("NAV_KNOWN", ""))) {
            preferences.edit().putString("NAV_KNOWN", value.toString()).apply();
        }
    }

    public static Object wishlistBanner(Object config) {
        return enabled(Feature.WISHLIST_AD) ? null : config;
    }


    public static boolean hideSimilarTray() { return enabled(Feature.SIMILAR_TRAY); }

    public static boolean showPayLaterPrice(boolean show) { return show && !enabled(Feature.PAY_LATER_PRICE); }

    public static boolean profileRow(Object item) {
        if (item == null) return false;
        String type = item.getClass().getName();
        if ("dng".equals(type) || "vi.m".equals(type)) return true;
        if (!"b5a".equals(type) && !"vi.i".equals(type)) return false;
        try {
            Object tag = item.getClass().getField("f").get(item);
            return tag != null && "morphe_settings".equals(tag.getClass().getField("a").get(tag));
        } catch (ReflectiveOperationException error) {
            Log.e("WindowShopper", "Cannot identify Morphe profile row", error);
            return false;
        }
    }

    public static boolean addPayLaterProfile(List<Object> list, Object item) {
        return !enabled(Feature.PROFILE_PAY_LATER) && list.add(item);
    }

    public static boolean addLoanProfile(List<Object> list, Object item) {
        return !enabled(Feature.PROFILE_LOANS) && list.add(item);
    }

    public static void addProfileEntry(List<Object> items) {
        try {
            ClassLoader loader = Settings.class.getClassLoader();
            boolean older = Arrays.stream(Class.forName(
                "com.meesho.account.impl.accountV2.AccountFragmentV2", false, loader).getDeclaredFields())
                .anyMatch(field -> field.getType().getName().equals("v7"));
            Class<?> model = Class.forName(older ? "b5a" : "vi.i", true, loader);
            Class<?> badge = Class.forName(older ? "lw0" : "vi.d", true, loader);
            Class<?> tag = Class.forName(older ? "rgi" : "vi.q", true, loader);
            Object testTag = tag.getConstructor(String.class, String.class, String.class,
                String.class, String.class, int.class).newInstance(
                    "morphe_settings", null, null, null, null, 62);
            Function0<Object> click = () -> {
                Activity activity = foreground.get();
                if (activity != null && !activity.isFinishing()) {
                    SettingsUi.show(activity);
                } else {
                    Log.e("WindowShopper", "No foreground activity for Morphe settings");
                }
                return null;
            };
            Object entry = model.getConstructor(String.class, String.class, boolean.class,
                Function0.class, badge, tag).newInstance("Morphe",
                    PROFILE_ICON, false, click, null, testTag);
            Class<?> nativeRow = Class.forName(older ? "dng" : "vi.m", true, loader);
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                if (!nativeRow.isInstance(item)) continue;
                Object rowTag = nativeRow.getField("h").get(item);
                if (rowTag != null && "settings".equals(tag.getField("a").get(rowTag))) {
                    items.add(i + 1, entry);
                    return;
                }
            }
            throw new IllegalStateException("Native Settings profile row not found");
        } catch (ReflectiveOperationException | IllegalStateException error) {
            Log.e("WindowShopper", "Cannot add Morphe profile entry", error);
            Activity activity = foreground.get();
            if (activity != null) {
                activity.runOnUiThread(() -> Toast.makeText(activity,
                    "Could not add Morphe settings to profile", Toast.LENGTH_LONG).show());
            }
        }
    }
}
