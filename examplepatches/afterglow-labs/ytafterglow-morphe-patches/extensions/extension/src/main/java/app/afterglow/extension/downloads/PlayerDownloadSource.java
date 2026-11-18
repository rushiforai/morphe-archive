package app.afterglow.extension.downloads;

import android.net.Uri;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import app.afterglow.extension.downloads.DownloadResolver.Cancellation;
import app.afterglow.extension.diagnostics.DebugLog;

/** Android transport of Afterglow's watch-bootstrap/player extraction policy. */
final class PlayerDownloadSource {
    private static final String BROWSER="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36";
    private static final String VISION="com.google.visionosyoutube/1.03 (RealityDevice17,1; U; CPU visionOS 26_5 like Mac OS X; en_US) gzip";
    private final CookieManager cookies=new CookieManager(null,CookiePolicy.ACCEPT_ORIGINAL_SERVER);
    static final class Format {
        int itag,width,height,fps,bitrate; long bytes,duration;
        String url="",mime="",quality="",trackId="",language="",trackName="";
        boolean audio,combined,drc,defaultAudio;
        Map<String,String> headers=Collections.emptyMap();
        String identity() { return itag+":"+trackId+":"+language+":"+drc+":"+mime; }
    }
    static final class Caption {
        String id,language,label,url,sourceLanguage;
        boolean automatic,translated;
        Map<String,String> headers=Collections.emptyMap();
    }
    static final class Video {
        String id,title="",channel="",thumbnail="",description=""; long duration;
        final List<Format> formats=new ArrayList<>();
        final List<Caption> captions=new ArrayList<>();
        final Map<String,String> translationLanguages=new LinkedHashMap<>();
        long created=System.currentTimeMillis();
        Video(String id) { this.id=id; }
    }

    Video load(String id,Cancellation cancel) throws Exception {
        Video video=new Video(id);
        String html="";
        // The web bootstrap has an isolated, memory-only cookie jar, as on iOS.
        // It never imports account cookies or reuses another client's PO token.
        try {
            html=request("https://www.youtube.com/watch?v="+id+"&bpctr=9999999999&has_verified=1",null,
                    Collections.singletonMap("User-Agent",BROWSER),cancel);
            JSONObject initial=objectAfter(html,"ytInitialPlayerResponse");
            if(initial!=null)readJson(initial,video,Collections.singletonMap("User-Agent",BROWSER),false);
        } catch(Exception error) { cancel.throwIfCancelled();DebugLog.write("extractor","Watch bootstrap unavailable: "+error.getClass().getSimpleName()); }
        try {
            String key=jsonString(html,"INNERTUBE_API_KEY"), visitor=jsonString(html,"VISITOR_DATA");
            String js=jsonString(html,"PLAYER_JS_URL");
            if(js.isEmpty())js=jsonString(html,"jsUrl");
            if(!key.isEmpty()&&!visitor.isEmpty()&&!js.isEmpty()) {
                URL playerJs=new URL(new URL("https://www.youtube.com"),js);
                if(!"https".equals(playerJs.getProtocol())||!"www.youtube.com".equals(playerJs.getHost()))
                    throw new IllegalArgumentException("Invalid player source");
                String script=request(playerJs.toString(),null,Collections.singletonMap("User-Agent",BROWSER),cancel);
                Matcher sts=Pattern.compile("(?:signatureTimestamp|sts)\\s*:\\s*(\\d{5,})").matcher(script);
                if(sts.find()) {
                    JSONObject client=new JSONObject().put("clientName","VISIONOS").put("clientVersion","1.03")
                            .put("deviceMake","Apple").put("deviceModel","RealityDevice17,1").put("userAgent",VISION)
                            .put("osName","visionOS").put("osVersion","26.5.23O471").put("hl","en")
                            .put("timeZone","UTC").put("utcOffsetMinutes",0);
                    JSONObject body=new JSONObject().put("context",new JSONObject().put("client",client))
                            .put("videoId",id).put("contentCheckOk",true).put("racyCheckOk",true)
                            .put("playbackContext",new JSONObject().put("contentPlaybackContext",new JSONObject()
                                    .put("html5Preference","HTML5_PREF_WANTS").put("signatureTimestamp",Long.parseLong(sts.group(1)))));
                    Map<String,String> headers=new LinkedHashMap<>();
                    headers.put("User-Agent",VISION); headers.put("Origin","https://www.youtube.com");
                    headers.put("X-YouTube-Client-Name","101"); headers.put("X-YouTube-Client-Version","1.03");
                    headers.put("X-Goog-Visitor-Id",visitor);
                    JSONObject player=new JSONObject(request("https://www.youtube.com/youtubei/v1/player?prettyPrint=false&key="
                            +Uri.encode(key),body.toString(),headers,cancel));
                    readJson(player,video,Collections.singletonMap("User-Agent",VISION),true);
                }
            }
        } catch(Exception error) { cancel.throwIfCancelled();DebugLog.write("extractor","Player bootstrap unavailable: "+error.getClass().getSimpleName()); }
        // Preserve Afterglow's own selections/queue/storage while sharing the installed
        // playback transport's client/signature fixes when the iOS client is unavailable.
        if(!video.formats.isEmpty()&&!probe(video.formats.get(0),cancel))video.formats.clear();
        if(video.formats.isEmpty()) {
            try { compatibleStreams(video,cancel); }
            catch(Exception error){cancel.throwIfCancelled();DebugLog.write("extractor","Compatible streams unavailable: "+error.getClass().getSimpleName());}
        }
        if(video.thumbnail.isEmpty())video.thumbnail="https://i.ytimg.com/vi/"+id+"/hqdefault.jpg";
        if(video.title.isEmpty())video.title=id;
        return video;
    }

