package app.yydarlinker.deepseekcaptions;
import org.junit.*;import static org.junit.Assert.*;import java.util.*;
public class PreprocessEquivalent133Test {
    /** Original exhaustive loop, frozen to guard both model names and ordinary source text. */
    List<SourceAtomTimeline.Atom> baseline(List<SourceAtomTimeline.Atom> a){
        List<SourceAtomTimeline.Atom> out=new ArrayList<>();
        for(int i=0;i<a.size();){int best=i;String value=a.get(i).text;
            for(int end=i;end<Math.min(a.size(),i+6);end++){
                if(a.get(end).endMs-a.get(i).startMs>4000)break;
                String candidate=SourceAtomTimeline.join(a,i,end);
                if(ModelNameProtection.isName(candidate)){best=end;value=ModelNameProtection.normalize(candidate);}
            }
            boolean precise=true;for(int n=i;n<=best;n++)precise &= a.get(n).precise;
            out.add(new SourceAtomTimeline.Atom(a.get(i).startMs,a.get(best).endMs,value,a.get(i).cueIndex,precise));i=best+1;
        }return out;
    }
    @Test public void optimizedNameScanIsExactlyEquivalentOnMixedLongTranscript(){
        String[] words={"ordinary","speech,","and","the","world.","GPT","5.6","Soul","Qwen3.8-Flash","Claude","3","Opus","Deepseek","v4","Flash","Gemini","2.5","Pro","Llama","3","模型","日本語","مرحبا"," ","GPT-like","[GPT","mini"};
        Random r=new Random(133);List<SourceAtomTimeline.Atom> atoms=new ArrayList<>();
        for(int i=0;i<4000;i++)atoms.add(new SourceAtomTimeline.Atom(i*400,i*400+350,words[r.nextInt(words.length)],i/9,r.nextBoolean()));
        SourceAtomTimeline.Result src=new SourceAtomTimeline.Result(atoms,500,0,4000,true,false);
        List<SourceAtomTimeline.Atom> expected=baseline(atoms),actual=ModelNameProtection.protect(src).atoms;
        assertEquals(expected.size(),actual.size());
        for(int i=0;i<actual.size();i++){
            assertEquals(expected.get(i).text,actual.get(i).text);assertEquals(expected.get(i).startMs,actual.get(i).startMs);
            assertEquals(expected.get(i).endMs,actual.get(i).endMs);assertEquals(expected.get(i).precise,actual.get(i).precise);
            assertEquals(expected.get(i).cueIndex,actual.get(i).cueIndex);
        }
    }
    @Test public void cachedRegexRetainsExactOriginalWordWeights(){
        for(String word:Arrays.asList("hello","1.23","o’clock","word?!","punctuation","你好","日本語","русский","",":-","🍀","we're","they're","1,000.2","-3.5","3-4","GPT-5.6")){
            if(word.matches("[A-Za-z0-9'’.,!?;:-]+"))assertEquals(Math.max(1,Math.min(5,((int)word.toLowerCase(Locale.ROOT).codePoints().filter(Character::isLetterOrDigit).count()+3)/4)),SourceAtomTimeline.estimatedWordWeight(word));
        }
    }
}
