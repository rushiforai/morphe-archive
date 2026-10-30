package app.yydarlinker.deepseekcaptions;

import java.util.Objects;

/** Guarded result/progress channel. No Activity, View or application state is held here. */
final class TranslationOutput {
    interface RenderGuard {
        boolean isValid();

        default void onApplied() {}

        default long displayPosition(long supplied) {
            return supplied;
        }

        default String identity() {
            return "";
        }

        default String session() {
            return "";
        }

        default long windowStart() {
            return -1;
        }

        default long windowEnd() {
            return -1;
        }

        default String blankReason() {
            return "";
        }

        default CaptionCredentialRef credential() {
            return CaptionCredentialRef.NONE;
        }
    }

    interface Sink {
        default CaptionPresentationBudget budget() {
            return null;
        }

        default void clear(RenderGuard guard) {}

        default void hide(RenderGuard guard) {}

        default void refreshSurface() {}

        default void position(long at, RenderGuard guard) {}

        default void showStatus(String text, RenderGuard guard) {}

        default void showWaitingEvent(
                String text, RenderGuard guard, String id, long start, long end, long at) {}

        default void showEvent(
                String text,
                RenderGuard guard,
                String id,
                long start,
                long end,
                long at,
                CaptionRenderSpec spec) {}

        default void showEvent(
                String text,
                RenderGuard guard,
                String id,
                long start,
                long end,
                long at,
                CaptionRenderSpec spec,
                CaptionEventTimeline sourceTimeline) {
            showEvent(text, guard, id, start, end, at, spec);
        }
    }

    private static volatile Sink sink = new Sink() {};

    static void install(Sink value) {
        sink = Objects.requireNonNull(value);
    }

    static TranslationBudget budget() {
        CaptionPresentationBudget value = sink.budget();
        return value == null
                ? null
                : new TranslationBudget(
                        value.width, value.minimumPx, value.preferredPx, value.renderSpec);
    }

    static void clear(RenderGuard g) {
        sink.clear(g);
    }

    static void hide(RenderGuard g) {
        sink.hide(g);
    }

    static void refreshSurface() {
        sink.refreshSurface();
    }

    static void position(long at, RenderGuard g) {
        sink.position(at, g);
    }

    static void showStatus(String text, RenderGuard g) {
        sink.showStatus(text, g);
    }

    static void showWaitingEvent(
            String text, RenderGuard g, String id, long start, long end, long at) {
        sink.showWaitingEvent(text, g, id, start, end, at);
    }

    static void showEvent(
            String text,
            RenderGuard g,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec) {
        sink.showEvent(text, g, id, start, end, at, spec);
    }

    static void showEvent(
            String text,
            RenderGuard g,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        sink.showEvent(text, g, id, start, end, at, spec, sourceTimeline);
    }
}
