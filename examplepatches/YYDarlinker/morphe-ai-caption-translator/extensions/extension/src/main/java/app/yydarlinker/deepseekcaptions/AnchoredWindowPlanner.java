package app.yydarlinker.deepseekcaptions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Bounded transport windows, NOT final subtitles. The model selects clauses inside each window. */
final class AnchoredWindowPlanner {
    static final int MAX_ATOMS = 48;
    static final long MAX_MS = 12_000L;
    private AnchoredWindowPlanner() {}

    static TranslationUnitTimeline.Result build(SourceAtomTimeline.Result source) {
        if (source == null || source.atoms.isEmpty()) return TranslationUnitTimeline.Result.EMPTY;
        List<SourceAtomTimeline.Atom> atoms = source.atoms;
        List<TranslationUnitTimeline.Unit> units = new ArrayList<>();
        int from = 0;
        while (from < atoms.size()) {
            int end = from;
            int candidate = -1;
            for (int i = from; i < atoms.size(); i++) {
                SourceAtomTimeline.Atom atom = atoms.get(i);
                if(i>from && atom.text.trim().startsWith(">") && !atoms.get(i-1).text.trim().equals(">"))break;
                long span = atom.endMs - atoms.get(from).startMs;
                if (i > from && (i - from + 1 > MAX_ATOMS || span > MAX_MS)) break;
                end = i;
                String text = atom.text.trim();
                boolean punctuation = !text.isEmpty() && SentenceBoundaryUtil.strong(text, text.length()-1);
                boolean gap = i+1 < atoms.size() && atoms.get(i+1).startMs - atom.endMs >= 700L;
                if (punctuation || gap) candidate = i;
                // Do not stop at every YouTube event or every comma. A reasonable lookahead lets
                // the model recover unpunctuated ASR clauses without an extra segmentation call.
                if ((punctuation || gap) && span >= 6_000L) break;
                if (gap) break; // Never translate across long silence/speaker breaks.
            }
            if (candidate >= from && end > candidate && candidate-from >= 3) end = candidate;
            else if(end+1<atoms.size() && candidate<from) {
                // Hard transport limits prefer a preceding clause, never a dangling connector.
                for(int cut=end;cut>Math.max(from,end-10);cut--) {
                    String t=atoms.get(cut).text.trim();
                    if(!t.isEmpty() && SentenceBoundaryUtil.weak(t.charAt(t.length()-1))){end=cut;break;}
                }
                while(end>from && (atoms.get(end).text.trim().endsWith("-") || atoms.get(end).text.trim().toLowerCase(java.util.Locale.ROOT).matches("and|or|the|a|an|of|to|with|for|as|than")))end--;
            }
            SourceAtomTimeline.Atom first=atoms.get(from), last=atoms.get(end);
            String text=SourceAtomTimeline.join(atoms,from,end);
            int index=units.size();
            units.add(new TranslationUnitTimeline.Unit(index,"w"+index+"-"+from+"-"+end,
                    from,end,first.cueIndex,last.cueIndex,first.startMs,last.endMs,text,
                    TranslationUnitTimeline.Confidence.MEDIUM,"anchored_window"));
            from=end+1;
        }
        return new TranslationUnitTimeline.Result(Collections.unmodifiableList(units),atoms,
                source.json3 ? "json3_anchored" : "estimated_anchored",source.rollupNormalized,
                Collections.emptyMap());
    }
}
