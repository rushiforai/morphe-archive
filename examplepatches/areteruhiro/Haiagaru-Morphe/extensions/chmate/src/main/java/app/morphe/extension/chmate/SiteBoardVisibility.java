package app.morphe.extension.chmate;

import java.util.Locale;
import java.util.regex.*;

/** Hide disabled managed sites from native lists without deleting their saved boards/logs. */
final class SiteBoardVisibility {
    private static final Pattern ALIAS=Pattern.compile("(?:^|/)("+SiteBoardGateway.KEY_PATTERN+")/?$");
    static boolean visible(SiteBoardGateway gateway,String server,String board){
        if(server==null)return true;
        String host=server.toLowerCase(Locale.ROOT);
        if(host.startsWith("127.0.0.1:")){
            String address=board==null?"":board;
            if(address.indexOf('%')>=0)try{address=java.net.URLDecoder.decode(address,"UTF-8");}catch(Exception invalid){return true;}
            Matcher alias=ALIAS.matcher(address);
            return !alias.find()||gateway.boardEnabled(alias.group(1));
        }
        String kind=kind(host);
        return kind==null||gateway.enabled()&&gateway.siteEnabled(kind);
    }
    static String kind(String host){
        host=host.toLowerCase(Locale.ROOT);
        if(host.equals("bakusai.com"))return "bakusai";
        if(host.equals("bbs.animanch.com"))return "animanch";
        if(host.equals("2chan.net")||host.endsWith(".2chan.net"))return "futaba";
        if(host.equals("bbs.eddibb.cc")||host.equals("bbs.eddibb.org"))return "edge";
        if(host.equals("kenmo.org")||host.equals("00c.org"))return "kenmo";
        return null;
    }
    private SiteBoardVisibility(){}
}
