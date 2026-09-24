package app.yydarlinker.deepseekcaptions;
import java.util.*;
import java.util.regex.*;
/** Matching tokens only: never changes source text, segmentation or native segment timestamps. */
final class TimingTokens {
    // Use sc= rather than Is prefixes, which older Android regex engines do not support.
    private static final Pattern TOKEN=Pattern.compile("[\\p{sc=Han}\\p{sc=Hiragana}\\p{sc=Katakana}\\p{sc=Thai}\\p{sc=Lao}\\p{sc=Khmer}\\p{sc=Myanmar}]|[\\p{L}\\p{N}&&[^\\p{sc=Han}\\p{sc=Hiragana}\\p{sc=Katakana}\\p{sc=Thai}\\p{sc=Lao}\\p{sc=Khmer}\\p{sc=Myanmar}]]+(?:['’][\\p{L}\\p{N}]+)*");
    static List<String> words(String text){List<String> out=new ArrayList<>();Matcher matcher=TOKEN.matcher(text==null?"":text.toLowerCase(Locale.ROOT));while(matcher.find())out.add(matcher.group().replace("'","").replace("’",""));return out;}
}
