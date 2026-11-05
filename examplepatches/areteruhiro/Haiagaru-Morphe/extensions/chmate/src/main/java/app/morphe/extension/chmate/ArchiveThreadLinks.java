package app.morphe.extension.chmate;
import java.net.URI;
/** Explicit thread navigation only: no board crawling and no archive route for external hosts. */
final class ArchiveThreadLinks {
    /** Only obsolete servers need recovery before native navigation starts.
     * Thread age does not establish DAT availability. Current servers are
     * handled by the existing DAT worker, including archive fallback.
     */
    static boolean requiresLegacyServerRecovery(String host){
        if(host==null)return false;
        host=host.toLowerCase(java.util.Locale.ROOT);
        if(host.equals("2ch.net")||host.endsWith(".2ch.net"))return true;
        if(!(host.endsWith(".5ch.net")||host.endsWith(".5ch.io")))return false;
        switch(host.substring(0,host.indexOf('.'))){
            case "ai": case "anago": case "awabi": case "daily": case "fox":
            case "hayabusa": case "hayabusa2": case "hayabusa3": case "hayabusa5":
            case "hayabusa6": case "hello": case "hope": case "kanae": case "maguro":
            case "mastiff": case "peace": case "potato": case "raptor": case "wktk":
                return true;
            default:return false;
        }
    }
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
