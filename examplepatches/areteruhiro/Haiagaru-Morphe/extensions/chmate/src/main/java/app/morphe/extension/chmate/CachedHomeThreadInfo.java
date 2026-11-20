package app.morphe.extension.chmate;

import android.content.Context;
import android.content.Intent;
import java.net.URI;

/** Keep the full board/Intent URL when 242 opens a cached HOME/search hit. */
public final class CachedHomeThreadInfo {
    public static Object resolve(Object row,Context context){
        if(row==null||context==null||!row.getClass().getName().equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ"))return null;
        try{
            Object intent=NativeFields.find(row.getClass(),"k").get(row);
            if(intent instanceof Intent){String url=((Intent)intent).getDataString();if(http(url)){String local=SiteNativeBoards.localUrl(url);return OpenTabsRefresh.parseInfo(context,local==null?url:local);}}
            Object board=NativeFields.find(row.getClass(),"e").get(row);
            long id=NativeFields.find(row.getClass(),"b").getLong(row);if(board==null||id<1)return null;
            String host=(String)NativeFields.find(board.getClass(),"c").get(board),path=(String)NativeFields.find(board.getClass(),"d").get(board);
            if(host!=null&&host.matches("127\\.0\\.0\\.1(?::[0-9]{1,5})?")&&path!=null&&path.matches(SiteBoardGateway.KEY_PATTERN)){
                SiteBoardGateway gateway=SiteBoardGateway.get(context);
                String base=gateway.registrationUrl(path);
                if(!host.equals("127.0.0.1")&&!host.equals(URI.create(base).getRawAuthority()))return null;
                return SiteNativeBoards.parse(gateway.nativeUrl(path,SiteThreadIds.source(Long.toString(id))));
            }
            String base=(String)NativeFields.find(board.getClass(),"b").get(board);
            if(!http(base))return null;
            String url=GlobalTitleSearchRules.threadUrl(base,Long.toString(id));
            return OpenTabsRefresh.parseInfo(context,url);
        }catch(Exception unavailable){return null;}
    }
    private static boolean http(String value){try{URI uri=URI.create(value);return uri.getHost()!=null&&uri.getUserInfo()==null&&("https".equalsIgnoreCase(uri.getScheme())||"http".equalsIgnoreCase(uri.getScheme()));}catch(Exception invalid){return false;}}
    private CachedHomeThreadInfo(){}
}
