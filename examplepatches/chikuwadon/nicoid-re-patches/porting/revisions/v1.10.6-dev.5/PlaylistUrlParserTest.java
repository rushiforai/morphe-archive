package e.e.a;

import java.util.Objects;

/** JVM-only URL acceptance and injection checks, run before assembling the MPP. */
public final class PlaylistUrlParserTest {
    private static void check(String input,String expected) {
        String actual=PlaylistUrlParser.videoId(input);
        if(!Objects.equals(expected,actual))
            throw new AssertionError("input="+input+" expected="+expected+" got="+actual);
        if(expected!=null&&!PlaylistUrlParser.canonicalUrl(input).equals("https://www.nicovideo.jp/watch/"+expected))
            throw new AssertionError("Canonical URL mismatch: "+input);
    }
    public static void main(String[] args) {
        check("sm12345678","sm12345678");
        check("https://sp.nicovideo.jp/watch/sm12345678","sm12345678");
        check("sp.nicovideo.jp/watch/sm12345678?ref=share","sm12345678");
        check("http://www.nicovideo.jp/watch/nm42#player","nm42");
        check("https://nicovideo.jp/watch/so32","so32");
        check("https://www.nicovideo.jp/shorts/ss9876","ss9876");
        check("https://nico.ms/sm12345","sm12345");
        check("https://nico.ms/watch/sm12345","sm12345");
        check("https://sp.nicovideo.jp/watch/13579","13579");
        check("https://sp.nicovideo.jp/watch/sm12345/","sm12345");
        check("https://evil.example/watch/sm12345",null);
        check("https://sp.nicovideo.jp.evil.example/watch/sm12345",null);
        check("https://nicovideo.jp@evil.example/watch/sm12345",null);
        check("javascript:sm12345",null);
        check("file:///watch/sm12345",null);
        check("https://sp.nicovideo.jp/watch/sm12345/../../etc/passwd",null);
        check("https://sp.nicovideo.jp/watch/sm12345/edit",null);
        check("https://sp.nicovideo.jp/watch/sm12345%2Fetc",null);
        check("https://sp.nicovideo.jp/user/12345",null);
        check("https://nicovideo.jp/watch/",null);
        check("hello",null);
        check("",null);
        check(null,null);
        System.out.println("PASS: NicoNico URL parser, canonicalization and host validation");
    }
}
