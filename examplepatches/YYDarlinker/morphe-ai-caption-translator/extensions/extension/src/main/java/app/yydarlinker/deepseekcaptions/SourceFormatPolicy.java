package app.yydarlinker.deepseekcaptions;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
/** Prefer word-offset JSON3 without changing signed identity or non-format query bytes. */
final class SourceFormatPolicy {
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
    private static String decode(String s){try{return URLDecoder.decode(s,StandardCharsets.UTF_8.name());}catch(Exception e){return s;}}
}
