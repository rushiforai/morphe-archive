package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk={28,35},shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N29SemanticPagerTest {
 N28CGeometryTest h;
 @Before public void setup(){h=new N28CGeometryTest();h.setup();}
 @After public void cleanup(){h.cleanup();}
 static final String[][] SAMPLES={
 {"zh-Hans","这是一条完整的测试字幕。"},{"zh-Hant","這是一條完整的測試字幕。"},
 {"ja","これは完全な字幕の表示テストです。"},{"ko","완전한 자막 표시를 확인합니다."},
 {"en","This complete caption keeps every original word."},{"es","Esta frase completa permanece visible."},
 {"fr","Une phrase complète reste lisible et conserve tous ses mots."},{"de","Die vollständige Nachricht bleibt sichtbar."},
 {"pt-BR","Esta legenda completa permanece visível."},{"ru","Полная строка субтитров остаётся видимой."},
 {"vi","Dòng phụ đề đầy đủ vẫn hiển thị rõ ràng."},{"id","Kalimat lengkap ini tetap terlihat."},
 {"ar","سَلَام، هذه جملة كاملة تظهر بوضوح."},{"hi","क्ष क़ि यह पूरा वाक्य स्पष्ट दिखाई देता है।"}};
 JSONObject row(String name,String lang,String text,long start,long end,int width,float size)throws Exception {
  CaptionRenderSpec spec=h.spec(lang);CaptionOverlay.LayoutBudget budget=new CaptionOverlay.LayoutBudget(width,size,size,spec);
  List<RebuildPageLayout.Page> before=spec.legacy?RebuildPageLayout.plan(text,start,end,budget,spec):N29LegacyPagerFixture.plan(text,start,end,budget,spec);
  List<RebuildPageLayout.Page> after=RebuildPageLayout.plan(text,start,end,budget,spec);
  if(!after.isEmpty()) {
   StringBuilder joined=new StringBuilder();long at=start;int offset=0;
   CaptionLanguagePager.Seams seams=spec.legacy?null:CaptionLanguagePager.seams(text,budget,spec);
   for(RebuildPageLayout.Page p:after){assertEquals(at,p.start);assertTrue(p.end>p.start);if(!spec.legacy && after.size()>1)assertTrue(p.end-p.start>=1200);
    assertTrue(spec.fits(p.text,size,width,2));joined.append(p.text);at=p.end;offset+=p.text.length();
    if(!spec.legacy && offset<text.length()) {
     int si=Arrays.binarySearch(seams.cuts,offset);assertTrue(si>=0);
     if(seams.kinds[si]==CaptionLanguagePager.WORD) {
      assertTrue(Arrays.binarySearch(CaptionUnicode.wordBoundaries(text,spec.locale),offset)>=0);
      assertTrue(Arrays.binarySearch(CaptionUnicode.lineBoundaries(text,spec.locale),offset)>=0);
     }
    }
   }
   assertEquals(text,joined.toString());assertEquals(end,at);
  }
  String exception="";
  if(!before.isEmpty() && after.isEmpty()) {
   assertFalse(spec.legacy);assertFalse(spec.fits(text,size,width,2));
   assertEquals("page_time_capacity_unresolved",CaptionLanguagePager.failureReason(text,budget,spec));
   exception="old_line_or_time_only_word_split_no_long_unit_permission";
  }
  return new JSONObject().put("case",name).put("target",lang).put("text",text).put("start",start).put("end",end)
   .put("width",width).put("font_px",size).put("before",N28CGeometryTest.pageRows(before)).put("after",N28CGeometryTest.pageRows(after))
   .put("new_constraint_exception",exception).put("seams",spec.legacy?"legacy_unchanged":CaptionLanguagePager.seamSummary(text,after,budget,spec));
 }
 @Test public void fourteenTargetsPunctuatedAndUnpunctuatedLongUnitsKeepHardContracts()throws Exception {
  JSONArray rows=new JSONArray();
  for(String[] s:SAMPLES) {
   rows.put(row("punctuated",s[0],String.join(" ",Collections.nCopies(4,s[1])),0,24000,240,32));
   String no=s[1].replaceAll("[。.!،,।]","");
   rows.put(row("unpunctuated",s[0],String.join(" ",Collections.nCopies(4,no)),0,24000,240,32));
   if(!h.spec(s[0]).legacy)rows.put(row("long_compound_graphemes",s[0],String.join("",Collections.nCopies(10,"क्षक़ि👩‍👩‍👧‍👦")),0,24000,200,32));
  }
  N28CGeometryTest.export("n29-seam-matrix-sdk"+android.os.Build.VERSION.SDK_INT+".json",new JSONObject().put("rows",rows));
 }
 @Test public void capturedUnshortenedJapaneseAndArabicEventsUseRecordedWidths()throws Exception {
  String raw;try(InputStream stream=getClass().getResourceAsStream("/n29/device-events.json")){assertNotNull(stream);raw=new String(stream.readAllBytes(),StandardCharsets.UTF_8);}
  JSONArray fixtures=new JSONArray(raw),rows=new JSONArray();
  for(int i=0;i<fixtures.length();i++) {
   JSONObject f=fixtures.getJSONObject(i);String text=f.getString("text"),lang=f.getString("lang");
   for(int width:new int[]{1101,1103,1160}) {
    JSONObject r=row("device_"+f.getInt("from")+"-"+f.getInt("to"),lang,text,f.getLong("start"),f.getLong("end"),width,58);
    assertTrue(r.getJSONArray("after").length()>0);
    if(lang.equals("ja") && f.getInt("from")==145) {
     JSONArray pages=r.getJSONArray("after");
     for(int n=0;n<pages.length()-1;n++) {
      String first=pages.getJSONObject(n).getString("text"),next=pages.getJSONObject(n+1).getString("text");
      assertFalse(first.endsWith("誇張す") && next.startsWith("る"));
      assertFalse(first.endsWith("中国") && next.startsWith("の"));
     }
     assertEquals(2,pages.length());assertTrue(pages.getJSONObject(0).getString("text").endsWith("一方で、"));
    }
    rows.put(r);
   }
  }
  N28CGeometryTest.export("n29-device-seams-sdk"+android.os.Build.VERSION.SDK_INT+".json",new JSONObject().put("rows",rows));
 }
 @Test public void exactCapturedFontAndInnerWidthsUseUnmodifiedCompleteResponses()throws Exception {
  String raw;try(InputStream stream=getClass().getResourceAsStream("/n29/device-events-exact.json")){assertNotNull(stream);raw=new String(stream.readAllBytes(),StandardCharsets.UTF_8);}
  JSONArray fixtures=new JSONArray(raw),rows=new JSONArray();
  for(int i=0;i<fixtures.length();i++) {
   JSONObject f=fixtures.getJSONObject(i);String text=f.getString("text"),lang=f.getString("lang");
   JSONObject r=row("exact_device_"+f.getInt("from")+"-"+f.getInt("to"),lang,text,f.getLong("start"),f.getLong("end"),f.getInt("width"),(float)f.getDouble("size"));
   r.put("font_at",f.getLong("font_at")).put("presentation_at",f.getLong("presentation_at")).put("captured_original_page",f.getString("original_shown_page"));
   assertTrue(r.getJSONArray("after").length()>0);
   if(lang.equals("ja") && f.getInt("from")==145) {
    JSONArray pages=r.getJSONArray("after");assertEquals(2,pages.length());
    assertTrue(pages.getJSONObject(0).getString("text").endsWith("一方で、"));
    assertTrue(pages.getJSONObject(1).getString("text").startsWith("中国の"));
   }
   rows.put(r);
  }
  N28CGeometryTest.export("n29-device-exact-sdk"+android.os.Build.VERSION.SDK_INT+".json",new JSONObject().put("rows",rows));
 }
 @Test public void decimalModelsAbbreviationsQuotesNbspCrLfAndIndicStayProtected()throws Exception {
  String text="Model J-20 (12.50) and U.S. units, ‘complete words’ one\u00a0two\r\nक्ष क़ि remain visible.";
  CaptionRenderSpec spec=h.spec("en");CaptionOverlay.LayoutBudget b=new CaptionOverlay.LayoutBudget(240,32,32,spec);
  CaptionLanguagePager.Seams seams=CaptionLanguagePager.seams(text,b,spec);
  for(String unit:new String[]{"J-20","12.50","U.S","one\u00a0two","क्ष","क़ि"}) {
   int begin=text.indexOf(unit),end=begin+unit.length();
   for(int i=0;i<seams.cuts.length;i++)if(seams.cuts[i]>begin && seams.cuts[i]<end)assertEquals(CaptionLanguagePager.EMERGENCY,seams.kinds[i]);
  }
  JSONObject r=row("protected_units","en",text,0,18000,240,32);assertTrue(r.getJSONArray("after").length()>0);
 }
 @Test public void abbreviatedOrAmbiguousPeriodsAreNotDefiniteSentenceEvidence() {
  String text="Prof. Smith meets NATO. units at approx. noon; Model J-20 remains. Next complete sentence.";
  CaptionRenderSpec spec=h.spec("en");CaptionOverlay.LayoutBudget b=new CaptionOverlay.LayoutBudget(400,32,32,spec);
  CaptionLanguagePager.Seams seams=CaptionLanguagePager.seams(text,b,spec);
  for(String word:new String[]{"Prof.","NATO.","approx."}) {
   int end=text.indexOf(word)+word.length();while(end<text.length() && Character.isWhitespace(text.charAt(end)))end++;
   int at=Arrays.binarySearch(seams.cuts,end);if(at>=0)assertEquals(word,CaptionLanguagePager.WORD,seams.kinds[at]);
  }
 }
 @Test public void timeShortageNeverGrantsEmergencyForOtherwiseFittingWords()throws Exception {
  String text="aaaa bbbb cccc dddd eeee ffff";CaptionRenderSpec spec=h.spec("en");
  CaptionOverlay.LayoutBudget b=new CaptionOverlay.LayoutBudget(140,32,32,spec);
  CaptionLanguagePager.Seams s=CaptionLanguagePager.seams(text,b,spec);
  for(int kind:s.kinds)assertNotEquals(CaptionLanguagePager.EMERGENCY,kind);
  List<RebuildPageLayout.Page> pages=CaptionLanguagePager.plan(text,0,1200,b,spec);assertTrue(pages.isEmpty());
 }
 @Test public void nonChineseVersionChangesScopeOnlyAndChineseIdentityIsExact()throws Exception {
  for(String lang:new String[]{"en","ja","ar","hi","de","pt-BR"})assertEquals("n29-presentation-v3",h.spec(lang).presentationPolicy);
  for(String lang:new String[]{"zh-Hans","zh-Hant"})assertEquals("legacy_n26",h.spec(lang).presentationPolicy);
  assertEquals("n28b-policy-v1",CaptionLanguageContext.POLICY_VERSION);
 }
}
