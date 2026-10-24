package app.morphe.extension.chmate;

import android.webkit.*;
import android.webkit.CookieManager;
import java.io.*;
import java.net.*;
import java.util.*;

/** Encoding correction for Hissi GET HTML only; no POST, auth or other hosts. */
final class HissiWebResponse {
    static WebResourceResponse intercept(WebResourceRequest request) {
        if(request==null||!"GET".equals(request.getMethod()))return null;
        return intercept(request.getUrl().toString(),request.getRequestHeaders());
    }
    static WebResourceResponse intercept(String address,Map<String,String> headers) {
        HttpURLConnection connection=null;
        try {
            URI uri=URI.create(address);String host=uri.getHost(),path=uri.getPath();
            if(!("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))
                    ||host==null||!(host.equalsIgnoreCase("hissi.org")||host.equalsIgnoreCase("www.hissi.org"))
                    ||uri.getUserInfo()!=null||uri.getPort()!=-1)return null;
            // Do not fetch fonts, images, JS or styles through the HTML decoder.
            if(path!=null&&!path.endsWith("/")&&!path.endsWith(".html")&&!path.contains(".php"))return null;
            connection=(HttpURLConnection)new URL(address).openConnection();
            connection.setConnectTimeout(10000);connection.setReadTimeout(15000);connection.setInstanceFollowRedirects(false);
            if(headers!=null)for(Map.Entry<String,String> h:headers.entrySet()){
                String key=h.getKey();if(key.equalsIgnoreCase("User-Agent")||key.equalsIgnoreCase("Referer")||key.equalsIgnoreCase("Accept")||key.equalsIgnoreCase("Accept-Language"))connection.setRequestProperty(key,h.getValue());
            }
            String cookie=CookieManager.getInstance().getCookie(address);if(cookie!=null)connection.setRequestProperty("Cookie",cookie);
            connection.setRequestProperty("Accept-Encoding","identity");
            String type;int code=connection.getResponseCode();
            if(code!=200||(type=connection.getContentType())==null||!type.toLowerCase(Locale.ROOT).contains("text/html")){connection.disconnect();return null;}
            ByteArrayOutputStream raw=new ByteArrayOutputStream();byte[] chunk=new byte[8192];int total=0,n;
            try(InputStream input=connection.getInputStream()){
                while((n=input.read(chunk))!=-1){total+=n;if(total>8*1024*1024)throw new IOException("Hissi page too large");raw.write(chunk,0,n);}
            }
            String html=HissiHtmlEncoding.decode(raw.toByteArray());
            // Convert the whole legacy response to UTF-8 and update its stale
            // meta declaration so WebView cannot decode it a second time.
            html=html.replaceAll("(?i)(charset\\s*=\\s*[\\\"']?\\s*)(?:shift[_-]?jis|sjis|windows-31j)","$1UTF-8");
            byte[] normalized=html.getBytes(java.nio.charset.StandardCharsets.UTF_8);
            Map<String,String> responseHeaders=new LinkedHashMap<>();
            for(Map.Entry<String,List<String>> h:connection.getHeaderFields().entrySet())if(h.getKey()!=null){
                String key=h.getKey();if(key.equalsIgnoreCase("Set-Cookie")){for(String value:h.getValue())CookieManager.getInstance().setCookie(address,value);}
                else if(!key.equalsIgnoreCase("Content-Type")&&!key.equalsIgnoreCase("Content-Length")&&!key.equalsIgnoreCase("Content-Encoding"))responseHeaders.put(key,String.join(", ",h.getValue()));
            }
            responseHeaders.put("Content-Type","text/html; charset=UTF-8");
            connection.disconnect();
            return new WebResourceResponse("text/html","UTF-8",200,"OK",responseHeaders,new ByteArrayInputStream(normalized));
        }catch(Exception error){if(connection!=null)connection.disconnect();return null;}
    }
    private HissiWebResponse(){}
}
