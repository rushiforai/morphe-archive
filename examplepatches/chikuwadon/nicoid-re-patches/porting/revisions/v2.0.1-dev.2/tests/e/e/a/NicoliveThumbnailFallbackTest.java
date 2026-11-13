package e.e.a;
import org.json.*;
import org.junit.Test;
import static org.junit.Assert.*;

/** User and channel history fixtures; no external network or account needed. */
public final class NicoliveThumbnailFallbackTest {
    static String html(JSONObject thumbnail,String extra) throws Exception {
        JSONObject p=new JSONObject().put("nicoliveProgramId","lv123");
        if(thumbnail!=null)p.put("thumbnail",thumbnail);
        String data=new JSONObject().put("program",p).toString();
        return "<script id='embedded-data' data-props='"+data.replace("&","&amp;")+"'></script>"+extra;
    }
    @Test public void largePictureBeatsDefaultSmallAvatar() throws Exception {
        String large="https://nicolive.cdn.nimg.jp/live/user/large.jpg";
        JSONObject t=new JSONObject().put("small","https://nicolive.cdn.nimg.jp/live/simg/img/blank_80x80.jpg")
            .put("large",large);
        assertEquals(large,NicoliveData.historyThumbnail(html(t,""),"lv123"));
    }
    @Test public void preferProgramLandscapeHuge() throws Exception {
        String real="https://listing-thumbnail.live.nicovideo.jp/image/picture.jpg";
        JSONObject t=new JSONObject().put("huge",new JSONObject().put("s640x360",real))
            .put("large","https://nicolive.cdn.nimg.jp/other.jpg");
        assertEquals(real,NicoliveData.historyThumbnail(html(t,""),"lv123"));
    }
    @Test public void socialMetaFallbackAcceptsTrustedDomainOnly() throws Exception {
        String meta="<meta property='og:image' content='https://nicolive.cdn.nimg.jp/live/lv123.jpg'>";
        assertEquals("https://nicolive.cdn.nimg.jp/live/lv123.jpg",
            NicoliveData.historyThumbnail(html(null,meta),"lv123"));
        assertEquals("",NicoliveData.historyThumbnail(
            html(null,"<meta property='og:image' content='https://untrusted.example/a.jpg'>"),"lv123"));
    }
    @Test public void doesNotUseUntrustedFallbackOrOtherBroadcast() throws Exception {
        JSONObject t=new JSONObject().put("large","https://malicious.example/image")
            .put("small","https://nicolive.cdn.nimg.jp/avatar.jpg");
        assertEquals("https://nicolive.cdn.nimg.jp/avatar.jpg",
            NicoliveData.historyThumbnail(html(t,""),"lv123"));
        try { NicoliveData.historyThumbnail(html(t,""),"lv124"); fail(); }
        catch(java.io.IOException expected) {}
    }
}
