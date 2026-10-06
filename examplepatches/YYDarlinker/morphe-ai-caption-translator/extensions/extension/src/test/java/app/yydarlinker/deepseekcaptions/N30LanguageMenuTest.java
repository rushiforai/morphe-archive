package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.os.LocaleList;
import java.util.*;
import java.io.ByteArrayOutputStream;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows={N30LanguageMenuTest.Flags.class,N30LanguageMenuTest.Host.class})
public class N30LanguageMenuTest {
 static boolean ai,simplified;static int clones;
 static class Track {final String code,name,url,vss;Track(String c,String n){code=c;name=n;url="https://www.youtube.com/api/timedtext?v=menu-test&lang=en&tlang="+c+"&signature=KEEP";vss="t"+c+".source";}}
 @Implements(CaptionAddonSupport.class) public static class Flags {
  @Implementation public static boolean aiInstalled(){return ai;}
  @Implementation public static boolean simplifiedInstalled(){return simplified;}
 }
 @Implements(NativeCaptionBridge.class) public static class Host {
  @Implementation public static String language(Object t){return ((Track)t).code;}
  @Implementation public static CharSequence displayName(Object t){return ((Track)t).name;}
  @Implementation public static String url(Object t){return ((Track)t).url;}
  @Implementation public static Object cloneTranslation(Object t,String c){clones++;return new Track(c,NativeCaptionBridge.translationLabel(c));}
 }
 Activity a;
 @Before public void before(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);ai=true;simplified=false;clones=0;
  a.getSharedPreferences(CaptionLanguageSelection.STORE,0).edit().clear().commit();DeepSeekConfig.saveEnabled(a,false);RememberedCaptionSelection.reset();}
 @After public void after(){a.finish();}
 @Test public void emptyByDefaultPersistsCanonicalCodesAndRejectsWrongStorage(){
  assertTrue(CaptionLanguageSelection.read(a).isEmpty());assertEquals(14,CaptionLanguageSelection.CODES.size());
  CaptionLanguageSelection.save(a,Arrays.asList("zh_CN","zh-Hans","fr-CA","fr","in-ID","en-US"));
  assertEquals(Arrays.asList("en","fr","id","zh-Hans"),new ArrayList<>(CaptionLanguageSelection.read(a)));
  assertFalse(DeepSeekConfig.enabled(a));assertEquals(-1,RememberedCaptionSelection.decision());
  try{CaptionLanguageSelection.save(a,Arrays.asList("French"));fail();}catch(IllegalArgumentException expected){assertEquals("unsupported_language_code",expected.getMessage());}
  a.getSharedPreferences(CaptionLanguageSelection.STORE,0).edit().putStringSet(CaptionLanguageSelection.KEY,new HashSet<>(Arrays.asList("bad-code"))).commit();
  assertTrue(CaptionLanguageSelection.read(a).isEmpty());assertTrue(CaptionDiagnostics.fullText(a).contains("unsupported_stored_code"));
  a.getSharedPreferences(CaptionLanguageSelection.STORE,0).edit().putString(CaptionLanguageSelection.KEY,"fr").commit();assertTrue(CaptionLanguageSelection.read(a).isEmpty());
 }
 @Test public void repeatsLocalesVideosAndAiSwitchesDoNotDuplicateOrModifyNativeObjects()throws Exception{
  CaptionLanguageSelection.save(a,Arrays.asList("fr","de","ar","zh-Hans","zh-Hant"));Set<String> saved=CaptionLanguageSelection.read(a);
  org.json.JSONArray evidence=new org.json.JSONArray();
  for(String tag:new String[]{"en","zh-CN","fr","ar"}){
   Configuration cfg=new Configuration(a.getResources().getConfiguration());cfg.setLocales(new LocaleList(Locale.forLanguageTag(tag)));a.getResources().updateConfiguration(cfg,a.getResources().getDisplayMetrics());
   List<Track> nativeTracks=new ArrayList<>();for(String code:new String[]{"en","zh-CN","ja","pt","zh-TW"})nativeTracks.add(new Track(code,LanguageMenuOrder.label(code)));
   java.text.Collator collator=java.text.Collator.getInstance(LanguageMenuOrder.locale());nativeTracks.sort((x,y)->collator.compare(LanguageMenuOrder.sortLabel(x.name),LanguageMenuOrder.sortLabel(y.name)));
   for(boolean enabled:new boolean[]{false,true,false}){DeepSeekConfig.saveEnabled(a,enabled);List<?> out=NativeCaptionBridge.augmentTranslations(nativeTracks);
    assertEquals(nativeTracks.size()+3,out.size());assertEquals(nativeTracks,new ArrayList<>(out).stream().filter(nativeTracks::contains).collect(java.util.stream.Collectors.toList()));
    assertSame(out,NativeCaptionBridge.augmentTranslations(out));Set<String> unique=new HashSet<>();for(Object track:out)assertTrue(unique.add(CaptionLanguageSelection.canonical(((Track)track).code)));
    for(int i=1;i<out.size();i++)assertTrue(collator.compare(LanguageMenuOrder.sortLabel(((Track)out.get(i-1)).name),LanguageMenuOrder.sortLabel(((Track)out.get(i)).name))<=0);
    assertEquals(saved,CaptionLanguageSelection.read(a));assertEquals("",RebuildController.activeUrl());
    org.json.JSONArray menu=new org.json.JSONArray();for(int p=0;p<out.size();p++){Track t=(Track)out.get(p);menu.put(new org.json.JSONObject().put("code",t.code).put("canonical_code",CaptionLanguageSelection.canonical(t.code)).put("display_name",t.name).put("position",p).put("native_object",nativeTracks.contains(t)));}
    evidence.put(new org.json.JSONObject().put("locale",tag).put("ai_enabled",enabled).put("menu",menu));
   }
  }
  N28CGeometryTest.export("n30-menu-runtime.json",new org.json.JSONObject().put("rows",evidence).put("host_model","verified_track_seam_with_test_host_models"));
 }
 static byte[] entry(String code,String label){ByteArrayOutputStream e=new ByteArrayOutputStream(),n=new ByteArrayOutputStream();CaptionLanguageMetadata.write(e,1,code.getBytes(java.nio.charset.StandardCharsets.UTF_8));CaptionLanguageMetadata.write(n,4,label.getBytes(java.nio.charset.StandardCharsets.UTF_8));CaptionLanguageMetadata.write(e,2,n.toByteArray());return e.toByteArray();}
 @Test public void metadataIsIdempotentPreservesNativeBytesAndUsesActualNativeLabel(){
  CaptionLanguageSelection.save(a,Arrays.asList("de","en","zh-Hans"));ByteArrayOutputStream root=new ByteArrayOutputStream();byte[] en=entry("en","Native English label");CaptionLanguageMetadata.write(root,3,en);byte[] before=root.toByteArray(),after=CaptionLanguageMetadata.addSimplified(before);
  assertArrayEquals(after,CaptionLanguageMetadata.addSimplified(after));assertEquals("Native English label",NativeCaptionBridge.translationLabel("en"));
  assertEquals("languages_existing",NativeCaptionBridge.languageStatus("en"));assertEquals("languages_new",NativeCaptionBridge.languageStatus("fr"));
  List<CaptionLanguageMetadata.Field> fields=CaptionLanguageMetadata.fields(after);assertEquals(3,fields.size());assertTrue(fields.stream().anyMatch(f->Arrays.equals(f.value,en)));
 }
 @Test public void legacyNativeOnlyAndRememberOnlySelectionsDoNotEnableAiOrChangeUserSet(){
  CaptionLanguageSelection.save(a,Arrays.asList("ja","fr"));Set<String> saved=CaptionLanguageSelection.read(a);ai=false;
  Track t=new Track("en","English");List<Track> before=Arrays.asList(t);assertSame(before,NativeCaptionBridge.augmentTranslations(before));
  simplified=true;List<?> out=NativeCaptionBridge.augmentTranslations(before);assertEquals(2,out.size());assertFalse(DeepSeekConfig.enabled(a));assertEquals(saved,CaptionLanguageSelection.read(a));
  assertFalse(NativeCaptionBridge.enabled());assertEquals("",RebuildController.activeUrl());
 }
 @Test public void nativeDialogCancelDoesNotSaveAndSaveCanRemainEmptyWhileAiOff(){
  CaptionLanguagesPreference pref=new CaptionLanguagesPreference(a);AlertDialog dialog=pref.showLanguages();Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();dialog.getListView().performItemClick(dialog.getListView().getChildAt(0),0,0);
  dialog.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertTrue(CaptionLanguageSelection.read(a).isEmpty());
  dialog=pref.showLanguages();Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();dialog.getListView().performItemClick(dialog.getListView().getChildAt(0),0,0);dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertEquals(1,CaptionLanguageSelection.read(a).size());assertFalse(DeepSeekConfig.enabled(a));
 }
}
