package e.e.a;
import android.app.*;import android.content.*;import android.content.res.*;import android.preference.*;import android.view.*;import android.widget.*;import java.io.*;import java.lang.reflect.*;import org.junit.*;import static org.junit.Assert.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk={28,34,36},manifest=Config.NONE)
public class AppliedApkTest {
 static Resources apkResources;
 public static class Screen extends PreferenceActivity {
  private Resources.Theme apkTheme;
  public AssetManager getAssets(){return apkResources==null?super.getAssets():apkResources.getAssets();}
  public Resources.Theme getTheme(){if(apkResources==null)return super.getTheme();if(apkTheme==null){apkTheme=apkResources.newTheme();apkTheme.applyStyle(android.R.style.Theme_Material,true);}return apkTheme;}
  public void setTheme(int id){if(apkResources==null){super.setTheme(id);return;}getTheme().applyStyle(id,true);}

  public Resources getResources(){return apkResources==null?super.getResources():apkResources;}
  public String getPackageName(){return "com.sauzask.nicoid.hls";}
 }
 @Before public void prepare()throws Exception {
  Activity base=Robolectric.buildActivity(Activity.class).setup().get();
  AssetManager assets=AssetManager.class.getDeclaredConstructor().newInstance();
  int cookie=(Integer)AssetManager.class.getMethod("addAssetPath",String.class).invoke(assets,System.getProperty("test.apk"));assertTrue(cookie>0);
  apkResources=new Resources(assets,base.getResources().getDisplayMetrics(),base.getResources().getConfiguration()){public ClassLoader getClassLoader(){return AppliedApkTest.class.getClassLoader();}};org.robolectric.util.ReflectionHelpers.setField(apkResources,"mClassLoader",AppliedApkTest.class.getClassLoader());
 }
 @After public void cleanup(){apkResources=null;}
 @Test public void settingsFromCompiledApkContainSeekOptions()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();
  PreferenceManager.getDefaultSharedPreferences(a).edit().clear().commit();
  a.addPreferencesFromResource(0x7f120001);
  FeedbackFixes.settings(a);
  assertNull(a.findPreference("seek_thumbnails"));
  assertNull(a.findPreference("seek_local_frequency"));
  assertNotNull("graph setting missing",a.findPreference("seek_comment_density"));
 }
 @Test public void newPreferencesDefaultOnAndCanBeDisabled()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();a.addPreferencesFromResource(0x7f120001);FeedbackFixes.settings(a);
  CheckBoxPreference g=(CheckBoxPreference)a.findPreference("seek_comment_density");assertTrue(g.isChecked());g.setChecked(false);assertFalse(g.isChecked());
 }
 @Test public void actualPlayerLayoutMovesTimelineInsideEvenWithNormalControls()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();a.setTheme(0x7f1000a2);View root=LayoutInflater.from(a).inflate(0x7f0b0061,null);apkResources.getConfiguration().orientation=1;
  PreferenceManager.getDefaultSharedPreferences(a).edit().putString("player_controls_visibility_mode","normal").commit();
  com.sauzask.nicoid.NicoidVideoFragment f=new com.sauzask.nicoid.NicoidVideoFragment();f.x1=root;f.r0=false;f.B0=false;
  Revision201.normal(f);View frame=PortraitTimeline213.find(root,"videoLayout"),controller=PortraitTimeline213.find(root,"controller");assertSame(frame,controller.getParent());
  for(int j=0;j<3;j++){root.measure(View.MeasureSpec.makeMeasureSpec(1080,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1920,View.MeasureSpec.EXACTLY));root.layout(0,0,1080,1920);Revision201.normal(f);}
  assertTrue(frame.getHeight()>0);assertTrue(controller.getHeight()>0);assertEquals(frame.getHeight(),controller.getBottom());assertTrue(controller.getTop()>=0);
 }
 @Test public void mobileStandardReachesNativeModelAndStartupSelector()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();
  android.net.ConnectivityManager cm=(android.net.ConnectivityManager)a.getSystemService(Context.CONNECTIVITY_SERVICE);
  org.robolectric.shadows.ShadowConnectivityManager shadow=Shadows.shadowOf(cm);
  shadow.setActiveNetworkInfo(org.robolectric.shadows.ShadowNetworkInfo.newInstance(android.net.NetworkInfo.DetailedState.CONNECTED,android.net.ConnectivityManager.TYPE_MOBILE,0,true,true));
  cm.getActiveNetwork();shadow.setNetworkCapabilities(cm.getActiveNetwork(),new android.net.NetworkCapabilities().addTransportType(0).addCapability(12).addCapability(16));
  PreferenceManager.getDefaultSharedPreferences(a).edit().clear().putString("quality_mode","0").putString("mobile_quality_mode","2").commit();
  assertTrue(Playback214.cellular(a));d0 model=new d0(a);assertEquals(3,model.e);
  model.modernWatch=new org.json.JSONObject("{\"video\":{\"id\":\"sm30769\"},\"media\":{\"domand\":{\"videos\":[{\"id\":\"video-h264-1080p\",\"isAvailable\":true},{\"id\":\"video-h264-720p\",\"isAvailable\":true},{\"id\":\"video-h264-480p\",\"isAvailable\":true},{\"id\":\"video-h264-360p\",\"isAvailable\":true}]}}}");
  assertEquals("video-h264-480p",Playback214.targetVideo(model));
  com.sauzask.nicoid.NicoidVideoFragment owner=new com.sauzask.nicoid.NicoidVideoFragment();owner.h1=model;com.devbrackets.android.exomedia.ui.widget.VideoView video=new com.devbrackets.android.exomedia.ui.widget.VideoView(a);
  Playback214.initial(owner,video);Object selector=Playback214.selector(video);Object parameters=selector.getClass().getMethod("c").invoke(selector);assertEquals(480,Playback214.number(parameters,"i"));assertEquals(true,Playback214.get(parameters,"q"));video.release();
 }
 @Test public void popupNativeOwnerReconcilesSameAspectAfterLateLayout()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();
  com.sauzask.nicoid.NicoidPopupViewService o=new com.sauzask.nicoid.NicoidPopupViewService();
  o.a=new android.widget.FrameLayout(a);o.w=new android.widget.RelativeLayout(a);o.w.setLayoutParams(new ViewGroup.LayoutParams(1440,810));o.e=new com.devbrackets.android.exomedia.ui.widget.VideoView(a);o.e.setLayoutParams(new ViewGroup.LayoutParams(1440,810));o.i=320;o.g=240;o.o=1440;o.p=2560;o.l=24;o.U=new android.view.WindowManager.LayoutParams();o.U.width=1440;o.U.height=810;o.U.x=9999;
  PopupAspect214.sync(o);assertEquals(1080,o.U.width);assertEquals(360,o.U.x);assertEquals(810,o.U.height);
  o.U.width=1440;o.e.getLayoutParams().height=450;PopupAspect214.sync(o);assertEquals(600,o.U.width);assertEquals(450,o.U.height);o.e.release();
 }
 @Test public void actualVideoViewHasUsableSelectorBeforeUri()throws Exception {
  Screen a=Robolectric.buildActivity(Screen.class).setup().get();
  com.devbrackets.android.exomedia.ui.widget.VideoView v=new com.devbrackets.android.exomedia.ui.widget.VideoView(a);
  assertNotNull(Playback214.selector(v));v.release();
 }
}
