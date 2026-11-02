package app.morphe.extension.chmate;
import java.net.URI;
/** Explicit thread navigation only: no board crawling and no archive route for external hosts. */
final class ArchiveThreadLinks {
    static boolean is5chThread(String url){
        if(url==null)return false;
        try{URI u=URI.create(url);String host=u.getHost();
            return ("http".equalsIgnoreCase(u.getScheme())||"https".equalsIgnoreCase(u.getScheme()))
                &&u.getRawUserInfo()==null&&(u.getPort()==-1||u.getPort()==80||u.getPort()==443)
                &&host!=null&&(host.toLowerCase(java.util.Locale.ROOT).endsWith(".5ch.io")||host.toLowerCase(java.util.Locale.ROOT).endsWith(".5ch.net")||host.toLowerCase(java.util.Locale.ROOT).endsWith(".2ch.net"))
                &&u.getRawPath()!=null&&u.getRawPath().matches("/test/read\\.cgi/[A-Za-z0-9_-]+/[0-9]{9,10}(?:/.*)?");
        }catch(IllegalArgumentException invalid){return false;}
    }
    static String secure(String url){
        if(!is5chThread(url)||!url.regionMatches(true,0,"http://",0,7))return url;
        URI u=URI.create(url);String authority=u.getRawAuthority();if(u.getPort()==80)authority=authority.substring(0,authority.lastIndexOf(':'));
        return "https://"+authority+url.substring(url.indexOf('/',7));
    }
    private ArchiveThreadLinks(){}
}
