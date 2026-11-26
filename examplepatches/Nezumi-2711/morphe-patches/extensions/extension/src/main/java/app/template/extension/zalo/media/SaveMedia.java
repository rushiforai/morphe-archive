package app.template.extension.zalo.media;

import java.lang.reflect.Field;

import app.template.extension.zalo.buglog.NezumiLog;

/** Hooks that unhide Zalo's native "Save" for profile avatar/cover and Story. Every hook fails safe. */
public final class SaveMedia {
    private SaveMedia() { }

    static final String TAG = "NezumiSaveMedia";

    /**
     * FeedImageViewer.f8(): the original value is the "prevent screenshot" flag which diverts the "..." menu to
     * report-only. The flag itself stays untouched everywhere else (FLAG_SECURE), only this menu choice changes.
     */
    public static boolean allowProtectedMenu(boolean preventScreenshot) {
        return false;
    }

    /** FeedImageViewer.y8(): the "owner is friend" menu field; true makes the native Download item eligible. */
    public static boolean treatAsFriend(boolean isFriend) {
        return true;
    }

    /** Story menu: offer native Download (id 36) for a story the viewer can already see. */
    public static boolean canSaveStory(Object story) {
        if (story == null) return false;
        try {
            int type = intField(story, "d");
            int status = intField(story, "p");
            // Same guards as the own-story block: not type 3 (other) / 18, and not a disabled (1, 5) story.
            return type != 3 && type != 18 && status != 1 && status != 5;
        } catch (Throwable failure) {
            NezumiLog.w(TAG, "canSaveStory", failure);
            return false;
        }
    }

    private static int intField(Object target, String name) throws ReflectiveOperationException {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(target);
    }
}