    @SuppressWarnings({"rawtypes","unchecked"})
    private void compatibleStreams(Video video,Cancellation cancel) throws Exception {
        Class<? extends Enum> clientClass=(Class<? extends Enum>)Class.forName("app.morphe.extension.shared.spoof.ClientType");
        Class<?> requestClass=Class.forName("app.morphe.extension.shared.spoof.requests.StreamingDataRequest");
        java.lang.reflect.Method fetch=requestClass.getMethod("fetchRequestForDownload",String.class,List.class,clientClass);
        for(String name:new String[]{"VISIONOS_1_03","VISIONOS_1_02","ANDROID_VR_DASH","TV_DASH","ANDROID_CREATOR","TV_SIMPLY"}) {
            cancel.throwIfCancelled();
            DebugLog.write("extractor","Trying compatible download client="+name);
            Object client=Enum.valueOf(clientClass,name);
            Object request=fetch.invoke(null,video.id,Collections.singletonList(client),client);
            Object stream=requestClass.getMethod("getStream").invoke(request);
            cancel.throwIfCancelled();
            if(stream==null)continue;
            byte[] bytes=(byte[])stream.getClass().getMethod("streamingData").invoke(stream);
            String agent=(String)clientClass.getField("userAgent").get(client);
            readProto(bytes,video,Collections.singletonMap("User-Agent",agent));
            if(!video.formats.isEmpty()&&probe(video.formats.get(0),cancel))break;
            video.formats.clear();
        }
    }

    private static boolean probe(Format format,Cancellation cancel) throws Exception {
        cancel.throwIfCancelled();
        HttpURLConnection connection=(HttpURLConnection)new URL(format.url).openConnection();
        connection.setConnectTimeout(10000);connection.setReadTimeout(10000);
        connection.setInstanceFollowRedirects(false);connection.setRequestProperty("Range","bytes=0-0");
        for(Map.Entry<String,String> h:format.headers.entrySet())connection.setRequestProperty(h.getKey(),h.getValue());
        try {
            int status=connection.getResponseCode();cancel.throwIfCancelled();
            if(status!=200&&status!=206){DebugLog.write("extractor","Media probe HTTP "+status);return false;}
            try(InputStream input=connection.getInputStream()){return input.read()!=-1;}
        } catch(java.io.IOException ignored){cancel.throwIfCancelled();return false;}
        finally{connection.disconnect();}
    }

