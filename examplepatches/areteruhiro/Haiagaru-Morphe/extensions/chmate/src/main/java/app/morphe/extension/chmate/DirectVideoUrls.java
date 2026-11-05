package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;
import java.util.regex.*;

/** Public direct files only, not web pages, playlists or protected streams. */
final class DirectVideoUrls {
    private static final Pattern URL=Pattern.compile("(?<![A-Za-z0-9_./:@-])https?://[^\\s<>\"'()（）]+",Pattern.CASE_INSENSITIVE);
    private static final Pattern VIDEO_PATH=Pattern.compile("(?i).+\\.(mp4|m4v|webm|mov|3gp|3gpp)");
    static boolean supported(String value){
        if(value==null)return false;
        try{URI uri=URI.create(value);String scheme=uri.getScheme(),host=uri.getHost(),path=uri.getPath();
            if(!("https".equalsIgnoreCase(scheme)||"http".equalsIgnoreCase(scheme))||host==null||uri.getUserInfo()!=null||path==null)return false;
            String h=host.toLowerCase(Locale.ROOT);if(h.equals("localhost")||h.endsWith(".localhost")||h.equals("127.0.0.1")||h.equals("[::1]")||h.equals("0.0.0.0"))return false;
            return VIDEO_PATH.matcher(path).matches();
        }catch(IllegalArgumentException error){return false;}
    }
    static String[] extract(String body){
        LinkedHashSet<String> urls=new LinkedHashSet<>();if(body!=null){Matcher matcher=URL.matcher(body);while(matcher.find()&&urls.size()<8){String url=matcher.group().replace("&amp;","&");if(supported(url))urls.add(url);}}
        return urls.toArray(new String[0]);
    }
    private DirectVideoUrls(){}
}
