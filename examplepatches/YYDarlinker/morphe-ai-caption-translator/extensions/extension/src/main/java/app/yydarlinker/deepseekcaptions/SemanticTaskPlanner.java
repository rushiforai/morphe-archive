package app.yydarlinker.deepseekcaptions;

import java.util.*;

/** Immutable semantic tasks, distinct from 12-second transport windows and display events.
 * No model call, source-word rewriting or target-length timing. Unpunctuated speech has bounded
 * lookahead; the fallback is explicitly labelled, never described as a proven sentence boundary. */
final class SemanticTaskPlanner {
    static final int MAX_ATOMS = 96;
    static final long MAX_MS = 24_000L;
    private static final long SOFT_MS = 10_000L;
    private SemanticTaskPlanner() {}

    static TranslationUnitTimeline.Result build(SourceAtomTimeline.Result source) {
        if (source == null || source.atoms.isEmpty()) return TranslationUnitTimeline.Result.EMPTY;
        List<SourceAtomTimeline.Atom> atoms=source.atoms;
        List<TranslationUnitTimeline.Unit> tasks=new ArrayList<>();
        Map<String,Integer> counts=new HashMap<>();
        int from=0;
        while(from<atoms.size()) {
            int end=from, candidate=-1, hard=-1; String reason="bounded_continuation";
            for(int i=from;i<atoms.size();i++) {
                long span=atoms.get(i).endMs-atoms.get(from).startMs;
                if(i>from && (i-from+1>MAX_ATOMS || span>MAX_MS)) break;
                end=i;
                if(i+1==atoms.size()) {hard=i;reason="source_tail";break;}
                long gap=atoms.get(i+1).startMs-atoms.get(i).endMs;
                if(gap>=700 || speaker(atoms.get(i+1).text)) {hard=i;reason="source_break";break;}
                String text=atoms.get(i).text.trim();
                if(terminal(text)) {
                    candidate=i;reason="sentence_boundary";
                    if(span>=6000){hard=i;break;}
                    continue; // Batch short complete sentences without making each an API job.
                }
                if(i-from>=3 && span>=1800 && safeBoundary(atoms,i)) {
                    int evidence=boundaryEvidence(atoms,i);
                    if(evidence>=2) {candidate=i;if(span>=SOFT_MS){reason="clause_boundary";break;}}
                }
            }
            if(hard>=from)end=hard;
            else if(candidate>=from){end=candidate;reason="clause_boundary";}
            else {
                // Prefer a complete syntactic group when a very long unpunctuated sentence hits
                // the budget. No fixed 12s/48-word cut; retain explicit continuation context.
                for(int i=end;i>Math.max(from,end-16);i--) {
                    if(safeBoundary(atoms,i)){end=i;break;}
                }
                counts.put(reason,counts.getOrDefault(reason,0)+1);
            }
            SourceAtomTimeline.Atom first=atoms.get(from),last=atoms.get(end);
            int index=tasks.size();String text=SourceAtomTimeline.join(atoms,from,end);
            tasks.add(new TranslationUnitTimeline.Unit(index,"s"+index+"-"+from+"-"+end,
                    from,end,first.cueIndex,last.cueIndex,first.startMs,last.endMs,text,
                    (reason.equals("source_break")||terminal(last.text))?TranslationUnitTimeline.Confidence.HIGH:
                    reason.equals("clause_boundary")?TranslationUnitTimeline.Confidence.MEDIUM:TranslationUnitTimeline.Confidence.LOW,reason));
            from=end+1;
        }
        return new TranslationUnitTimeline.Result(Collections.unmodifiableList(tasks),atoms,
                source.json3?"json3_semantic_tasks":"estimated_semantic_tasks",source.rollupNormalized,counts);
    }
    static boolean terminal(String text) {
        if(text==null)return false;int end=text.trim().length()-1;text=text.trim();
        while(end>=0 && SentenceBoundaryUtil.closer(text.charAt(end)))end--;
        return end>=0 && SentenceBoundaryUtil.strong(text,end);
    }
    static boolean speaker(String text){String s=text==null?"":text.trim();return s.startsWith(">>")||s.startsWith("— ");}
    static String word(String text) {
        return text==null?"":text.toLowerCase(Locale.ROOT).replace('’','\'').replaceAll("^[^\\p{L}\\p{N}]+|[^\\p{L}\\p{N}']+$","");
    }
    private static String at(List<SourceAtomTimeline.Atom>a,int i){return i>=0&&i<a.size()?word(a.get(i).text):"";}
    static boolean safeBoundary(List<SourceAtomTimeline.Atom>a,int i) {
        if(i+1>=a.size())return true;String left=at(a,i),right=at(a,i+1);
        if(left.isEmpty()||right.isEmpty())return false;
        if(Arrays.asList("a","an","the","this","that","these","those","my","your","our","their","its",
                "of","to","in","on","for","with","from","by","at","as","than","between","without",
                "and","or","but","because","although","if","unless","whether","which","who",
                "is","am","are","was","were","be","been","being","have","has","had","do","does","did",
                "can","could","will","would","should","must","may","might","not","never","no","very","more","most").contains(left))return false;
        if(Arrays.asList("of","to","is","are","was","were","has","have","can","will","would","should","which","whose").contains(right))return false;
        if(left.matches("[+-]?\\d+(?:[.,]\\d+)*(?:st|nd|rd|th)?") || left.endsWith("-") || left.endsWith("'s"))return false;
        String prior=at(a,i-1);
        // Do not strand the object of a determiner/negation or a modifier of the next noun.
        if(Arrays.asList("a","an","the","this","that","these","those","not","never").contains(prior))return false;
        return true;
    }
    static int boundaryEvidence(List<SourceAtomTimeline.Atom>a,int i) {
        String t=a.get(i).text.trim();if(terminal(t))return 4;
        if(t.endsWith(";")||t.endsWith("；"))return 3;
        if(t.endsWith(",")||t.endsWith("，")||t.endsWith(":"))return 2;
        String next=at(a,i+1),n2=at(a,i+2),n3=at(a,i+3);
        if(Arrays.asList("however","nevertheless","meanwhile","finally").contains(next))return 3;
        if((next.equals("caveats")&&n2.equals("upfront"))||(next.equals("with")&&n2.equals("that")&&n3.equals("said"))||
                (next.equals("in")&&n2.equals("other")&&n3.equals("words")))return 3;
        if(Arrays.asList("and","but","so","whereas").contains(next)&&subject(n2)&&predicate(n3))return 2;
        if(subject(next)&&predicate(n2)&&!Arrays.asList("that","because","if","although","whether").contains(at(a,i)))return 2;
        return 0;
    }
    private static boolean subject(String s){return Arrays.asList("i","we","they","you","he","she","it").contains(s);}
    private static boolean predicate(String s){return Arrays.asList("am","is","are","was","were","have","has","will","would","can","cannot","want","think","know","expect","don't","doesn't").contains(s);}
}