    static void readProto(byte[] bytes,Video video,Map<String,String> headers) throws Exception {
        DownloadProto root=DownloadProto.parse(bytes), data=root.message(4), details=root.message(11);
        if(!details.text(1).isEmpty()&&!video.id.equals(details.text(1)))throw new IllegalArgumentException("Video changed");
        if(video.title.isEmpty())video.title=details.text(15);
        if(video.channel.isEmpty())video.channel=details.text(33);
        if(video.duration==0)video.duration=details.number(16)*1000;
        for(int field:new int[]{2,3})for(DownloadProto.Field entry:data.all(field)) {
            DownloadProto p=DownloadProto.parse(entry.bytes);
            Format f=new Format(); f.itag=(int)p.number(1);f.url=p.text(2);f.mime=p.text(5);
            f.bitrate=(int)p.number(6);f.width=(int)p.number(7);f.height=(int)p.number(8);
            f.bytes=p.number(12);f.duration=p.number(44);f.fps=(int)p.number(26);f.quality=p.text(32);
            f.audio=f.mime.startsWith("audio/"); f.combined=field==2; f.headers=headers;
            if(f.quality.isEmpty()&&f.height>0)f.quality=f.height+"p"+(f.fps>30?f.fps:"");
            // xtags remains part of the resolved URL and identifies language/DRC even
            // where this client omits the audioTrack message.
            String tags=Uri.parse(f.url).getQueryParameter("xtags");
            if(tags!=null)for(String tag:tags.split(":")) {
                if(tag.startsWith("lang="))f.language=tag.substring(5);
                if(tag.equals("drc=1"))f.drc=true;
                if(tag.startsWith("acont="))f.trackId=tag.substring(6);
            }
            if(validMediaUrl(f.url)&&supported(f))video.formats.add(f);
        }
    }

    static void readJson(JSONObject root,Video video,Map<String,String> headers,boolean streams) throws Exception {
        JSONObject details=root.optJSONObject("videoDetails");
        if(details!=null) {
            String id=details.optString("videoId",video.id);
            if(!id.equals(video.id))throw new IllegalArgumentException("Video changed");
            video.title=details.optString("title",video.title);video.channel=details.optString("author",video.channel);
            video.description=details.optString("shortDescription",video.description);
            video.duration=details.optLong("lengthSeconds",video.duration/1000)*1000;
            JSONObject thumb=details.optJSONObject("thumbnail");
            JSONArray images=thumb==null?null:thumb.optJSONArray("thumbnails");
            if(images!=null&&images.length()>0)video.thumbnail=images.getJSONObject(images.length()-1).optString("url",video.thumbnail);
        }
        JSONObject captionRoot=root.optJSONObject("captions");
        JSONObject renderer=captionRoot==null?null:captionRoot.optJSONObject("playerCaptionsTracklistRenderer");
        if(renderer!=null) {
            JSONArray tracks=renderer.optJSONArray("captionTracks");
            if(tracks!=null) {
                video.captions.clear();
                for(int i=0;i<tracks.length();i++) {
                    JSONObject p=tracks.getJSONObject(i); Caption c=new Caption();
                    c.url=p.optString("baseUrl"); c.language=p.optString("languageCode");
                    c.id=p.optString("vssId",c.language+":"+i);c.label=text(p.optJSONObject("name"));
                    c.automatic="asr".equals(p.optString("kind"));c.sourceLanguage=c.language;
                    c.headers=headers;
                    if(c.url.startsWith("https://"))video.captions.add(c);
                }
            }
            JSONArray languages=renderer.optJSONArray("translationLanguages");
            if(languages!=null)for(int i=0;i<languages.length();i++) {
                JSONObject lang=languages.getJSONObject(i);
                video.translationLanguages.put(lang.optString("languageCode"),text(lang.optJSONObject("languageName")));
            }
        }
        if(!streams)return;
        JSONObject data=root.optJSONObject("streamingData");if(data==null)return;
        for(String key:new String[]{"formats","adaptiveFormats"}) {
            JSONArray list=data.optJSONArray(key);if(list==null)continue;
            for(int i=0;i<list.length();i++) {
                JSONObject p=list.getJSONObject(i); Format f=new Format();
                f.itag=p.optInt("itag");f.url=p.optString("url");f.mime=p.optString("mimeType");
                f.width=p.optInt("width");f.height=p.optInt("height");f.fps=p.optInt("fps");
                f.bitrate=p.optInt("bitrate");f.bytes=p.optLong("contentLength");f.duration=p.optLong("approxDurationMs");
                f.quality=p.optString("qualityLabel");f.audio=f.mime.startsWith("audio/");
                f.combined="formats".equals(key);f.drc=p.optBoolean("isDrc");f.headers=headers;
                JSONObject track=p.optJSONObject("audioTrack");
                if(track!=null) {
                    f.trackId=track.optString("id");f.trackName=track.optString("displayName");
                    f.defaultAudio=track.optBoolean("audioIsDefault");
                    int dot=f.trackId.indexOf('.');f.language=dot>0?f.trackId.substring(0,dot):f.trackId;
                }
                if(validMediaUrl(f.url)&&supported(f))video.formats.add(f);
            }
        }
    }

