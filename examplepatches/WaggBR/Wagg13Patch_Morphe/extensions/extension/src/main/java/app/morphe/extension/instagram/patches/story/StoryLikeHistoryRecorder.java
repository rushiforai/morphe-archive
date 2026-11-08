/*
 * Story like history (Morphe) — capture of the "heart" tap.
 *
 * Instagram's story viewer reports heart taps through LX/09TS.A0W (reached from the
 * viewer's click listener after haptic feedback); older/alternate paths report the new
 * like state through LX/0ATY.FhI / LX/0H13.FhI / LX/0AkV.FhG. The fields and helper names
 * are the obfuscated ones of the single supported version (452.1.0.53.64), reached by
 * reflection so a rename downgrades this patch to a no-op instead of crashing the app.
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Application;
import android.content.Context;
import android.util.Log;

@SuppressWarnings("unused")
public final class StoryLikeHistoryRecorder {
    private static final String TAG = "StoryLikeHistory";

    private StoryLikeHistoryRecorder() {
    }

    /**
     * Called from the patched story viewer right before it applies a new like state.
     * Records only {@code LIKED}; anything unexpected is ignored.
     */
    public static void onLikeStateChanged(Object action, Object reelItem) {
        try {
            Log.i(TAG, "onLikeStateChanged action=" + name(action) + " reel=" + (reelItem != null ? reelItem.getClass().getSimpleName() : "null"));
            if (reelItem == null) return;
            if (!"LIKED".equals(name(action))) {
                // An unlike arriving through a like-state path: forget the story too.
                removeRecord(reelItem);
                return;
            }

            Application app = application();
            if (app == null) {
                Log.w(TAG, "no application context");
                return;
            }

            String storyId = text(readField(reelItem, "A1F"));
            if (storyId.isEmpty()) {
                Log.w(TAG, "no story id (A1F)");
                return;
            }

            Object user = readField(reelItem, "A1D");
            String username = readUsername(user);
            String displayName = callString(user, "A7a");
            if (displayName.isEmpty()) displayName = username;

            long postedAt = callLong(reelItem, "A06");
            if (postedAt <= 0L || postedAt == Long.MAX_VALUE) postedAt = 0L;

            StoryLikeHistory.add(app, new StoryLikeHistoryEntry(
                    storyId,
                    "",
                    username,
                    displayName,
                    postedAt,
                    System.currentTimeMillis(),
                    null));

            String thumbnail = imageUrl(reelItem, app);
            boolean video = isVideo(reelItem);
            Log.i(TAG, "recorded storyId=" + storyId + " user=" + username + " name=" + displayName
                    + " postedAt=" + postedAt + " video=" + video + " thumb=" + (thumbnail.isEmpty() ? "<none>" : thumbnail));
            if (!thumbnail.isEmpty()) {
                StoryLikeHistory.saveThumbnail(app, storyId, thumbnail, video);
            }
        } catch (Throwable t) {
            Log.e(TAG, "could not record story like", t);
        }
    }

    // ---- reflection over the target's obfuscated model --------------------------------

    /** {@code ReelItem.A1F}: the story's id; empty when the field moved. */
    private static Object readField(Object target, String name) {
        return readFieldAnywhere(target, name);
    }

    /**
     * Reads a field by name, walking up the class hierarchy and bypassing visibility.
     * Needed because the holder's {@code A00} lives on its parent class, and obfuscated
     * members are not guaranteed to be Java-public.
     */
    private static Object readFieldAnywhere(Object target, String name) {
        if (target == null) return null;
        Class<?> cls = target.getClass();
        while (cls != null) {
            try {
                java.lang.reflect.Field field = cls.getDeclaredField(name);
                field.setAccessible(true);
                Object value = field.get(target);
                Log.i(TAG, "readField " + cls.getName() + "." + name + " -> "
                        + (value == null ? "null" : value.getClass().getName()));
                return value;
            } catch (NoSuchFieldException e) {
                cls = cls.getSuperclass();
            } catch (Throwable t) {
                Log.w(TAG, "readField " + cls.getName() + "." + name + " failed: " + t);
                return null;
            }
        }
        Log.w(TAG, "readField ." + name + " not found on " + target.getClass().getName());
        return null;
    }

    /**
     * Fallback: scans every field (including inherited) for a value that looks like a
     * story item, in case the holder chain differs from the researched shape.
     */
    private static Object scanForReelItem(Object holder) {
        try {
            Class<?> cls = holder.getClass();
            while (cls != null) {
                for (java.lang.reflect.Field field : cls.getDeclaredFields()) {
                    try {
                        field.setAccessible(true);
                        Object value = field.get(holder);
                        if (value == null) continue;
                        String type = field.getType().getName();
                        String actual = value.getClass().getName();
                        if (type.endsWith("ReelItem") || actual.endsWith("ReelItem")
                                || type.endsWith("/ReelItem;") || actual.contains("ReelItem")) {
                            return value;
                        }
                    } catch (Throwable ignored) {
                    }
                }
                cls = cls.getSuperclass();
            }
        } catch (Throwable t) {
            Log.w(TAG, "scanForReelItem failed: " + t);
        }
        return null;
    }

    /**
     * Reads the field declared on one exact class, replicating an smali
     * {@code iget} that names its defining class. Unlike the hierarchy walk, this is
     * immune to subclass shadowing (a subclass field with the same name hiding the one
     * the target code actually reads).
     */
    private static Object readFieldOn(String binaryName, String name, Object target) {
        if (target == null) return null;
        try {
            Class<?> cls = Class.forName(binaryName);
            java.lang.reflect.Field field = cls.getDeclaredField(name);
            field.setAccessible(true);
            Object value = field.get(target);
            Log.i(TAG, "readFieldOn " + binaryName + "." + name + " -> "
                    + (value == null ? "null" : value.getClass().getName()));
            return value;
        } catch (Throwable t) {
            Log.w(TAG, "readFieldOn " + binaryName + "." + name + " failed: " + t);
            return null;
        }
    }

    /** Reads a static field (e.g. an enum constant) by class and field name. */
    private static Object readStaticField(String binaryName, String name) {
        try {
            Class<?> cls = Class.forName(binaryName);
            java.lang.reflect.Field field = cls.getField(name);
            field.setAccessible(true);
            return field.get(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Calls a no-arg method by name, walking up the class hierarchy. */
    private static Object callMethodAnywhere(Object target, String method) {
        if (target == null) return null;
        Class<?> cls = target.getClass();
        while (cls != null) {
            try {
                java.lang.reflect.Method m = cls.getDeclaredMethod(method);
                m.setAccessible(true);
                return m.invoke(target);
            } catch (NoSuchMethodException e) {
                cls = cls.getSuperclass();
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    /** Calls a one-arg method by name, walking up the class hierarchy. */
    private static Object callMethodAnywhere(Object target, String method, Class<?> argType, Object arg) {
        if (target == null) return null;
        Class<?> cls = target.getClass();
        while (cls != null) {
            try {
                java.lang.reflect.Method m = cls.getDeclaredMethod(method, argType);
                m.setAccessible(true);
                return m.invoke(target, arg);
            } catch (NoSuchMethodException e) {
                cls = cls.getSuperclass();
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    private static String text(Object value) {
        return value instanceof String ? (String) value : "";
    }

    /** {@code User.A7a()}: full name (falls back to the username when empty). */
    private static String callString(Object target, String method) {
        return text(callMethodAnywhere(target, method));
    }

    /**
     * The author's @username. The {@code User} object on a story is minimal: its
     * {@code A7J()} falls back to the numeric PK. The real handle lives on its inner
     * delegate ({@code User.A01}, a {@code 01xp}): field {@code A7w} (with {@code A88} as
     * a second copy). Falls back to {@code A7J()} when the delegate is missing.
     */
    private static String readUsername(Object user) {
        Object inner = readFieldAnywhere(user, "A01");
        String username = text(readFieldAnywhere(inner, "A7w"));
        if (username.isEmpty()) username = text(readFieldAnywhere(inner, "A88"));
        if (username.isEmpty()) username = callString(user, "A7J");
        return username;
    }

    /** {@code ReelItem.A06()}: the story's publish time, {@link Long#MAX_VALUE} when unset. */
    private static long callLong(Object target, String method) {
        Object value = callMethodAnywhere(target, method);
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    /** {@code ReelItem.A0D(Context)}: the cover image the viewer shows for this story. */
    private static String imageUrl(Object reelItem, Context context) {
        try {
            Object imageUrl = callMethodAnywhere(reelItem, "A0D", Context.class, context);
            if (imageUrl == null) return "";
            Object url = Class.forName("com.instagram.common.typedurl.ImageUrl")
                    .getMethod("getUrl").invoke(imageUrl);
            return text(url);
        } catch (Throwable t) {
            return "";
        }
    }

    /** {@code ReelItem.A0b()} yields a URL only for video stories. */
    private static boolean isVideo(Object reelItem) {
        Object url = callMethodAnywhere(reelItem, "A0b");
        return url instanceof String && !((String) url).isEmpty();
    }

    private static String name(Object enumValue) {
        if (enumValue instanceof Enum) return ((Enum<?>) enumValue).name();
        return "";
    }

    /**
     * Called from the patched like-toggle entry point (452: {@code LX/09TS.A0W}).
     * That method runs on every heart-icon tap, for likes and unlikes alike, and only
     * carries its own holder object. The story and the tap's direction are recovered here:
     * the holder's {@code A00} (declared on its parent) leads to the viewed item, whose
     * {@code A05} is the {@code ReelItem}; the item's current like state (via
     * {@code MediaExtKt.A0X}) tells likes apart from unlikes. Likes delegate to
     * {@link #onLikeStateChanged} so both capture paths share one extraction routine.
     */
    public static void onStoryToggle(Object toggle) {
        try {
            Log.i(TAG, "onStoryToggle toggle=" + (toggle == null ? "null" : toggle.getClass().getName()));
            if (toggle == null) return;

            Object holder = readFieldOn("X.0Kc7", "A00", toggle);
            Log.i(TAG, "onStoryToggle holder=" + (holder == null ? "null" : holder.getClass().getName()));
            Object reelItem = readFieldOn("X.0A86", "A05", holder);
            if (reelItem == null && holder != null) {
                reelItem = scanForReelItem(holder);
                Log.i(TAG, "onStoryToggle scan=" + (reelItem == null ? "null" : reelItem.getClass().getName()));
            }
            if (reelItem == null) {
                Log.w(TAG, "no reel item (A00/A05)");
                return;
            }

            if (currentlyLiked(reelItem)) {
                Log.i(TAG, "toggle is an unlike, removing");
                removeRecord(reelItem);
                return;
            }

            Object liked = readStaticField("X.04gU", "A02");
            if (liked == null) {
                Log.w(TAG, "no LIKED enum (04gU.A02)");
                return;
            }
            onLikeStateChanged(liked, reelItem);
        } catch (Throwable t) {
            Log.e(TAG, "could not record story toggle", t);
        }
    }

    /** True when the story's current like state is {@code LIKED} (so this tap unlikes). */
    private static boolean currentlyLiked(Object reelItem) {
        try {
            Object media = callMethodAnywhere(reelItem, "A0G");
            if (media == null) return false;
            Class<?> extKt = Class.forName("com.instagram.feed.media.MediaExtKt");
            java.lang.reflect.Method m = extKt.getMethod("A0X", Class.forName("com.instagram.feed.media.Media"));
            Object state = m.invoke(null, media);
            return "LIKED".equals(name(state));
        } catch (Throwable t) {
            // Fail open: a broken state read must not swallow a real like.
            return false;
        }
    }

    /**
     * Forgets the story's record (unlike path). Best effort: a missing id or context
     * just logs, so an unlike never crashes the viewer.
     */
    private static void removeRecord(Object reelItem) {
        try {
            String storyId = text(readField(reelItem, "A1F"));
            if (storyId.isEmpty()) {
                Log.w(TAG, "no story id (A1F)");
                return;
            }
            Application app = application();
            if (app == null) {
                Log.w(TAG, "no application context");
                return;
            }
            StoryLikeHistory.remove(app, storyId);
            Log.i(TAG, "removed storyId=" + storyId);
        } catch (Throwable t) {
            Log.e(TAG, "could not remove story record", t);
        }
    }

    private static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
