package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import java.util.Collections;

/** Performs network, review and cache preparation; the root alone authorizes publication. */
final class RebuildReplyPreparation {
    static final class Evaluation {
        final RebuildProtocol.Plan accepted;
        final boolean cacheable;
        final RebuildCache.Prepared prepared;

        Evaluation(RebuildProtocol.Plan accepted, boolean cacheable, RebuildCache.Prepared prepared) {
            this.accepted = accepted;
            this.cacheable = cacheable;
            this.prepared = prepared;
        }
    }

    /** The previous staged candidate is closed after review, before preparing its replacement. */
    static Evaluation evaluate(
            Context cacheContext, String cacheKey, RebuildSource source, RebuildPlanner.Block block,
            CaptionLanguageContext language, RebuildProtocol.Plan old, RebuildProtocol.Plan candidate,
            RebuildCache.Prepared previous) {
        RebuildProtocol.Plan accepted = RebuildReview.accept(old, candidate, block);
        if (previous != null) previous.close();
        boolean cacheable = !accepted.partial && RebuildReview.score(accepted.issues) == 0;
        RebuildCache.Prepared prepared = cacheable
                ? RebuildCache.prepare(cacheContext, cacheKey, source, block, accepted, language) : null;
        return new Evaluation(accepted, cacheable, prepared);
    }

    private static boolean validRange(RebuildPlanner.Block parent, RebuildSource source, int from, int to) {
        return source != null && from >= parent.from && to <= parent.to && to >= from
                && from < source.words.size() && to < source.words.size();
    }

    /** Hole requests must use the original parent cue identity. */
    static RebuildPlanner.Block holeBlock(RebuildPlanner.Block parent, RebuildSource source, int[] hole) {
        int from = hole[0], to = hole[1];
        if (!validRange(parent, source, from, to)) return null;
        if (!parent.authored) return new RebuildPlanner.Block(parent.index, from, to, source);
        for (RebuildPlanner.Block.CueRange cue : parent.cues)
            if (cue.from == from && cue.to == to)
                return new RebuildPlanner.Block(parent.index, from, to, source, Collections.singletonList(cue));
        return null;
    }

    /** Page requests use the independent display cue grouping contract. */
    static RebuildPlanner.Block pageBlock(RebuildPlanner.Block parent, RebuildSource source, int from, int to) {
        if (!validRange(parent, source, from, to)) return null;
        if (!parent.authored) return new RebuildPlanner.Block(parent.index, from, to, source);
        for (RebuildPlanner.Block.CueRange group : RebuildCueContract.groups(source, parent))
            if (group.from == from && group.to == to)
                return new RebuildPlanner.Block(parent.index, from, to, source, Collections.singletonList(group));
        return null;
    }

    static int[] pageRange(RebuildPlanner.Block parent, RebuildSource source, long time) {
        if (parent.authored) {
            for (RebuildPlanner.Block.CueRange group : RebuildCueContract.groups(source, parent))
                if (time >= group.start && time < group.end) return new int[] {group.from, group.to};
            return null;
        }
        RebuildSource.TimedWindow window = source.windowAt(time);
        if (window == null) return null;
        int from = Math.max(parent.from, window.from);
        int to = Math.min(parent.to, window.to);
        return to < from ? null : new int[] {from, to};
    }

}