    static boolean supported(Format f) {
        return f.itag>0&&DownloadFormatPolicy.supported(f.mime,android.os.Build.VERSION.SDK_INT);
    }
    static boolean validMediaUrl(String url) {
        try { URL u=new URL(url);return "https".equals(u.getProtocol())&&u.getHost().endsWith(".googlevideo.com"); }
        catch(Exception ignored){return false;}
    }
    private String request(String url,String body,Map<String,String> headers,Cancellation cancel) throws Exception {
        cancel.throwIfCancelled(); URL endpoint=new URL(url);
        if(!"https".equals(endpoint.getProtocol()))throw new IllegalArgumentException("HTTPS required");
        HttpURLConnection connection=(HttpURLConnection)endpoint.openConnection();
        connection.setConnectTimeout(12000);connection.setReadTimeout(18000);connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("Accept-Language","en-US,en;q=0.5");
        for(Map.Entry<String,String> h:headers.entrySet())connection.setRequestProperty(h.getKey(),h.getValue());
        for(Map.Entry<String,List<String>> h:cookies.get(endpoint.toURI(),Collections.emptyMap()).entrySet())
            connection.setRequestProperty(h.getKey(),String.join("; ",h.getValue()));
        try {
            if(body!=null) {
                byte[] bytes=body.getBytes(StandardCharsets.UTF_8);connection.setRequestMethod("POST");connection.setDoOutput(true);
                connection.setRequestProperty("Content-Type","application/json");connection.setFixedLengthStreamingMode(bytes.length);
                try(java.io.OutputStream out=connection.getOutputStream()){out.write(bytes);}
            }
            int status=connection.getResponseCode();cookies.put(endpoint.toURI(),connection.getHeaderFields());
            if(status!=200)throw new java.io.IOException("Player request failed (HTTP "+status+")");
            try(InputStream in=connection.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()) {
                byte[] buffer=new byte[16384];int n;
                while((n=in.read(buffer))!=-1) {
                    cancel.throwIfCancelled();if(out.size()+n>12*1024*1024)throw new java.io.IOException("Player response too large");
                    out.write(buffer,0,n);
                }
                return out.toString("UTF-8");
            }
        } finally { connection.disconnect(); }
    }
    static JSONObject objectAfter(String source,String marker) throws Exception {
        int start=source.indexOf(marker);if(start<0)return null;
        start=source.indexOf('{',start+marker.length());if(start<0)return null;
        boolean quoted=false,escape=false;int depth=0;
        for(int i=start;i<source.length();i++) {
            char c=source.charAt(i);
            if(quoted) { if(escape)escape=false;else if(c=='\\')escape=true;else if(c=='"')quoted=false; }
            else if(c=='"')quoted=true;
            else if(c=='{')depth++;
            else if(c=='}'&&--depth==0)return new JSONObject(source.substring(start,i+1));
        }
        return null;
    }
    private static String jsonString(String text,String key) throws Exception {
        Matcher match=Pattern.compile("\""+Pattern.quote(key)+"\"\\s*:\\s*(\"(?:\\\\.|[^\"\\\\])*\")").matcher(text);
        return match.find()?new JSONArray("["+match.group(1)+"]").getString(0):"";
    }
    private static String text(JSONObject value) {
        if(value==null)return "";String text=value.optString("simpleText");if(!text.isEmpty())return text;
        JSONArray runs=value.optJSONArray("runs");StringBuilder out=new StringBuilder();
        if(runs!=null)for(int i=0;i<runs.length();i++)out.append(runs.optJSONObject(i).optString("text"));
        return out.toString();
    }
}
