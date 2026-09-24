package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import java.text.Collator;
import java.util.*;
import java.util.function.Function;

/** Insert only the added language using the app locale and native labels. Never force Chinese to the end. */
public final class LanguageMenuOrder {
    static Locale locale(){Context c=CaptionAddonSupport.context();return c==null?Locale.getDefault():c.getResources().getConfiguration().getLocales().get(0);}
    public static String simplifiedLabel(){return simplifiedLabel(locale());}
    static String simplifiedLabel(Locale display){
        if("zh".equals(display.getLanguage())){
            boolean traditional="Hant".equals(display.getScript())||Arrays.asList("TW","HK","MO").contains(display.getCountry());
            return traditional?"中文（簡體）":"中文（简体）";
        }
        return Locale.forLanguageTag("zh-Hans").getDisplayName(display);
    }
    static int rank(String code){String s=code==null?"":code.toLowerCase(Locale.ROOT);return s.equals("zh-hans")||s.equals("zh-cn")?1:s.equals("zh-hant")||s.equals("zh-tw")||s.equals("zh-hk")?2:0;}
    static String label(String code){if(rank(code)==1)return simplifiedLabel();return Locale.forLanguageTag(code==null?"":code).getDisplayName(locale());}
    static String sortLabel(String text){return java.text.Normalizer.normalize(text==null?"":text,java.text.Normalizer.Form.NFKC).replaceAll("\\s+", "");}
    static int compare(String a,String b){return Collator.getInstance(locale()).compare(sortLabel(label(a)),sortLabel(label(b)));}
    static <T> List<T> sorted(List<T> values,Function<T,String> code){return insertSimplified(values,code,v->label(code.apply(v)));}
    static <T> List<T> insertSimplified(List<T> values,Function<T,String> code,Function<T,String> label){
        List<T> out=new ArrayList<>();T simplified=null;
        for(T value:values){if(rank(code.apply(value))==1){if(simplified==null)simplified=value;}else out.add(value);}
        if(simplified==null)return new ArrayList<>(values);
        Collator collator=Collator.getInstance(locale());String name=label.apply(simplified);int at=out.size();
        for(int i=0;i<out.size();i++)if(collator.compare(sortLabel(name),sortLabel(label.apply(out.get(i))))<0){at=i;break;}
        out.add(at,simplified);return out;
    }
}
