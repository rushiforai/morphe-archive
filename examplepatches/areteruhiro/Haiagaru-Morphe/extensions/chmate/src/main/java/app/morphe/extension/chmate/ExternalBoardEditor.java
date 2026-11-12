package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** Keep native identities (bookmarks, NG rules and log paths) while relocating the transport. */
public final class ExternalBoardEditor {
    static final String PREFS="haiagaru.external-board-addresses";
    private static volatile List<Route> routes=Collections.emptyList();
    private static boolean initialized;
    private ExternalBoardEditor() {}
    static SharedPreferences prefs(Context c) { return c.getSharedPreferences(PREFS,0); }
    static final class Route {
        final String id; final BoardAddress original, target;
        Route(String id, String original, String target) {
            this.id=id;this.original=BoardAddress.parse(original);this.target=BoardAddress.parse(target);
        }
        boolean matches(String server,String path) {
            String key=server+"/"+path;
            return key.equals(original.key()) || key.equals(target.key());
        }
    }
    public static synchronized void initialize(Context c) {
        if(initialized) return;
        ArrayList<Route> loaded=new ArrayList<>();
        SharedPreferences p=prefs(c);
        for(Map.Entry<String,?> e:p.getAll().entrySet()) {
            if(!e.getKey().startsWith("target:") || !(e.getValue() instanceof String)) continue;
            String id=e.getKey().substring(7);
            try { loaded.add(new Route(id,p.getString("original:"+id,""),(String)e.getValue())); }
            catch(IllegalArgumentException error) { Log.w("Haiagaru","Invalid saved external board address"); }
        }
        routes=Collections.unmodifiableList(loaded); initialized=true;
    }
    // Replaced with exact native field bindings by the patch, validated against constructor stores.
    public static String boardFields() { return ""; }
    public static String infoFields() { return ""; }
    private static String get(Object o,String name) throws Exception {
        Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return (String)f.get(o);
    }
    private static void put(Object o,String name,String value) throws Exception {
        Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);f.set(o,value);
    }
    public static void rewriteBoard(Object o) { rewrite(o,boardFields(),true); }
    public static void rewriteInfo(Object o) { rewrite(o,infoFields(),false); }
    public static String rewriteInfoUrl(Object info,String value) {
        value=SiteNativeBoards.rewriteInfoUrl(info,value);
        if(routes.isEmpty() || value==null) return value;
        try {
            String[] fields=infoFields().split(",");
            String server=get(info,fields[0]),path=get(info,fields[1]);
            for(Route r:routes) if(r.matches(server,path)) {
                String rewritten=rewriteUrl(value);
                for(BoardAddress base:new BoardAddress[]{r.original,r.target})
                    for(String scheme:new String[]{"http://","https://"}) {
                        String prefix=scheme+base.server+"/";
                        if(rewritten.startsWith(prefix)) {
                            java.net.URI target=java.net.URI.create(r.target.url);
                            return target.getScheme()+"://"+r.target.server+"/"+rewritten.substring(prefix.length());
                        }
                    }
                return rewritten;
            }
        } catch(Exception error) { Log.w("Haiagaru","External board URL resolution failed",error); }
        return value;
    }
    public static String rewriteUrl(String value) {
        if(value==null || routes.isEmpty() || !(value.startsWith("http://") || value.startsWith("https://"))) return value;
        for(Route r:routes) {
            for(BoardAddress base:new BoardAddress[]{r.original,r.target}) {
                for(String scheme:new String[]{"http://","https://"}) {
                    String prefix=scheme+base.key()+"/";
                    if(value.startsWith(prefix)) return r.target.url+value.substring(prefix.length());
                    // Native read.cgi endpoints have the board path after /test/read.cgi/.
                    String read=scheme+base.server+"/test/read.cgi/"+base.path+"/";
                    if(value.startsWith(read)) return r.target.url.substring(0,r.target.url.indexOf('/',8))
                            +"/test/read.cgi/"+r.target.path+"/"+value.substring(read.length());
                }
            }
        }
        return value;
    }
    private static void rewrite(Object o,String binding,boolean board) {
        if(routes.isEmpty() || o==null) return;
        try {
            String[] f=binding.split(",");
            String server=get(o,f[0]), path=get(o,f[1]);
            String id=board?get(o,f[2]):null;
            for(Route r:routes) {
                if(!(board && r.id.equals(id)) && !r.matches(server,path)) continue;
                put(o,f[0],r.target.server); put(o,f[1],r.target.path);
                if(board) { put(o,f[2],r.id); put(o,f[3],r.target.url); }
                return;
            }
        } catch(Exception error) { Log.w("Haiagaru","External board relocation failed",error); }
    }
}
