package app.yydarlinker.deepseekcaptions;
import android.content.Context;
/** UI-only strings; runtime defaults use DeepSeekConfig's isolated legacy reader. */
public final class CaptionStrings {
    private CaptionStrings() {}
    public static String get(Context c,String key){
        return CaptionTextResolver.string(c,key);
    }
    static String settings(Context c,String key){
        return CaptionTextResolver.string(c,key);
    }
    public static String localize(Context c,CharSequence value){
        if(value==null)return "";String source=value.toString();
        // Exact authored constants only. Never substitute substrings in provider/user/raw data.
        for(String[] entry:CaptionTranslationCatalog.SOURCES)if(source.equals(entry[0]))return settings(c,entry[1]);
        return source;
    }
}
