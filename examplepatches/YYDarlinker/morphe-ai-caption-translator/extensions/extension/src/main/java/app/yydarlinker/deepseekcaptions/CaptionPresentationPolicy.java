package app.yydarlinker.deepseekcaptions;
import java.util.*;
/** Live-video adaptation of documented timed-text guidelines; source clock always wins. */
final class CaptionPresentationPolicy {
    static final int CJK_LINE=16,CJK_EVENT=32;
    static final long MIN_MS=950,MAX_MS=7000;
    static boolean cjk(String s){for(int cp:s.codePoints().toArray())if(Character.UnicodeScript.of(cp)==Character.UnicodeScript.HAN||Character.UnicodeScript.of(cp)==Character.UnicodeScript.HIRAGANA||Character.UnicodeScript.of(cp)==Character.UnicodeScript.KATAKANA||Character.UnicodeScript.of(cp)==Character.UnicodeScript.HANGUL)return true;return false;}
    static int visible(String s){return (int)s.codePoints().filter(cp->!Character.isWhitespace(cp)).count();}
    static String issue(String text,long duration){
        int limit=cjk(text)?CJK_EVENT:84;
        if(duration>MAX_MS)return "duration_over_7s";
        if(visible(text)>limit)return "text_over_two_lines";
        if(duration<MIN_MS)return "brief_source_interval";
        return "";
    }
    static String requestRules(){return "Translate naturally in the target language, not word by word. Then divide speech into readable sense groups, normally a short sentence or coherent clause per subtitle. "
        +"An event is NOT a visual line. Split multi-sentence explanations instead of placing a paragraph on screen. A transition such as 'So to put it simply' begins its new explanation, not the previous event. "
        +"A numbered point or a new contrast begins a new event rather than attaching it to the previous claim. Keep names, quantities, modifiers and their nouns, verbs and their objects together. A long sentence may span events, but do not leave an orphaned connector or filler. "
        +"Aim for 1.5-6 seconds and 10-32 Chinese characters (other languages roughly two 42-character lines); these are goals, not excuses to invent, drop, or prematurely translate future speech. "
        +"Prefer a single visual line when a complete sense group fits naturally (often 10-20 Chinese characters); use two lines when needed. Never shorten meaning or detach a name, object, modifier, or closing quote just to meet a line target. Avoid unnecessary spaces around Chinese punctuation. Use timed_words [source text,end deciseconds] and pauses_before_ms as source timing evidence. Never equate every cue edge or pause with a speaker/shot change. When timing_precision is cue_estimated or mixed, internal word times are approximate: favor complete coherent clauses rather than inventing tiny pauses from those estimates. "
        +"Prefer faithful natural technical terms; translate multiplicative comparisons as ratios, not additive increases. Do not include read-only context in output.";}
    // Do not force a visual break by character count. The renderer knows the actual font and width.
    static String wrap(String text){
        if(text==null)return "";
        String s=text.replace('\n',' ').trim();
        if(!cjk(s))return s;
        return s.replaceAll("\\s+([，。！？；：、）】》”’])", "$1")
                .replaceAll("([（【《“‘])\\s+", "$1")
                .replaceAll("([，。！？；：、])\\s+(?=[\\p{IsHan}\\p{IsHiragana}\\p{IsKatakana}\\p{IsHangul}])", "$1");
    }
}
