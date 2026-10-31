"""Run the production collector against in-memory native stores/HTTP/preferences."""
from pathlib import Path
import subprocess
root=Path(__file__).resolve().parents[1]
source=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/PersonalNgSubmissions.java').read_text(encoding='utf-8')
methods=source[source.index('    static String hash('):source.index('    private PersonalNgSubmissions()')]
preamble=r"""package app.morphe.extension.chmate;
import org.json.*; import java.util.*; import java.security.*; import java.nio.charset.*;
public class PersonalNgSubmissions {
 static final Context context=new Context(); static final SharedPreferences preferences=new SharedPreferences();
 static SharedPreferences prefs(){return preferences;}
 static long retryDelay=-1;static void cancelRetry(){retryDelay=-1;}static void scheduleRetry(long delay){retryDelay=delay;}
 static int checks; static void check(boolean x,String message){if(!x)throw new AssertionError(message);checks++;}
 static class Context{}
 static class ProgrammableNgRuleSet {List<Rule> rules=new ArrayList<>();static class Rule {boolean enabled=true,allBoards=true;String target="title",boards="",script;Rule(String s){script=s;}}}
 static class ProgrammableNgController {static boolean enabled;static final ProgrammableNgRuleSet rules=new ProgrammableNgRuleSet();static boolean isEnabled(){return enabled;}static ProgrammableNgRuleSet currentRules(){return rules;}}

 static class SharedNgBoardCatalog{static String resolve(Context c,String scope){return SharedNgRules.boardScope(scope,List.of());}}
 static class SharedPreferences {
  Map<String,Object> map=new HashMap<>(); int commits;
  boolean getBoolean(String k,boolean f){return (boolean)map.getOrDefault(k,f);}
  long getLong(String k,long f){return ((Number)map.getOrDefault(k,f)).longValue();}
  String getString(String k,String f){return (String)map.getOrDefault(k,f);}
  Editor edit(){return new Editor();}
  class Editor {
   Map<String,Object> changes=new HashMap<>();
   Editor putString(String k,String v){changes.put(k,v);return this;}
   Editor putLong(String k,long v){changes.put(k,v);return this;}
   boolean commit(){commits++;map.putAll(changes);return true;} void apply(){commit();}
  }
 }
 static class NativeNgStore {
  static Map<String,List<Entry>> stores=new HashMap<>(); String category;
  NativeNgStore(Context c,String category){this.category=category;}
  List<Entry> entries(){return stores.getOrDefault(category,List.of());}
  static class Entry {String pattern,board;int flags;Entry(String p,String b,int f){pattern=p;board=b;flags=f;}}
 }
 static class SharedNg {
  static String target="https://example.test/one";static int calls;static boolean fail,forgedAck,emptyAck;static Runnable inFlight;
  static List<JSONObject> sent=new ArrayList<>();static String endpoint(){return target;}
  static JSONObject request(String method,String url,JSONObject body)throws Exception{
   calls++;sent.add(new JSONObject(body.toString()));if(fail)throw new Exception("synthetic offline");
   if(inFlight!=null){Runnable r=inFlight;inFlight=null;r.run();}
   JSONArray ack=new JSONArray();if(forgedAck)ack.put("f".repeat(64));if(!emptyAck)for(Object x:body.getJSONArray("reports"))ack.put(((JSONObject)x).getString("operationId"));
   return new JSONObject().put("ok",true).put("ack",ack);
  }
 }
"""
tests=r"""
 static void ready(){preferences.map.put("retryAfter",0L);}
 static JSONArray queue()throws Exception{return new JSONArray(preferences.getString("queue."+hash(SharedNg.endpoint()),"[]"));}
 public static void main(String[] args)throws Exception{
  NativeNgStore.stores.put("NAME",List.of(new NativeNgStore.Entry("-Ab12","https://egg.5ch.io/android/",16)));
  collect();check(SharedNg.calls==0&&preferences.map.isEmpty(),"no consent means no snapshot or network");
  preferences.map.put("consent",true);SharedNg.fail=true;collect();
  check(queue().length()==1,"initial existing registration queued durably");
  check(retryDelay==15*60*1000,"failed send schedules a one-shot retry");
  int blocked=SharedNg.calls;collect();check(SharedNg.calls==blocked&&retryDelay>0,"failure backoff respected on another NG event");
  JSONObject report=queue().getJSONObject(0);String op=report.getString("operationId");
  check(report.getString("kind").equals("suffix")&&report.getString("value").equals("Ab12"),"lower four classified");
  check(report.getString("period").isEmpty(),"never invent posting date");
  check(report.getString("board").equals("5ch/all"),"canonical board");
  ready();collect();check(queue().length()==1&&queue().getJSONObject(0).getString("operationId").equals(op),"retry retains same operation");
  int calls=SharedNg.calls;preferences.map.put("type.NAME",false);ready();collect();check(SharedNg.calls==calls,"disabled category does not send queued entries");
  preferences.map.put("type.NAME",true);SharedNg.fail=false;ready();collect();check(queue().length()==0,"ack removes transmitted operations");
  check(preferences.getLong("retryAfter",-1)==0&&retryDelay==-1,"success removes throttle and retry task");
  int beforeNew=SharedNg.calls;
  NativeNgStore.stores.put("ID",List.of(new NativeNgStore.Entry("newEventId","https://egg.5ch.io/android/",16)));collect();
  check(SharedNg.calls==beforeNew+1&&queue().length()==0,"new NG event sends immediately after prior success");
  int commits=preferences.commits;ready();collect();check(queue().length()==0,"unchanged native store not resent");
  check(preferences.commits==commits,"unchanged polling skips snapshot commit");
  NativeNgStore.stores.put("ID",List.of());collect();
  NativeNgStore.stores.put("NAME",List.of(new NativeNgStore.Entry("-Ab12","https://egg.5ch.io/android/",25)));ready();collect();
  JSONArray replacement=SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports");
  check(replacement.length()==2&&replacement.getJSONObject(0).getString("action").equals("delete")&&replacement.getJSONObject(1).getString("action").equals("upsert"),"presentation update withdraws before replacement so last operation stays active");
  NativeNgStore.stores.put("NAME",List.of());ready();collect();
  check(SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").getJSONObject(0).getString("action").equals("delete"),"personal removal withdraws report");
  NativeNgStore.stores.put("ID",List.of(new NativeNgStore.Entry("abc123","android",16)));ready();collect();
  JSONObject id=SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").getJSONObject(0);
  check(id.getString("board").equals("*")&&!id.has("sourceScope"),"unresolved past scope shared globally");
  SharedNg.target="https://example.test/two";ready();collect();check(SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").length()==1,"new endpoint has independent snapshot");
  NativeNgStore.stores.put("WORD",List.of(new NativeNgStore.Entry("synthetic日本語","",16)));SharedNg.inFlight=()->{preferences.map.put("consent",false);preferences.map.put("generation",1L);};ready();collect();
  check(queue().length()==1,"stale HTTP result cannot overwrite state after consent change");
  calls=SharedNg.calls;ready();collect();check(SharedNg.calls==calls,"consent off stops further network");
  JSONObject prefix=condition("NAME",new NativeNgStore.Entry("Ab12-",null,16));check(prefix.getString("kind").equals("prefix"),"upper four classified");
  JSONObject regex=condition("NAME",new NativeNgStore.Entry("-Ab12",null,32));check(regex.getString("kind").equals("name")&&regex.getBoolean("regex"),"regex is not guessed into identity");
  preferences.map.put("consent",true);SharedNg.forgedAck=true;ready();collect();check(queue().length()==1,"unexpected server acknowledgement cannot discard pending operations");
  SharedNg.forgedAck=false;ready();collect();check(queue().length()==0,"valid retry acknowledges remaining operation");
  List<NativeNgStore.Entry> many=new ArrayList<>();for(int i=0;i<25;i++)many.add(new NativeNgStore.Entry("batch"+i,"https://egg.5ch.io/android/",16));
  NativeNgStore.stores.put("WORD",many);ready();int beforeBatch=SharedNg.calls;collect();
  check(queue().length()>0&&retryDelay==1000&&SharedNg.calls==beforeBatch+1,"large registration drains in batches with one-shot scheduling");
  collect();check(queue().length()==0&&retryDelay==-1,"last batch cancels further retries");
  many.add(new NativeNgStore.Entry("emptyAckAudit日本語","https://egg.5ch.io/android/",16));SharedNg.emptyAck=true;collect();
  check(queue().length()==1&&retryDelay==900000,"empty acknowledgement retains queue with failure backoff");
  SharedNg.emptyAck=false;ready();collect();check(queue().length()==0,"retry sends same unacknowledged change");
  for(String value:List.of("あ","a","abcd","abcde","ＡＢＣＤＥ","a b c d e","éÉabc","あいうえ","日 本 語"))check(!SharedNgRules.shareableKeyword(value),"unsuitable keyword excluded");
  for(String value:List.of("あいうえお","日本語の単語","abc12","𠮷𠮷𠮷𠮷𠮷"))check(SharedNgRules.shareableKeyword(value),"eligible keyword admitted");
  NativeNgStore.stores.clear();collect();
  JSONObject legacy=condition("WORD",new NativeNgStore.Entry("あ","https://egg.5ch.io/android/",16));
  String sk=hash(SharedNg.endpoint());preferences.map.put("snapshot."+sk,new JSONObject().put(hash(legacy.toString()),legacy).toString());
  preferences.map.put("queue."+sk,new JSONArray().put(operation(legacy,"upsert")).toString());
  int legacyBefore=SharedNg.calls;collect();
  JSONArray migrated=SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports");
  check(SharedNg.calls==legacyBefore+1&&migrated.length()==1&&migrated.getJSONObject(0).getString("action").equals("delete"),"old ineligible upsert pruned; withdrawal still sent");
  NativeNgStore.stores.put("WORD",List.of(new NativeNgStore.Entry("あ","",16),new NativeNgStore.Entry("abcde","",16),new NativeNgStore.Entry("あいうえお","",16)));
  collect();check(SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").length()==1,"only eligible keyword submitted");
  preferences.map.put("type.REPORTER",true);ProgrammableNgController.enabled=true;
  ProgrammableNgController.rules.rules.add(new ProgrammableNgRuleSet.Rule("function (text, options) { return options.posterId === \"Reporter123\"; }"));
  collect();JSONObject reporter=SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").getJSONObject(0);
  check(reporter.getString("kind").equals("reporter")&&reporter.getString("board").equals("edge/all")&&reporter.getString("value").equals("Reporter123")&&!reporter.has("script"),"reporter template submits literal ID without code");
  ProgrammableNgController.enabled=false;collect();check(SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").getJSONObject(0).getString("action").equals("delete"),"disabled advanced NG withdraws reporter condition");
  NativeNgStore.stores.put("THREAD",List.of(new NativeNgStore.Entry("[ReporterNative★]","bbs.eddibb.cc/liveedge",16),new NativeNgStore.Entry("ordinary title","edge/all",16),new NativeNgStore.Entry("[Disabled★]","edge/all",20),new NativeNgStore.Entry("[OtherBoard★]","https://egg.5ch.io/android/",16)));
  collect();JSONObject nativeReporter=SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").getJSONObject(0);
  check(nativeReporter.getString("value").equals("ReporterNative")&&nativeReporter.getString("kind").equals("reporter"),"native reporter-only NGThread submits without advanced NG");
  check(SharedNg.sent.get(SharedNg.sent.size()-1).getJSONArray("reports").length()==1,"ordinary/disabled/other-board titles are not reporter conditions");
  System.out.println("PASS "+checks+" production collector checks (synthetic data only)");
 }
}
"""
out=root/'build/personal-ng-host';out.mkdir(parents=True,exist_ok=True)
java=out/'PersonalNgSubmissions.java';java.write_text(preamble+methods+tests,encoding='utf-8')
jdk=Path('C:/Users/narum/jdk-21.0.9+10/bin');jar=root/'build/shared-ng-json.jar'
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-cp',str(jar),'-d',str(out),str(java),str(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNgRules.java'),str(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNgReporter.java')],check=True)
subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out)+';'+str(jar),'app.morphe.extension.chmate.PersonalNgSubmissions'],check=True)
