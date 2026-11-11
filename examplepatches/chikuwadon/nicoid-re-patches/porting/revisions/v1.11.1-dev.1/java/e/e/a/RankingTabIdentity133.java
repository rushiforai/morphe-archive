package e.e.a;

import java.net.URI;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;

/**
 * Canonical identity of a single ranking screen. The legacy startup route
 * uses sp.nicovideo.jp/api/ranking/genre/... while the ranking menu uses
 * www.nicovideo.jp/ranking/genre/... for the same category and period.
 * Genre, period and any other ranking filters are kept distinct.
 */
public final class RankingTabIdentity133 {
    private RankingTabIdentity133() {}

    static String key(int type,String screen,String raw) {
        if(type!=6||!"list".equals(screen)||raw==null||raw.isEmpty())return null;
        try {
            URI uri=URI.create(raw);
            String host=uri.getHost();
            if(host==null)return null;
            host=host.toLowerCase(Locale.ROOT);
            if(!host.equals("nicovideo.jp") && !host.endsWith(".nicovideo.jp"))return null;
            String path=uri.getPath();
            if(path==null)return null;
            if(path.startsWith("/api/ranking/"))path=path.substring(4);
            if(!path.startsWith("/ranking/genre/"))return null;
            while(path.endsWith("/") && path.length()>"/ranking/genre/".length())
                path=path.substring(0,path.length()-1);
            if(path.length()<="/ranking/genre/".length())return null;
            String query=uri.getRawQuery();
            ArrayList<String> pieces=new ArrayList<>();
            if(query!=null && !query.isEmpty()){
                for(String piece:query.split("&",-1)){
                    if(piece.isEmpty())continue;
                    int sep=piece.indexOf('=');
                    String name=sep<0?piece:piece.substring(0,sep);
                    String value=sep<0?"":piece.substring(sep+1);
                    name=URLDecoder.decode(name,"UTF-8");
                    value=URLDecoder.decode(value,"UTF-8");
                    pieces.add(name+"="+value);
                }
            }
            Collections.sort(pieces);
            return path+"?"+String.join("&",pieces);
        } catch(Exception ignored){return null;}
    }
    public static boolean same(int typeA,String screenA,String urlA,
                               int typeB,String screenB,String urlB){
        String a=key(typeA,screenA,urlA);
        return a!=null && a.equals(key(typeB,screenB,urlB));
    }
}
