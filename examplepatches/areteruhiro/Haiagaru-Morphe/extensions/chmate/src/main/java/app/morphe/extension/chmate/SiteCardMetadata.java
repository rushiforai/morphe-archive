package app.morphe.extension.chmate;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.text.Html;
import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.*;
import okhttp3.*;
import org.json.JSONObject;

/** Common HTML metadata only: no scripts, login state or site-specific scraping. */
final class SiteCardMetadata {
    static final class Data {
        final String url, title, description, image, site;
        final long savedAt;
        boolean tunnel;
        Data(String url, String title, String description, String image, String site) {
            this(url,title,description,image,site,System.currentTimeMillis());
        }
        Data(String url, String title, String description, String image, String site,long savedAt) {
            this.url=url; this.title=title; this.description=description; this.image=image; this.site=site;
            this.savedAt=savedAt;
        }
        JSONObject json() throws Exception { return new JSONObject().put("url",url).put("title",title)
                .put("description",description).put("image",image).put("site",site).put("saved",savedAt).put("tunnel",tunnel); }
    }
    private static final Pattern META = Pattern.compile("(?is)<meta\\b(?:\"[^\"]*\"|'[^']*'|[^'\">])*>");
    private static final Pattern ATTR = Pattern.compile("(?is)([a-z_:][a-z0-9_:.-]*)\\s*=\\s*(?:\"([^\"]*)\"|'([^']*)'|([^\\s>]+))");
    private static final OkHttpClient CLIENT = new OkHttpClient.Builder()
            .cookieJar(CookieJar.NO_COOKIES).authenticator(okhttp3.Authenticator.NONE).proxyAuthenticator(okhttp3.Authenticator.NONE)
            .followRedirects(false).followSslRedirects(false).cache(null)
            .connectTimeout(10,TimeUnit.SECONDS).readTimeout(10,TimeUnit.SECONDS).callTimeout(15,TimeUnit.SECONDS)
            .dns(host -> {
                List<InetAddress> addresses = Dns.SYSTEM.lookup(host);
                for (InetAddress a : addresses) {
                    byte[] bytes=a.getAddress();
                    if(a.isAnyLocalAddress() || a.isLoopbackAddress() || a.isLinkLocalAddress()
                            || a.isSiteLocalAddress() || a.isMulticastAddress()
                            || bytes.length==16 && (bytes[0]&0xfe)==0xfc
                            || bytes.length==4 && (bytes[0]&255)==100 && ((bytes[1]&255)&192)==64)
                        throw new UnknownHostException("Local address is not a public preview destination");
                }
                return addresses;
            }).build();

    static String safeUrl(String value) {
        try {
            URI u=URI.create(value.trim());
            if (!("https".equalsIgnoreCase(u.getScheme())||"http".equalsIgnoreCase(u.getScheme()))
                    ||u.getHost()==null||u.getUserInfo()!=null||u.getPort()!=-1&&u.getPort()!=80&&u.getPort()!=443) return null;
            String host=u.getHost().toLowerCase(Locale.ROOT);
            if(!host.contains(".")||host.endsWith(".local")||host.endsWith(".localhost"))return null;
            int hash=value.indexOf('#'); return hash<0?value:value.substring(0,hash);
        } catch(RuntimeException invalid){return null;}
    }

