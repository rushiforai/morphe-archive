package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import app.yydarlinker.caption.contracts.CaptionContracts.Action;
import app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * UI-to-application command port, not an engine. Until the application installs itself the port
 * does nothing, so the UI can run on a fake host without loading the translation provider.
 */
final class CaptionActions {
    private static volatile CaptionPort port =
            new CaptionPort() {
                public void command(Action a, String v) {}

                public boolean active() {
                    return false;
                }

                public boolean ownsNativeTrack() {
                    return false;
                }

                public String restoreTarget(String u) {
                    return u;
                }

                public String videoId() {
                    return "";
                }

                public void playback(long t) {}
            };

    /** What the settings screens need from the translation service. */
    interface SettingsServices {
        String testApi() throws Exception;

        List<String> models(String endpoint) throws Exception;

        default List<CaptionDisplayPage> displayPages(
                String text,
                long start,
                long end,
                CaptionPresentationBudget geometry,
                CaptionRenderSpec spec) {
            return Collections.emptyList();
        }

        default List<CaptionDisplayPage> displayPages(
                String text,
                long start,
                long end,
                CaptionPresentationBudget geometry,
                CaptionRenderSpec spec,
                CaptionEventTimeline sourceTimeline) {
            return displayPages(text, start, end, geometry, spec);
        }
    }

    private static volatile SettingsServices services =
            new SettingsServices() {
                public String testApi() {
                    throw new IllegalStateException("Translation service is not ready.");
                }

                public List<String> models(String endpoint) {
                    throw new IllegalStateException("Translation service is not ready.");
                }
            };

    private CaptionActions() {}

    static void install(CaptionPort p, SettingsServices s) {
        port = Objects.requireNonNull(p);
        services = Objects.requireNonNull(s);
    }

    static void command(Action a, String v) {
        port.command(a, v == null ? "" : v);
    }

    // ---- Commands ----

    static void refreshConfiguration(Context c) {
        command(Action.CONFIGURATION, "");
    }

    static void appearanceChanged() {
        command(Action.APPEARANCE, "");
    }

    static void clearCache(Context c) {
        command(Action.CLEAR_CACHE, "");
    }

    /**
     * Records official CC off and stops the display, preserving the AI switch and language.
     */
    static void deactivateByUser() {
        command(Action.DEACTIVATE, "user_off");
    }

    /** Stops a session because the native caption model reset on its own; the intent survives. */
    static void deactivateAfterNativeReset() {
        command(Action.DEACTIVATE, "native_reset");
    }

    /** Stops the display with the session; the intent is never written by a teardown. */
    static void deactivateForTeardown() {
        command(Action.DEACTIVATE, "teardown");
    }

    static void activate(Context c, String u) {
        command(Action.ACTIVATE, u);
    }

    /** Starts [u]: untranslated when [original], else visible or only prewarmed. */
    static void activate(Context c, String u, boolean original, boolean show) {
        command(original ? Action.SOURCE : show ? Action.ACTIVATE : Action.PREWARM, u);
    }

    /** Shows (or, for an observed request, just registers) the untranslated captions of [u]. */
    static void activateSource(Context c, String u) {
        command(Action.SOURCE, u);
    }

    static void onVideoId(String v) {
        command(Action.VIDEO, v);
    }

    static void onPlayerType(String t) {
        command(Action.PLAYER_TYPE, t);
    }

    static void onVideoTime(long t) {
        port.playback(t);
    }

    // ---- Questions ----

    /** Is an AI session on screen? */
    static boolean isVisibleActive() {
        return port.active();
    }

    /** Does the AI overlay own the screen, so that the native renderer stays masked? */
    static boolean ownsNativeTrack() {
        return port.ownsNativeTrack();
    }

    static String restoreTargetAfterMiniplayer(String u) {
        return port.restoreTarget(u);
    }

    static String currentVideoIdSnapshot() {
        return port.videoId();
    }

    // ---- Settings services ----

    static List<CaptionDisplayPage> displayPages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec) {
        return services.displayPages(text, start, end, geometry, spec);
    }

    static List<CaptionDisplayPage> displayPages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        return services.displayPages(text, start, end, geometry, spec, sourceTimeline);
    }

    static String testApi() throws Exception {
        return services.testApi();
    }

    static List<String> models(String endpoint) throws Exception {
        return services.models(endpoint);
    }
}
