package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import java.util.*;
/** Resolve against the host context; no global Locale override and no cached translated strings. */
public final class CaptionStrings {
    private static final Map<String,String> english=new HashMap<>();
    static{for(String[] entry:CaptionTranslationCatalog.ENGLISH)english.put(entry[0],entry[1]);}
    public static String get(Context c,String key){
        if(c!=null)try{int id=c.getResources().getIdentifier("cap_"+key,"string",c.getPackageName());if(id!=0)return c.getString(id);}catch(Exception ignored){}
        return english.getOrDefault(key,key);
    }
    static String settings(Context c,String key){
        // Public, non-obfuscated official resource API honors Morphe's language override.
        try{Object text=Class.forName("app.morphe.extension.shared.ResourceUtils").getMethod("getString",String.class).invoke(null,"cap_"+key);
            if(text instanceof String&&!text.equals("cap_"+key))return (String)text;
        }catch(Exception ignored){}
        return get(c,key);
    }
    public static String localize(Context c,CharSequence value){
        if(value==null)return "";String source=value.toString();
        // Match against the original input once, so translated text is never translated again.
        for(String[] entry:CaptionTranslationCatalog.SOURCES)if(source.equals(entry[0]))return settings(c,entry[1]);
        StringBuilder out=new StringBuilder();
        for(int at=0;at<source.length();){boolean found=false;
            for(String[] entry:CaptionTranslationCatalog.SOURCES)if(entry[0].length()>1&&source.startsWith(entry[0],at)){
                out.append(settings(c,entry[1]));at+=entry[0].length();found=true;break;
            }
            if(!found)out.append(source.charAt(at++));
        }
        return out.toString();
    }
}
