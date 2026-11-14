package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.*;
import org.json.*;

/** Streaming upload adapters. No cross-site redirects, global cookies or automatic POST retries. */
public final class MediaUploadClient {
    interface Transport { HttpURLConnection open(URL url) throws IOException; }
    private final Transport transport;
    public MediaUploadClient() { this(url -> (HttpURLConnection)url.openConnection()); }
    MediaUploadClient(Transport transport) { this.transport=transport; }

    public JSONObject upload(String provider,File file,String mime,String apiKey,boolean adult) throws Exception {
        MediaUploadPolicy.validate(provider,mime,file.length(),apiKey);
        JSONObject data = provider.equals(MediaUploadPolicy.IMGBOX) ? imgbox(file,mime,adult) : imgpile(file,mime,apiKey);
        if (!MediaUploadPolicy.mediaUrl(provider,data.optString("link")))
            throw new IOException("送信済みですが安全な直接URLを確認できません。再送せずサイトを確認してください");
        // Never pass a foreign deletion token to ChMate's Imgur DELETE implementation.
        data.put("deletehash", "");
        return data;
    }
    private HttpURLConnection open(String address,String method) throws IOException {
        HttpURLConnection c=transport.open(new URL(address));
        c.setInstanceFollowRedirects(false);
        c.setConnectTimeout(30_000); c.setReadTimeout(120_000);
        c.setRequestMethod(method);
        c.setRequestProperty("User-Agent","Haiagaru/1.0 (Android media uploader)");
        c.setRequestProperty("Accept","application/json");
        if(method.equals("POST")) c.setDoOutput(true);
        return c;
    }
    private JSONObject imgpile(File file,String mime,String key) throws Exception {
        HttpURLConnection c=open("https://imgpile.com/uploads?filename=upload."+MediaUploadPolicy.extension(mime),"POST");
        c.setRequestProperty("Authorization","Bearer "+key);
        c.setRequestProperty("Content-Type",mime);
        c.setFixedLengthStreamingMode(file.length());
        try {
            try(OutputStream out=c.getOutputStream()) { copy(file,out); }
            return parseImgpile(json(body(c,true)),mime);
        } finally { c.disconnect(); }
    }
    static JSONObject parseImgpile(JSONObject root,String mime) throws Exception {
        JSONObject d=root.optJSONObject("data"), urls=d==null?null:d.optJSONObject("urls");
        if(urls==null) throw new IOException("imgpileの送信結果にURLがありません。再送せずサイトを確認してください");
        // The official API explicitly says processing=true is not a polling signal.
        String link=urls.optString("original", "");
        if(!MediaUploadPolicy.mediaUrl(MediaUploadPolicy.IMGPILE,link)) throw new IOException("imgpileの直接URLを確認できません");
        return new JSONObject().put("id",d.optString("slug")).put("link",link)
                .put("haiagaruProvider", MediaUploadPolicy.IMGPILE)
                .put("haiagaruManagementUrl", MediaUploadManagementPolicy.imgpile(d.optString("slug")))
                .put("type",mime).put("animated",link.matches("(?i).*\\.(mp4|webm|mov|gif)$"));
    }
    private JSONObject imgbox(File file,String mime,boolean adult) throws Exception {
        ImgboxCookies cookies=new ImgboxCookies();
        HttpURLConnection home=open("https://imgbox.com/","GET");
        home.setRequestProperty("Accept","text/html");
        String html;
        try { html=body(home,false); cookies.receive(home.getHeaderFields()); }
        finally { home.disconnect(); }
        String csrf=csrf(html);
        HttpURLConnection token=open("https://imgbox.com/ajax/token/generate","POST");
        headers(token,cookies,csrf);
        token.setRequestProperty("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        // The current anonymous endpoint requires an explicit new-gallery request.
        // Empty POST gives HTTP 500; gallery=false returns ok=false, even though
        // the public form still exposes a no-gallery option.
        byte[] tokenBody="gallery=true&gallery_title=&comments_enabled=0".getBytes(StandardCharsets.US_ASCII);
        token.setFixedLengthStreamingMode(tokenBody.length);
        JSONObject credentials;
        try {
            try(OutputStream out=token.getOutputStream()) { out.write(tokenBody); }
            credentials=json(body(token,false));
            cookies.receive(token.getHeaderFields());
        } finally { token.disconnect(); }
        String id=credentials.optString("token_id"), secret=credentials.optString("token_secret");
        if(!id.matches("[A-Za-z0-9_-]{1,512}") || !secret.matches("[A-Za-z0-9_+=/-]{1,512}"))
            throw new IOException("imgboxの送信準備に失敗しました。ファイルは送信していません");
        String galleryId=credentials.optString("gallery_id"),gallerySecret=credentials.optString("gallery_secret");
        if(!credentials.optBoolean("ok",false) || !galleryId.matches("[A-Za-z0-9_-]{1,512}")
                || !gallerySecret.matches("[A-Za-z0-9_+=/-]{1,512}"))
            throw new IOException("imgboxのギャラリーを準備できません。ファイルは送信していません");
        String boundary="Haiagaru"+UUID.randomUUID().toString().replace("-","");
        StringBuilder start=new StringBuilder();
        part(start,boundary,"token_id",id); part(start,boundary,"token_secret",secret);
        part(start,boundary,"gallery_id",galleryId);part(start,boundary,"gallery_secret",gallerySecret);
        part(start,boundary,"content_type",adult?"2":"1"); part(start,boundary,"thumbnail_size","100r");
        part(start,boundary,"comments_enabled","0");
        start.append("--").append(boundary).append("\r\nContent-Disposition: form-data; name=\"files[]\"; filename=\"upload.")
                .append(MediaUploadPolicy.extension(mime)).append("\"\r\nContent-Type: ").append(mime).append("\r\n\r\n");
        byte[] prefix=start.toString().getBytes(StandardCharsets.UTF_8);
        byte[] suffix=("\r\n--"+boundary+"--\r\n").getBytes(StandardCharsets.US_ASCII);
        HttpURLConnection upload=open("https://imgbox.com/upload/process","POST");
        headers(upload,cookies,csrf);
        upload.setRequestProperty("Content-Type","multipart/form-data; boundary="+boundary);
        upload.setFixedLengthStreamingMode(prefix.length+file.length()+suffix.length);
        try {
            try(OutputStream out=upload.getOutputStream()) { out.write(prefix);copy(file,out);out.write(suffix); }
            return parseImgbox(json(body(upload,true)),mime)
                    .put("haiagaruProvider", MediaUploadPolicy.IMGBOX)
                    .put("haiagaruManagementUrl", MediaUploadManagementPolicy.imgbox(id, secret));
        } finally { upload.disconnect(); }
    }
    static JSONObject parseImgbox(JSONObject root,String mime) throws Exception {
        JSONArray files=root.optJSONArray("files");
        JSONObject f=files==null||files.length()!=1?null:files.optJSONObject(0);
        if(f==null || (f.has("error") && !f.isNull("error") && !f.optString("error").isEmpty()))
            throw new IOException("imgboxでアップロードを確認できません。再送せずサイトを確認してください");
        String link=f.optString("original_url", f.optString("image_url", ""));
        if(!MediaUploadPolicy.mediaUrl(MediaUploadPolicy.IMGBOX,link)) throw new IOException("imgboxの直接画像URLを確認できません");
        return new JSONObject().put("id",f.optString("id", "")).put("link",link)
                .put("type",mime).put("animated",mime.equals("image/gif"));
    }
    static String csrf(String html) throws IOException {
        Matcher tags=Pattern.compile("<meta\\b[^>]*>",Pattern.CASE_INSENSITIVE).matcher(html);
        while(tags.find()) {
            String tag=tags.group();
            if(!Pattern.compile("\\bname=['\"]csrf-token['\"]",Pattern.CASE_INSENSITIVE).matcher(tag).find()) continue;
            Matcher value=Pattern.compile("\\bcontent=['\"]([^'\"]+)['\"]",Pattern.CASE_INSENSITIVE).matcher(tag);
            if(value.find()) {
                String token=value.group(1).replace("&amp;","&").replace("&#x2B;","+").replace("&#43;","+");
                if(token.matches("[A-Za-z0-9_+=/-]{1,1024}")) return token;
            }
        }
        throw new IOException("imgboxの送信フォームを確認できません。ファイルは送信していません");
    }
    private static void headers(HttpURLConnection c,ImgboxCookies cookies,String csrf) throws Exception {
        c.setRequestProperty("Origin","https://imgbox.com"); c.setRequestProperty("Referer","https://imgbox.com/");
        c.setRequestProperty("X-CSRF-Token",csrf); c.setRequestProperty("X-Requested-With","XMLHttpRequest");
        if(!cookies.header().isEmpty()) c.setRequestProperty("Cookie",cookies.header());
    }
    /** Only this anonymous request's two cookies, only ever sent to fixed imgbox.com endpoints. */
    static final class ImgboxCookies {
        private final Map<String,String> values=new LinkedHashMap<>();
        void receive(Map<String,List<String>> headers) {
            if(headers==null)return;
            for(Map.Entry<String,List<String>> h:headers.entrySet()) {
                if(!"Set-Cookie".equalsIgnoreCase(h.getKey()) || h.getValue()==null)continue;
                for(String raw:h.getValue()) {
                    if(raw==null || raw.length()>16384 || raw.indexOf('\r')>=0 || raw.indexOf('\n')>=0)continue;
                    String[] parts=raw.split(";");int eq=parts[0].indexOf('=');if(eq<1)continue;
                    String name=parts[0].substring(0,eq).trim(),value=parts[0].substring(eq+1).trim();
                    if(!(name.equals("_imgbox_session") || name.equals("request_method")) || !value.matches("[!-~]*"))continue;
                    boolean allowed=true,expired=value.isEmpty();
                    for(int i=1;i<parts.length;i++) {
                        String attribute=parts[i].trim();int split=attribute.indexOf('=');
                        String key=(split<0?attribute:attribute.substring(0,split)).trim();
                        String val=split<0?"":attribute.substring(split+1).trim();
                        if(key.equalsIgnoreCase("Domain") && !(val.equalsIgnoreCase("imgbox.com") || val.equalsIgnoreCase(".imgbox.com"))) allowed=false;
                        if(key.equalsIgnoreCase("Path") && !val.equals("/")) allowed=false;
                        if(key.equalsIgnoreCase("Max-Age")) {
                            try {if(Long.parseLong(val)<=0)expired=true;}catch(NumberFormatException ignored){allowed=false;}
                        }
                        if(key.equalsIgnoreCase("Expires")) {
                            // imgbox sends e.g. "Sun, 17 Oct 2027 06:48:50 -0000".
                            // java.net.HttpCookie can misparse -0000 and delete a fresh session.
                            try {
                                java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z",Locale.US);
                                format.setLenient(false);
                                if(format.parse(val).getTime()<=System.currentTimeMillis())expired=true;
                            } catch(java.text.ParseException ignored) {allowed=false;}
                        }
                    }
                    if(allowed) {if(expired)values.remove(name);else values.put(name,value);}
                }
            }
        }
        String header() {
            StringBuilder result=new StringBuilder();
            for(Map.Entry<String,String> entry:values.entrySet()) {
                if(result.length()>0)result.append("; ");
                result.append(entry.getKey()).append('=').append(entry.getValue());
            }
            return result.toString();
        }
    }
    private static void part(StringBuilder b,String boundary,String name,String value) {
        b.append("--").append(boundary).append("\r\nContent-Disposition: form-data; name=\"").append(name)
                .append("\"\r\n\r\n").append(value).append("\r\n");
    }
    private static void copy(File file,OutputStream out) throws IOException {
        try(InputStream in=new FileInputStream(file)) {
            byte[] b=new byte[32768];int n;
            while((n=in.read(b))!=-1) {
                if(Thread.currentThread().isInterrupted()) throw new java.io.InterruptedIOException("送信が中断されました。再送前にサイトを確認してください");
                out.write(b,0,n);
            }
        }
    }
    private static JSONObject json(String body) throws IOException {
        try { return new JSONObject(body); }
        catch(JSONException ignored) {
            // Parser exceptions can quote the response (including session tokens).
            throw new IOException("アップロード先の応答形式を確認できません。再送前にサイトを確認してください");
        }
    }
    private static String body(HttpURLConnection c,boolean sent) throws IOException {
        int code=c.getResponseCode();
        if(code==413)throw new MediaUploadSizeException();
        if(code<200 || code>=300) throw new IOException("アップロード先の応答: HTTP "+code
                +(sent?"。再送前にサイトを確認してください":"。ファイルは送信していません"));
        try(InputStream input=c.getInputStream(); ByteArrayOutputStream out=new ByteArrayOutputStream()) {
            byte[] b=new byte[8192];int n;
            while((n=input.read(b))!=-1) {
                if(out.size()+n>2*1024*1024) throw new IOException("アップロード先の応答が大きすぎます");
                out.write(b,0,n);
            }
            return new String(out.toByteArray(),StandardCharsets.UTF_8);
        }
    }
}
