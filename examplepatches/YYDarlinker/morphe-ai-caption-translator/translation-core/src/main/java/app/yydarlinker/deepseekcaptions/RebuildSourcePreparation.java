package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

/** Source computation only; the controller owns raw display, cache admission and installation. */
final class RebuildSourcePreparation {
    private RebuildSourcePreparation() {}

    static final class Built {
        final RebuildSource source;
        final List<RebuildPlanner.Block> blocks;
        final String key;
        final boolean authored;

        Built(RebuildSource source, List<RebuildPlanner.Block> blocks, String key, boolean authored) {
            this.source = source;
            this.blocks = blocks;
            this.key = key;
            this.authored = authored;
        }

        String readyDetail(int restored) {
            int precise = 0;
            for (RebuildSource.Word w : source.words)
                if (w.precision != RebuildSource.Precision.ESTIMATED) precise++;
            return "words="
                            + source.words.size()
                            + ";measured_or_aligned="
                            + precise
                            + ";estimated="
                            + (source.words.size() - precise)
                            + ";coarse_reconstructed="
                            + source.coarseCueReconstructed
                            + ";coarse_cues="
                            + source.coarseCueCount
                            + ";blocks="
                            + blocks.size()
                            + ";cache_hits="
                            + restored
                            + ";precision="
                            + source.precisionEvidence();
        }
    }

    /**
     * Read the URL after parsing for track classification and again at reference fetch, as before.
     * The report consumer sends the original diagnostics immediately; neither port grants authority.
     */
    static Built build(
            Context context, TranslationSourceAccess.Source raw, boolean sourceOnly,
            TranslationSettings config, String target, CaptionLanguageContext language,
            long sessionId, Supplier<String> url, DeepSeekApiClient.RequestControl control,
            BiConsumer<String, String> report) throws Exception {
        RebuildSource source = RebuildSource.read(raw.body, raw.document, !sourceOnly);
        // A coarse automatic track is exactly the case that needs a finer ASR reference. The
        // old gate required native words first, so a completely coarse primary never tried the
        // reference at all. A manually authored track keeps its cue-level timing and needs no
        // second download.
        boolean authoredTrack = TranslationRuntime.authoredTrack(url.get());
        if (!sourceOnly
                && !authoredTrack
                && source.nativeWordCount() < source.words.size())
            source =
                    alignedToReference(
                            context, url.get(), source, sourceOnly, sessionId, control, report);
        else if (!sourceOnly && !authoredTrack)
            report.accept(
                    "REBUILD_SOURCE_REFERENCE_SKIPPED",
                    "session="
                            + sessionId
                            + ";native_words="
                            + source.nativeWordCount()
                            + ";words="
                            + source.words.size()
                            + ";reason=all_words_native");
        // A manually authored track keeps its own segmentation: every authored cue is a display
        // boundary, while consecutive cues may share one request block so the model sees the
        // sentence around a fragment. Automatic tracks keep the sentence-sized blocks.
        List<RebuildPlanner.Block> blocks =
                authoredTrack
                        ? RebuildPlanner.planAuthored(source, language)
                        : RebuildPlanner.plan(source, language);
        String key =
                RebuildCache.identity(
                        source, config, target, language, authoredTrack);
        return new Built(source, blocks, key, authoredTrack);
    }

    /** The source with a reference track's timing adopted; unchanged when none is available. */
    private static RebuildSource alignedToReference(
            Context context, String url, RebuildSource source, boolean sourceOnly, long sessionId,
            DeepSeekApiClient.RequestControl control, BiConsumer<String, String> report)
            throws InterruptedException {
        try {
            TranslationSourceAccess.Source ref =
                    TranslationSourceAccess.reference(context, url, source, control);
            if (ref == null) return source;
            RebuildSource evidence =
                    ref.timingEvidence != null
                            ? ref.timingEvidence
                            : RebuildSource.read(ref.body, ref.document, !sourceOnly);
            String profile = ";profile=" + ref.timingProfile + ";quality=" + ref.timingQuality;
            RebuildSource aligned =
                    source.align(
                            evidence,
                            detail ->
                                    report.accept(
                                            "REBUILD_SOURCE_ALIGNMENT",
                                            "session=" + sessionId + profile + ";" + detail));
            report.accept(
                    "REBUILD_SOURCE_REFERENCE_APPLIED",
                    "session="
                            + sessionId
                            + profile
                            + ";before="
                            + source.precisionEvidence()
                            + ";after="
                            + aligned.precisionEvidence());
            return aligned;
        } catch (Exception failure) {
            TranslationSourceAccess.checkActive(control);
            report.accept(
                    "ASR_REFERENCE_FETCH_FAILED",
                    "session=" + sessionId + ";reason=" + TranslationRuntime.errorDetail(failure));
            return source;
        }
    }
}
