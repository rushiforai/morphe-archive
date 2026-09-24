package app.yydarlinker.deepseekcaptions;
import java.util.*;
import java.util.regex.*;
import org.json.JSONArray;
/** Protect model/version compounds before windowing; no paid correction pass and no global Soul replacement. */
final class ModelNameProtection {
    private static final Pattern NAME=Pattern.compile("(?i)^(GPT|Deepseek|Claude|Opus|Gemini|Qwen|Llama)[ -]*(?:v)?[0-9]+(?:[.。]\\s*[0-9]+)*(?:[ -]+(?:Sol|Soul|Flash|Pro|Mini|Max|Sonnet|Haiku))?[.,!?]?$" );
    private static final Pattern PREFIX=Pattern.compile("(?i)^(GPT|Deepseek|Claude|Opus|Gemini|Qwen|Llama)");
    static boolean isName(String value){return NAME.matcher(value.trim()).matches();}
    static String normalize(String text){
        String n=text.replaceAll("(?<=[0-9])[.。]\\s+(?=[0-9])",".");
        // User-confirmed ASR confusion, only within this exact model identifier.
        return n.replaceAll("(?i)\\bGPT[ -]*5\\.6 +Soul\\b","GPT 5.6 Sol");
    }
    static SourceAtomTimeline.Result protect(SourceAtomTimeline.Result source){
        List<SourceAtomTimeline.Atom> out=new ArrayList<>();List<SourceAtomTimeline.Atom> a=source.atoms;
        for(int i=0;i<a.size();) {
            // NAME is anchored to these brands. An ordinary word cannot begin a protected
            // compound; skip six joined-string allocations without changing a single boundary.
            if(!a.get(i).text.trim().isEmpty() && !PREFIX.matcher(a.get(i).text.trim()).find()){out.add(a.get(i++));continue;}
            int best=i;String value=a.get(i).text;
            for(int end=i;end<Math.min(a.size(),i+6);end++) {
                if(a.get(end).endMs-a.get(i).startMs>4000)break;
                String candidate=SourceAtomTimeline.join(a,i,end);
                if(isName(candidate)){best=end;value=normalize(candidate);}
            }
            SourceAtomTimeline.Atom first=a.get(i),last=a.get(best);
            boolean precise=true;for(int n=i;n<=best;n++)precise &= a.get(n).precise;
            out.add(new SourceAtomTimeline.Atom(first.startMs,last.endMs,value,first.cueIndex,precise));
            i=best+1;
        }
        int precise=0;for(SourceAtomTimeline.Atom atom:out)if(atom.precise)precise++;
        return new SourceAtomTimeline.Result(Collections.unmodifiableList(out),source.rawCueCount,precise,out.size()-precise,source.json3,source.rollupNormalized);
    }
    static JSONArray terms(List<SourceAtomTimeline.Atom> atoms,TranslationUnitTimeline.Unit u){
        JSONArray out=new JSONArray();Set<String> seen=new LinkedHashSet<>();
        for(int i=u.fromAtom;i<=u.toAtom && out.length()<8;i++)if(isName(atoms.get(i).text)){
            String term=normalize(atoms.get(i).text).replaceAll("[.,!?]+$","");
            if(term.length()<=80 && seen.add(term))out.put(term);
        }
        return out;
    }

    static String restore(String source,String translated){
        if(source.matches("(?is).*\\bGPT[ -]*5\\.6 +Sol\\b.*"))
            return translated.replaceAll("(?i)GPT\\s*5[.。]\\s*6\\s*(?:灵魂|靈魂|Soul|Sol)","GPT 5.6 Sol");
        return translated;
    }
}