    private static final class Content {
        final byte[] bytes; final String url,type; boolean tunnel;
        Content(byte[] bytes,String url,String type){this.bytes=bytes;this.url=url;this.type=type;}
    }
    private static Content get(String address, boolean image) throws Exception {
        return get(address,image,false);
    }
    private static Content get(String address, boolean image, boolean inheritedProtection) throws Exception {
        String url=safeUrl(address); if(url==null)throw new IOException("Unsupported URL");
        for(int redirect=0;redirect<=3;redirect++) {
            // Decide before DNS/request creation, including a redirect into a registered domain.
            if(inheritedProtection || ImageVpnController.protectedPreview(url)) {
                app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image result=ImageVpnController.fetchPreview(url);
                String type=result.getContentType(); byte[] bytes=result.getBody();
                if(bytes==null || type==null || (image ? !type.startsWith("image/") :
                        !(type.contains("text/html")||type.contains("application/xhtml+xml"))))
                    throw new IOException("Not preview content");
                if(bytes.length>(image?2*1024*1024:512*1024))throw new IOException("Preview too large");
                Content content=new Content(bytes,result.getURL(),type);content.tunnel=true;return content;
            }
            Request request=new Request.Builder().url(url).header("User-Agent","Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/131.0 Mobile Safari/537.36")
                    .header("Accept",image?"image/*":"text/html,application/xhtml+xml").build();
            try(Response response=CLIENT.newCall(request).execute()) {
                if(response.code()>=300&&response.code()<400) {
                    String location=response.header("Location");
                    if(location==null)throw new IOException("No redirect destination");
                    String next=safeUrl(new URI(url).resolve(location).toString());
                    if(next==null||url.startsWith("https:")&&!next.startsWith("https:"))throw new IOException("Unsupported redirect");
                    url=next;continue;
                }
                if(!response.isSuccessful()||response.body()==null)throw new IOException("No preview response");
                String type=response.header("Content-Type","");
                if(image?!type.toLowerCase(Locale.ROOT).startsWith("image/"):
                        !(type.toLowerCase(Locale.ROOT).contains("text/html")||type.toLowerCase(Locale.ROOT).contains("application/xhtml+xml")))
                    throw new IOException("Not preview content");
                int limit=image?2*1024*1024:512*1024;
                ByteArrayOutputStream output=new ByteArrayOutputStream();
                try(InputStream stream=response.body().byteStream()) {
                    byte[] buffer=new byte[8192];int n;
                    while((n=stream.read(buffer))!=-1) {
                        if(output.size()+n>limit) {
                            if(image)throw new IOException("Preview image too large");
                            output.write(buffer,0,limit-output.size());break;
                        }
                        output.write(buffer,0,n);
                    }
                }
                return new Content(output.toByteArray(),url,type);
            }
        }
        throw new IOException("Too many redirects");
    }
    static Data fetch(String url) throws Exception {
        Content content=get(url,false);
        Charset charset=StandardCharsets.UTF_8;
        String prefix=new String(content.bytes,0,Math.min(content.bytes.length,4096),StandardCharsets.ISO_8859_1);
        Matcher encoding=Pattern.compile("(?i)charset\\s*=\\s*['\"]?([a-z0-9_.-]+)").matcher(content.type+" "+prefix);
        if(encoding.find())try{charset=Charset.forName(encoding.group(1));}catch(Exception ignored){}
        Data data=parse(new String(content.bytes,charset),content.url,url);
        if(data!=null)data.tunnel=content.tunnel;
        return data;
    }
    static Data parse(String html,String base,String original) throws Exception {
        int end=html.toLowerCase(Locale.ROOT).indexOf("</head>");if(end>=0)html=html.substring(0,end);
        html=html.replaceAll("(?is)<!--.*?-->|<script\\b[^>]*>.*?</script>","");
        Map<String,String> meta=new HashMap<>();Matcher tags=META.matcher(html);
        while(tags.find()) {
            Map<String,String> attributes=new HashMap<>();Matcher a=ATTR.matcher(tags.group());
            while(a.find())attributes.put(a.group(1).toLowerCase(Locale.ROOT),a.group(2)!=null?a.group(2):a.group(3)!=null?a.group(3):a.group(4));
            String key=attributes.get("property");if(key==null)key=attributes.get("name");
            if(key!=null&&attributes.containsKey("content"))meta.putIfAbsent(key.toLowerCase(Locale.ROOT),attributes.get("content"));
        }
        String title=first(meta,"og:title","twitter:title");
        if(title.isEmpty()){Matcher t=Pattern.compile("(?is)<title\\b[^>]*>(.*?)</title>").matcher(html);if(t.find())title=t.group(1);}
        title=clean(title,200);if(title.isEmpty())return null;
        String description=clean(first(meta,"og:description","twitter:description","description"),400);
        String image=first(meta,"og:image:secure_url","og:image","twitter:image","twitter:image:src");
        if(!image.isEmpty())try{image=safeUrl(new URI(base).resolve(Html.fromHtml(image).toString()).toString());}catch(Exception invalid){image="";}
        String site=clean(first(meta,"og:site_name"),80);
        return new Data(original,title,description,image==null?"":image,site);
    }
    private static String first(Map<String,String> values,String... keys){for(String key:keys){String v=values.get(key);if(v!=null&&!v.trim().isEmpty())return v;}return "";}
    private static String clean(String v,int max){String text=Html.fromHtml(v).toString().replaceAll("[\\p{Cntrl}\\s]+"," ").trim();return text.substring(0,Math.min(max,text.length()));}
    static Bitmap image(String url) throws Exception {
        return image(url,false);
    }
    static Bitmap image(String url,boolean protectedPage) throws Exception {
        Content content=get(url,true,protectedPage);BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;
        BitmapFactory.decodeByteArray(content.bytes,0,content.bytes.length,bounds);
        if(bounds.outWidth<=0||bounds.outHeight<=0||(long)bounds.outWidth*bounds.outHeight>40000000) return null;
        BitmapFactory.Options options=new BitmapFactory.Options();options.inSampleSize=1;
        while(Math.max(bounds.outWidth,bounds.outHeight)/options.inSampleSize>400)options.inSampleSize*=2;
        return BitmapFactory.decodeByteArray(content.bytes,0,content.bytes.length,options);
    }

