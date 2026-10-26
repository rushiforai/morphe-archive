package app.xposed.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Keeps passive engagement with filtered posts (impressions, dwell time, video views, opening
 * them) out of X's client events. Active engagement such as likes, replies and reposts is
 * untouched. Also feeds the posts-seen statistics, which come from the same events.
 */
final class Engagement {
    /** Event actions that only record that something was on screen or played. */
    private static final Set<String> PASSIVE_ACTIONS = new HashSet<>(Arrays.asList(
            "impression", "results", "linger", "dwell", "view", "show", "visible", "render",
            "heartbeat", "video_view", "view_threshold", "playback_start", "playback_25",
            "playback_50", "playback_75", "playback_95", "playback_complete"
    ));

    private static Class<?> logClass, itemClass;
    private static Field eventName, items, tweetDetails, authorId, itemId, itemType;
    private static volatile boolean ready, broken;

    private Engagement() {
    }

    /** True when the event only concerned filtered posts and should not be reported at all. */
    static boolean shouldDrop(Object event) {
        if (broken || event == null) return false;
        try {
            if (!ready) resolve();
            if (!logClass.isInstance(event)) return false;
            String name = (String) eventName.get(event);
            if (name == null || !isPassive(name)) return false;
            List<?> list = (List<?>) items.get(event);
            if (list == null || list.isEmpty()) return false;
            if (name.endsWith(":results")) countShown(list);
            if (!Settings.zeroEngagement() || !Filters.any()) return false;
            // Mixed events (e.g. a list of shown posts) keep their other items.
            if (!list.removeIf(Engagement::isFilteredItem)) return false;
            Log.d(Hooks.TAG, "Withheld " + name + (list.isEmpty() ? "" : " (partially)"));
            return list.isEmpty();
        } catch (Exception e) {
            broken = true;
            Log.e(Hooks.TAG, "Client event fields are unavailable", e);
            return false;
        }
    }

    /** Elements whose click just opens the post, as opposed to liking, replying and so on. */
    private static final Set<String> OPEN_ELEMENTS = new HashSet<>(Arrays.asList("tweet", "tweet_text"));

    /** Event names repeat endlessly and come from a small set, so the verdict is cached per name. */
    private static final Map<String, Boolean> passiveNames = new ConcurrentHashMap<>();

    private static boolean isPassive(String name) {
        Boolean cached = passiveNames.get(name);
        if (cached != null) return cached;
        boolean passive = classify(name);
        if (passiveNames.size() < 5000) passiveNames.put(name, passive);
        return passive;
    }

    /** Event names are "page:section:component:element:action". */
    private static boolean classify(String name) {
        String[] parts = name.toLowerCase(Locale.ROOT).split(":", -1);
        String action = parts[parts.length - 1];
        String element = parts.length > 1 ? parts[parts.length - 2] : "";
        if (action.equals("navigate") || action.equals("click") && OPEN_ELEMENTS.contains(element)) return true;
        return PASSIVE_ACTIONS.contains(action) || action.endsWith("_impression") || action.startsWith("linger");
    }

    /** "results" events list the posts that were on screen; count each post once. */
    private static void countShown(List<?> list) throws IllegalAccessException {
        for (Object item : list) {
            if (!itemClass.isInstance(item) || itemType.getInt(item) != 0) continue; // 0 = post
            Object details = tweetDetails.get(item);
            if (details == null) continue;
            String handle = Users.handleFor(authorId.getLong(details));
            Stats.postShown(itemId.getLong(item), handle == null ? null : Lookup.peek(handle));
        }
    }

    private static boolean isFilteredItem(Object item) {
        if (!itemClass.isInstance(item)) return false;
        try {
            Object details = tweetDetails.get(item);
            if (details == null) return false;
            String handle = Users.handleFor(authorId.getLong(details));
            return handle != null && Filters.actionFor(Lookup.peek(handle)) != Filters.Action.NONE;
        } catch (IllegalAccessException e) {
            return false;
        }
    }

    /** "logClass|eventName|items|itemClass|tweetDetails|authorId|itemId|itemType" fields, from the patch. */
    private static synchronized void resolve() throws Exception {
        if (ready) return;
        String[] spec = Hooks.scribeFields().split("\\|");
        logClass = Class.forName(spec[0]);
        eventName = field(logClass, spec[1]);
        items = field(logClass, spec[2]);
        itemClass = Class.forName(spec[3]);
        tweetDetails = field(itemClass, spec[4]);
        authorId = field(tweetDetails.getType(), spec[5]);
        itemId = field(itemClass, spec[6]);
        itemType = field(itemClass, spec[7]);
        ready = true;
    }

    private static Field field(Class<?> c, String name) throws NoSuchFieldException {
        for (Class<?> k = c; k != null; k = k.getSuperclass()) {
            try {
                Field f = k.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(c.getName() + "." + name);
    }
}
