package e.e.a;
public final class HlsBlankSegmentPolicyTest {
 static void ok(boolean b,String why){if(!b)throw new AssertionError(why);}
 static int count(String s,String part){int n=0,p=0;while((p=s.indexOf(part,p))>=0){n++;p+=part.length();}return n;}
 public static void main(String[] args){
  String src="#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:177\n#EXT-X-DISCONTINUITY\n"
   +"#EXT-X-MAP:URI=\"https://assetdelivery.dlive.nicovideo.jp/blank/video/init?q=1\"\n"
   +"#EXTINF:1.000,\n"
   +"https://assetdelivery.dlive.nicovideo.jp/blank/video/segment?q=signed\n"
   +"#EXT-X-DISCONTINUITY\n"
   +"#EXT-X-KEY:METHOD=AES-128,URI=\"https://assetdelivery.dlive.nicovideo.jp/hls/keys/k\",IV=0x1234\n"
   +"#EXTINF:6.000,\n"
   +"https://asset1.dlive.nicovideo.jp/hls/segments/video/178.cmfv\n";
  HlsBlankSegmentPolicy.Result r=HlsBlankSegmentPolicy.annotate(src);
  ok(r.added==1,"one filler gap");
  ok(r.playlist.contains("#EXTINF:1.000,\n#EXT-X-GAP\nhttps://assetdelivery"),"gap position");
  ok(r.playlist.replace("#EXT-X-GAP\n","").equals(src),"no other mutations");
  ok(count(r.playlist,"#EXT-X-DISCONTINUITY")==2,"discontinuities");
  ok(r.playlist.contains("#EXT-X-MEDIA-SEQUENCE:177"),"sequence");
  ok(r.playlist.contains("IV=0x1234"),"IV preserved");
  ok(r.playlist.contains("#EXT-X-MAP:URI="),"init preserved");
  HlsBlankSegmentPolicy.Result again=HlsBlankSegmentPolicy.annotate(r.playlist);
  ok(again.added==0&&again.playlist.equals(r.playlist),"idempotent");
  ok(!HlsBlankSegmentPolicy.isBlankMediaUri("https://wrong.test/blank/segment"),"untrusted host");
  ok(!HlsBlankSegmentPolicy.isBlankMediaUri("https://dlive.nicovideo.jp/segment?next=/blank/abc"),"query ignored");
  ok(HlsBlankSegmentPolicy.isBlankMediaUri("/blank/audio/segment"),"relative blank");
  String master="#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=123\nhttps://assetdelivery.dlive.nicovideo.jp/blank/variant.m3u8\n";
  ok(HlsBlankSegmentPolicy.annotate(master).playlist.equals(master),"master untouched");
  String crlf="#EXTM3U\r\n#EXTINF:1,\r\nhttps://assetdelivery.dlive.nicovideo.jp/blank/audio/segment\r\n";
  ok(HlsBlankSegmentPolicy.annotate(crlf).playlist.contains("#EXT-X-GAP\r\n"),"CRLF preserved");
  System.out.println("PASS: blank HLS filler is marked as a gap while timeline, IV and URLs are preserved");
 }
}
