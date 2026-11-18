package app.afterglow.extension.navigation;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Parcelable;

import java.util.Map;

import app.afterglow.extension.Afterglow;

/**
 * The iOS Shorts behavior settings. Injection points of {@code tweaks/navigation/ShortsHooksPatch.kt}.
 */
@SuppressWarnings("unused")
public final class ShortsHooks {
    static final String SHORTS_ONLY_MODE = "shortsOnlyMode";
    private static final String RESUME_SHORTS = "resumeShorts";
    private static final String AUTO_SKIP_SHORTS = "autoSkipShorts";
    private static final String SHORTS_TO_REGULAR = "shortsToRegular";

    private static final String AUTO_ADVANCE = "REEL_LOOP_BEHAVIOR_AUTO_ADVANCE";
    private static final String INTERNAL_MAIN_ACTIVITY = "com.google.android.apps.youtube.app.watchwhile.InternalMainActivity";

    private ShortsHooks() {}

    /**
     * Injection point: whether YouTube resumes the Shorts player at launch because Shorts were
     * last open. iOS resumeShorts ("Disable resume Shorts") makes YTShortsStartupCoordinator
     * evaluateResumeToShorts return nil.
     */
    public static boolean resumeShorts(boolean original) {
        try {
            if (original && Gate.on(Gate.SHORTS, RESUME_SHORTS)) return false;
        } catch (Throwable error) {
            Afterglow.error("ShortsHooks.resumeShorts", error);
        }
        return original;
    }

    /**
     * Injection point: what a Short does when it ends (YouTube's REEL_LOOP_BEHAVIOR enum).
     * iOS autoSkipShorts advances to the next Short when the current one reaches its end
     * (reelContentViewRequestsAdvanceToNextVideo:); YouTube's own auto advance does that here.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Enum<?> loopBehavior(Enum<?> original) {
        try {
            if (original == null || !Gate.on(Gate.SHORTS, AUTO_SKIP_SHORTS)) return original;
            for (Object constant : original.getDeclaringClass().getEnumConstants()) {
                if (AUTO_ADVANCE.equals(((Enum) constant).name())) return (Enum<?>) constant;
            }
        } catch (Throwable error) {
            Afterglow.error("ShortsHooks.loopBehavior", error);
        }
        return original;
    }

    /**
     * Injection point, before YouTube opens a Short in the Shorts player. iOS shortsToRegular
     * sends every Short the Shorts player starts to the regular watch page
     * (YTAGHandleShortsToRegularActivation). Returns true when the Short was opened in the
     * regular player instead, so the Shorts player is not opened.
     */
    public static boolean openInRegularPlayer(Map<?, ?> context, String videoId) {
        try {
            if (videoId == null || videoId.isEmpty() || !Gate.on(Gate.SHORTS, SHORTS_TO_REGULAR)) return false;
            Activity activity = Afterglow.mainActivity();
            Context source = activity != null ? activity : Afterglow.context();
            if (source == null) return false;
            Intent intent = new Intent();
            intent.setComponent(new ComponentName(source, INTERNAL_MAIN_ACTIVITY));
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | (activity == null ? Intent.FLAG_ACTIVITY_NEW_TASK : 0));
            // YouTube's watch descriptor factory reads the video from this extra.
            intent.putExtra("android.intent.extra.inventory_identifier", new String[] {"vnd.youtube://" + videoId});
            Parcelable watch = watchDescriptor(intent);
            if (watch == null) return false;
            intent.putExtra("watch", watch);
            source.startActivity(intent);
            return true;
        } catch (Throwable error) {
            Afterglow.error("ShortsHooks.openInRegularPlayer", error);
            return false;
        }
    }

    /** YouTube's watch descriptor for a "vnd.youtube" intent. The patch replaces this body. */
    private static Parcelable watchDescriptor(Intent intent) {
        return null;
    }
}
