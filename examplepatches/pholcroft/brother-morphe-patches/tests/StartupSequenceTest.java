import app.template.extension.extension.CommunicationTiming;
import java.util.*;
public class StartupSequenceTest {
 public static void main(String[] args){
  CommunicationTiming.discardAll();CommunicationTiming.setSequenceSource(null);
  List<Long> seen=new ArrayList<>();CommunicationTiming.setSnapshotSink((ip,s)->seen.add(s.sequence));
  CommunicationTiming.request("first");CommunicationTiming.finishAll();
  CommunicationTiming.request("second");CommunicationTiming.finishAll();
  if(!seen.isEmpty())throw new AssertionError("unreserved bursts must wait");
  final long[] next={100};CommunicationTiming.setSequenceSource(()->next[0]++);
  if(!seen.equals(Arrays.asList(100L,101L)))throw new AssertionError("startup bursts must retain capture order: "+seen);
  CommunicationTiming.discardAll();CommunicationTiming.setSnapshotSink(null);CommunicationTiming.setSequenceSource(null);
 }
}