    private static File directory(){return new File(Haiagaru.applicationContextForExtension().getCacheDir(),"haiagaru-site-cards");}
    private static File file(String url)throws Exception{
        byte[] digest=java.security.MessageDigest.getInstance("SHA-256").digest(url.getBytes(StandardCharsets.UTF_8));StringBuilder name=new StringBuilder();
        for(byte b:digest)name.append(String.format(Locale.ROOT,"%02x",b));return new File(directory(),name+".json");
    }
    static Data cached(String url){try{
        File file=file(url);if(file.length()>16384||System.currentTimeMillis()-file.lastModified()>86400000)return null;
        byte[] bytes=new android.util.AtomicFile(file).readFully();JSONObject j=new JSONObject(new String(bytes,StandardCharsets.UTF_8));
        if(!url.equals(j.optString("url")))return null;
        long saved=j.optLong("saved");if(saved<=0||System.currentTimeMillis()-saved>86400000)return null;
        Data data=new Data(url,j.getString("title"),j.optString("description"),j.optString("image"),j.optString("site"),saved);
        // Old caches cannot prove that an unregistered URL did not redirect into a protected site.
        if(!j.has("tunnel"))return null;
        data.tunnel=j.optBoolean("tunnel");return data;
    }catch(Exception missing){return null;}}
    static void store(Data data){try{
        File directory=directory();if(!directory.isDirectory()&&!directory.mkdirs())return;
        android.util.AtomicFile target=new android.util.AtomicFile(file(data.url));FileOutputStream out=target.startWrite();
        try{out.write(data.json().toString().getBytes(StandardCharsets.UTF_8));target.finishWrite(out);}catch(Exception e){target.failWrite(out);throw e;}
        File[] files=directory.listFiles((dir,name)->name.endsWith(".json"));
        if(files!=null&&files.length>128){Arrays.sort(files,Comparator.comparingLong(File::lastModified));for(int i=0;i<files.length-128;i++)files[i].delete();}
    }catch(Exception ignored){}}
    static void clear(){File[] files=directory().listFiles();if(files!=null)for(File f:files)if(f.isFile())f.delete();}
    private SiteCardMetadata(){}
}
