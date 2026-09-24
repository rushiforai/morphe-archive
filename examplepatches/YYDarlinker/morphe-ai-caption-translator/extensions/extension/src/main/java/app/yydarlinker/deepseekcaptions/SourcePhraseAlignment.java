package app.yydarlinker.deepseekcaptions;
import java.util.*;import java.util.regex.*;import java.text.Normalizer;
/** Cursor-only, token-preserving match. Decorative punctuation may vary; numbers/signs may not. */
final class SourcePhraseAlignment {
    private static final Pattern TOKENS=Pattern.compile("(?<=\\p{N})[-–/](?=\\p{N})|(?<![\\p{L}\\p{N}])[+-]?\\p{N}+(?:[.,:]\\p{N}+)*(?:%|％)?|[\\p{L}\\p{N}]+(?:['’][\\p{L}\\p{N}]+)*");
    /** Frozen v1.3.3 lexical signature for timing weights/reference identity only.
     * Do NOT use this weaker comparison for online source-phrase validation. */
    static String timingLexical(String text){
        StringBuilder out=new StringBuilder();
        if(text!=null)text.toLowerCase(Locale.ROOT).codePoints().filter(Character::isLetterOrDigit).forEach(out::appendCodePoint);
        return out.toString();
    }
    static String canonical(String text){
        String s=Normalizer.normalize(text==null?"":text,Normalizer.Form.NFKC).toLowerCase(Locale.ROOT).replace('’','\'');
        Matcher m=TOKENS.matcher(s);StringBuilder b=new StringBuilder();
        while(m.find()){
            String token=m.group();
            // Thousands separators are unambiguous only in complete three-digit groups.
            if(token.matches("[+-]?\\d{1,3}(,\\d{3})+(\\.\\d+)?%?"))token=token.replace(",","");
            if(b.length()>0)b.append('|');b.append(token);
        }
        return b.toString();
    }
    static int end(String phrase,List<SourceAtomTimeline.Atom> atoms,int from,int last){
        String target=canonical(phrase);
        if(target.isEmpty()){
            if(from<=last&&canonical(atoms.get(from).text).isEmpty())return from;
            throw new IllegalArgumentException("source_phrase_empty");
        }
        for(int i=from;i<=last;i++){
            String actual=canonical(SourceAtomTimeline.join(atoms,from,i));
            if(actual.equals(target)){
                while(i<last&&canonical(atoms.get(i+1).text).isEmpty())i++;
                return i;
            }
            if(actual.length()>target.length()||!target.startsWith(actual))break;
        }
        throw new IllegalArgumentException("source_phrase_mismatch;cursor="+from);
    }
}
