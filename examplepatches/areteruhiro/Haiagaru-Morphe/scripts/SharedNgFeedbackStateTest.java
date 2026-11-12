package app.morphe.extension.chmate;
import java.util.*;import org.json.*;
public final class SharedNgFeedbackStateTest {
 static int checks;static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 interface Run{void run()throws Exception;}static void bad(Run action)throws Exception{try{action.run();throw new AssertionError("expected rejection");}catch(JSONException|IllegalArgumentException expected){checks++;}}
 static String id(int n){return String.format(Locale.ROOT,"%064x",n);}
 public static void main(String[]args)throws Exception{
  SharedNgFeedbackState empty=new SharedNgFeedbackState(Set.of(),Set.of(),0);ok(empty.batch().length()==0,"startup does not transmit old local exclusions");
  var selected=empty.saved(Set.of(id(1)),100);JSONArray sent=selected.batch();ok(sent.length()==1&&sent.getJSONObject(0).getBoolean("exclude"),"explicit save queues exclusion");
  var concurrent=selected.saved(Set.of(),101);var after=concurrent.acknowledged(sent,new JSONArray(sent.toString()));ok(after.pending.contains(id(1))&&!after.desired.contains(id(1)),"old success cannot overwrite concurrent undo");ok(!after.batch().getJSONObject(0).getBoolean("exclude"),"undo follows in next request");
  var done=after.acknowledged(after.batch(),new JSONArray(after.batch().toString()));ok(done.pending.isEmpty(),"acknowledged undo drained");
  var restart=new SharedNgFeedbackState(selected.desired,selected.pending,selected.revision);ok(restart.batch().toString().equals(sent.toString()),"restart retries same operation revision");
  JSONArray newer=new JSONArray().put(new JSONObject().put("target",id(1)).put("exclude",false).put("revision",10000));var conflict=selected.acknowledged(sent,newer);ok(conflict.revision>10000&&conflict.pending.contains(id(1)),"older restored client advances revision without losing desired choice");
  bad(()->selected.acknowledged(sent,new JSONArray()));bad(()->selected.acknowledged(sent,new JSONArray().put(new JSONObject().put("target",id(2)).put("exclude",true).put("revision",100))));
  bad(()->selected.acknowledged(sent,new JSONArray().put(new JSONObject().put("target",id(1)).put("exclude",true).put("revision",99))));bad(()->selected.acknowledged(sent,new JSONArray().put(new JSONObject().put("target",id(1)).put("exclude",true).put("revision",100.5))));
  bad(()->empty.saved(Set.of("invalid"),1));bad(()->new SharedNgFeedbackState(Set.of(),Set.of(),SharedNgFeedbackState.MAX_REVISION).saved(Set.of(id(1)),1));
  Set<String> many=new TreeSet<>();for(int i=1;i<=55;i++)many.add(id(i));var batch=empty.saved(many,200);int rounds=0;while(!batch.pending.isEmpty()){JSONArray outgoing=batch.batch();ok(outgoing.length()<=20,"bounded body across retries");batch=batch.acknowledged(outgoing,new JSONArray(outgoing.toString()));rounds++;}ok(rounds==3&&batch.desired.size()==55,"all targets drain without truncation");
  System.out.println("PASS "+checks+" durable feedback/concurrent-save/acknowledgement checks");
 }
}
