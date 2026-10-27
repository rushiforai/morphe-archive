package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;
import java.util.regex.*;

/** Normalizes displayed links only; never rewrites a response or outgoing message. */
final class PreviewUrls {
    private static final String LABEL="[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?";
    private static final Pattern LINKS=Pattern.compile("(?<![\\p{L}\\p{N}_@/.:+-])"
            +"(?:(?:https?|ttps?|tps?)://|//)?(?:"+LABEL+"\\.)+[a-z]{2,63}"
            +"(?::[0-9]{1,5})?(?:[/?#][^\\s<>\"'()（）]*)?",Pattern.CASE_INSENSITIVE);
    static String normalize(String value){
        if(value==null)return null;
        String url=value.trim().replace("&amp;","&").replaceAll("[.,、。]+$","");
        if(url.regionMatches(true,0,"ttps://",0,7)||url.regionMatches(true,0,"tps://",0,6)
                ||url.regionMatches(true,0,"ttp://",0,6)||url.regionMatches(true,0,"tp://",0,5))
            url="https://"+url.substring(url.indexOf("://")+3);
        else if(url.startsWith("//"))url="https:"+url;
        else if(!url.matches("(?i)^https?://.*")){
            if(!LINKS.matcher(url).matches()||url.contains("://"))return null;
            url="https://"+url;
        }
        try{
            URI uri=URI.create(url);
            if(uri.getHost()==null||uri.getUserInfo()!=null
                    ||!("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme())))return null;
            return url;
        }catch(IllegalArgumentException invalid){return null;}
    }
    static List<String> extract(CharSequence body,int maximum){
        LinkedHashSet<String> links=new LinkedHashSet<>();
        if(body!=null&&body.length()<=100000){
            Matcher matcher=LINKS.matcher(body);
            while(matcher.find()&&links.size()<maximum){String url=normalize(matcher.group());if(url!=null)links.add(url);}
        }
        return new ArrayList<>(links);
    }
    private PreviewUrls(){}
}
