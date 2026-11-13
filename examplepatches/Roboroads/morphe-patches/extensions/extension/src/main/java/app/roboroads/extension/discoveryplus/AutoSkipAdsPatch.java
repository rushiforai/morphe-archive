package app.roboroads.extension.discoveryplus;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Set;

/**
 * Discovery Plus (Fire TV) ad auto-skip.
 * <p>
 * Ads are stitched into the stream server side. The app's own AdSkipModule skips ad breaks that
 * are already watched. This marks every ad break as watched in
 * com.discovery.adtech.adskip.AdSkipState, so the module skips them all before they start.
 * It also skips out of an ad break the playhead is already inside (pre-roll, resume or seek
 * landing inside a break), using the module's own skip seek.
 * <p>
 * Reflection is used because the app classes are not available at compile time.
 * All accessed classes and members are public and not obfuscated.
 */
@SuppressWarnings({"unused", "unchecked", "rawtypes"})
public final class AutoSkipAdsPatch {

    private static final String EVENTS = "com.discovery.adtech.core.modules.events.";
    private static final String PLAYBACK_EVENT = EVENTS + "PlaybackEvent$";
    private static final String TIMELINE_CONTEXT_IN_AD = EVENTS + "TimelineContext$InAd";

    /** Skip seeks to the same break and target within this window are dropped. */
    private static final long DEDUPE_WINDOW_MS = 3000;

    private static String lastSkipKey;
    private static long lastSkipTime;

    private AutoSkipAdsPatch() {
    }

    /**
     * Injection point: AdSkipModule.initializeState and AdSkipModule.updateState.
     *
     * @param state com.discovery.adtech.adskip.AdSkipState instance.
     */
    public static void markAllWatched(Object state) {
        if (state == null) return;
        try {
            Class<?> stateClass = state.getClass();
            List adBreaks = (List) stateClass.getMethod("getAllAdBreaks").invoke(state);
            Set watchedSlots = (Set) stateClass.getMethod("getWatchedSlots").invoke(state);
            Set watchedIds = (Set) stateClass.getMethod("getWatchedAdBreakIds").invoke(state);
            if (adBreaks == null || watchedSlots == null || watchedIds == null) return;

            Method getBreakId = null;
            for (int i = 0, size = adBreaks.size(); i < size; i++) {
                watchedSlots.add(i);

                Object adBreak = adBreaks.get(i);
                if (adBreak == null) continue;
                if (getBreakId == null) {
                    getBreakId = adBreak.getClass().getMethod("getBreakId");
                }
                Object breakId = getBreakId.invoke(adBreak);
                if (breakId != null) watchedIds.add(breakId);
            }
        } catch (Throwable ignored) {
            // Never break playback. Ads then behave as unpatched.
        }
    }

    /**
     * Injection point: start of the AdSkipModule input event dispatcher lambda, which runs on the
     * module scheduler for every coordinator event.
     * <p>
     * When a playback event reports the playhead inside an ad break, seeks to the content after
     * the break the same way the module skips a watched break:
     * AdSkipModule.seekTo$default(module, AdSkipModuleKt.createPlaybackPosition(false, target),
     * SeekReason.SKIP, null, 4, null) with target = AdSkipUtility.INSTANCE.nextChapterStart(adBreak, state).
     *
     * @param module com.discovery.adtech.adskip.AdSkipModule instance.
     * @param state  com.discovery.adtech.adskip.AdSkipState instance, may be null.
     * @param event  com.discovery.adtech.core.modules.events.ModuleInputEvent instance.
     */
    public static void skipIfInsideAdBreak(Object module, Object state, Object event) {
        if (module == null || state == null || event == null) return;
        try {
            // SeekRequest is excluded on purpose: it carries the current context while the
            // user seeks elsewhere.
            String eventName = event.getClass().getName();
            if (!eventName.equals(PLAYBACK_EVENT + "Progress")
                    && !eventName.equals(PLAYBACK_EVENT + "Play")
                    && !eventName.equals(PLAYBACK_EVENT + "Seeked")
                    && !eventName.equals(PLAYBACK_EVENT + "Buffered")) {
                return;
            }

            Object context = event.getClass().getMethod("getTimelineContext").invoke(event);
            if (context == null || !context.getClass().getName().equals(TIMELINE_CONTEXT_IN_AD)) {
                lastSkipKey = null;
                return;
            }

            Object adBreak = context.getClass().getMethod("getAdBreak").invoke(context);
            if (adBreak == null) return;

            ClassLoader loader = module.getClass().getClassLoader();

            // Live, start over and simulcast streams have no content to skip forward to.
            Object streamType = state.getClass().getMethod("getStreamType").invoke(state);
            if (streamType == null) return;
            Class<?> streamTypeClass = Class.forName("com.discovery.adtech.core.models.StreamType", true, loader);
            Boolean isLive = (Boolean) Class.forName("com.discovery.adtech.core.models.StreamTypeExtKt", true, loader)
                    .getMethod("isLiveStream", streamTypeClass)
                    .invoke(null, streamType);
            if (isLive == null || isLive) return;

            Class<?> adBreakClass = Class.forName("com.discovery.adtech.core.models.ads.AdBreak", true, loader);
            Class<?> stateClass = Class.forName("com.discovery.adtech.adskip.AdSkipState", true, loader);
            Class<?> utilityClass = Class.forName("com.discovery.adtech.adskip.AdSkipUtility", true, loader);
            Object utility = utilityClass.getField("INSTANCE").get(null);
            Object target = utilityClass.getMethod("nextChapterStart", adBreakClass, stateClass)
                    .invoke(utility, adBreak, state);
            if (target == null) return;

            Object breakId = adBreakClass.getMethod("getBreakId").invoke(adBreak);
            String key = breakId + "@" + target;
            long now = System.currentTimeMillis();
            if (key.equals(lastSkipKey) && now - lastSkipTime < DEDUPE_WINDOW_MS) return;

            Class<?> positionClass = Class.forName("com.discovery.adtech.common.Playback$Position", true, loader);
            Class<?> playbackPositionClass = Class.forName("com.discovery.adtech.core.models.PlaybackPosition", true, loader);
            Class<?> seekReasonClass = Class.forName("com.discovery.adtech.adskip.SeekReason", true, loader);
            Class<?> moduleClass = Class.forName("com.discovery.adtech.adskip.AdSkipModule", true, loader);

            Object playbackPosition = Class.forName("com.discovery.adtech.adskip.AdSkipModuleKt", true, loader)
                    .getMethod("createPlaybackPosition", boolean.class, positionClass)
                    .invoke(null, false, target);
            Object skipReason = seekReasonClass.getField("SKIP").get(null);

            lastSkipKey = key;
            lastSkipTime = now;

            // Default argument mask 4 leaves the third seekTo argument null.
            moduleClass.getMethod(
                    "seekTo$default",
                    moduleClass,
                    playbackPositionClass,
                    seekReasonClass,
                    positionClass,
                    int.class,
                    Object.class
            ).invoke(null, module, playbackPosition, skipReason, null, 4, null);
        } catch (Throwable ignored) {
            // Never break playback. The ad break then plays as unpatched.
        }
    }
}
