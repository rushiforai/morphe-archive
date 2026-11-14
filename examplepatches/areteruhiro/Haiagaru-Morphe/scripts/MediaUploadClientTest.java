package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import org.json.*;

/** All HTTP is fake. No account keys or user media leave this process. */
public final class MediaUploadClientTest {
    private static int checks;
    private static void check(boolean v,String label) { checks++;if(!v)throw new AssertionError(label); }
    interface Action { void run() throws Exception; }
    private static void fails(Action a,String label) throws Exception {
        boolean failed=false;try {a.run();}catch(IOException e){failed=true;} check(failed,label);
    }
    static final class Reply extends HttpURLConnection {
        final ByteArrayOutputStream sent=new ByteArrayOutputStream();
        final String body; final int status;
        boolean disconnected,broken;
        Reply(URL url,int status,String body){super(url);this.status=status;this.body=body;}
        public void connect(){}
        public void disconnect(){disconnected=true;}
        public boolean usingProxy(){return false;}
        public int getResponseCode(){return status;}
        public InputStream getInputStream(){return new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8));}
        public OutputStream getOutputStream() throws IOException { if(broken)throw new IOException("fixture write failure");return sent; }
        public Map<String,List<String>> getHeaderFields(){return Map.of("Set-Cookie",List.of("_imgbox_session=fixture; Path=/; Secure; HttpOnly"));}
    }
    static final class Fake implements MediaUploadClient.Transport {
        final List<Reply> replies=new ArrayList<>();final List<String> responses=new ArrayList<>();
        int status=200;boolean broken;
        Fake(String... body){responses.addAll(Arrays.asList(body));}
        public HttpURLConnection open(URL url) {
            if(replies.size()>=responses.size()) throw new AssertionError("Unexpected retry or extra request");
            Reply r=new Reply(url,status,responses.get(replies.size()));r.broken=broken;replies.add(r);return r;
        }
    }
    public static void main(String[] args) throws Exception {
        File png=Files.createTempFile("haiagaru-upload-test-",".tmp").toFile();
        File video=Files.createTempFile("haiagaru-upload-test-",".tmp").toFile();
        try {
            MediaUploadClient.ImgboxCookies cookies=new MediaUploadClient.ImgboxCookies();
            cookies.receive(Map.of("Set-Cookie",List.of("_imgbox_session=fixture; path=/; expires=Sun, 17 Oct 2027 06:48:50 -0000; HttpOnly")));
            check(cookies.header().contains("_imgbox_session=fixture"),"numeric timezone does not discard fresh cookie");
            cookies.receive(Map.of("Set-Cookie",List.of("unrelated=private; Path=/","_imgbox_session=evil; Domain=evil.test; Path=/")));
            check(!cookies.header().contains("unrelated") && !cookies.header().contains("evil"),"cookie name/domain scope");
            cookies.receive(Map.of("Set-Cookie",List.of("_imgbox_session=deleted; Path=/; Max-Age=0")));
            check(cookies.header().isEmpty(),"cookie deletion");
            cookies.receive(Map.of("Set-Cookie",List.of("_imgbox_session=old; path=/; expires=Sat, 17 Oct 2020 06:48:50 -0000")));
            check(cookies.header().isEmpty(),"expired cookie not restored");
            check(MediaUploadPolicy.destination("native","imgpile","image/png").equals("native"),"unchanged image route");
            check(MediaUploadPolicy.destination("imgbox","native","video/mp4").equals("native"),"unchanged video route");
            check(MediaUploadPolicy.destination("imgbox","imgpile","image/png").equals("imgbox"),"selected image route");
            check(MediaUploadPolicy.destination("imgbox","imgpile","video/mp4").equals("imgpile"),"selected video route");
            fails(()->MediaUploadPolicy.destination("unknown","native","image/png"),"unknown route does not fall back");
            byte[] bytes=Base64.getDecoder().decode("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+jRZkAAAAASUVORK5CYII=");
            Files.write(png.toPath(),bytes);
            Files.write(video.toPath(),new byte[]{0,0,0,24,'f','t','y','p','i','s','o','m',0,0,0,0});
            check(MediaUploadPolicy.mime(png).equals("image/png"),"PNG sniff, not filename");
            check(MediaUploadPolicy.mime(video).equals("video/mp4"),"MP4 sniff");
            Files.write(video.toPath(),new byte[]{0,0,0,24,'f','t','y','p','a','v','i','f',0,0,0,0});
            check(MediaUploadPolicy.mime(video).equals("image/avif"),"AVIF is not MP4");
            MediaUploadPolicy.validate("imgbox","image/png",10_000_000," ");checks++;
            fails(()->MediaUploadPolicy.validate("imgbox","image/png",10_000_001,""),"imgbox limit");
            fails(()->MediaUploadPolicy.validate("imgbox","video/mp4",12,""),"imgbox video rejected");
            fails(()->MediaUploadPolicy.validate("imgbox","image/webp",12,""),"imgbox unsupported image");
            fails(()->MediaUploadPolicy.validate("imgpile","image/png",97_000_001,"fixture-key"),"imgpile limit");
            fails(()->MediaUploadPolicy.validate("imgpile","image/png",12,""),"key required");
            fails(()->MediaUploadPolicy.validate("imgpile","image/png",12,"key\r\nInjected: yes"),"header injection");
            fails(()->MediaUploadPolicy.validate("unknown","image/png",12,"key"),"unknown provider");
            check(MediaUploadPolicy.mediaUrl("imgbox","https://images2.imgbox.com/ab/cd/ABC_o.png"),"imgbox CDN");
            check(MediaUploadPolicy.mediaUrl("imgpile","https://cdn.imgpile.com/f/ABC_lg.mp4"),"imgpile video CDN");
            for(String url:new String[]{"http://cdn.imgpile.com/f/a.png","https://cdn.imgpile.com.evil.test/f/a.png",
                    "https://user@cdn.imgpile.com/f/a.png","https://cdn.imgpile.com:444/f/a.png",
                    "https://cdn.imgpile.com/f/a.png?token=secret","https://imgpile.com/m/ABC","https://cdn.imgpile.com/f/a.svg"})
                check(!MediaUploadPolicy.mediaUrl("imgpile",url),"reject unexpected link: "+url);
            String response="{\"data\":{\"slug\":\"Fixture\",\"processing\":true,\"urls\":{\"original\":\"https://cdn.imgpile.com/f/Fixture.webp\"}}}";
            Fake p=new Fake(response);
            JSONObject result=new MediaUploadClient(p).upload("imgpile",png,"image/png","fixture-key",false);
            check(result.getString("link").endsWith("Fixture.webp"),"actual stored extension, no polling");
            check(result.getString("deletehash").isEmpty(),"foreign deletion token not sent to Imgur");
            check(result.getString("haiagaruManagementUrl").equals("https://imgpile.com/m/Fixture"),"imgpile management page from own slug");
            check(p.replies.size()==1,"one POST only");
            Reply r=p.replies.get(0);
            check(r.getRequestProperty("Authorization").equals("Bearer fixture-key"),"official auth header");
            check(r.getURL().toString().equals("https://imgpile.com/uploads?filename=upload.png"),"fixed official endpoint");
            check(Arrays.equals(bytes,r.sent.toByteArray()),"raw bytes, no base64 buffering");
            check(!r.getInstanceFollowRedirects() && r.disconnected,"redirect disabled / disconnect");
            byte[] mp4=new byte[]{0,0,0,24,'f','t','y','p','i','s','o','m',0,0,0,0};
            Files.write(video.toPath(),mp4);
            Fake movie=new Fake("{\"data\":{\"slug\":\"Video\",\"processing\":true,\"urls\":{\"original\":\"https://cdn.imgpile.com/f/Video.mp4\"}}}");
            JSONObject movieResult=new MediaUploadClient(movie).upload("imgpile",video,"video/mp4","fixture-key",false);
            check(movieResult.getString("link").endsWith("Video.mp4") && movieResult.getBoolean("animated"),"video direct URL / animation flag");
            check(Arrays.equals(mp4,movie.replies.get(0).sent.toByteArray()),"stream raw video bytes");
            check(movie.replies.size()==1 && movie.replies.get(0).getRequestProperty("Content-Type").equals("video/mp4"),"video MIME / no processing polling");
            Fake noKey=new Fake(response);
            fails(()->new MediaUploadClient(noKey).upload("imgpile",png,"image/png","",false),"preflight missing key");
            check(noKey.replies.isEmpty(),"no contact without key");
            Fake error=new Fake("{}");error.status=429;
            fails(()->new MediaUploadClient(error).upload("imgpile",png,"image/png","fixture-key",false),"rate-limit error");
            check(error.replies.size()==1 && error.replies.get(0).disconnected,"no retry on error");
            Fake redirect=new Fake("{}");redirect.status=302;
            fails(()->new MediaUploadClient(redirect).upload("imgpile",png,"image/png","fixture-key",false),"redirect rejected");
            check(redirect.replies.size()==1,"no credential forwarding");
            Fake broken=new Fake(response);broken.broken=true;
            fails(()->new MediaUploadClient(broken).upload("imgpile",png,"image/png","fixture-key",false),"write error");
            check(broken.replies.size()==1 && broken.replies.get(0).disconnected,"failed POST not retried");
            Fake oversized=new Fake("<html><title>413 Request Entity Too Large</title></html>");oversized.status=413;
            try {new MediaUploadClient(oversized).upload("imgpile",png,"image/png","fixture-key",false);throw new AssertionError("413 accepted");}
            catch(MediaUploadSizeException e){check(e.getMessage().equals("ファイルの容量が大きすぎます"),"HTML 413 becomes a capacity error before JSON parsing");}
            check(oversized.replies.size()==1&&oversized.replies.get(0).disconnected,"oversized upload not retried");
            String home="<meta content=\"fixtureCSRF==\" name=\"csrf-token\" />";
            String token="{\"ok\":true,\"token_id\":\"1234\",\"token_secret\":\"fixture-secret\",\"gallery_id\":\"1234\",\"gallery_secret\":\"fixture-gallery-secret\"}";
            String box="{\"files\":[{\"id\":\"ABC\",\"image_url\":\"https://images2.imgbox.com/ab/cd/ABC_o.png\"}]}";
            Fake b=new Fake(home,token,box);
            result=new MediaUploadClient(b).upload("imgbox",png,"image/png","",false);
            check(result.getString("link").endsWith("ABC_o.png"),"imgbox direct URL");
            check(result.getString("haiagaruManagementUrl").equals("https://imgbox.com/upload/edit/1234/fixture-secret"),"imgbox token management URL preserved separately");
            check(result.getString("deletehash").isEmpty(),"imgbox management credential never becomes Imgur deletion key");
            check(MediaUploadClient.parseImgbox(new JSONObject("{\"files\":[{\"original_url\":\"https://images2.imgbox.com/ab/cd/Actual_o.png\"}]}"),"image/png")
                    .getString("link").endsWith("Actual_o.png"),"current original_url response supported");
            check(b.replies.size()==3,"home/token/upload only");
            check(b.replies.get(1).sent.toString(StandardCharsets.US_ASCII).equals("gallery=true&gallery_title=&comments_enabled=0"),"explicit gallery token request");
            Reply upload=b.replies.get(2);
            String multipart=upload.sent.toString(StandardCharsets.ISO_8859_1);
            check(multipart.contains("name=\"files[]\"; filename=\"upload.png\""),"imgbox multipart field");
            check(multipart.contains("name=\"content_type\"\r\n\r\n1\r\n"),"family-safe default");
            check(multipart.contains("fixture-secret") && multipart.contains("Content-Type: image/png"),"token and MIME");
            check(multipart.contains("name=\"gallery_id\"") && multipart.contains("fixture-gallery-secret"),"gallery token forwarded only to imgbox");
            check(upload.getRequestProperty("X-CSRF-Token").equals("fixtureCSRF=="),"CSRF header");
            check(upload.getRequestProperty("Cookie").contains("_imgbox_session=fixture"),"request-scoped cookies");
            check(upload.getRequestProperty("Authorization")==null,"no imgpile key to imgbox");
            Fake adult=new Fake(home,token,box);
            new MediaUploadClient(adult).upload("imgbox",png,"image/png","",true);
            check(adult.replies.get(2).sent.toString(StandardCharsets.ISO_8859_1).contains("name=\"content_type\"\r\n\r\n2\r\n"),"adult choice");
            Fake noCsrf=new Fake("<html></html>");
            fails(()->new MediaUploadClient(noCsrf).upload("imgbox",png,"image/png","",false),"changed imgbox page");
            check(noCsrf.replies.size()==1,"media not sent without CSRF");
            Fake badToken=new Fake(home,"{\"token_id\":\"123\",\"token_secret\":\"bad\\r\\nvalue\"}");
            fails(()->new MediaUploadClient(badToken).upload("imgbox",png,"image/png","",false),"multipart injection");
            check(badToken.replies.size()==2,"media not sent with invalid token");
            Fake malformed=new Fake("private-auth-response");
            try { new MediaUploadClient(malformed).upload("imgpile",png,"image/png","fixture-key",false); throw new AssertionError("invalid JSON accepted"); }
            catch(IOException e) { check(!e.toString().contains("private-auth-response") && e.getCause()==null,"parse error does not disclose response"); }
            fails(()->MediaUploadClient.parseImgbox(new JSONObject("{\"files\":[{\"error\":\"too big\"}]}"),"image/png"),"imgbox rejection");
            fails(()->MediaUploadClient.parseImgpile(new JSONObject("{\"data\":{\"urls\":{\"original\":\"https://evil.test/a.png\"}}}"),"image/png"),"unsafe response");
            System.out.println("PASS: "+checks+" upload protocol / privacy / failure tests (no live upload)");
        } finally { Files.deleteIfExists(png.toPath());Files.deleteIfExists(video.toPath()); }
    }
}
