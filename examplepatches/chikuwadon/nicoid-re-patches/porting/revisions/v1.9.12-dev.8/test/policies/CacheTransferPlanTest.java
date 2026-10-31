package e.e.a;
import java.net.URL;import java.util.*;
public final class CacheTransferPlanTest {
 static void expect(long expected,long actual){if(expected!=actual)throw new AssertionError(actual+" != "+expected);}
 public static void main(String[]args)throws Exception{
  Map<String,String> files=new HashMap<>();
  files.put("/master.m3u8","#EXTM3U\n#EXT-X-MEDIA:TYPE=AUDIO,URI=\"audio.m3u8\"\n#EXT-X-STREAM-INF:BANDWIDTH=1\nvideo.m3u8\n#EXT-X-STREAM-INF:BANDWIDTH=2\nunused.m3u8\n");
  files.put("/audio.m3u8","#EXTM3U\n#EXT-X-MAP:URI=\"a.mp4\",BYTERANGE=\"20@0\"\n#EXT-X-BYTERANGE:80@20\na.mp4\n");
  files.put("/video.m3u8","#EXTM3U\n#EXT-X-MAP:URI=\"v.mp4\",BYTERANGE=\"50@0\"\n#EXT-X-BYTERANGE:100@50\nv.mp4\n#EXT-X-BYTERANGE:200@150\nv.mp4\n");
  expect(450,PlanFetch250.bytes(new URL("https://media.example/master.m3u8"),u->{String value=files.get(u.getPath());if(value==null)throw new java.io.IOException("Unexpected variant");return value;}));
  expect(-1,PlanFetch250.bytes(new URL("https://media.example/v.m3u8"),u->"#EXTM3U\nunknown-size.m4s\n"));
  expect(16,PlanFetch250.bytes(new URL("https://media.example/v.m3u8"),u->"#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"key\"\n"));
  expect(300,PlanFetch250.bytes(new URL("https://media.example/v.m3u8"),new PlanFetch250(){
   public String text(URL u){return "#EXTM3U\none.m4s\ntwo.m4s\n";}
   public long length(URL u){return u.getPath().endsWith("one.m4s")?100:200;}
  }));
  final int[] probes={0},planned={0};expect(-1,PlanFetch250.bytes(new URL("https://media.example/v.m3u8"),new PlanFetch250(){public void assets(int count){planned[0]=count;}public String text(URL u){StringBuilder playlist=new StringBuilder("#EXTM3U\n");for(int n=0;n<50;n++)playlist.append(n).append(".m4s\n");return playlist.toString();}public long length(URL u){probes[0]++;return 100;}}));expect(0,probes[0]);expect(50,planned[0]);
  System.out.println("Cache transfer plan: selected variant, audio/video ranges and unknown-size fallback passed");
 }
}
