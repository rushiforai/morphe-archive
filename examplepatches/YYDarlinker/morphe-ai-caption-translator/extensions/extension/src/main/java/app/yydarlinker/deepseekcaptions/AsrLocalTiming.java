package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Punctuation-insensitive lexical correspondence; never uses translated text to allocate time. */
final class AsrLocalTiming {
    private static final int N=4;
    private static final class Word {final String value;final int atom;Word(String v,int a){value=v;atom=a;}}
    static SourceAtomTimeline.Result align(SourceAtomTimeline.Result source,SourceAtomTimeline.Result asr){
        return align(source,asr,false);
    }
    static SourceAtomTimeline.Result alignWithCueTiming(SourceAtomTimeline.Result source,SourceAtomTimeline.Result asr){
        return align(source,asr,true);
    }
    private static SourceAtomTimeline.Result align(SourceAtomTimeline.Result source,SourceAtomTimeline.Result asr,boolean allowEstimated){
        if(source==null||asr==null||asr.atoms.isEmpty()||(!allowEstimated&&asr.nativeTimedAtoms==0))return source;
        List<Word> p=words(source.atoms),a=words(asr.atoms);
        if(p.isEmpty()||a.isEmpty())return source;
        boolean identical=p.size()==a.size();
        for(int i=0;identical&&i<p.size();i++)identical=compatible(p.get(i),a.get(i),source,asr,allowEstimated);
        // Punctuation-only atoms have no lexical anchor and must not make complete text fail.
        int lexicalAtoms=0,previousAtom=-1;for(Word word:p)if(word.atom!=previousAtom){lexicalAtoms++;previousAtom=word.atom;}
        int minimum=identical?Math.min(8,lexicalAtoms):8;
        if(!identical&&(p.size()<8||a.size()<8))return source;
        Map<String,Integer> unique=index(a),sourceUnique=index(p);
        int[] match=new int[p.size()];Arrays.fill(match,-1);int last=-1,matched=0;
        if(identical){for(int i=0;i<p.size();i++)match[i]=i;matched=p.size();}
        for(int i=0;!identical&&i+N<=p.size();i++){
            String key=key(p,i);Integer j=unique.get(key);
            if(j==null||j<0||sourceUnique.get(key)!=i||j<=last)continue;
            boolean valid=true;
            for(int k=0;k<N;k++){
                SourceAtomTimeline.Atom x=source.atoms.get(p.get(i+k).atom),y=asr.atoms.get(a.get(j+k).atom);
                if((!allowEstimated&&!y.precise)||Math.abs(x.startMs-y.startMs)>12000)valid=false;
            }
            if(!valid)continue;
            for(int k=0;k<N;k++)match[i+k]=j+k;
            matched+=N;last=j+N-1;i+=N-1;
        }
        if(matched<minimum)return source;
        // Extend at most three adjacent identical words around unique 4-word anchors.
        // Never search ahead across a mismatch, reuse a word, or infer translated timing.
        int[] rightMatch=new int[match.length];int nextKnown=-1;
        for(int i=match.length-1;i>=0;i--){rightMatch[i]=nextKnown;if(match[i]>=0)nextKnown=match[i];}
        int extended=0;
        for(int i=1;i<p.size();i++) {
            if(match[i]>=0){extended=0;continue;}
            int j=match[i-1]+1;
            if(extended<3 && match[i-1]>=0 && j<a.size()
                    && (rightMatch[i]<0 || j<rightMatch[i])
                    && compatible(p.get(i),a.get(j),source,asr,allowEstimated)){match[i]=j;extended++;}
        }
        int[] leftMatch=new int[match.length];int previousKnown=-1;
        for(int i=0;i<match.length;i++){leftMatch[i]=previousKnown;if(match[i]>=0)previousKnown=match[i];}
        extended=0;
        for(int i=p.size()-2;i>=0;i--) {
            if(match[i]>=0){extended=0;continue;}
            int j=match[i+1]-1;
            if(extended<3 && match[i+1]>0 && j>=0
                    && (leftMatch[i]<0 || j>leftMatch[i])
                    && compatible(p.get(i),a.get(j),source,asr,allowEstimated)){match[i]=j;extended++;}
        }
        int size=source.atoms.size();long[] starts=new long[size],ends=new long[size];boolean[] exact=new boolean[size];
        int[] total=new int[size],hits=new int[size],nativeHits=new int[size];
        Arrays.fill(starts,Long.MAX_VALUE);
        for(int i=0;i<p.size();i++){
            int atom=p.get(i).atom;total[atom]++;
            if(match[i]>=0){SourceAtomTimeline.Atom ref=asr.atoms.get(a.get(match[i]).atom);hits[atom]++;if(ref.precise)nativeHits[atom]++;starts[atom]=Math.min(starts[atom],ref.startMs);ends[atom]=Math.max(ends[atom],ref.endMs);}
        }
        for(int i=0;i<size;i++)exact[i]=total[i]>0&&hits[i]==total[i];
        // Complete lexical coverage above is not necessarily native precision.
        // Matched ASR anchors may only be installed with a monotonic surrounding timeline. A local
        // conflict removes those anchors, not all valid anchors elsewhere in a long transcript.
        for(int pass=0;pass<3;pass++){
            interpolate(source.atoms,starts,ends,exact);
            boolean conflict=false;
            for(int i=0;i<size;i++){
                if(starts[i]<0||ends[i]<=starts[i]||(i>0&&starts[i]<ends[i-1])){
                    if(exact[i])exact[i]=false;
                    if(i>0&&exact[i-1])exact[i-1]=false;
                    conflict=true;
                }
            }
            if(!conflict)break;
            if(pass==2)return source;
        }
        List<SourceAtomTimeline.Atom> out=new ArrayList<>();int count=0,nativeCount=0;
        for(int i=0;i<size;i++){SourceAtomTimeline.Atom original=source.atoms.get(i);if(exact[i])count++;boolean precise=exact[i]&&nativeHits[i]==total[i];if(precise)nativeCount++;out.add(new SourceAtomTimeline.Atom(starts[i],ends[i],original.text,original.cueIndex,precise));}
        if(count<minimum)return source;
        return new SourceAtomTimeline.Result(Collections.unmodifiableList(out),source.rawCueCount,nativeCount,size-nativeCount,source.json3,source.rollupNormalized,count);
    }
    private static boolean compatible(Word p,Word a,SourceAtomTimeline.Result source,SourceAtomTimeline.Result asr,boolean allowEstimated){
        SourceAtomTimeline.Atom x=source.atoms.get(p.atom),y=asr.atoms.get(a.atom);
        return p.value.equals(a.value)&&(allowEstimated||y.precise)&&Math.abs(x.startMs-y.startMs)<=12000;
    }
    private static void interpolate(List<SourceAtomTimeline.Atom> p,long[] s,long[] e,boolean[] exact){
        int[] right=new int[p.size()];int next=-1;
        for(int i=p.size()-1;i>=0;i--){right[i]=next;if(exact[i])next=i;}
        int left=-1;
        for(int i=0;i<p.size();i++){
            if(exact[i]){left=i;continue;}
            SourceAtomTimeline.Atom old=p.get(i);s[i]=old.startMs;e[i]=old.endMs;int r=right[i];
            // A punctuation-only tail carries no speech anchor. Keep its duration and borrow
            // the adjacent same-cue offset uniformly; fading each edge can invert a short tail.
            if(TimingTokens.words(old.text).isEmpty()&&left>=0&&old.cueIndex==p.get(left).cueIndex&&old.endMs-p.get(left).endMs<=2000){
                long delta=e[left]-p.get(left).endMs;s[i]+=delta;e[i]+=delta;
            }
            else if(TimingTokens.words(old.text).isEmpty()&&r>=0&&old.cueIndex==p.get(r).cueIndex&&p.get(r).startMs-old.startMs<=2000){
                long delta=s[r]-p.get(r).startMs;s[i]+=delta;e[i]+=delta;
            }
            else if(left>=0&&r>=0){
                long from=p.get(left).endMs,to=p.get(r).startMs,newFrom=e[left],newTo=s[r];
                if(to>from&&to-from<=8000&&newTo>=newFrom){
                    s[i]=newFrom+Math.round((newTo-newFrom)*((old.startMs-from)/(double)(to-from)));
                    e[i]=newFrom+Math.round((newTo-newFrom)*((old.endMs-from)/(double)(to-from)));
                }
            }
            // Edge words remain estimated: borrow only a nearby source-clock offset, not speech.
            else if(left>=0&&old.endMs-p.get(left).endMs<=2000){long d=e[left]-p.get(left).endMs;s[i]+=Math.round(d*Math.max(0,1-(old.startMs-p.get(left).endMs)/2000.0));e[i]+=Math.round(d*Math.max(0,1-(old.endMs-p.get(left).endMs)/2000.0));}
            else if(r>=0&&p.get(r).startMs-old.startMs<=2000){long d=s[r]-p.get(r).startMs;s[i]+=Math.round(d*Math.max(0,1-(p.get(r).startMs-old.startMs)/2000.0));e[i]+=Math.round(d*Math.max(0,1-(p.get(r).startMs-old.endMs)/2000.0));}
        }
    }
    private static List<Word> words(List<SourceAtomTimeline.Atom> atoms){List<Word> result=new ArrayList<>();for(int i=0;i<atoms.size();i++)for(String word:TimingTokens.words(atoms.get(i).text))result.add(new Word(word,i));return result;}
    private static Map<String,Integer> index(List<Word>a){Map<String,Integer> result=new HashMap<>();for(int i=0;i+N<=a.size();i++){String k=key(a,i);result.put(k,result.containsKey(k)?-1:i);}return result;}
    private static String key(List<Word>a,int from){StringBuilder s=new StringBuilder();for(int i=0;i<N;i++)s.append(a.get(from+i).value).append('|');return s.toString();}
}
