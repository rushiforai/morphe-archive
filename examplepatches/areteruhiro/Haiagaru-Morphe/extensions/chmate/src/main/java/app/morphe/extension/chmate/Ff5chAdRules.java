package app.morphe.extension.chmate;

import java.net.URI;
import java.util.Locale;

final class Ff5chAdRules {
    private static String host(String url){
        try{
            URI parsed=URI.create(url);
            String scheme=parsed.getScheme(),host=parsed.getHost();
            return host!=null&&parsed.getRawUserInfo()==null&&("https".equalsIgnoreCase(scheme)||"http".equalsIgnoreCase(scheme))
                ?host.toLowerCase(Locale.ROOT):"";
        }catch(RuntimeException invalid){return "";}
    }
    static boolean searchPage(String url){return "ff5ch.syoboi.jp".equals(host(url));}
    static boolean adResource(String url){
        String host=host(url);
        for(String domain:new String[]{"ad-stir.com","googlesyndication.com","doubleclick.net"}){
            if(host.equals(domain)||host.endsWith("."+domain))return true;
        }
        return false;
    }
    private Ff5chAdRules(){}
}
