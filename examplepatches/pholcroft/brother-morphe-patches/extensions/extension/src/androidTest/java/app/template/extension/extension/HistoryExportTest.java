package app.template.extension.extension;

import android.content.Context;
import java.io.StringWriter;
import java.util.Collections;
import org.json.JSONObject;

public final class HistoryExportTest {
 public static void run(Context context)throws Exception{
  ActivityStore store=new ActivityStore(context);PrinterRecord p=store.resolveVerified("192.0.2.99","02:01:02:03:04:99","Example printer");
  long seq=store.reserveSequences(1);long generation=store.registerPrinter(p.id);
  RequestRecord.Details d=new RequestRecord.Details("192.0.2.99",161,0,1,1000,1,"opaque-context","encoded","success",123000000L);
  RequestRecord r=new RequestRecord("token",0,"1.3.6.1.2.1.1.1.0",100,200,true,"integer:7".getBytes(java.nio.charset.StandardCharsets.UTF_8),d);
  RequestRecord language=new RequestRecord("language",1,"1.3.6.1.2.1.43.15.1.1.2.1.1",201,250,true,"integer:6".getBytes(java.nio.charset.StandardCharsets.UTF_8),d);
  ActivityBurst burst=new ActivityBurst(new ActivityBurst.Ref(p.id,"export-test-burst",seq),123456789,300,java.util.Arrays.asList(r,language),"192.0.2.99",new ActivityBurst.Coverage(true,true,2,2));
  if(!store.publish(burst,generation))throw new AssertionError("fixture failed");
  ReplayRun replay=new ReplayRun("export-replay",burst.ref,"192.0.2.99",500,java.util.Arrays.asList(new ReplayRun.RequestResult("token","integer:8".getBytes(java.nio.charset.StandardCharsets.UTF_8)),new ReplayRun.RequestResult("language","integer:6".getBytes(java.nio.charset.StandardCharsets.UTF_8))));
  if(!store.saveReplay(replay))throw new AssertionError("replay fixture failed");
  StringWriter output=new StringWriter();HistoryExport.write(output,p,store.listBursts(p.id),store::listReplays);
  JSONObject json=new JSONObject(output.toString());JSONObject first=json.getJSONArray("bursts").getJSONObject(0);
  if(first.getLong("sequence")!=seq||first.getJSONArray("requests").getJSONObject(0).getLong("start_offset_ns")!=100||!first.getJSONArray("requests").getJSONObject(0).getBoolean("cached")||first.getJSONArray("replays").length()!=1||!first.getJSONArray("requests").getJSONObject(0).getString("oid_name").equals("System description"))throw new AssertionError("export must contain ordered request timing and replay");
  if(!first.getJSONArray("requests").getJSONObject(1).getString("value_meaning").equals("PostScript"))throw new AssertionError("export must include verified value meanings");
  if(output.toString().contains("community"))throw new AssertionError("credentials must not be exported");
  StringWriter single=new StringWriter();HistoryExport.writeBurst(single,p,burst);
  JSONObject exported=new JSONObject(single.toString());
  if(exported.getJSONArray("bursts").length()!=1||exported.getJSONArray("bursts").getJSONObject(0).getLong("sequence")!=seq||exported.getJSONArray("bursts").getJSONObject(0).getJSONArray("requests").length()!=2)throw new AssertionError("single burst export must contain the selected requests");
  if(single.toString().contains("community"))throw new AssertionError("single burst export must not include credentials");
  store.clearPrinter(p.id);store.close();
 }
}
