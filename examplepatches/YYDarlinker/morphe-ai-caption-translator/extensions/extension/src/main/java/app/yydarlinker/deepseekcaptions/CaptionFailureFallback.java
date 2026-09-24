package app.yydarlinker.deepseekcaptions;
import java.util.List;
/** Explicit original-language recovery, never cached or reported as a successful translation. */
final class CaptionFailureFallback {
    static String compactText(List<SourceAtomTimeline.Atom> atoms,TranslationUnitTimeline.Unit unit,long time){
        if(unit==null||time<unit.startMs||time>=unit.endMs)return "";
        for(int i=unit.fromAtom;i<=unit.toAtom;i++){
            SourceAtomTimeline.Atom a=atoms.get(i);if(time<a.startMs||time>=a.endMs)continue;
            int from=i,to=i;
            // Last-resort original phrase only, at genuine source boundaries, never translated
            // character-ratio timing. Prefer preceding words to importing future speech.
            while(from>unit.fromAtom && atoms.get(from-1).cueIndex==a.cueIndex && i-from<5 &&
                    CaptionPresentationPolicy.visible(SourceAtomTimeline.join(atoms,from-1,to))<48)from--;
            return "[Original] "+SourceAtomTimeline.join(atoms,from,to);
        }
        return "";
    }
    static String text(List<SourceAtomTimeline.Atom> atoms,TranslationUnitTimeline.Unit unit,long time){
        if(unit==null || time<unit.startMs || time>=unit.endMs)return "";
        for(int i=unit.fromAtom;i<=unit.toAtom;i++) {
            SourceAtomTimeline.Atom a=atoms.get(i);
            if(time<a.startMs || time>=a.endMs)continue;
            int from=i,to=i;
            // Show only the original cue fragment, not future cues from a 12-second window.
            while(from>unit.fromAtom && atoms.get(from-1).cueIndex==a.cueIndex)from--;
            while(to<unit.toAtom && atoms.get(to+1).cueIndex==a.cueIndex)to++;
            String original=ContextualCaptionTextPolicy.sourceForTranslation(SourceAtomTimeline.join(atoms,from,to));
            return original.isEmpty()?"":"[原文 / Original] "+original;
        }
        return "";
    }
}
