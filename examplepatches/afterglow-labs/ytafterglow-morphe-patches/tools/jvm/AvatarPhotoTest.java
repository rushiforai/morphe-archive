import app.afterglow.extension.menus.AvatarPhotoPolicy;
import app.afterglow.extension.menus.AvatarPhotoSource;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class AvatarPhotoTest {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static final String URL="https://yt3.ggpht.com/ytc/native-avatar=s88-c-k-c0x00ffffff-no-rj";
    private static final class Fake extends HttpURLConnection {
        int status=200;String location,type="image/png";byte[] bytes={1,2,3};long length=3;boolean closed;
        Fake()throws Exception{super(new URL(URL));}
        @Override public int getResponseCode(){return status;}
        @Override public String getHeaderField(String key){return key.equals("Location")?location:null;}
        @Override public long getContentLengthLong(){return length;}
        @Override public String getContentType(){return type;}
        @Override public InputStream getInputStream(){return new ByteArrayInputStream(bytes);}
        @Override public void disconnect(){closed=true;}
        @Override public boolean usingProxy(){return false;}
        @Override public void connect(){}
    }
    private static void failure(String message,Fake... values)throws Exception {
        List<Fake> opened=new ArrayList<>();int[] cursor={0};
        try{AvatarPhotoSource.read(URL,uri->{Fake value=values[Math.min(cursor[0]++,values.length-1)];opened.add(value);return value;});throw new AssertionError(message+" accepted");}
        catch(IOException expected){check(!expected.getMessage().contains("https://"),message+" has no source URL in error");}
        check(!opened.isEmpty()&&opened.stream().allMatch(value->value.closed),message+" disconnects every request");
    }
    public static void main(String[] args)throws Exception {
        // Captured124 watch, teaser and feed paths all terminate in this exact native leaf.
        String leaf="avatar.eml-fe|fd3e1a338fad6b68|ImageType|";
        for(String root:new String[]{"compactify_video_action_bar.eml-js-fe|5ea80e654811ef70|ContainerType|","video_metadata_carousel.eml-fe|dc12e0d704fe3fd3|CellType|","video_lockup.eml-fe|de92a94279212740|ContainerType|"})
            check(AvatarPhotoPolicy.avatarPath(root+leaf),"verified native avatar under "+root);
        for(String other:new String[]{null,"",leaf+"TextType|","not_"+leaf,leaf.replace("avatar.eml-fe","avatar.eml-js-fe"),leaf.replace("ImageType","ContainerType"),leaf.replace("fd3e1a338fad6b68","invalid"),"x".repeat(8193)+leaf})
            check(!AvatarPhotoPolicy.avatarPath(other),"reject non-avatar/invalid native leaf");
        check(AvatarPhotoPolicy.largeUrl(URL).equals(URL.replace("=s88","=s1024")),"preserve crop and format options");
        check(AvatarPhotoPolicy.largeUrl(URL+"?token=keep%2Fthis").endsWith("?token=keep%2Fthis"),"preserve encoded query");
        check(AvatarPhotoPolicy.largeUrl("https://yt4.googleusercontent.com/a=s48").endsWith("=s1024"),"terminal native size token");
        check(AvatarPhotoPolicy.largeUrl("https://lh3.googleusercontent.com/a%2Fb=s64-c").contains("a%2Fb=s1024-c"),"preserve encoded path");
        check(AvatarPhotoPolicy.largeUrl("https://yt3.ggpht.com/a?size=s88").equals("https://yt3.ggpht.com/a?size=s88"),"query is not a size token");
        for(String invalid:new String[]{null,"http://yt3.ggpht.com/a=s48","https://yt3.ggpht.com.evil.invalid/a=s48","https://evil.invalid/a=s48","https://yt3.ggpht.com@evil.invalid/a","https://user:secret@yt3.ggpht.com/a","https://yt3.ggpht.com:8443/a","https://yt3.ggpht.com/a#fragment","https://yt3.ggpht.com/a b","https://yt3.ggpht.com/"+"x".repeat(8192)})
            check(AvatarPhotoPolicy.largeUrl(invalid)==null,"reject invalid/non-image source");
        Fake good=new Fake();List<URI> requests=new ArrayList<>();
        check(Arrays.equals(AvatarPhotoSource.read(URL,uri->{requests.add(uri);return good;}),good.bytes),"complete public image transfer");
        check(requests.size()==1&&requests.get(0).toString().contains("=s1024"),"request high-resolution native URL");
        check(good.closed&&!good.getInstanceFollowRedirects(),"own bounded redirect handling and cleanup");
        check(good.getConnectTimeout()==15000&&good.getReadTimeout()==20000,"bounded connection/read waits");
        check("identity".equals(good.getRequestProperty("Accept-Encoding"))&&good.getRequestProperty("Authorization")==null&&good.getRequestProperty("Cookie")==null,"public image request has no account credentials");
        Fake redirect=new Fake(),target=new Fake();redirect.status=302;redirect.location="https://yt4.ggpht.com/b=s1024-c";int[] index={0};
        check(AvatarPhotoSource.read(URL,uri->index[0]++==0?redirect:target).length==3,"allowed image-host redirect");
        check(redirect.closed&&target.closed&&index[0]==2,"redirect closes both responses");
        for(String bad:new String[]{"http://yt3.ggpht.com/x","https://unrelated.invalid/x","https://yt4.ggpht.com/x#secret","https://user:secret@yt4.ggpht.com/x"}) {
            Fake response=new Fake();response.status=302;response.location=bad;int[] count={0};
            try{AvatarPhotoSource.read(URL,uri->{count[0]++;return response;});throw new AssertionError("bad redirect accepted");}
            catch(IOException expected){check(count[0]==1&&response.closed,"reject redirect before second connection");}
        }
        Fake loop=new Fake();loop.status=307;loop.location="/again";failure("redirect limit",loop);
        Fake missing=new Fake();missing.status=302;failure("missing redirect location",missing);
        Fake status=new Fake();status.status=404;failure("missing image",status);
        Fake html=new Fake();html.type="text/html";failure("non-image response",html);
        Fake empty=new Fake();empty.length=0;empty.bytes=new byte[0];failure("empty image",empty);
        Fake truncated=new Fake();truncated.length=8;failure("truncated response",truncated);
        Fake declared=new Fake();declared.length=AvatarPhotoSource.MAX_BYTES+1L;failure("declared bound",declared);
        Fake overflow=new Fake();overflow.length=-1;overflow.bytes=new byte[AvatarPhotoSource.MAX_BYTES+1];failure("streaming bound",overflow);
        Fake unknown=new Fake();unknown.length=-1;unknown.type=null;
        check(AvatarPhotoSource.read(URL,uri->unknown).length==3,"unknown length handled with actual byte bound");
        Thread.currentThread().interrupt();try{failure("interrupted transfer",new Fake());}finally{Thread.interrupted();}
        System.out.println("AvatarPhotoTest: "+checks+" checks passed");
    }
}
