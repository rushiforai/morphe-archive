package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.content.Context;
import android.content.res.Configuration;
import java.util.Locale;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={N29InstallationSafetyTest.Installed.class,N28ALanguageContextTest.NoKey.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class N28ALanguageContextTest {
  @Implements(SecureApiKey.class) public static class NoKey {
    @Implementation public static String load(Context c){return "";}
  }
  RebuildIntegrationTest h;
  @Before public void setup() throws Exception {h=new RebuildIntegrationTest();h.setup();}
  @After public void cleanup() throws Exception {h.cleanup();}
  String url(String source,String target){return "https://www.youtube.com/api/timedtext?v=rebuild0001&kind=asr"+(source==null ? "" : "&lang="+source)+"&tlang="+target;}
  CaptionLanguageContext ctx(RebuildController.Session s) throws Exception {
    java.lang.reflect.Field f=RebuildController.Session.class.getDeclaredField("languageContext");f.setAccessible(true);
    assertTrue(java.lang.reflect.Modifier.isFinal(f.getModifiers()));return (CaptionLanguageContext)f.get(s);
  }
  String log(){return CaptionDiagnostics.fullText(h.a);}
  int records(String stage){return CaptionDiagnostics.history(h.a).split(" \\| "+stage+" \\| ",-1).length-1;}
  @Test public void actualActivateSelectsSourceAndConfirmedTargetUnderThreeUiLocales() throws Exception {
    org.json.JSONArray evidence=new org.json.JSONArray();
    String[][] cases={{"en","zh-Hans","zh-Hans"},{"en","zh-Hant","zh-Hant"},{"fr","ar","ar"},{"zh","en","en"},{null,"fr","fr"}};
    for(String ui:new String[]{"zh-CN","en-US","ar"}) {
      Configuration config=new Configuration(h.a.getResources().getConfiguration());config.setLocale(Locale.forLanguageTag(ui));
      h.a.getResources().updateConfiguration(config,h.a.getResources().getDisplayMetrics());
      for(String[] c:cases) {
        RebuildController.stop();CaptionDiagnostics.clear(h.a);
        RebuildController.activate(h.a,url(c[0],c[1]),false,true);
        RebuildController.Session s=h.session();assertNotNull(s);
        assertEquals(c[1],s.target);assertEquals(c[2],ctx(s).profile.id);
        assertEquals(c[0]==null ? "UNKNOWN" : c[0],ctx(s).sourceCode);
        assertEquals(c[0]==null ? "UNKNOWN" : "url_lang",ctx(s).sourceProvenance);
        assertEquals(c[1].startsWith("zh-"),ctx(s).canApplyEnglishToChinese);
        assertTrue(log().contains("LANGUAGE_PROFILE_BOUND"));assertTrue(log().contains("strategy="+(ctx(s).canApplyEnglishToChinese ? "legacy_en_zh" : "neutral")));
        assertEquals(1,records("LANGUAGE_PROFILE_BOUND"));
        evidence.put(new org.json.JSONObject().put("ui_locale",ui).put("confirmed_session_target",s.target)
            .put("diagnostic_fields",ctx(s).diagnosticFields()).put("english_to_chinese_metadata",ctx(s).canApplyEnglishToChinese));
      }
    }
    assertEquals(0,h.calls.get());
    String dir=System.getenv("N28A_EVIDENCE_DIR");if(dir!=null)try(java.io.FileOutputStream out=new java.io.FileOutputStream(new java.io.File(dir,"language-session-matrix.json"))) {out.write(evidence.toString(2).getBytes("UTF-8"));}
  }
  @Test public void metadataNormalizationKeepsRegionsAndDoesNotRewriteLegacyTargetOrUrl() throws Exception {
    assertEquals("pt-PT",CaptionLanguageProfile.normalizeCode(" PT_pt "));
    assertEquals("pt-BR",CaptionLanguageProfile.normalizeCode("pt_br"));
    assertEquals("en-GB",CaptionLanguageProfile.normalizeCode("EN_gb"));
    assertEquals("en-US",CaptionLanguageProfile.normalizeCode("en-us"));
    assertEquals("id-ID",CaptionLanguageProfile.normalizeCode("in_ID"));
    assertEquals("zh-Hant-TW",CaptionLanguageProfile.normalizeCode(" zh _ hANT _ tw "));
    String u=url("EN_gb","pt_PT");RebuildController.activate(h.a,u,false,false);
    RebuildController.Session s=h.session();assertEquals(u,s.url);assertEquals("pt-PT",s.target);
    assertEquals("en-GB",ctx(s).sourceCode);assertEquals("pt-PT",ctx(s).targetCode);
    assertEquals("pt",ctx(s).profile.id);
  }
  @Test public void unknownSourceAndGenericChineseDoNotInventEnglishOrHans() {
    for(String source:new String[]{null,"","und","unknown","%21bad","fr","ja","zh"}) {
      CaptionLanguageContext c=CaptionLanguageContext.observe(url(source,"zh-Hans"),"zh-Hans");
      assertFalse(c.canApplyEnglishToChinese);
    }
    CaptionLanguageContext c=CaptionLanguageContext.observe(url("en","zh"),"zh");
    assertEquals("generic",c.profile.id);assertTrue(c.chineseFamily);assertFalse(c.canApplyEnglishToChinese);
    assertEquals("generic",CaptionLanguageContext.observe(url("en","it"),"it").profile.id);
    assertEquals("UNKNOWN",CaptionLanguageContext.observe(url(null,"en"),null).targetCode);
    assertEquals("UNKNOWN",CaptionLanguageContext.observe(url("und-Latn","en"),"en").sourceCode);
    assertEquals("UNKNOWN",CaptionLanguageContext.observe(url("e%20n","en"),"en").sourceCode);
    assertEquals("UNKNOWN",CaptionLanguageContext.observe(url("en--US","en"),"en").sourceCode);
  }
  @Test public void signatureReuseLogsOnceAndTrackOrVideoChangesOwnSeparateContext() throws Exception {
    String u=url("en","zh-Hans");CaptionDiagnostics.clear(h.a);
    RebuildController.activate(h.a,u,false,false);RebuildController.Session first=h.session();
    RebuildController.activate(h.a,u+"&signature=secret-signature&expire=17",false,false);
    assertSame(first,h.session());
    for(int i=0;i<20;i++)RebuildController.time(i*100);h.advance(2000);
    assertEquals(1,records("LANGUAGE_PROFILE_BOUND"));
    assertFalse(log().contains("secret-signature"));
    RebuildController.activate(h.a,url("fr","zh-Hans"),false,false);
    RebuildController.Session second=h.session();assertNotSame(first,second);assertTrue(first.cancelled);
    assertEquals("en",ctx(first).sourceCode);assertEquals("fr",ctx(second).sourceCode);
    RebuildController.stop();RebuildController.video("rebuild0002");
    RebuildController.activate(h.a,url("ja","en").replace("rebuild0001","rebuild0002"),false,false);
    assertNotSame(second,h.session());assertEquals("ja",ctx(h.session()).sourceCode);
  }
  @Test public void duplicateSourceChangeRevokesPreviousPublicationAndBindsUnknownScope() throws Exception {
    String u=url("en","fr");CaptionDiagnostics.clear(h.a);
    RebuildController.activate(h.a,u,false,false);RebuildController.Session s=h.session();String key=s.identity;
    // N28B intentionally replaces N28A's observation-only Session reuse contract.
    RebuildController.activate(h.a,u+"&lang=ar",false,false);
    RebuildController.Session unknown=h.session();
    RebuildController.activate(h.a,u+"&lang=ar&signature=other",false,false);
    assertSame(unknown,h.session());assertNotEquals(key,unknown.identity);assertEquals("en",ctx(s).sourceCode);
    assertNotSame(s,unknown);assertTrue(s.cancelled);assertFalse(RebuildController.current(s));
    assertEquals(0,records("LANGUAGE_CONTEXT_MISMATCH"));assertEquals(2,records("LANGUAGE_PROFILE_BOUND"));
    assertEquals("UNKNOWN",ctx(unknown).sourceCode);assertTrue(log().contains("source_code=UNKNOWN"));
    RebuildController.activate(h.a,u,false,false);RebuildController.activate(h.a,u+"&lang=ar",false,false);
    assertEquals(4,records("LANGUAGE_PROFILE_BOUND"));
  }
  @Test public void nativeManualSourceAndAiDisabledRemainApiZero() throws Exception {
    CaptionChoice.select("en",false,false);
    String u=url("en","fr");
    DeepSeekConfig.saveEnabled(h.a,false);
    assertEquals(u,DeepSeekCaptionHook.rewriteUrl(h.engine,u));
    RebuildController.activate(h.a,u,false,true);assertNull(h.session());
    DeepSeekConfig.saveEnabled(h.a,true);
    String nativeUrl=url("en","fr").replace("&tlang=fr","");
    assertTrue(DeepSeekCaptionHook.rewriteUrl(h.engine,nativeUrl).startsWith("http://127.0.0.1:"));
    CaptionChoice.select("en",true,true);
    RebuildController.activate(h.a,nativeUrl,true,false);
    assertTrue(h.session().sourceOnly);RebuildController.Session source=h.session();h.await(()->source.source!=null || source.raw!=null);
    assertEquals(0,h.calls.get());
  }
}
