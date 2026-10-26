package app.xposed.extension;

import android.util.Log;
import android.view.View;

import java.util.List;

/** Entry points called from patched X code. */
@SuppressWarnings("unused")
public final class Hooks {
    static final String TAG = "XPosed";

    private Hooks() {
    }

    /** Replaced at patch time with the obfuscated UsernameBadge class name. */
    public static String usernameBadgeClass() {
        return null;
    }

    /** Replaced at patch time with the obfuscated DefaultAboutProfileRepository class name. */
    public static String aboutRepositoryClass() {
        return null;
    }

    /** Replaced at patch time with "class|idField|usernameField" of TwitterUser. */
    public static String twitterUserFields() {
        return null;
    }

    /** Replaced at patch time with the client event and item field names, see Engagement. */
    public static String scribeFields() {
        return null;
    }

    /** Called at the end of every TwitterUser constructor. */
    public static void onTwitterUser(Object user) {
        Users.onTwitterUser(user);
    }

    /** Called before X dispatches a client event; true drops it. */
    public static boolean shouldDropEvent(Object event) {
        try {
            return Engagement.shouldDrop(event);
        } catch (Throwable t) {
            return false;
        }
    }

    /** Called at the start of TweetHeaderView.setData; returns the badge list to use. */
    public static List<Object> onSetHeaderData(View view, String name, String username, String timestamp, List<Object> badges) {
        try {
            return HeaderBadges.onSetData(view, name, username, timestamp, badges);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to add badge", t);
            return badges;
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
}
