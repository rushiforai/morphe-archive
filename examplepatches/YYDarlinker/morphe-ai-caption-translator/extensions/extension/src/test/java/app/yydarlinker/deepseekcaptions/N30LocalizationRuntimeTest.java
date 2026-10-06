package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.*;import android.content.*;import android.content.res.Configuration;import android.os.LocaleList;
import android.graphics.*;import android.view.*;import android.widget.*;import android.preference.*;
import java.util.*;import java.io.*;
import org.json.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N30LocalizationRuntimeTest {
 public static class HostedPreferences extends PreferenceActivity {}
 static final String[] TAGS={"en","zh-CN","zh-TW","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi"};
 static final String[] KEYS={"ai_quick_toggle_on","ai_quick_toggle_off","ai_summary","languages_title","languages_summary","languages_count","languages_save","languages_existing","languages_new","languages_unavailable","languages_empty","default_prompt","size_tier_xs","size_tier_s","size_tier_standard","size_tier_l","size_tier_xl","size_tier_hint","preview","preview_sample","preview_hint","cancel","save_diagnostics","audit_current_model","audit_title"};
 @Test public void everyRuntimeKeyAnd320DpLargeFontRowResolvesWithoutEllipsisOrChineseFallback()throws Exception {
  RuntimeEnvironment.getApplication().getApplicationInfo().flags |= android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
  Activity a=Robolectric.buildActivity(HostedPreferences.class).setup().get();JSONArray rows=new JSONArray();
  for(String tag:TAGS){Configuration cfg=new Configuration(a.getResources().getConfiguration());cfg.setLocales(new LocaleList(Locale.forLanguageTag(tag)));cfg.fontScale=1.3f;Context c=a.createConfigurationContext(cfg);
   for(String key:KEYS){int id=c.getResources().getIdentifier("cap_"+key,"string",c.getPackageName());assertNotEquals(tag+":"+key,0,id);String s=CaptionStrings.settings(c,key);assertEquals(c.getString(id),s);assertFalse(s.contains("cap_"));assertNotEquals(key,s);
    if(!tag.startsWith("zh")&&!tag.equals("ja"))assertFalse(tag+":"+key,s.matches("(?s).*[\\p{IsHan}].*"));}
   assertNotEquals(CaptionStrings.settings(c,"autosave"),CaptionStrings.settings(c,"ai_summary"));assertEquals(CaptionStrings.settings(c,"default_prompt"),DeepSeekConfig.defaultPrompt(c));
   LinearLayout page=new LinearLayout(c);page.setOrientation(LinearLayout.VERTICAL);page.setPadding(16,8,16,8);page.setBackgroundColor(Color.WHITE);page.setLayoutDirection(tag.equals("ar")?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
   for(String key:new String[]{"ai_quick_toggle_on","ai_quick_toggle_off","ai_summary","languages_title","languages_summary","languages_empty","preview"}){TextView v=new TextView(c);v.setText(CaptionStrings.settings(c,key));v.setTextSize(18);v.setTextColor(Color.BLACK);v.setEllipsize(null);v.setMaxLines(Integer.MAX_VALUE);page.addView(v,new LinearLayout.LayoutParams(-1,-2));}
   PreferenceManager pm=((PreferenceActivity)a).getPreferenceManager();PreferenceScreen screen=pm.createPreferenceScreen(c);screen.setTitle(CaptionStrings.settings(c,"ai_title"));screen.setSummary(CaptionStrings.settings(c,"ai_summary"));screen.setSingleLineTitle(false);screen.setIconSpaceReserved(false);
   View entry=screen.getView(null,new FrameLayout(c));page.addView(entry,new LinearLayout.LayoutParams(-1,-2));
   CaptionLanguagesPreference pref=new CaptionLanguagesPreference(c);View row=pref.getView(null,new FrameLayout(c));page.addView(row,new LinearLayout.LayoutParams(-1,-2));
   int width=Math.round(320*c.getResources().getDisplayMetrics().density);page.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));page.layout(0,0,width,page.getMeasuredHeight());
   assertEquals(tag.equals("ar")?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR,page.getLayoutDirection());
   for(int i=0;i<page.getChildCount()-2;i++)check((TextView)page.getChildAt(i));check(entry.findViewById(android.R.id.title));check(entry.findViewById(android.R.id.summary));check(row.findViewById(android.R.id.title));check(row.findViewById(android.R.id.summary));
   rows.put(new JSONObject().put("locale",tag).put("resource_keys",KEYS.length).put("width_dp",320).put("font_scale",1.3).put("height_px",page.getHeight()).put("ellipsis",0).put("rtl",tag.equals("ar")));
   if(Arrays.asList("en","zh-CN","fr","ar").contains(tag)){String dir=System.getenv("N30_EVIDENCE_DIR");if(dir!=null){Bitmap b=Bitmap.createBitmap(width,page.getHeight(),Bitmap.Config.ARGB_8888);page.draw(new Canvas(b));try(FileOutputStream out=new FileOutputStream(new File(dir,"n30-ui-"+tag+".png"))){b.compress(Bitmap.CompressFormat.PNG,100,out);}}}
  }a.finish();N28CGeometryTest.export("n30-localization-runtime.json",new JSONObject().put("rows",rows));
 }
 static void check(TextView text){assertNotNull(text);assertNotNull(text.getLayout());assertEquals(text.length(),text.getLayout().getLineEnd(text.getLayout().getLineCount()-1));for(int i=0;i<text.getLayout().getLineCount();i++)assertEquals(0,text.getLayout().getEllipsisCount(i));}
 @Test public void fullNativeMultiChoiceRowsWrapAt320DpInEveryLocale(){Activity a=Robolectric.buildActivity(Activity.class).setup().get();
  for(String tag:TAGS){Configuration cfg=new Configuration(a.getResources().getConfiguration());cfg.setLocales(new LocaleList(Locale.forLanguageTag(tag)));cfg.fontScale=1.3f;Context c=a.createConfigurationContext(cfg);
   CaptionLanguagesPreference p=new CaptionLanguagesPreference(c);AlertDialog d=p.showLanguages();ListView list=d.getListView();
   for(int i=0;i<list.getAdapter().getCount();i++){View row=list.getAdapter().getView(i,null,list);int width=Math.round(280*c.getResources().getDisplayMetrics().density);row.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));row.layout(0,0,width,row.getMeasuredHeight());check(row.findViewById(android.R.id.text1));}
   d.dismiss();}a.finish();}
 @Test public void all232AuthoredKeysResolveInTheirActualLocaleNotAnEnglishOrChineseFallback()throws Exception {
  JSONObject expected=new JSONObject(new String(getClass().getResourceAsStream("/n30/localization-expected.json").readAllBytes(),"UTF-8"));Activity a=Robolectric.buildActivity(Activity.class).setup().get();
  for(String tag:TAGS){String folder=tag.equals("zh-CN")?"zh-rCN":tag.equals("zh-TW")?"zh-rTW":tag;JSONObject values=expected.getJSONObject(folder);assertEquals(232,values.length());
   Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocales(new LocaleList(Locale.forLanguageTag(tag)));Context c=a.createConfigurationContext(config);
   java.util.Iterator<String> keys=values.keys();while(keys.hasNext()){String key=keys.next();assertEquals(tag+":"+key,values.getString(key),CaptionStrings.settings(c,key));}
  }a.finish();
 }
 @Test public void missingResourceFallbackNeverLeaksAKeyOrChinese(){assertEquals("AI caption translation · On",CaptionStrings.get(null,"ai_quick_toggle_on"));assertEquals("AI caption translation · Off",CaptionStrings.get(null,"ai_quick_toggle_off"));assertEquals("",CaptionStrings.get(null,"unknown_missing_key"));}
 @Test public void rawTechnicalExportRemainsEnglishWhileEvidenceIsVerbatim(){Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionDiagnostics.clear(a);String evidence="source=原始证据;response=texte brut;prompt=自定义";CaptionDiagnostics.mark(a,"N30_RAW_EVIDENCE",evidence);
  String raw=CaptionDiagnostics.fullText(a);assertTrue(raw.contains("Engine: "));assertTrue(raw.contains("Latest stage: "));assertTrue(raw.contains("N30_RAW_EVIDENCE"));assertTrue(raw.contains(evidence));a.finish();}
}
