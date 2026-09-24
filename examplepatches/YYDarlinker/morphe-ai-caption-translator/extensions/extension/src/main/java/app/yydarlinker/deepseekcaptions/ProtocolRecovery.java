package app.yydarlinker.deepseekcaptions;
/** A simpler response on an already-budgeted retry, never a fabricated index repair. */
final class ProtocolRecovery {
    static boolean wholeText(String reason,TranslationUnitTimeline.Unit unit){
        return unit!=null && unit.endMs-unit.startMs<=CaptionPresentationPolicy.MAX_MS && wholeText(reason);
    }
    static boolean wholeText(String reason){return reason!=null && (reason.equals("protocol_json")||reason.equals("protocol_translations")||reason.equals("protocol_format")||reason.equals("finish_length")||reason.equals("duplicate_response_id")||reason.contains("incomplete token coverage")||reason.contains("overlap or out of range")||reason.contains("segment_shape")||reason.contains("non_contiguous_start")||reason.contains("invalid segment")||reason.contains("missing_response")||reason.contains("missing_id")||reason.contains("source_phrase_mismatch"));}
}
