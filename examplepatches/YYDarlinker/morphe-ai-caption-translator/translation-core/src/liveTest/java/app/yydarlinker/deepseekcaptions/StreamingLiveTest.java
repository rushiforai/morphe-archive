package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.net.HttpURLConnection;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.*;
import org.junit.Test;

/**
 * Explicit opt-in: captured blocks of a real video through the unmocked streamed provider path.
 * Uses QWEN_* and DEEPSEEK_* (base URL, model, key) when present; never prints a credential.
 */
public class StreamingLiveTest {
  static final class Probe implements DeepSeekApiClient.RequestControl, RebuildStream.Early {
    final long began=System.nanoTime();
    volatile long firstAt=-1;
    final List<RebuildProtocol.Plan> prefixes=new CopyOnWriteArrayList<>();
    public boolean isCancelled(){return false;}
    public void onConnection(HttpURLConnection connection){}
    public void onProvisional(RebuildProtocol.Plan prefix){if(firstAt<0)firstAt=System.nanoTime();prefixes.add(prefix);}
  }

  @Test public void capturedBlocksStreamAndMatchTheAcceptedPlan() throws Exception {
    int maxRequests=Integer.parseInt(System.getProperty("live.maxRequests","0"));
    long maxTokens=Long.parseLong(System.getProperty("live.maxTokens","0"));
    int elapsedSeconds=Integer.parseInt(System.getProperty("live.elapsedSeconds","0"));
    assertTrue("Live requires explicit positive budgets",maxRequests>0&&maxTokens>0&&elapsedSeconds>0);
    int configured=0;
    for(String provider:new String[]{"QWEN","DEEPSEEK"}) {
      String endpoint=System.getenv(provider+"_BASE_URL"),model=System.getenv(provider+"_MODEL"),key=System.getenv(provider+"_API_KEY");
      if(endpoint==null&&model==null&&key==null)continue;
      assertTrue(provider+" live configuration is incomplete",
              endpoint!=null&&!endpoint.isBlank()&&model!=null&&!model.isBlank()&&key!=null&&!key.isBlank());
      configured++;
    }
    assertTrue("No live provider configured; zero calls cannot prove streaming",configured>0);
    long began=System.nanoTime();
    long[] charged={0};int[] attempts={0};
    TranslationOutput.install(new TranslationOutput.Sink(){});
    TranslationAudit.install(new TranslationAudit.Sink(){
      public int attempt(TranslationAudit.Request r,int bytes){
        if(attempts[0]>=maxRequests||charged[0]+8000>maxTokens
                ||(System.nanoTime()-began)/1000000000L>=elapsedSeconds)
            throw new IllegalStateException("live_budget_exhausted_before_send");
        charged[0]+=8000;return ++attempts[0];
      }
      public void response(TranslationAudit.Request r,int attempt,JSONObject root){
        JSONObject u=root.optJSONObject("usage");if(u!=null&&u.has("total_tokens"))charged[0]+=u.optLong("total_tokens")-8000;
      }
    });
    DisplayReplayTest.Capture capture=DisplayReplayTest.load("deepseek-flash.jsonl");
    CaptionLanguageContext context=CaptionLanguageContext.explicit("en","zh-Hans");
    JSONArray rows=new JSONArray();
    for(String provider:new String[]{"QWEN","DEEPSEEK"}) {
      String endpoint=System.getenv(provider+"_BASE_URL"),model=System.getenv(provider+"_MODEL"),key=System.getenv(provider+"_API_KEY");
      if(endpoint==null||model==null||key==null)continue;
      TranslationSettings cfg=new TranslationSettings(true,endpoint,model,
          "忠实、自然、简洁；优先符合目标语言的母语表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。",key,"program_default");
      for(int index:new int[]{0,1,83}) {
        RebuildApi.reset();
        Probe probe=new Probe();
        JSONObject row=new JSONObject().put("provider",provider).put("model",TranslationRuntime.redact(model,key,200)).put("block",index);
        try {
          RebuildProtocol.Plan plan=RebuildApi.translate(capture.source,capture.blocks.get(index),cfg,"zh-Hans",probe,true,"",context);
          long total=(System.nanoTime()-probe.began)/1000000;
          row.put("total_ms",total).put("events",plan.events.size()).put("provisional_updates",probe.prefixes.size())
              .put("first_event_ms",probe.firstAt<0?-1:(probe.firstAt-probe.began)/1000000);
          // Every early prefix is exactly the leading part of the accepted plan.
          for(RebuildProtocol.Plan prefix:probe.prefixes)for(int i=0;i<prefix.events.size();i++){
            RebuildProtocol.Event early=prefix.events.get(i),accepted=plan.events.get(i);
            assertEquals(accepted.from,early.from);assertEquals(accepted.to,early.to);assertEquals(accepted.text,early.text);
          }
          assertTrue(provider+" block "+index+" was not streamed",probe.prefixes.size()>0);
          row.put("first_text",TranslationRuntime.redact(plan.events.get(0).text,key,200));
        } catch(Exception failure) {
          row.put("failure",TranslationRuntime.redact(String.valueOf(failure),key,300));
        }
        rows.put(row);
        System.out.println("LIVE_STREAM "+row);
      }
    }
    Path output=Paths.get(System.getProperty("live.output"));Files.createDirectories(output.getParent());
    Files.write(output,new JSONObject().put("kind","real_streamed_capture_blocks").put("attempts",attempts[0])
        .put("charged_tokens",charged[0]).put("rows",rows).toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));
    assertTrue("A live run must exercise at least one configured provider",rows.length()>0&&attempts[0]>0);
    for(int i=0;i<rows.length();i++)assertFalse(rows.getJSONObject(i).toString(),rows.getJSONObject(i).has("failure"));
  }
}
