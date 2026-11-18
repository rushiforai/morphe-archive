import app.template.extension.extension.RequestTimeline;
import java.util.Arrays;
import app.template.extension.extension.RequestRecord;
public final class RequestTimelineTest {
 public static void main(String[] args){
  RequestRecord.Details details=new RequestRecord.Details("192.0.2.1",161,0,1,1000,1,"c","encoded","ok",75000000L);
  RequestRecord cached=new RequestRecord("a",0,"1.2.3",0,1000000L,true,null,details);
  RequestRecord live=new RequestRecord("b",1,"1.2.4",5,120000005L,false,null);
  RequestRecord unknown=new RequestRecord("c",2,"1.2.5",0,1000L,true,null);
  if(!Arrays.equals(RequestTimeline.durations(Arrays.asList(cached,live,unknown)),new long[]{75000000L,120000000L,-1L}))throw new AssertionError("use printer samples for cached requests, measured time for live, and retain unknowns");
  long[] offsets=RequestTimeline.offsets(new long[]{75000000L,120000000L,20000000L});
  if(!Arrays.equals(offsets,new long[]{0L,75000000L,195000000L}))throw new AssertionError("accumulate in request order");
  offsets=RequestTimeline.offsets(new long[]{2L,-1L,4L});
  if(!Arrays.equals(offsets,new long[]{0L,2L,-1L}))throw new AssertionError("unknown durations make later offsets unknown");
  offsets=RequestTimeline.offsets(new long[]{Long.MAX_VALUE,1L,1L});
  if(!Arrays.equals(offsets,new long[]{0L,Long.MAX_VALUE,-1L}))throw new AssertionError("overflow must be unavailable, not wrap negative");
 }
}
