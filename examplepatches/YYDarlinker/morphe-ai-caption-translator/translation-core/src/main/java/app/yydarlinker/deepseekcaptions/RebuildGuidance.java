package app.yydarlinker.deepseekcaptions;

/**
 * Extra request guidance for event sizing, sentence completeness and the authored display
 * contract. Appended to every request; local protocol/guidance changes are recorded by provenance.
 */
final class RebuildGuidance {
    private RebuildGuidance() {}

    /**
     * Appended only for a manually authored track. It does not replace {@link #SENTENCE}: the
     * translation quality instructions stay the same as an automatic track. It states that the
     * author's cue ranges are the preferred display boundaries, while a sentence that the author
     * cut in half may stay whole in one event: the display projection publishes such an event as
     * its own page instead of discarding it.
     */
    static String displayCueRule(RebuildPlanner.Block block) {
        return " Authored display groups are the preferred page boundaries. The display_cues field"
                + " lists each group's first-last owned token ids. Prefer keeping every event"
                + " inside one group, and use several natural events for a group when that keeps"
                + " the sentence intact. When the author's boundary cuts a sentence, a complete"
                + " sentence wins: an event may span the boundary. Cover every group's text.";
    }

    /** Cue-sized requests need the sentence around them; the cue is the unit, not the context. */
    private static final int CONTEXT_TOKENS = 600;

    /**
     * A manually authored cue is a line of a sentence, so translating it alone loses the references
     * that make it accurate. The reply is still limited to the block's own tokens, but the model
     * gets the surrounding cues as read-only context, which is what a whole-block request used to
     * give.
     */
    static void widenContext(
            org.json.JSONObject payload, RebuildSource source, RebuildPlanner.Block block)
            throws org.json.JSONException {
        int last = source.words.size() - 1;
        payload.put(
                "context_before",
                RebuildPlanner.context(
                        source, Math.max(0, block.from - CONTEXT_TOKENS), block.from - 1));
        payload.put(
                "context_after",
                RebuildPlanner.context(
                        source, block.to + 1, Math.min(last, block.to + CONTEXT_TOKENS)));
    }

    static final String SENTENCE =
            " Event sizing: one event is one complete clause or sentence that reads naturally on its"
                + " own. Local presentation handles line count and page size. Punctuate every event's text for its own"
                + " range: end with a full stop when that range ends a sentence, a comma when the"
                + " clause continues into the next event, and never drop the closing punctuation."
                + " A long source sentence may stay in one event, or be split only where each side"
                + " keeps its own subject and predicate. Never leave a prepositional phrase, a verb"
                + " and its object, a comparison such as 'more A than B', or a correlative pair on"
                + " opposite sides of an event boundary, and never shorten an event merely to make it"
                + " fit: shorter is only better when the meaning is still complete.";
}
