package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Exact source captions: no translation, segmentation API or target-length timing. */
final class NativeSourcePlan {
    static TranslationUnitTimeline.Result build(CaptionDocument.Parsed document) {
        List<SourceAtomTimeline.Atom> atoms=new ArrayList<>(); List<TranslationUnitTimeline.Unit> units=new ArrayList<>();
        for(CaptionDocument.Cue cue:document.cues()) {
            int i=units.size();atoms.add(new SourceAtomTimeline.Atom(cue.startMs,cue.endMs,cue.text,i,true));
            units.add(new TranslationUnitTimeline.Unit(i,"source"+i,i,i,i,i,cue.startMs,cue.endMs,cue.text,
                TranslationUnitTimeline.Confidence.HIGH,"source_passthrough"));
        }
        return new TranslationUnitTimeline.Result(units,atoms,"source_passthrough",false,Collections.emptyMap());
    }
}
