package app.yydarlinker.deepseekcaptions;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
/** Prefer word-offset JSON3 without changing signed identity or non-format query bytes. */
final class SourceFormatPolicy {
    static final class Profile {
        final String name,url;
        Profile(String name,String url){this.name=name;this.url=url;}
    }
    static String json3(String url) {
        if(url==null) return null;
        int hash=url.indexOf('#');String fragment=hash<0 ? "" : url.substring(hash);
        String head=hash<0 ? url : url.substring(0,hash);int q=head.indexOf('?');
        String query=q<0 ? "" : head.substring(q+1);List<String> kept=new ArrayList<>();
        for(String item:query.split("&")) {
            if(item.isEmpty())continue;int eq=item.indexOf('=');String key=decode(eq<0?item:item.substring(0,eq));
            if("sparams".equals(key) && eq>=0 && Arrays.asList(decode(item.substring(eq+1)).split(",")).contains("fmt"))return url;
            if(!"fmt".equals(key))kept.add(item);
        }
        kept.add("fmt=json3");return (q<0?head:head.substring(0,q))+"?"+String.join("&",kept)+fragment;
    }
    /**
     * A small, deterministic negotiation set for reference tracks.  Only unsigned format/layout
     * knobs are touched; signed query bytes (including duplicate/encoded parameters) remain byte
     * for byte intact.  The caller owns the three-attempt budget.
     */
    static List<Profile> referenceProfiles(String url) {
        List<Profile> result=new ArrayList<>();
        add(result,"ORIGINAL_JSON3",json3(url));
        String withoutXosf=removeUnsigned(url,"xosf");
        if(!withoutXosf.equals(url))add(result,"WORD_LAYOUT",json3(withoutXosf));
        // srv3 is only a final registered option; never synthesize it when fmt is signed.
        String srv3=replaceUnsignedFormat(url,"srv3");
        if(!srv3.equals(url))add(result,"REGISTERED_SRV3",srv3);
        return result;
    }
    private static void add(List<Profile> result,String name,String url){
        if(url==null)return;for(Profile p:result)if(p.url.equals(url))return;result.add(new Profile(name,url));
    }
    private static String removeUnsigned(String url,String removeKey){
        return rewrite(url,(key,item)->!removeKey.equals(key));
    }
    private static String replaceUnsignedFormat(String url,String format){
        boolean signed=signed(url,"fmt");if(signed)return url;
        String replaced=rewrite(url,(key,item)->!"fmt".equals(key));
        int hash=replaced.indexOf('#');String fragment=hash<0?"":replaced.substring(hash);
        String head=hash<0?replaced:replaced.substring(0,hash);return head+(head.contains("?")?"&":"?")+"fmt="+format+fragment;
    }
    private interface ItemFilter { boolean keep(String decodedKey,String rawItem); }
    private static String rewrite(String url,ItemFilter filter){
        if(url==null)return "";int hash=url.indexOf('#');String fragment=hash<0?"":url.substring(hash);
        String head=hash<0?url:url.substring(0,hash);int q=head.indexOf('?');if(q<0)return url;
        String query=head.substring(q+1);List<String> kept=new ArrayList<>();
        for(String item:query.split("&",-1)){if(item.isEmpty())continue;int eq=item.indexOf('=');String rawKey=eq<0?item:item.substring(0,eq);String key=decode(rawKey);if(filter.keep(key,item))kept.add(item);}
        return head.substring(0,q)+"?"+String.join("&",kept)+fragment;
    }
    private static boolean signed(String url,String name){
        int hash=url.indexOf('#');String head=hash<0?url:url.substring(0,hash);int q=head.indexOf('?');if(q<0)return false;
        String[] items=head.substring(q+1).split("&",-1);for(String item:items){int eq=item.indexOf('=');if(eq<0)continue;String key=decode(item.substring(0,eq));if(!"sparams".equals(key)&&!"lsparams".equals(key))continue;for(String value:decode(item.substring(eq+1)).split(","))if(name.equals(value))return true;}
        return false;
    }
    private static String decode(String s){try{return URLDecoder.decode(s,StandardCharsets.UTF_8.name());}catch(Exception e){return s;}}
}
