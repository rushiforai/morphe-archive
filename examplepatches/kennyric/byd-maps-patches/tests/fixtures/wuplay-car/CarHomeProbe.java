package nl.johninnl.wuplaycar;
import java.util.*;
public final class CarHomeProbe {
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static final class Source implements CarStreamPolicy.Candidate {
  final String name,addon;final Long rate;Source(String n,String a,Long r){name=n;addon=a;rate=r;}
  public Long bitrate(){return rate;}public String addon(){return addon;}public boolean direct(){return true;}
 }
 public static void main(String[] args)throws Exception {
  check(CarStreamPolicy.eligible(10000000L),"10 Mbps boundary excluded");
  check(!CarStreamPolicy.eligible(10000001L),"over limit allowed");
  check(!CarStreamPolicy.eligible(null)&&!CarStreamPolicy.eligible(0L)&&!CarStreamPolicy.eligible(-1L),"unknown/invalid bitrate allowed");
  check(Long.valueOf(10000000).equals(CarStreamPolicy.bitrate(75000000L,60d)),"size/runtime arithmetic");
  check(!CarStreamPolicy.eligible(CarStreamPolicy.bitrate(Long.MAX_VALUE,1d)),"overflow became eligible");
  check(CarStreamPolicy.bitrate(1L,Double.NaN)==null&&CarStreamPolicy.bitrate(-1L,60d)==null&&CarStreamPolicy.bitrate(1L,0d)==null,"invalid rate input");
  check(Double.valueOf(7200).equals(CarStreamPolicy.runtimeSeconds("120 min")),"native minutes lost");
  check(Double.valueOf(1800).equals(CarStreamPolicy.runtimeSeconds(30)),"episode runtime minutes lost");
  check(CarStreamPolicy.runtimeSeconds("unknown")==null,"unknown duration guessed");
  check(CarStreamPolicy.direct("https://cdn.test/video.mp4")&&!CarStreamPolicy.direct("magnet:?xt=x")&&!CarStreamPolicy.direct("https://")&&!CarStreamPolicy.direct("javascript:x"),"direct URL gate");
  Source over=new Source("over","favorite",12000000L),unknown=new Source("unknown","favorite",null),first=new Source("first","other",4000000L),preferred=new Source("preferred","favorite",7000000L);
  List<Source> ranked=CarStreamPolicy.ranked(List.of(over,unknown,first,preferred),"favorite");
  check(ranked.equals(List.of(preferred,first)),"preference bypassed eligibility or unstable ordering");
  check(CarStreamPolicy.ranked(List.of(over,unknown),"favorite").isEmpty(),"all-over-limit permissive fallback");
  String base=args[0];
  check(Long.valueOf(10000000).equals(StreamRateProbe.rate(base+"/video.mp4",Map.of("X-Test","required"),60d,null)),"header-authenticated HEAD size");
  check(Long.valueOf(10000000).equals(StreamRateProbe.rate(base+"/fallback.mp4",Map.of("X-Test","required"),60d,null)),"range total not partial content length");
  check(StreamRateProbe.rate(base+"/video.mp4",Map.of(),60d,null)==null,"HTTP error accepted");
  check(StreamRateProbe.rate(base+"/error",Map.of("X-Test","required"),60d,null)==null,"HTML error page sized as video");
  check(Long.valueOf(4000000).equals(StreamRateProbe.rate(base+"/master.m3u8",Map.of("X-Test","required"),60d,1L)),"manifest byte size treated as video size");
  Map<Integer,List<String>> seasons=ShelfGroups.seasons(List.of("2:3","0:1","1:2","1:1","-1:8"),v->Integer.parseInt(v.split(":")[0]),Comparator.comparingInt(v->Integer.parseInt(v.split(":")[1])));
  check(new ArrayList<>(seasons.keySet()).equals(List.of(1,2,0,-1)),"season ordering and Specials/unknown grouping");
  check(seasons.get(1).equals(List.of("1:1","1:2")),"episode sorting");
  check(ShelfGroups.window(List.of(1,2,3,4,5),2,2).equals(List.of(3,4)),"shelf page offset");
  check(ShelfGroups.window(List.of(1,2,3,4,5),4,2).equals(List.of(5)),"last item unreachable");
  check(!ShelfGroups.identity("session-a",1,"home").equals(ShelfGroups.identity("session-b",1,"home")),"session/profile cache collision");
  check(!ShelfGroups.identity("session-a",1,"home").equals(ShelfGroups.identity("session-a",2,"home")),"refresh cache collision");
  AutoplayQueue<Source> queue=new AutoplayQueue<>(List.of(over,unknown,first,preferred,new Source("third","other",5000000L),new Source("fourth","other",6000000L)),"favorite");
  check(queue.next()==preferred&&queue.next()==first,"autoplay ordering");
  check(queue.next()!=null&&queue.next()==null,"autoplay retried beyond three candidates");
  queue=new AutoplayQueue<>(List.of(first,preferred),"");queue.cancel();check(queue.next()==null,"cancelled autoplay restarted");
  queue=new AutoplayQueue<>(List.of(over,unknown),"");check(queue.next()==null,"autoplay queue accepted unsafe candidates");
  Source second=new Source("second","other",5000000L),third=new Source("third","other",6000000L);
  AutoplayQueue<Source> recovery=new AutoplayQueue<>(List.of(first,second,third),"");
  check(recovery.next()==first,"initial selection missing");List<String> tried=new ArrayList<>();
  Source recovered=recovery.prepareNext(source->{tried.add(source.name);if(source==second)throw new IllegalStateException("native preparation failed");return true;});
  check(recovered==third&&tried.equals(List.of("second","third")),"synchronous retry failure stranded automatic playback");
  check(recovery.next()==null,"recovery escaped attempt limit");
  System.out.println("PASS: bitrate boundary, invalid/unknown sources, runtime, URL and preferred-addon ordering");
 }
}
