package e.e.a;
import java.net.URL;
public final class HlsKeyRefreshPolicyTest {
 private static void ok(boolean condition,String message){if(!condition)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
  String key="#EXT-X-KEY:METHOD=AES-128,URI=\"https://example.org/key?sig=abcdef\",IV=0x1234";
  String first=HlsKeyRefreshPolicy.rewriteLine(key,1);
  String second=HlsKeyRefreshPolicy.rewriteLine(key,2);
  ok(!first.equals(second),"fresh key cache identity");
  ok(first.contains("?sig=abcdef#nicoid-key-refresh-1\""),"signed query unchanged");
  ok(first.endsWith("IV=0x1234"),"IV unchanged");
  String uri=first.substring(first.indexOf("URI=\"")+5,first.indexOf('"',first.indexOf("URI=\"")+5));
  ok(new URL(uri).getFile().equals("/key?sig=abcdef"),"HTTP path and query unchanged");
  ok(HlsKeyRefreshPolicy.rewriteLine("#EXT-X-KEY:METHOD=NONE",2).equals("#EXT-X-KEY:METHOD=NONE"),"clear mode");
  ok(HlsKeyRefreshPolicy.rewriteLine("#EXT-X-KEY:METHOD=SAMPLE-AES,URI=\"key\"",2).endsWith("URI=\"key\""),"SAMPLE-AES unchanged");
  ok(HlsKeyRefreshPolicy.rewriteLine("#EXT-X-MAP:URI=\"init.mp4\"",1).equals("#EXT-X-MAP:URI=\"init.mp4\""),"init segment unchanged");
  ok(HlsKeyRefreshPolicy.rewriteLine("#EXT-X-KEY:METHOD=AES-128,URI=\"k#old\"",3).contains("k#old&nicoid-key-refresh-3"),"existing fragment");
  ok(!HlsKeyRefreshPolicy.isAes128KeyLine("#EXT-X-SESSION-KEY:METHOD=AES-128,URI=\"k\""),"exclude session key");
  ok(!HlsKeyRefreshPolicy.isAes128KeyLine("#EXT-X-KEY:METHOD=AES-128-INVALID,URI=\"k\""),"strict method");
  System.out.println("PASS: refreshed key identity, signed HTTP URL and IV are preserved");
 }
}
