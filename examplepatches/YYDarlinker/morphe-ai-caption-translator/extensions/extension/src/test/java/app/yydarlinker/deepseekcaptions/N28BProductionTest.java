package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={N29InstallationSafetyTest.Installed.class,RebuildIntegrationTest.Keys.class,RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N28BProductionTest {
  RebuildIntegrationTest h;
  final List<String> requests=Collections.synchronizedList(new ArrayList<>());
  final JSONArray trace=new JSONArray();
  volatile String translated="Une phrase fidèle.";
  volatile CountDownLatch oldGate;
  volatile boolean oldArrived;
  volatile String fault="";
  @Before public void setup()throws Exception {
    h=new RebuildIntegrationTest();h.setup();
    RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,600,340);RebuildLayoutTest.shorts=false;
    h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
      try {
        h.calls.incrementAndGet();String body=r.getBody().readUtf8();requests.add(body);
        JSONObject input=new JSONObject(new JSONObject(body).getJSONArray("messages").getJSONObject(1).getString("content"));
        String text=translated;
        if(oldGate!=null && "ar".equals(input.getString("language"))) {
          oldArrived=true;oldGate.await(10,TimeUnit.SECONDS);text="OLD_SCOPE_ONLY";
        }
        JSONArray w=input.getJSONArray("owned_tokens");JSONObject event=new JSONObject()
            .put("from",w.getJSONArray(0).getInt(0)).put("to",w.getJSONArray(w.length()-1).getInt(0))
            .put("source",input.getString("source_text")).put("text",text);
        JSONObject plan=new JSONObject().put("block",input.getString("block")).put("events",new JSONArray().put(event));
        if(fault.equals("gap"))event.put("from",event.getInt("from")+1);
        if(fault.equals("duplicate"))plan.getJSONArray("events").put(new JSONObject(event.toString()));
        if(fault.equals("reverse"))event.put("from",event.getInt("to")).put("to",event.getInt("from")-1);
        if(fault.equals("quote"))event.put("source","wrong source quote");
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
            .put("finish_reason","stop").put("message",new JSONObject().put("content",plan.toString())))).toString());
      }catch(Exception e){return new MockResponse().setResponseCode(500);}
    }});
  }
  @After public void cleanup()throws Exception{if(oldGate!=null)oldGate.countDown();h.cleanup();}
  String url(String source,String target){return "https://www.youtube.com/api/timedtext?v=rebuild0001&kind=asr"+(source==null?"":"&lang="+source)+"&tlang="+target;}
  void ui(String code){Configuration cfg=new Configuration(h.a.getResources().getConfiguration());cfg.setLocale(Locale.forLanguageTag(code));h.a.getResources().updateConfiguration(cfg,h.a.getResources().getDisplayMetrics());}
  void source(String text)throws Exception{h.engine.fixtureBody=new JSONObject().put("events",new JSONArray().put(RebuildR2SourceTest.cue(0,2400,text,false))).toString();}
  RebuildController.Session start(String source,String target)throws Exception {
    RebuildController.activate(h.a,url(source,target),false,true);RebuildController.Session s=h.session();assertNotNull(s);return s;
  }
  void ready(RebuildController.Session s)throws Exception {
    h.await(()->s.states!=null && s.states[0]==RebuildController.READY);
    if(s.attempts[0]>0)h.await(()->CaptionDiagnostics.fullText(h.a).contains("REBUILD_EVENTS_ACCEPTED | block=0;events=1;session="+s.id+";"));
    assertNotNull(s.plans[0]);
  }
  void row(RebuildController.Session s,String ui,boolean network,int calls,String request)throws Exception {
    JSONArray reasons=new JSONArray();for(RebuildReview.Issue i:s.plans[0].issues)reasons.put(new JSONObject().put("code",i.code).put("repair",i.repair));
    JSONObject r=new JSONObject(request);String system=r.getJSONArray("messages").getJSONObject(0).getString("content");
    trace.put(new JSONObject().put("source",s.languageContext.sourceCode).put("target",s.languageContext.targetCode).put("ui",ui)
        .put("profile",s.languageContext.profile.id).put("policy",s.languageContext.scope())
        .put("systemPromptHash",RebuildCache.hash(system)).put("cacheKeyHash",s.cacheKey)
        .put("network",network).put("cache",!network).put("calls",calls).put("observations",reasons)
        .put("numeric_outcome",RebuildNumbers.compare(s.source.text(s.blocks.get(0).from,s.blocks.get(0).to),s.plans[0].events.get(0).text,s.languageContext).name())
        .put("presentation_policy","legacy_n26").put("accepted",true));
  }
  void export(String name)throws Exception {
    String dir=System.getenv("N28B_EVIDENCE_DIR");if(dir==null)return;File f=new File(dir);f.mkdirs();
    try(FileOutputStream out=new FileOutputStream(new File(f,name+"-trace.json"))){out.write(trace.toString(2).getBytes(StandardCharsets.UTF_8));}
  }
  @Test public void actualPolicyColdWarmAndUiMatrix()throws Exception {
    String[][] cases={{"en","zh-Hans","This is one complete sentence.","这是一条完整的测试字幕。"},
        {"en","zh-Hant","This is one complete sentence.","這是一條完整的測試字幕。"},
        {"fr","ar","La phrase contient in et the.","هذه جملة كاملة."},
        {"zh","en","这是一句话。","This is a complete sentence."},
        {"ja","fr","漢字表現。","Une phrase fidèle."},
        {null,"fr","unknown Latin source.","Une phrase fidèle."},
        {"en","ja","a tank fleet","坦克舰队"},
        {"fr","zh-Hans","a tank fleet","坦克舰队"}};
    for(String[] c:cases) {
      RebuildController.stop();SourceCaptionCache.clear(h.a);RebuildCache.clear(h.a);source(c[2]);translated=c[3];
      for(String locale:new String[]{"zh-CN","en-US","ar"}) {
        RebuildController.stop();ui(locale);int before=h.calls.get();RebuildController.Session s=start(c[0],c[1]);ready(s);
        boolean network=h.calls.get()>before;assertEquals(s.languageContext.canApplyEnglishToChinese || locale.equals("zh-CN")?1:0,h.calls.get()-before);
        assertEquals(c[0]==null?"UNKNOWN":c[0],s.languageContext.sourceCode);assertEquals(c[1],s.target);
        assertSame(s.languageContext,new RebuildController.Job(s,0).languageContext);
        assertEquals(c[3],s.plans[0].events.get(0).text);assertEquals(0,RebuildReview.score(s.plans[0].issues));
        assertNotNull(RebuildCache.read(h.a,s.cacheKey,s.source,s.blocks.get(0),s.languageContext));
        row(s,locale,network,h.calls.get()-before,requests.get(requests.size()-1));
        String request=requests.get(requests.size()-1);JSONObject payload=new JSONObject(new JSONObject(request).getJSONArray("messages").getJSONObject(1).getString("content"));
        if(!s.languageContext.canApplyEnglishToChinese) {
          assertEquals("n28b-policy-v1",payload.getString("policy_version"));
          assertFalse(payload.optJSONObject("display_hint")!=null && payload.getJSONObject("display_hint").has("approx_cjk_columns_per_line"));
        }
      }
    }
    assertEquals(12,h.calls.get());export("production-matrix");
  }
  @Test public void signatureReuseButSourceAndDuplicateChangeScopes()throws Exception {
    source("Une phrase.");RebuildController.Session en=start("en","fr");ready(en);int calls=h.calls.get();
    RebuildController.activate(h.a,url("en","fr")+"&signature=private-sig&expire=19",false,true);
    assertSame(en,h.session());h.advance(300);assertEquals(calls,h.calls.get());
    RebuildController.Session fr=start("fr","fr");ready(fr);assertNotSame(en,fr);assertTrue(en.cancelled);assertNotEquals(en.cacheKey,fr.cacheKey);
    RebuildController.activate(h.a,url("fr","fr")+"&lang=en",false,true);RebuildController.Session unknown=h.session();ready(unknown);
    assertEquals("UNKNOWN",unknown.languageContext.sourceCode);assertNotSame(fr,unknown);assertNotEquals(fr.cacheKey,unknown.cacheKey);
    RebuildController.activate(h.a,url("fr","fr")+"&lang=en&signature=other",false,true);assertSame(unknown,h.session());
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("private-sig"));assertEquals(3,h.calls.get());
    row(unknown,"default",true,3,requests.get(2));export("scope-switch");
  }
  @Test public void actualTargetRegionsHaveIndependentCaches()throws Exception {
    source("Une phrase.");Set<String> keys=new HashSet<>();
    for(String target:new String[]{"ar","en","pt-PT","pt-BR"}){RebuildController.Session s=start("fr",target);ready(s);assertTrue(keys.add(s.cacheKey));row(s,"default",true,1,requests.get(requests.size()-1));}
    assertEquals(4,h.calls.get());export("target-regions");
  }
  @Test public void confirmedChineseAliasKeepsActualTargetMetadataAndNeutralIdentity()throws Exception {
    source("Une phrase.");translated="一句话。";RebuildController.Session cn=start("fr","zh-CN");ready(cn);
    assertEquals("zh-Hans",cn.target);assertEquals("zh-CN",cn.languageContext.targetCode);assertFalse(cn.languageContext.canApplyEnglishToChinese);
    JSONObject payload=new JSONObject(new JSONObject(requests.get(0)).getJSONArray("messages").getJSONObject(1).getString("content"));assertEquals("zh-CN",payload.getString("language"));
    RebuildController.Session hans=start("fr","zh-Hans");ready(hans);assertNotEquals(cn.cacheKey,hans.cacheKey);assertEquals(2,h.calls.get());
  }
  @Test public void alreadySentOldJobCompletesWithoutPublishingOrNewCacheWrite()throws Exception {
    source("Une phrase.");oldGate=new CountDownLatch(1);RebuildController.Session old=start("fr","ar");h.await(()->oldArrived);
    RebuildController.Job oldJob=old.jobs[0];assertNotNull(oldJob);h.await(()->oldJob.sent);
    translated="NEW_SCOPE_ONLY";RebuildController.Session next=start("fr","en");ready(next);
    assertTrue(old.cancelled);assertTrue(old.retired);assertFalse(oldJob.isCancelled());assertNotEquals(old.cacheKey,next.cacheKey);
    oldGate.countDown();h.await(()->oldJob.connection==null);h.advance(500);
    assertNull(old.plans[0]);assertEquals("NEW_SCOPE_ONLY",next.plans[0].events.get(0).text);
    assertNull(RebuildCache.read(h.a,old.cacheKey,old.source,old.blocks.get(0),old.languageContext));
    assertEquals("NEW_SCOPE_ONLY",RebuildCache.read(h.a,next.cacheKey,next.source,next.blocks.get(0),next.languageContext).events.get(0).text);
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("REBUILD_EVENTS_ACCEPTED | block=0;events=1;session="+old.id+";"));
    assertEquals(2,h.calls.get());row(next,"default",true,2,requests.get(1));export("late-job");
  }
  @Test public void oldNonChineseCacheFileIsIsolatedAndPreserved()throws Exception {
    source("This is one complete sentence.");RebuildSource s=RebuildContractTest.json(h.engine.fixtureBody);RebuildPlanner.Block b=RebuildPlanner.plan(s).get(0);
    DeepSeekConfig.Snapshot cfg=DeepSeekConfig.load(h.a);String oldKey=RebuildCache.identity(s,cfg,"fr");
    JSONObject event=new JSONObject().put("from",b.from).put("to",b.to).put("source",s.text(b.from,b.to)).put("text","OLD_NON_CHINESE_CACHE");
    RebuildProtocol.Plan p=RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(event)),s,b);
    assertTrue(RebuildCache.write(h.a,oldKey,b,p));File f=new File(RebuildCache.directory(h.a),oldKey+"-"+b.id()+".json");byte[] bytes=java.nio.file.Files.readAllBytes(f.toPath());
    translated="NEW_NEUTRAL_CACHE";RebuildController.Session next=start("en","fr");ready(next);
    assertNotEquals(oldKey,next.cacheKey);assertEquals(1,h.calls.get());assertEquals("NEW_NEUTRAL_CACHE",next.plans[0].events.get(0).text);
    assertArrayEquals(bytes,java.nio.file.Files.readAllBytes(f.toPath()));
    RebuildController.stop();RebuildController.Session warm=start("en","fr");ready(warm);assertEquals(0,warm.attempts[0]);assertEquals(1,h.calls.get());
    row(warm,"default",false,0,requests.get(0));export("old-cache-isolation");
  }
  @Test public void loadProvenanceKeepsStoredBytesAndDefaultsLocaleIndependent()throws Exception {
    SharedPreferences p=ApiProfiles.values(h.a);p.edit().remove("prompt").commit();source("Une phrase.");
    Map<String,?> before=new TreeMap<>(p.getAll());ui("zh-CN");DeepSeekConfig.Snapshot zh=DeepSeekConfig.load(h.a);RebuildController.Session s=start("fr","ar");ready(s);
    String key=s.cacheKey,prompt=RebuildApi.prompt(zh,"ar",s.languageContext);
    ui("en-US");DeepSeekConfig.Snapshot en=DeepSeekConfig.load(h.a);assertEquals("program_default",en.preferenceProvenance);
    assertEquals(zh.effectivePreference,en.effectivePreference);assertEquals(prompt,RebuildApi.prompt(en,"ar",s.languageContext));
    RebuildController.activate(h.a,url("fr","ar"),false,true);assertSame(s,h.session());
    RebuildController.stop();RebuildController.Session warm=start("fr","ar");ready(warm);assertEquals(key,warm.cacheKey);assertEquals(1,h.calls.get());
    assertEquals(before,p.getAll());
    for(String stored:new String[]{DeepSeekConfig.DEFAULT_PROMPT,"忠实、自然、简洁地翻译成简体中文；优先符合中文表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。","请使用清晰语气并保留原文。"}) {
      p.edit().putString("prompt",stored).commit();byte[] original=stored.getBytes(StandardCharsets.UTF_8);
      DeepSeekConfig.Snapshot loaded=DeepSeekConfig.load(h.a);
      assertArrayEquals(original,p.getString("prompt","").getBytes(StandardCharsets.UTF_8));
      assertEquals(stored.equals("请使用清晰语气并保留原文。")?"stored_custom":"program_default",loaded.preferenceProvenance);
      if(loaded.preferenceProvenance.equals("stored_custom"))assertEquals(stored,loaded.effectivePreference);
    }
    RebuildController.Session custom=start("fr","ar");ready(custom);assertNotEquals(key,custom.cacheKey);assertEquals(2,h.calls.get());
    row(custom,"en-US",true,1,requests.get(1));export("preference-storage");
  }
  @Test public void invalidOrMissingTargetCreatesNoTranslationSession()throws Exception {
    for(String target:new String[]{"", "und", "!!"}){RebuildController.stop();RebuildController.activate(h.a,url("fr",target),false,true);assertNull(h.session());}
    RebuildController.activate(h.a,"https://www.youtube.com/api/timedtext?v=rebuild0001&lang=fr",false,true);assertNull(h.session());assertEquals(0,h.calls.get());
  }
  @Test public void actualManualSourceOnlyAndAiDisabledExportProviderZero()throws Exception {
    String nativeUrl="https://www.youtube.com/api/timedtext?v=rebuild0001&kind=asr&lang=fr";
    for(boolean asr:new boolean[]{true,false}) {
      RebuildController.stop();CaptionChoice.select("en",false,asr);
      assertTrue(DeepSeekCaptionHook.rewriteUrl(h.engine,nativeUrl).startsWith("http://127.0.0.1:"));
      RebuildController.Session s=h.session();assertNotNull(s);h.await(()->s.raw!=null);assertTrue(s.sourceOnly);assertEquals(0,h.calls.get());
      trace.put(new JSONObject().put("source",s.languageContext.sourceCode).put("target",s.languageContext.targetCode).put("ui","default")
          .put("policy",s.languageContext.scope()).put("mode",asr?"sourceOnly_asr":"manual_native")
          .put("systemPromptHash",JSONObject.NULL).put("cacheKeyHash",s.cacheKey.isEmpty()?JSONObject.NULL:s.cacheKey)
          .put("network",false).put("cache",false).put("calls",0).put("accepted",true));
    }
    RebuildController.stop();DeepSeekConfig.saveEnabled(h.a,false);CaptionChoice.select("ar",true,false);
    String requested=url("fr","ar");assertEquals(requested,DeepSeekCaptionHook.rewriteUrl(h.engine,requested));
    RebuildController.activate(h.a,requested,false,true);assertNull(h.session());assertEquals(0,h.calls.get());
    trace.put(new JSONObject().put("source","fr").put("target","ar").put("ui","default").put("mode","ai_disabled")
        .put("policy","not_requested").put("systemPromptHash",JSONObject.NULL).put("cacheKeyHash",JSONObject.NULL)
        .put("network",false).put("cache",false).put("calls",0).put("accepted",true));export("provider-zero");
  }
  @Test public void frenchDecimalUnknownColdWarmDoesNotTriggerRepair()throws Exception {
    source("1,2");translated="1.2";RebuildController.Session s=start("fr","ar");ready(s);assertTrue(s.plans[0].issues.stream().anyMatch(i->i.code.equals("numeric_unknown")));
    h.advance(2000);assertEquals(1,h.calls.get());RebuildController.stop();RebuildController.Session warm=start("fr","ar");ready(warm);assertEquals(0,warm.attempts[0]);
    assertEquals(s.plans[0].json,warm.plans[0].json);row(warm,"default",false,0,requests.get(0));export("numeric-unknown");
  }
  @Test public void unicodeIntegerValuesTraverseActualNetworkAndCache()throws Exception {
    source("12");int expected=0;
    for(String[] c:new String[][]{{"ar","١٢"},{"hi","१२"}}){
      translated=c[1];RebuildController.Session s=start("fr",c[0]);ready(s);assertEquals(c[1],s.plans[0].events.get(0).text);expected++;
      RebuildController.stop();RebuildController.Session warm=start("fr",c[0]);ready(warm);assertEquals(0,warm.attempts[0]);assertEquals(expected,h.calls.get());row(warm,"default",false,0,requests.get(requests.size()-1));
    }export("unicode-integer");
  }
  @Test public void actualIntegerContradictionRejectsAndDoesNotWriteCache()throws Exception {
    source("12");translated="१३";RebuildController.Session s=start("fr","hi");
    h.await(()->s.states!=null && s.states[0]==RebuildController.WAITING && s.attempts[0]==1);
    assertEquals("numeric_substitution",s.reasons[0]);h.advance(1500);h.await(()->s.states[0]==RebuildController.FAILED);
    assertNull(s.plans[0]);assertEquals(2,h.calls.get());assertNull(RebuildCache.read(h.a,s.cacheKey,s.source,s.blocks.get(0),s.languageContext));
    JSONObject req=new JSONObject(requests.get(0));trace.put(new JSONObject().put("source","fr").put("target","hi").put("ui","default")
        .put("systemPromptHash",RebuildCache.hash(req.getJSONArray("messages").getJSONObject(0).getString("content")))
        .put("policy",s.languageContext.scope()).put("cacheKeyHash",s.cacheKey).put("network",true).put("cache",false)
        .put("rejection","numeric_substitution").put("calls",2).put("accepted",false));export("integer-contradiction");
  }
  @Test public void actualNeutralNetworkKeepsStructuralRejectionAndRetryBounds()throws Exception {
    for(String reason:new String[]{"gap","duplicate","reverse","quote"}) {
      RebuildController.stop();SourceCaptionCache.clear(h.a);RebuildCache.clear(h.a);source("Une phrase complète.");fault=reason;
      int before=h.calls.get();RebuildController.Session s=start("fr","ar");
      h.await(()->s.states!=null && s.states[0]==RebuildController.WAITING && s.attempts[0]==1);
      String code=reason.equals("quote")?"source_quote_mismatch":"source_coverage";
      assertTrue(s.reasons[0],s.reasons[0].startsWith(code));assertNull(s.plans[0]);
      trace.put(new JSONObject().put("source","fr").put("target","ar").put("ui","default").put("policy",s.languageContext.scope())
          .put("cacheKeyHash",s.cacheKey).put("systemPromptHash",RebuildCache.hash(new JSONObject(requests.get(requests.size()-1)).getJSONArray("messages").getJSONObject(0).getString("content")))
          .put("network",true).put("cache",false).put("calls",h.calls.get()-before).put("rejection",code).put("accepted",false));
    }export("structural-rejection");
  }
  @Test public void actualSourceSilenceAndSpeakerBreaksRemainHard()throws Exception {
    for(String marker:new String[]{"silence","speaker"}) {
      RebuildController.stop();SourceCaptionCache.clear(h.a);RebuildCache.clear(h.a);
      JSONArray cues=new JSONArray().put(RebuildR2SourceTest.cue(0,500,"Bonjour",false))
          .put(RebuildR2SourceTest.cue(marker.equals("silence")?1200:500,500,marker.equals("speaker")?">> Salut":"Salut",false));
      h.engine.fixtureBody=new JSONObject().put("events",cues).toString();
      RebuildController.Session s=start("fr","ar");ready(s);h.await(()->s.blocks.size()==2&&s.states[1]==RebuildController.READY);
      assertEquals(2,s.blocks.size());assertNotNull(s.plans[0]);assertNotNull(s.plans[1]);
      // Preserve the original hard rejection at the production protocol boundary. The N30 planner
      // must now avoid requesting this illegal owner, not ask it and wait for a failure/repair.
      RebuildPlanner.Block illegal=new RebuildPlanner.Block(0,0,s.source.words.size()-1,s.source);
      String crossing=new JSONObject().put("block",illegal.id()).put("events",new JSONArray().put(new JSONObject()
          .put("from",illegal.from).put("to",illegal.to).put("source",s.source.text(illegal.from,illegal.to)).put("text",translated))).toString();
      try{RebuildProtocol.parseBound(crossing,s.source,illegal,s.languageContext);fail("hard source break was weakened");}
      catch(RebuildProtocol.Invalid invalid){assertEquals("crosses_source_break",invalid.code);}
      for(RebuildPlanner.Block block:s.blocks)for(int i=block.from+1;i<=block.to;i++)assertFalse(RebuildPlanner.hardBreakBefore(s.source,i));
      trace.put(new JSONObject().put("source","fr").put("target","ar").put("ui","default").put("policy",s.languageContext.scope())
          .put("cacheKeyHash",s.cacheKey).put("systemPromptHash",RebuildCache.hash(new JSONObject(requests.get(requests.size()-1)).getJSONArray("messages").getJSONObject(0).getString("content")))
          .put("network",true).put("cache",false).put("calls",2).put("hard_rejection_preserved","crosses_source_break").put("boundary",marker).put("legal_planned_blocks",2).put("accepted",true));
    }export("source-boundary");
  }
  @Test public void localizedDatesMagnitudeAndMultipleNumbersAreObservedUnknown()throws Exception {
    for(String[] c:new String[][]{{"12 octobre 2026","١٢ أكتوبر ٢٠٢٦"},{"12 millions","١٢ مليون"},{"12 13","١٢ ١٣"},{"12–13","١٢–١٣"}}) {
      RebuildController.stop();SourceCaptionCache.clear(h.a);source(c[0]);translated=c[1];int before=h.calls.get();
      RebuildController.Session s=start("fr","ar");ready(s);assertEquals(1,h.calls.get()-before);
      assertTrue(s.plans[0].issues.stream().anyMatch(i->i.code.equals("numeric_unknown")));assertEquals(0,RebuildReview.score(s.plans[0].issues));
      row(s,"default",true,1,requests.get(requests.size()-1));
    }export("localized-numeric-unknown");
  }
  @Test public void neutralLongEventHasNoReadabilityPaidRepair()throws Exception {
    source("Une phrase.");StringBuilder text=new StringBuilder();for(int i=0;i<650;i++)text.append('字');translated=text.toString();
    RebuildController.Session s=start("fr","ja");ready(s);assertEquals(0,RebuildReview.score(s.plans[0].issues));
    h.advance(2500);assertEquals(1,h.calls.get());row(s,"default",true,1,requests.get(0));export("readability-advisory");
  }
}
