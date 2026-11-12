package e.e.a;

public final class HlsFullSegmentPolicyTest {
 private HlsFullSegmentPolicyTest(){}
 static void test(boolean condition,String message){if(!condition)throw new AssertionError(message);}
 static int count(String text,String pattern){
  int n=0,index=0;
  while((index=text.indexOf(pattern,index))>=0){n++;index+=pattern.length();}
  return n;
 }
 public static void main(String[] args){
  String source="#EXTM3U\n#EXT-X-VERSION:9\n#EXT-X-TARGETDURATION:3\n"+
    "#EXT-X-SERVER-CONTROL:CAN-BLOCK-RELOAD=YES,PART-HOLD-BACK=1.5,CAN-SKIP-UNTIL=12\n"+
    "#EXT-X-PART-INF:PART-TARGET=0.3\n#EXT-X-MEDIA-SEQUENCE:78\n"+
    "#EXT-X-KEY:METHOD=AES-128,URI=\"https://dlive.nicovideo.jp/key?sig=redacted\",IV=0x0010\n"+
    "#EXT-X-MAP:URI=\"init.mp4\"\n"+
    "#EXTINF:3.0,\n78.cmfv\n"+
    "#EXT-X-DISCONTINUITY\n"+
    "#EXT-X-PART:DURATION=0.3,URI=\"part79a.cmfv\"\n"+
    "#EXT-X-PART:DURATION=0.3,URI=\"part79b.cmfv\"\n"+
    "#EXTINF:3.0,\n79.cmfv\n"+
    "#EXT-X-KEY:METHOD=AES-128,URI=\"https://dlive.nicovideo.jp/key?sig=rotated\",IV=0x0020\n"+
    "#EXT-X-PART:DURATION=0.3,URI=\"part80a.cmfv\"\n"+
    "#EXT-X-PRELOAD-HINT:TYPE=PART,URI=\"part80b.cmfv\"\n"+
    "#EXT-X-RENDITION-REPORT:URI=\"../audio/index.m3u8\",LAST-MSN=79,LAST-PART=1\n";
  HlsFullSegmentPolicy.Result converted=HlsFullSegmentPolicy.normalize(source);
  test(converted.converted&&converted.partsFound==3&&converted.removedTags==7,
      "all part, hint, server-control, and rendition lines removed");
  test(!converted.playlist.contains("#EXT-X-PART:")&&!converted.playlist.contains("#EXT-X-PRELOAD-HINT:"),
      "no partial segments requested");
  test(!converted.playlist.contains("#EXT-X-SERVER-CONTROL:")&&!converted.playlist.contains("#EXT-X-PART-INF:"),
      "disable blocking LL-HLS reload");
  test(count(converted.playlist,"#EXTINF:")==2,"both complete segments retained");
  test(count(converted.playlist,"#EXT-X-KEY:")==2,"both encryption rotations retained");
  test(converted.playlist.contains("sig=rotated\",IV=0x0020"),"key signed URL and IV retained");
  test(converted.playlist.contains("#EXT-X-DISCONTINUITY"),"discontinuity preserved");
  test(converted.playlist.contains("#EXT-X-MEDIA-SEQUENCE:78"),"media sequence unchanged");
  test(converted.playlist.contains("#EXT-X-MAP:URI=\"init.mp4\""),"init segment retained");
  test(converted.playlist.contains("78.cmfv\n")&&converted.playlist.contains("79.cmfv\n"),"media URLs unchanged");
  HlsFullSegmentPolicy.Result repeated=HlsFullSegmentPolicy.normalize(converted.playlist);
  test(!repeated.converted&&repeated.playlist.equals(converted.playlist),"idempotent");
  String master="#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1000000\nvideo.m3u8\n";
  test(HlsFullSegmentPolicy.normalize(master).playlist.equals(master),"master unchanged");
  String partsOnly="#EXTM3U\n#EXT-X-PART:DURATION=0.3,URI=\"part.cmfv\"\n";
  test(HlsFullSegmentPolicy.normalize(partsOnly).playlist.equals(partsOnly),"parts-only fallback unchanged");
  String single="#EXTM3U\n#EXT-X-PART:DURATION=0.3,URI=\"part.cmfv\"\n#EXTINF:3,\nfull.cmfv\n";
  test(HlsFullSegmentPolicy.normalize(single).playlist.equals(single),"not enough complete segments");
  String crlf=source.replace("\n","\r\n");
  HlsFullSegmentPolicy.Result windows=HlsFullSegmentPolicy.normalize(crlf);
  test(windows.converted&&windows.playlist.contains("#EXTINF:3.0,\r\n78.cmfv\r\n"),"CRLF retained");
  System.out.println("PASS: LL-HLS partial segments disabled while complete encrypted segments are preserved");
 }
}
