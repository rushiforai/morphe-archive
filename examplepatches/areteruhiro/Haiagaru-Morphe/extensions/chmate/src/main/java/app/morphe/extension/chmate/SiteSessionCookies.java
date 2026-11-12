package app.morphe.extension.chmate;

import java.io.IOException;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.URI;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** In-memory HTTP session; separate from the user's optional browser authentication. */
final class SiteSessionCookies {
    private final CookieManager cookies=new CookieManager(null,CookiePolicy.ACCEPT_ORIGINAL_SERVER);
    synchronized String header(URI uri)throws IOException{
        List<String> values=cookies.get(uri,Collections.emptyMap()).get("Cookie");
        String value=values==null?"":String.join("; ",values);
        return value.length()<=8192?value:"";
    }
    synchronized void receive(URI uri,Map<String,List<String>> headers)throws IOException{
        cookies.put(uri,headers);
        if(cookies.getCookieStore().getCookies().size()>128)cookies.getCookieStore().removeAll();
    }
}
