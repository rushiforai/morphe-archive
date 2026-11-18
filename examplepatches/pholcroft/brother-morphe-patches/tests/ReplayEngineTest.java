import app.template.extension.extension.ReplayEngine;
import java.util.*;
public class ReplayEngineTest {
 static void check(boolean v,String m){if(!v)throw new AssertionError(m);}
 static class Wire implements ReplayEngine.Transport {List<String> seen=new ArrayList<>();String identity="02:01:02:03:04:05";boolean fail; public String probe(ReplayEngine.Spec s)throws Exception{seen.add("probe");if(fail)throw new Exception("offline");return identity;}public String request(ReplayEngine.Spec s)throws Exception{seen.add(s.oid);return s.oid.equals("1.2.3")?"integer:2":"integer:5";}public void close(){}}
 public static void main(String[] x)throws Exception{
  List<ReplayEngine.Spec> seq=Arrays.asList(new ReplayEngine.Spec("1.2.3","public",0,1,161,1000,1),new ReplayEngine.Spec("1.2.4","public",0,2,161,1000,1),new ReplayEngine.Spec("1.2.3","public",0,3,161,1000,1));
  Map<String,String> old=new HashMap<>();old.put("1.2.3","integer:1");old.put("1.2.4","integer:5");
  Wire w=new Wire();ReplayEngine.Result r=ReplayEngine.run(seq,old,"02:01:02:03:04:05",w);check(w.seen.equals(Arrays.asList("probe","1.2.3","1.2.4","1.2.3")),"preserve duplicates and order");check(r.completed==3&&r.changes.size()==1,"compare distinct changed values");check(old.get("1.2.3").equals("integer:1"),"never mutate saved values");check(ReplayEngine.isRoutine("1.3.6.1.2.1.1.3.0")&&!ReplayEngine.isRoutine("1.2.3"),"known changing uptime distinguished from other changes");
  ReplayEngine.Result captured=ReplayEngine.runRecorded(seq,Arrays.asList("integer:1","integer:5","integer:2"),"02:01:02:03:04:05",new Wire());
  check(captured.changes.size()==1&&captured.changes.get(0).before.equals("integer:1"),"each repeated request must use its own original response");
  check(captured.responses.equals(Arrays.asList("integer:2","integer:5","integer:2")),"replay result must retain every response in order");
  Wire shortBaseline=new Wire();try{ReplayEngine.runRecorded(seq,Collections.singletonList("integer:1"),"02:01:02:03:04:05",shortBaseline);throw new AssertionError("incomplete baseline must be rejected");}catch(ReplayEngine.ProbeException expected){}check(shortBaseline.seen.isEmpty(),"invalid captured baseline must be rejected before network access");
  ReplayEngine.Result unavailable=ReplayEngine.runRecorded(seq,Arrays.asList(null,"integer:5","integer:2"),"02:01:02:03:04:05",new Wire());
  check(unavailable.uncached==1&&unavailable.changes.isEmpty(),"missing original values must not be treated as changes");
  ReplayEngine.Transport partial=new ReplayEngine.Transport(){public String probe(ReplayEngine.Spec s){return "02:01:02:03:04:05";}public String request(ReplayEngine.Spec s){return s.oid.equals("1.2.3")?null:"integer:5";}public void close(){}};
  ReplayEngine.Result partialResult=ReplayEngine.run(seq,Collections.singletonMap("1.2.3","integer:1"),"02:01:02:03:04:05",partial);check(partialResult.unsupported==2&&partialResult.uncached==1&&partialResult.changes.isEmpty(),"unsupported and unsaved responses are not invented as differences");
  ReplayEngine.Transport transientChange=new ReplayEngine.Transport(){int count;public String probe(ReplayEngine.Spec s){return "02:01:02:03:04:05";}public String request(ReplayEngine.Spec s){if(!s.oid.equals("1.2.3"))return "integer:5";return count++==0?"integer:2":"integer:1";}public void close(){}};
  check(ReplayEngine.run(seq,old,"02:01:02:03:04:05",transientChange).changes.size()==1,"differences seen during repeated requests remain visible");
  w=new Wire();w.fail=true;try{ReplayEngine.run(seq,old,"02:01:02:03:04:05",w);throw new AssertionError("offline probe must abort");}catch(ReplayEngine.ProbeException expected){}check(w.seen.equals(Arrays.asList("probe")),"offline must not replay");
  w=new Wire();w.identity="02:09:09:09:09:09";try{ReplayEngine.run(seq,old,"02:01:02:03:04:05",w);throw new AssertionError("different printer must abort");}catch(ReplayEngine.ProbeException expected){}check(w.seen.size()==1,"identity mismatch must not replay");
  System.out.println("Printer replay engine checks passed");
 }
}

