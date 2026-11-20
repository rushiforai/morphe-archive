package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.List;
import kotlin.jvm.functions.Function0;

public final class Settings {
    public enum Feature {
        SPONSORED(0, "Sponsored products", "Hide product cards marked as advertisements."),
        ORDER_ADS(0, "Order advertising widgets", "Hide configured ads in order listing, details and confirmation."),
        ORDER_FINANCE(0, "Loan banners in My Orders", "Hide identified promotions; keep repayment-marked banners."),
        CONFIRMATION_AD(0, "Pay Later confirmation banner", "Hide the configured Pay Later promotion after an order."),
        WISHLIST_AD(0, "Wishlist Pay Later banner", "Hide the buy now, pay next month banner in Wishlist."),
        PAY_LATER_PRICE(0, "Pay Later price line", "Hide the secondary price; keep the actual product price."),
        SHOP_RATINGS(1, "Hide shop ratings", "Keep product ratings only. Missing ratings stay missing."),
        AUTO_SORT(1, "Automatic page sorting", "Sort each new search page by product rating count."),
        FLOATING_SORT(1, "Floating sort button", "Sort all loaded search or category products when you tap."),
        FEED_VIDEOS(2, "Hide videos in feeds", "Remove reel cards from feeds. Keep the video tab."),
        FINANCE_TAB(2, "Hide Loans / Pay Later tab", "Free the finance navigation slot for Meesho's alternative tab."),
        PROFILE_LOANS(2, "Hide Loans in profile", "Hide the Loans shortcut without changing payment services."),
        PROFILE_PAY_LATER(2, "Hide Pay Later in profile", "Hide Pay Later and deferred-payment shortcuts."),
        GOLD_TRAY(2, "Hide Gold tray in search", "Remove the Gold Premium Quality row. Gold cards in results stay."),
        SUGGESTION_TRAY(2, "Hide You may also like", "Remove the suggested searches row from search results."),
        SIMILAR_TRAY(2, "Hide Similar Products", "Remove the row added after returning from a product in search, categories or the home feed."),
        NAV_CATEGORIES(2, "Hide Categories tab", "Remove Categories from the bottom tab bar.", false),
        NAV_MALL(2, "Hide Mall tab", "Remove Mall from the bottom tab bar.", false),
        NAV_VIDEO(2, "Hide Video Finds tab", "Remove Video Finds from the bottom tab bar.", false);

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
                case WISHLIST_AD: return Unclutter.hideAds();
                case PAY_LATER_PRICE: return Unclutter.hidePayLaterPrice();
                case SHOP_RATINGS: return Unclutter.productRatings();
                case AUTO_SORT: return Unclutter.sortRatings();
                case FLOATING_SORT: return Unclutter.loadedSort();
                case FEED_VIDEOS: return Unclutter.hideFeedVideos();
                case FINANCE_TAB: return Unclutter.hideFinanceTab();
                case PROFILE_LOANS:
                case PROFILE_PAY_LATER: return Unclutter.hideFinanceProfile();
                case GOLD_TRAY:
                case SUGGESTION_TRAY:
                case SIMILAR_TRAY: return Unclutter.hideSearchTrays();
                case NAV_CATEGORIES:
                case NAV_MALL:
                case NAV_VIDEO: return Unclutter.hideNavTabs();
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

    public static Object wishlistBanner(Object config) {
        return enabled(Feature.WISHLIST_AD) ? null : config;
    }

    public static boolean hideFinanceTab() { return enabled(Feature.FINANCE_TAB); }

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
