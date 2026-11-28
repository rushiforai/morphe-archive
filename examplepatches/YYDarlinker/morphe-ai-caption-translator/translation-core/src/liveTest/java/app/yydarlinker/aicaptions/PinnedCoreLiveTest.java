package app.yydarlinker.aicaptions;
import static org.junit.Assert.*;
import org.junit.Test;
import org.json.JSONObject;
import java.nio.file.*;
import java.util.concurrent.atomic.AtomicInteger;

/** Explicit opt-in: one five-word source through the unmocked upstream HTTP/provider/protocol chain. */
public class PinnedCoreLiveTest {
    @Test public void fiveWordRealTranslation() throws Exception {
        String endpoint=System.getenv("MORPHE_P4_BASE_URL"),model=System.getenv("MORPHE_P4_MODEL"),key=System.getenv("MORPHE_P4_API_KEY");
        assertNotNull("missing MORPHE_P4_BASE_URL",endpoint);assertNotNull("missing MORPHE_P4_MODEL",model);assertNotNull("missing MORPHE_P4_API_KEY",key);
        int maxRequests=Integer.parseInt(System.getProperty("live.maxRequests","0"));
        long maxTokens=Long.parseLong(System.getProperty("live.maxTokens","0"));
        int elapsedSeconds=Integer.parseInt(System.getProperty("live.elapsedSeconds","0"));
        assertTrue("Live requires explicit positive budgets",maxRequests>0&&maxTokens>0&&elapsedSeconds>0);
        long began=System.nanoTime();
        AtomicInteger attempts=new AtomicInteger();long[] usage={0,0};long[] charged={0};
        TranslationOutput.install(new TranslationOutput.Sink(){});
        RebuildRequestObserver.install(new RebuildRequestObserver.Sink(){
            public void attempt(){
                if(attempts.get()>=maxRequests||charged[0]+6000>maxTokens||(System.nanoTime()-began)/1000000000L>=elapsedSeconds)throw new IllegalStateException("live_budget_exhausted_before_send");
                charged[0]+=6000;attempts.incrementAndGet();
            }
            public void response(int attempt,JSONObject root){JSONObject u=root.optJSONObject("usage");if(u!=null&&u.has("total_tokens")){usage[0]+=u.optLong("prompt_tokens");usage[1]+=u.optLong("completion_tokens");charged[0]+=u.optLong("total_tokens")-6000;}}
        });
        String text=RebuildApi.test(new TranslationSettings(true,endpoint,model,"Translate faithfully and naturally.",key,"stored_custom"));
        assertFalse("provider returned empty accepted translation",text.trim().isEmpty());
        JSONObject result=new JSONObject().put("kind","real_external_translation").put("core_commit","ac65fe803ec2b11821b1131040f807922a2b8505")
            .put("source","This is a subtitle test.").put("target","zh-Hans").put("model",TranslationRuntime.redact(model,key,200))
            .put("accepted_translation",TranslationRuntime.redact(text,key,2000)).put("attempts",attempts.get())
            .put("elapsed_ms",(System.nanoTime()-began)/1000000).put("input_tokens",usage[0]).put("output_tokens",usage[1])
            .put("charged_tokens",charged[0]).put("max_requests",maxRequests).put("max_tokens",maxTokens).put("elapsed_budget_seconds",elapsedSeconds);
        Path output=Paths.get(System.getProperty("live.output"));Files.createDirectories(output.getParent());Files.write(output,result.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));
        System.out.println("LIVE_CORE_PASS attempts="+attempts.get()+" accepted_chars="+text.length());
    }
}
