package app.xposed.extension;

import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import android.util.Log;

import java.util.Map;

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
     * Called at the start of X's post and quote composables with the author, the AvailablePost
     * (null for quotes), the modifier (null when they use the default), the composer, the row's
     * PaddingValues (null when it has none) and whether it is the opened post. Returns
     * {@link #HIDE}, or the modifier to use.
     */
    public static Object onPost(Object user, Object post, Object modifier, Object composer, Object padding, boolean focal) {
        try {
            return PostFilters.onPost(user, post, modifier, composer, padding, focal);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter post", t);
            return modifier;
        }
    }

    /**
     * Called at the start of X's quote item with the quoted author, the quoted AvailablePost,
     * the modifier and the composer. True when it drew X-Posed's collapsed quote instead.
     */
    public static boolean onQuote(Object user, Object post, Object modifier, Object composer) {
        return Placeholders.quote(user, post, modifier, composer);
    }

    /**
     * Called at the start of a person row in people lists (Followers, Following, search,
     * Who to follow) with the account and the row's modifier. Returns the modifier to use;
     * people are highlighted, never hidden, so the lists stay complete.
     */
    public static Object onPersonRow(Object user, Object modifier) {
        try {
            return PostFilters.onPersonRow(user, modifier);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter person row", t);
            return modifier;
        }
    }

    /** Set after the first failure to read X's models, so a changed release can't spam the log. */
    private static volatile boolean modelsBroken;

    /** Called when X creates a CanonicalPost, on the thread that loads it. */
    public static void onCanonicalPost(Object post) {
        if (modelsBroken) return;
        try {
            Observed.canonicalPost(post);
        } catch (Throwable t) {
            modelsBroken = true;
            Log.e(TAG, "Post languages and relations are unavailable", t);
        }
    }

    /** Called when X creates a ProfileUser, on the thread that loads it. */
    public static void onProfileUser(Object user) {
        if (modelsBroken) return;
        try {
            Observed.profileUser(user);
        } catch (Throwable t) {
            modelsBroken = true;
            Log.e(TAG, "Profile details are unavailable", t);
        }
    }

    /** Called before X maps a GraphQL user to a timeline user, on the thread that parses it. */
    public static void onGraphqlUser(Object user) {
        if (modelsBroken) return;
        try {
            Observed.graphqlUser(user);
        } catch (Throwable t) {
            modelsBroken = true;
            Log.e(TAG, "Timeline profile details are unavailable", t);
        }
    }

    /**
     * Called when Apollo starts writing an operation's variables, before {@link #variablesJson}
     * or {@link #variablesMap} on the same thread. Runs for every GraphQL request.
     */
    public static void beginVariables(Object operation) {
        ProfileInfo.begin(operation);
    }

    /** The variables JSON of a request, with profile info included when {@link ProfileInfo} wants it. */
    public static String variablesJson(String json) {
        try {
            return ProfileInfo.json(json);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to adjust query variables", t);
            return json;
        }
    }

    /** The variables the response parser evaluates, matching {@link #variablesJson}. */
    public static Map<String, Object> variablesMap(Map<String, Object> variables) {
        try {
            return ProfileInfo.map(variables);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to adjust query variables", t);
            return variables;
        }
    }

    static float density() {
        Application a = app;
        return a != null ? a.getResources().getDisplayMetrics().density : 1;
    }
}
