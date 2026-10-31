package app.xposed.extension;

import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import android.util.Log;

/** Entry points called from patched X code. */
@SuppressWarnings("unused")
public final class Hooks {
    static final String TAG = "XPosed";

    /** Returned by {@link #onPost} for posts that should not be shown. Their modifier may be null. */
    public static final Object HIDE = new Object();

    private static volatile Application app;

    private Hooks() {
    }

    /** Replaced at patch time with the about repository and model names, see XAboutApi. */
    public static String aboutApiSpec() {
        return null;
    }

    /** Replaced at patch time with the client event class and field names, see Engagement. */
    public static String clientEventSpec() {
        return null;
    }

    /** Called at the start of X's Application.onCreate. */
    public static void onApplicationCreate(Application application) {
        try {
            app = application;
            Settings.init(application);
            Stats.init(application);
            Lookup.init(application);
            XTheme.init(application);
            Activities.init(application);
            Lookup.addListener(States::changed);
            application.registerComponentCallbacks(new ComponentCallbacks() {
                @Override
                public void onConfigurationChanged(Configuration newConfig) {
                    // X follows the system night mode by default.
                    XTheme.themeChanged();
                }

                @Override
                public void onLowMemory() {
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Failed to start", t);
        }
    }

    /** Called when X creates its GraphQL client. */
    public static void onGraphqlApi(Object api) {
        XAboutApi.setGraphqlApi(api);
        // Build the country tables and icon paths off the main thread, before the first post shows.
        Lookup.runOnWorker(() -> {
            Countries.flagFor("United States");
            Glyphs.forSource("");
        });
    }

    /** Called before X reports a client event; true drops it. */
    public static boolean shouldDropEvent(Object event) {
        try {
            return Engagement.shouldDrop(event);
        } catch (Throwable t) {
            return false;
        }
    }

    /** Called at the start of X's name row; returns the badge list to use. */
    public static Object onNameRow(String handle, Object badges) {
        try {
            return NameBadges.onNameRow(handle, badges);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to add badge", t);
            return badges;
        }
    }

    /** Called at the start of X's Affiliate badge composable; true when it drew our badge instead. */
    public static boolean drawBadge(String url, String description, float sizeDp, Object composer) {
        return NameBadges.drawBadge(url, description, sizeDp, composer);
    }

    /**
     * Called at the start of X's post and quote composables, whose modifier is null when they
     * use the default. Returns {@link #HIDE}, or the modifier to use.
     */
    public static Object onPost(String screenName, long userId, Object modifier) {
        try {
            return PostFilters.onPost(screenName, userId, modifier);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter post", t);
            return modifier;
        }
    }

    static float density() {
        Application a = app;
        return a != null ? a.getResources().getDisplayMetrics().density : 1;
    }
}
