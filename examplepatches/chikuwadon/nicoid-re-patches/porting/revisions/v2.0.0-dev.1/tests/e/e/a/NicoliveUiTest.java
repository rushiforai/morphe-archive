package e.e.a;
import android.app.*;import android.content.*;import android.content.res.*;import android.graphics.*;import android.os.*;import android.preference.PreferenceManager;import android.view.*;import android.widget.*;import java.util.*;import org.junit.*;import static org.junit.Assert.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.android.controller.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk={28,34,36},manifest=Config.NONE)
public class NicoliveUiTest {
 static Resources apkResources;
 public static class Screen extends NicoliveActivity {
  Resources.Theme theme;
  boolean loadCatalog;
  public Resources getResources(){return apkResources==null?super.getResources():apkResources;}
  public AssetManager getAssets(){return apkResources==null?super.getAssets():apkResources.getAssets();}
  public Resources.Theme getTheme(){if(apkResources==null)return super.getTheme();if(theme==null){theme=getResources().newTheme();theme.applyStyle(android.R.style.Theme_Material,true);}return theme;}
  public void setTheme(int id){if(apkResources==null)super.setTheme(id);else getTheme().applyStyle(id,true);}
  public String getPackageName(){return "com.sauzask.nicoid.hls";}
  @Override void load(){if(loadCatalog)super.load();else if(status!=null)status.setText("テスト番組");}
  @Override void bind(){}
 }
 ActivityController<Screen> controller;Screen a;
 @Before public void setup()throws Exception {
  Resources device=RuntimeEnvironment.getApplication().getResources();
  AssetManager assets=AssetManager.class.getDeclaredConstructor().newInstance();
  int cookie=(Integer)AssetManager.class.getMethod("addAssetPath",String.class).invoke(assets,System.getProperty("test.apk"));
  assertTrue("Expected resources from the applied APK",cookie>0);
  apkResources=new Resources(assets,device.getDisplayMetrics(),device.getConfiguration()){
   @Override public ClassLoader getClassLoader(){return NicoliveUiTest.class.getClassLoader();}
  };
  org.robolectric.util.ReflectionHelpers.setField(apkResources,"mClassLoader",NicoliveUiTest.class.getClassLoader());
  controller=Robolectric.buildActivity(Screen.class);
  a=controller.setup().get();
 }
 @After public void cleanup(){if(controller!=null)controller.pause().stop().destroy();apkResources=null;}
 static void layout(View v,int width,int height){v.measure(View.MeasureSpec.makeMeasureSpec(width,1073741824),View.MeasureSpec.makeMeasureSpec(height,1073741824));v.layout(0,0,width,height);}
 @Test @Config(sdk=36) @GraphicsMode(GraphicsMode.Mode.NATIVE) public void lightDarkAndMaterialThemesUseReadableNativeColors()throws Exception{
  for(boolean night:new boolean[]{false,true})for(boolean material:new boolean[]{false,true}){
   controller.pause().stop().destroy();android.content.res.Configuration config=new android.content.res.Configuration(apkResources.getConfiguration());config.uiMode=(config.uiMode&~48)|(night?32:16);apkResources.updateConfiguration(config,apkResources.getDisplayMetrics());PreferenceManager.getDefaultSharedPreferences(a).edit().putString("app_theme",material?"material":night?"dark":"light").putBoolean("material_you_mode",material).commit();controller=Robolectric.buildActivity(Screen.class);a=controller.setup().get();
   ServiceController<NicoliveService> serviceController=Robolectric.buildService(NicoliveService.class);NicoliveService service=serviceController.create().get();try{a.service=service;a.watching=true;a.requested=service.id="lv123";NicoliveData.Program p=new NicoliveData.Program("lv123");p.title="放送中の番組 / ゆっくり雑談";p.owner="放送者";p.provider="user";p.status="ON_AIR";p.begin=System.currentTimeMillis()/1000-5400;p.loggedIn=true;p.views=1234;p.comments=5678;p.description="番組情報のテキストです。";service.program=p;service.status="LIVE";String[] sample={"こんばんは","音声も聞こえています","今日はどんなお話ですか？","コメント表示の確認です","よろしくお願いします"};for(int i=0;i<sample.length;i++){NicoliveData.Chat c=new NicoliveData.Chat();c.text=sample[i];c.vpos=540000+i*100;service.history.add(c);}service.deliveredCount=sample.length;service.player.play();a.viewer();a.input.setText("コメントの下書き");layout(a.root,360,760);a.fitViewer();layout(a.root,360,760);
    int background=((android.graphics.drawable.ColorDrawable)a.root.getBackground()).getColor();assertEquals("Theme brightness",night,luminance(background)<.5);assertTrue("Primary text contrast",contrast(a.title.getCurrentTextColor(),background)>=4.5);assertEquals(NicoliveUi.accent(a),a.input.getBackgroundTintList().getDefaultColor());assertEquals(NicoliveUi.accent(a),a.anonymous.getButtonTintList().getDefaultColor());assertTrue(a.playerFrame.live.getText().toString().startsWith("LIVE"));assertNotNull(a.playerFrame.live.getLayout());String suffix=(material?"material":"classic")+(night?"-dark":"-light");snapshot(a.root,suffix);
    a.hub();for(int i=0;i<4;i++){NicoliveData.Program item=new NicoliveData.Program("lv"+(100+i));item.title=new String[]{"のんびりゲーム配信 / 続きから","新しい作品について話します","今週のニュースと解説","音楽を聴きながら雑談"}[i];item.owner="放送者 "+(i+1);item.status="ON_AIR";item.provider=i==2?"official":i==1?"channel":"user";item.begin=System.currentTimeMillis()/1000-(i+1)*1260;item.views=123*(i+1);item.comments=54*(i+1);a.programs.add(item);}a.feedAdapter.notifyDataSetChanged();layout(a.root,360,760);snapshot(a.root,"hub-"+suffix);
    assertLiveSettingsChoices();
   }finally{a.service=null;serviceController.destroy();}
  }
 }
 static void snapshot(View view,String name)throws Exception{Bitmap bitmap=Bitmap.createBitmap(360,760,Bitmap.Config.ARGB_8888);view.draw(new Canvas(bitmap));java.io.File dir=new java.io.File("build/ui");dir.mkdirs();try(java.io.FileOutputStream out=new java.io.FileOutputStream(new java.io.File(dir,name+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}bitmap.recycle();}
 static double contrast(int a,int b){double x=luminance(a),y=luminance(b);return (Math.max(x,y)+.05)/(Math.min(x,y)+.05);}
 static double luminance(int color){double[] c={Color.red(color)/255d,Color.green(color)/255d,Color.blue(color)/255d};for(int i=0;i<3;i++)c[i]=c[i]<=.04045?c[i]/12.92:Math.pow((c[i]+.055)/1.055,2.4);return c[0]*.2126+c[1]*.7152+c[2]*.0722;}
 @Test public void sidebarEntryFollowsShortsAndRespectsItsOwnPreference(){
  android.content.SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(a);
  prefs.edit().remove("show_nicolive_menu").commit();
  ArrayList<Map<String,Object>> menu=new ArrayList<>();
  Map<String,Object> ranking=new HashMap<>(),shorts=new HashMap<>(),search=new HashMap<>();
  shorts.put("intent",new Intent().setData(android.net.Uri.parse("nicoid-re://shorts")));
  menu.add(ranking);menu.add(shorts);menu.add(search);
  NicoliveEntry.addMenu(a,menu);
  assertSame(shorts,menu.get(1));
  assertEquals("nicoid_live",menu.get(2).get("id"));
  assertSame(search,menu.get(3));
  prefs.edit().putBoolean("show_nicolive_menu",false).commit();
  NicoliveEntry.addMenu(a,menu);
  assertEquals(Arrays.asList(ranking,shorts,search),menu);
 }

 public static class TestSettings extends android.preference.PreferenceActivity {}

 @Test public void livePreferenceIsInsertedBetweenShortsAndNextRow(){
  android.preference.PreferenceActivity settings=Robolectric.buildActivity(TestSettings.class).setup().get();
  android.preference.PreferenceScreen screen=settings.getPreferenceManager().createPreferenceScreen(settings);
  settings.setPreferenceScreen(screen);
  android.preference.PreferenceCategory other=new android.preference.PreferenceCategory(settings);
  screen.addPreference(other);
  android.preference.CheckBoxPreference shorts=new android.preference.CheckBoxPreference(settings);
  shorts.setKey("show_shorts_menu");shorts.setOrder(8);other.addPreference(shorts);
  android.preference.Preference next=new android.preference.Preference(settings);
  next.setOrder(9);other.addPreference(next);
  NicoliveEntry.settings(settings,other);
  NicoliveEntry.settings(settings,other);
  assertEquals(3,other.getPreferenceCount());
  assertSame(shorts,other.getPreference(0));
  assertEquals("show_nicolive_menu",other.getPreference(1).getKey());
  assertSame(next,other.getPreference(2));
 }

 @Test public void bottomRefreshAndCloseBroadcastAreAvailable(){
  assertNotNull(a.root.findViewWithTag("nicoid-live-bottom-refresh"));
  assertEquals(View.GONE,a.nowPlayingBar.getVisibility());
  ServiceController<NicoliveService> controller=Robolectric.buildService(NicoliveService.class).create();
  NicoliveService live=controller.get();
  try{
   live.id="lv123";
   a.updateNowPlaying();
   assertEquals(View.VISIBLE,a.nowPlayingBar.getVisibility());
   a.root.findViewWithTag("nicoid-live-close-broadcast").performClick();
   assertTrue(live.stopped);
   assertEquals(View.GONE,a.nowPlayingBar.getVisibility());
  }finally{controller.destroy();}
 }

 @Test public void tabGesturesMoveOnlyBroadcastCategories(){
  NicoliveListGestures.perform(a,a.feed,"righttab");
  assertEquals(1,a.category);
  assertEquals(0,a.hubTab);
  NicoliveListGestures.perform(a,a.feed,"lefttab");
  assertEquals(0,a.category);
  a.hubTab=1;
  NicoliveListGestures.perform(a,a.feed,"righttab");
  assertEquals(0,a.category);
  assertEquals(1,a.hubTab);
 }

 @Test public void sidebarAddsOneNativeIntent(){ArrayList<Map<String,Object>> menu=new ArrayList<Map<String,Object>>();NicoliveEntry.addMenu(a,menu);NicoliveEntry.addMenu(a,menu);assertEquals(1,menu.size());assertEquals(NicoliveUi.ja(a)?"ニコ生の視聴":"Watch Niconico Live",menu.get(0).get("subtitle"));assertEquals(NicoliveActivity.class.getName(),((Intent)menu.get(0).get("intent")).getComponent().getClassName());}
 @Test public void liveGestureFollowsShortsAndOpensTheNativeHub(){
  String[] original={"menu_ranking","menu_shorts","menu_video_id"};
  assertArrayEquals(new String[]{"menu_ranking","menu_shorts","menu_nicolive","menu_video_id"},
      NicoliveEntry.gestureActions(original));
  assertNotNull(NicoliveEntry.gestureName(a,"menu_nicolive"));
  assertNull(NicoliveEntry.gestureName(a,"menu_shorts"));
  assertFalse(NicoliveEntry.performGesture(a,"menu_shorts"));
  assertTrue(NicoliveEntry.performGesture(a,"menu_nicolive"));
  assertEquals(NicoliveActivity.class.getName(),Shadows.shadowOf(a).getNextStartedActivity().getComponent().getClassName());
 }
 @Test public void livePagesAndTimetableUseIndependentLists()throws Exception{
  final List<String> requestedUrls=new ArrayList<>();
  final List<NicoliveBrowser.Result> responses=new ArrayList<>();
  a.browser.close();
  a.browser=new NicoliveBrowser(){
   @Override void load(String url,String cookie,Result result){requestedUrls.add(url);responses.add(result);}
  };
  a.loadCatalog=true;
  a.hub();
  assertTrue(requestedUrls.get(0).endsWith("offset=0"));

  org.json.JSONArray rows=new org.json.JSONArray();
  for(int id=1;id<=70;id++)rows.put(new org.json.JSONObject().put("id","lv"+id)
      .put("liveCycle","ON_AIR").put("providerType","community").put("beginAt",1794406725000L-id*1000));
  org.json.JSONObject result=new org.json.JSONObject().put("meta",new org.json.JSONObject().put("totalCount",72));
  responses.get(0).done(result.put("data",rows).toString());
  assertTrue(requestedUrls.get(1).contains("/timetable?date="));
  assertEquals(70,a.feedAdapter.getCount());
  org.json.JSONArray schedule=new org.json.JSONArray()
      .put(new org.json.JSONObject().put("nicoliveProgramId","lv100").put("title","公式生放送")
          .put("beginTime",1794406700).put("providerType","official").put("status","ON_AIR"))
      .put(new org.json.JSONObject().put("nicoliveProgramId","lv101").put("title","放送予定")
          .put("beginTime",1794409900).put("providerType","channel").put("status","RELEASED"));
  String date=requestedUrls.get(1).split("date=")[1];
  long day=java.time.LocalDate.parse(date,NicoliveCatalog.DAY).atStartOfDay(NicoliveCatalog.JAPAN).toInstant().toEpochMilli();
  String timetable="<script id='embedded-data' data-props='"
      +new org.json.JSONObject().put("view",new org.json.JSONObject().put("programs",schedule).put("date",day))+"'></script>";
  responses.get(1).done(timetable);
  assertTrue(requestedUrls.get(2).endsWith("offset=1"));
  org.json.JSONArray lastPage=new org.json.JSONArray().put(rows.getJSONObject(69)).put(new org.json.JSONObject().put("id","lv71")
      .put("liveCycle","ON_AIR").put("providerType","channel"));
  responses.get(2).done(result.put("data",lastPage).toString());
  assertEquals(72,a.feedAdapter.getCount());
  assertEquals(0,a.feed.getFooterViewsCount());
  a.refreshFeed();
  assertTrue(requestedUrls.get(3).endsWith("offset=0"));
  responses.get(3).done(result.put("data",rows).toString());
  assertEquals(72,a.feedAdapter.getCount());
  responses.get(4).done(timetable);
  assertTrue(requestedUrls.get(5).endsWith("offset=1"));
  responses.get(5).error();
  assertEquals(72,a.feedAdapter.getCount());
  assertTrue(a.status.getText().toString().contains("再試行"));
  a.refreshFeed();
  responses.get(6).done(result.put("data",rows).toString());
  responses.get(7).done(timetable);
  responses.get(8).done(result.put("data",lastPage).toString());
  assertEquals(72,a.feedAdapter.getCount());
  a.selectCategory(2);
  assertEquals(1,a.feedAdapter.getCount());

  a.watching=true;
  a.hub();
  assertEquals(9,requestedUrls.size());
  assertEquals(1,a.feedAdapter.getCount());

  LinearLayout tabs=a.root.findViewWithTag("nicoid-live-navigation");
  tabs.getChildAt(2).performClick();
  assertEquals(0,a.feedAdapter.getCount());
  responses.get(9).done(timetable);
  assertEquals(2,a.feedAdapter.getCount());
  NicoliveData.Program scheduled=(NicoliveData.Program)a.feedAdapter.getItem(1);
  assertEquals("lv101",scheduled.id);
  assertTrue(a.programLabel(scheduled).contains("放送予定"));
  a.selectSort(NicoliveCatalog.Sort.NEWEST);
  assertSame(scheduled,a.feedAdapter.getItem(0));
  assertEquals(10,requestedUrls.size());

  NicoliveSwipeLayout swipe=(NicoliveSwipeLayout)a.root;
  MotionEvent down=MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,290,280,0);
  MotionEvent move=MotionEvent.obtain(0,50,MotionEvent.ACTION_MOVE,170,280,0);
  MotionEvent up=MotionEvent.obtain(0,90,MotionEvent.ACTION_UP,80,280,0);
  swipe.onInterceptTouchEvent(down);
  assertTrue(swipe.onInterceptTouchEvent(move));
  assertTrue(swipe.onTouchEvent(up));
  down.recycle();move.recycle();up.recycle();
  String next=java.time.LocalDate.parse(date,NicoliveCatalog.DAY).plusDays(1).format(NicoliveCatalog.DAY);
  assertTrue(requestedUrls.get(10).endsWith("date="+next));
  assertEquals(0,a.feedAdapter.getCount());
  responses.get(9).done(timetable);
  assertEquals(0,a.feedAdapter.getCount());
  responses.get(10).done(timetable);
  assertEquals("番組はありません",a.status.getText().toString());

  a.root.<LinearLayout>findViewWithTag("nicoid-live-navigation").getChildAt(0).performClick();
  a.selectSort(NicoliveCatalog.Sort.COMMENTS);
  assertTrue(requestedUrls.get(11).contains("recentDesc&offset=0"));
  assertTrue(requestedUrls.get(12).contains("commentCountDesc&offset=0"));
  responses.get(11).done(result.toString());
  assertEquals(0,a.feedAdapter.getCount());
  assertEquals("COMMENTS",PreferenceManager.getDefaultSharedPreferences(a).getString("nicolive_live_sort",""));
  assertEquals("NEWEST",PreferenceManager.getDefaultSharedPreferences(a).getString("nicolive_timetable_sort",""));
 }

 @Test public void hubKeepsListAboveNavigationAndClipsOnlyThumbnails(){
  layout(a.root,360,760);
  View navigation=a.root.findViewWithTag("nicoid-live-navigation");
  assertSame(navigation,a.body.getChildAt(a.body.getChildCount()-1));
  assertTrue(navigation.getTop()>0);
  assertTrue(a.feed.getHeight()>navigation.getHeight()*5);
  Button sort=a.root.findViewWithTag("nicoid-live-sort");
  assertSame(a.status.getParent(),sort.getParent());
  assertTrue(sort.getWidth()>0);
  for(int index=0;index<6;index++){
   LinearLayout destination=(LinearLayout)((LinearLayout)navigation).getChildAt(index);
   TextView caption=(TextView)destination.getChildAt(1);
   assertTrue(caption.getHeight()>0);
   assertTrue(caption.getBottom()<=destination.getHeight());
  }

  FrameLayout row=new FrameLayout(a);
  ImageView image=new ImageView(a),avatar=new ImageView(a);
  View overlay=new View(a);
  image.setId(0x7f0800cd);
  row.addView(image);
  row.addView(avatar);
  row.addView(overlay);
  ThumbnailCorners.applyNative(row);
  assertTrue(image.getClipToOutline());
  ViewOutlineProvider outline=image.getOutlineProvider();
  ThumbnailCorners.applyNative(row);
  assertSame(outline,image.getOutlineProvider());
  assertFalse(avatar.getClipToOutline());
  assertFalse(overlay.getClipToOutline());
 }
 @Test public void rankingAndReservationTabPositionsAndLiveBadges(){
  LinearLayout navigation=a.root.findViewWithTag("nicoid-live-navigation");
  assertEquals(Arrays.asList("放送中","ランキング","番組表","フォロー","履歴","タイムシフト予約リスト"),
   Arrays.asList(navigation.getChildAt(0).getContentDescription(),navigation.getChildAt(1).getContentDescription(),
    navigation.getChildAt(2).getContentDescription(),navigation.getChildAt(3).getContentDescription(),
    navigation.getChildAt(4).getContentDescription(),navigation.getChildAt(5).getContentDescription()));
  navigation.getChildAt(1).performClick();
  assertNull(a.categoryTabs);
  assertTrue(a.officialPage().contains("/ranking"));
  navigation=a.root.findViewWithTag("nicoid-live-navigation");
  assertTrue(navigation.getChildAt(1).isSelected());
  navigation.getChildAt(0).performClick();
  assertTrue(a.categoryTabs.getChildAt(0).isSelected());
  a.moveCategory(-1);
  assertTrue(a.categoryTabs.getChildAt(0).isSelected());

  NicoliveData.Program row=new NicoliveData.Program("lv100");
  row.status="ON_AIR";
  a.programs.add(row);
  a.feedAdapter.notifyDataSetChanged();
  LinearLayout item=(LinearLayout)a.feedAdapter.getView(0,null,a.feed);
  TextView badge=(TextView)((FrameLayout)item.getChildAt(0)).getChildAt(1);
  assertEquals("LIVE",badge.getText().toString());
  row.status="RELEASED";
  row.reservations=1708;
  assertSame(item,a.feedAdapter.getView(0,item,a.feed));
  assertEquals("放送予定",badge.getText().toString());
  assertTrue(((TextView)((LinearLayout)item.getChildAt(1)).getChildAt(3)).getText().toString().contains("1,708"));
  row.status="ENDED";
  a.feedAdapter.getView(0,item,a.feed);
  assertEquals(View.GONE,badge.getVisibility());

  navigation=a.root.findViewWithTag("nicoid-live-navigation");
  navigation.getChildAt(3).performClick();
  a.moveCategory(1);
  assertTrue(((LinearLayout)a.body.getChildAt(0)).getChildAt(1).isSelected());
  a.moveCategory(-1);
  assertTrue(((LinearLayout)a.body.getChildAt(0)).getChildAt(0).isSelected());
 }

 @Test public void timetableDateStripIncludesOnAirBetweenYesterdayAndToday(){
  a.root.<LinearLayout>findViewWithTag("nicoid-live-navigation").getChildAt(2).performClick();
  HorizontalScrollView strip=a.root.findViewWithTag("nicoid-live-timetable-dates");
  LinearLayout dates=(LinearLayout)strip.getChildAt(0);
  assertEquals(16,dates.getChildCount());
  assertEquals("放送中",((Button)dates.getChildAt(7)).getText());
  assertEquals("今日",((Button)dates.getChildAt(8)).getText());
  assertTrue(dates.getChildAt(8).isSelected());
  a.moveCategory(-1);
  dates=(LinearLayout)a.root.<HorizontalScrollView>findViewWithTag("nicoid-live-timetable-dates").getChildAt(0);
  assertTrue(dates.getChildAt(7).isSelected());
  assertEquals("https://live.nicovideo.jp/timetable",a.officialPage());
  a.moveCategory(-1);
  dates=(LinearLayout)a.root.<HorizontalScrollView>findViewWithTag("nicoid-live-timetable-dates").getChildAt(0);
  assertTrue(dates.getChildAt(6).isSelected());
 }

 @Test public void liveMenuAndBothBackRoutesRespectExitConfirmation(){
  a.root.findViewWithTag("nicoid-live-menu").performClick();
  AlertDialog menu=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
  assertEquals(3,menu.getListView().getCount());
  assertEquals("ニコ生の設定",menu.getListView().getItemAtPosition(1).toString());
  menu.dismiss();
  a.header.getChildAt(0).performClick();
  AlertDialog confirm=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
  assertTrue(confirm.isShowing());
  assertFalse(a.isFinishing());
  confirm.dismiss();
  a.onBackPressed();
  assertTrue(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().isShowing());
  org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().dismiss();
  PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("nicolive_exit_confirm",false).commit();
  a.onBackPressed();
  assertTrue(a.isFinishing());
 }

 @Test public void gestureAxisOptionsControlRecognitionAndOpenSeparateHelp(){
  SharedPreferences preferences=GestureControls110.prefs(a);
  preferences.edit().putString("app_lang","0").putBoolean("list_gestures_enabled",true).commit();
  GestureControls110.configure(a);
  AlertDialog settings=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
  String[] labels={"上下方向のみのジェスチャーを認識","左右方向のみのジェスチャーを認識"};
  CheckBox[] options=new CheckBox[2];
  for(int i=0;i<labels.length;i++){
   ArrayList<View> found=new ArrayList<>();
   settings.getWindow().getDecorView().findViewsWithText(found,labels[i],View.FIND_VIEWS_WITH_TEXT);
   assertEquals(1,found.size());
   options[i]=(CheckBox)found.get(0);
   assertEquals(i==1,options[i].isChecked());
   LinearLayout row=(LinearLayout)options[i].getParent();
   assertEquals(2,row.getChildCount());
   View note=row.getChildAt(1);
   assertEquals(labels[i]+"の説明",note.getContentDescription());
   note.performClick();
   AlertDialog help=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
   TextView description=help.findViewById(android.R.id.message);
   assertTrue(description.getText().toString().contains(i==0?"↑↓":"←→"));
   assertEquals(i==1,options[i].isChecked());
   help.dismiss();
  }
  assertFalse(Dev128.allowClaim(a,"UDU"));
  assertTrue(Dev128.allowClaim(a,"RLR"));
  options[0].setChecked(true);
  options[1].setChecked(false);
  assertTrue(Dev128.allowClaim(a,"UDU"));
  assertFalse(Dev128.allowClaim(a,"RLR"));
  assertFalse(Dev128.allowClaim(a,"LR"));
  assertTrue(Dev128.allowClaim(a,"LRU"));
  assertTrue(Dev128.allowClaim(a,"UDL"));
  options[0].setChecked(false);
  assertFalse(Dev128.allowClaim(a,"DU"));
  assertTrue(Dev128.allowClaim(a,"LRD"));
  options[0].setChecked(true);
  Dev128.reset(a);
  assertFalse(Dev128.allowClaim(a,"UD"));
  assertTrue(Dev128.allowClaim(a,"RL"));
  assertTrue(preferences.getBoolean("list_gestures_enabled",false));
  settings.dismiss();
 }

 @Test public void generalSettingsSortPlacesTabHeightImmediatelyAfterPlacement(){
  ActivityController<TestSettings> owner=Robolectric.buildActivity(TestSettings.class).setup();
  try{
   TestSettings settings=owner.get();
   android.preference.PreferenceScreen screen=settings.getPreferenceManager().createPreferenceScreen(settings);
   settings.setPreferenceScreen(screen);
   android.preference.PreferenceCategory general=new android.preference.PreferenceCategory(settings);
   general.setKey("setting_whole");
   screen.addPreference(general);
   android.preference.CheckBoxPreference enabled=new android.preference.CheckBoxPreference(settings);
   enabled.setKey("multiple_video_tabs");
   general.addPreference(enabled);
   enabled.setChecked(true);
   android.preference.Preference mode=new android.preference.Preference(settings);
   mode.setKey("play_mode");
   general.addPreference(mode);
   Dev111.settings(settings);
   Dev111.settings(settings);
   ArrayList<String> keys=new ArrayList<>();
   for(int i=0;i<general.getPreferenceCount();i++)keys.add(general.getPreference(i).getKey());
   int index=keys.indexOf("multiple_video_tabs");
   assertEquals("multiple_video_tabs_at_bottom",keys.get(index+1));
   assertEquals("multiple_video_tabs_height_dp",keys.get(index+2));
   assertEquals("nicoid_tab_bar_buttons",keys.get(index+3));
   assertEquals(1,Collections.frequency(keys,"multiple_video_tabs_height_dp"));
   android.preference.Preference height=settings.findPreference("multiple_video_tabs_height_dp");
   assertTrue(height.getSummary().toString().contains("32 dp"));
   height.getOnPreferenceClickListener().onPreferenceClick(height);
   AlertDialog dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
   SeekBar slider=findSeekBar(dialog.getWindow().getDecorView());
   assertNotNull(slider);
   slider.setProgress(50-MultiTabPlacement.MIN_HEIGHT);
   dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
   Shadows.shadowOf(Looper.getMainLooper()).idle();
   assertTrue(height.getSummary().toString().contains("50 dp"));
   height.getOnPreferenceClickListener().onPreferenceClick(height);
   dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
   slider=findSeekBar(dialog.getWindow().getDecorView());
   assertEquals(50-MultiTabPlacement.MIN_HEIGHT,slider.getProgress());
   dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
   assertTrue(dialog.isShowing());
   assertEquals(32-MultiTabPlacement.MIN_HEIGHT,slider.getProgress());
   dialog.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
   Shadows.shadowOf(Looper.getMainLooper()).idle();
   assertTrue(height.getSummary().toString().contains("50 dp"));
   height.getOnPreferenceClickListener().onPreferenceClick(height);
   dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
   dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
   dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
   Shadows.shadowOf(Looper.getMainLooper()).idle();
   assertTrue(height.getSummary().toString().contains("32 dp"));
  }finally{owner.pause().stop().destroy();}
 }

 private SeekBar findSeekBar(View view){
  if(view instanceof SeekBar)return (SeekBar)view;
  if(view instanceof ViewGroup){
   ViewGroup group=(ViewGroup)view;
   for(int i=0;i<group.getChildCount();i++){
    SeekBar slider=findSeekBar(group.getChildAt(i));
    if(slider!=null)return slider;
   }
  }
  return null;
 }

 @Test public void liveSettingsChoicesAreStartAlignedAndColorOnlyTheCurrentValue(){
  assertLiveSettingsChoices();
 }

 private void assertLiveSettingsChoices(){
  a.root.findViewWithTag("nicoid-live-menu").performClick();
  AlertDialog menu=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
  menu.getListView().performItemClick(null,1,1);
  AlertDialog settings=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
  View decor=settings.getWindow().getDecorView();
  for(String title:new String[]{"最初に開くタブ","放送中の時刻表示"}){
   ArrayList<View> found=new ArrayList<>();
   decor.findViewsWithText(found,title,View.FIND_VIEWS_WITH_TEXT);
   assertEquals(1,found.size());
   Button button=(Button)found.get(0);
   assertEquals(Gravity.START,button.getGravity()&Gravity.RELATIVE_HORIZONTAL_GRAVITY_MASK);
   android.text.Spanned text=(android.text.Spanned)button.getText();
   android.text.style.ForegroundColorSpan[] colors=text.getSpans(0,text.length(),android.text.style.ForegroundColorSpan.class);
   assertEquals(2,colors.length);
   android.text.style.ForegroundColorSpan label=text.getSpanStart(colors[0])==0?colors[0]:colors[1];
   android.text.style.ForegroundColorSpan value=label==colors[0]?colors[1]:colors[0];
   assertEquals(0,text.getSpanStart(label));
   assertEquals(title.length()+3,text.getSpanEnd(label));
   assertEquals(DynamicTheme.textColor(button),label.getForegroundColor());
   assertEquals(title.length()+3,text.getSpanStart(value));
   assertEquals(text.length(),text.getSpanEnd(value));
   int surface=UiDialogs.surface(a);
   int accent=NicoliveUi.accent(button.getContext());
   if(contrast(accent,surface)>=4.5)assertEquals(accent,value.getForegroundColor());
   assertNotEquals(label.getForegroundColor(),value.getForegroundColor());
   assertTrue(contrast(label.getForegroundColor(),surface)>=4.5);
   assertTrue(contrast(value.getForegroundColor(),surface)>=4.49);
  }
  settings.dismiss();
 }

 @Test public void multipleTabPlacementKeepsExistingBarAndListInSelectedOrder(){
  SharedPreferences preferences=PreferenceManager.getDefaultSharedPreferences(a);
  LinearLayout root=new LinearLayout(a);
  root.setOrientation(LinearLayout.VERTICAL);
  View list=new View(a),bar=new View(a);
  LinearLayout.LayoutParams barParams=new LinearLayout.LayoutParams(-1,32);
  root.addView(list,new LinearLayout.LayoutParams(-1,0,1));
  MultiTabPlacement.insert(root,bar,0,barParams);
  assertSame(bar,root.getChildAt(0));
  root.removeView(bar);
  preferences.edit().putBoolean("multiple_video_tabs_at_bottom",true).commit();
  MultiTabPlacement.insert(root,bar,0,barParams);
  assertSame(list,root.getChildAt(0));
  assertSame(bar,root.getChildAt(1));
  assertSame(barParams,bar.getLayoutParams());
  preferences.edit().putInt("multiple_video_tabs_height_dp",48).commit();
  MultiTabPlacement.update(root,bar);
  assertEquals(PanelUi.dp(a,48),bar.getLayoutParams().height);
  assertSame(bar,root.getChildAt(1));
  preferences.edit().putBoolean("multiple_video_tabs_at_bottom",false)
   .putInt("multiple_video_tabs_height_dp",100).commit();
  MultiTabPlacement.update(root,bar);
  assertEquals(PanelUi.dp(a,64),bar.getLayoutParams().height);
  assertSame(bar,root.getChildAt(0));
  preferences.edit().remove("multiple_video_tabs_at_bottom").remove("multiple_video_tabs_height_dp").commit();
 }

 @Test @Config(sdk=36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
 public void translucentCommentDoesNotDarkenWhereFillAndOutlineIntersect(){
  Bitmap image=Bitmap.createBitmap(100,100,Bitmap.Config.ARGB_8888);
  Canvas canvas=new Canvas(image);
  Paint paint=new Paint();
  paint.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));
  paint.setTextSize(56);
  paint.setColor(Color.BLACK);
  String glyph="I";
  int x=35,y=70;
  Rect bounds=new Rect();
  paint.getTextBounds(glyph,0,glyph.length(),bounds);
  int center=x+bounds.centerX(), sampleY=y+bounds.centerY(), edge=x+bounds.left+1;
  image.eraseColor(Color.WHITE);
  paint.setStyle(Paint.Style.STROKE);
  assertTrue(CommentOutlineOpacity.drawPass(canvas,glyph,x,y,paint,39,24,0));
  paint.setStyle(Paint.Style.FILL);
  assertTrue(CommentOutlineOpacity.drawPass(canvas,glyph,x,y,paint,39,24,0));
  int expected=255-Math.round(255*.39f);
  assertEquals(expected,Color.red(image.getPixel(center,sampleY)),1);
  assertEquals(expected,Color.red(image.getPixel(edge,sampleY)),1);
  assertEquals(255,paint.getAlpha());
  image.eraseColor(Color.WHITE);
  Paint outline=new Paint(paint);
  outline.setStyle(Paint.Style.STROKE);
  outline.setStrokeWidth(24);
  outline.setAlpha(99);
  paint.setAlpha(99);
  CommentOutlineOpacity.drawLive(canvas,glyph,x,y,outline,paint);
  assertEquals(expected,Color.red(image.getPixel(center,sampleY)),1);
  assertEquals(expected,Color.red(image.getPixel(edge,sampleY)),1);
  assertEquals(99,paint.getAlpha());
  assertEquals(99,outline.getAlpha());
  image.recycle();
 }

 @Test @Config(sdk=36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
 public void ambientGlowTapersBeforeItsOuterBoundary(){
  AmbientLight.Glow glow=new AmbientLight.Glow();
  glow.video.set(10,100,110,150);
  glow.setBounds(0,0,120,160);
  glow.sides=1;
  glow.spread=100;
  glow.normalFade=true;
  glow.alpha=180;
  Arrays.fill(glow.colors,Color.WHITE);
  Bitmap pixels=Bitmap.createBitmap(120,160,Bitmap.Config.ARGB_8888);
  glow.draw(new Canvas(pixels));
  assertTrue(Color.alpha(pixels.getPixel(50,90))>120);
  assertTrue(Color.alpha(pixels.getPixel(50,30))<55);
  assertTrue(Color.alpha(pixels.getPixel(50,8))<10);
  assertTrue(Color.alpha(pixels.getPixel(50,1))<4);
  pixels.recycle();
 }
 @Test public void hubHasInlineSearchAndCompactBroadcastMetadata(){assertNotNull(a.searchInput);a.searchInput.setText("ゲーム");a.searchInput.onEditorAction(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);assertEquals("ゲーム",a.query);NicoliveData.Program p=new NicoliveData.Program("lv123");p.title="番組タイトル";p.provider="official";p.owner="放送者";p.status="ON_AIR";p.begin=System.currentTimeMillis()/1000-65*60;p.views=123;p.comments=456;a.programs.add(p);a.feedAdapter.notifyDataSetChanged();View row=a.feedAdapter.getView(0,null,a.feed);assertTrue(((LinearLayout)row).getChildAt(0).getClipToOutline());LinearLayout text=(LinearLayout)((LinearLayout)row).getChildAt(1);assertTrue(((TextView)text.getChildAt(0)).getText().toString().contains("公式"));assertTrue(((TextView)text.getChildAt(0)).getText().toString().contains("1時間5分"));assertTrue(((TextView)text.getChildAt(3)).getText().toString().contains("456"));assertSame(row,a.feedAdapter.getView(0,row,a.feed));}
 @Test public void portraitViewerUsesNativeControlsAndPreservesDraft(){a.watching=true;a.requested="lv123";a.draft="下書き";a.viewer();layout(a.root,360,760);assertEquals("下書き",a.input.getText().toString());assertNotNull(a.playerFrame.video);assertTrue(a.input.getWidth()>0);assertTrue(a.composer.getBottom()<=a.body.getHeight());assertTrue(a.send.getWidth()>=NicoliveUi.dp(a,44));a.fullscreen=true;a.viewer();layout(a.root,760,360);assertEquals(View.GONE,a.header.getVisibility());assertEquals(View.GONE,a.viewerPane.getVisibility());}
 @Test public void keyboardHeightKeepsPlayerAndComposerReachable(){a.watching=true;a.viewer();layout(a.root,360,400);a.fitViewer();layout(a.root,360,400);assertEquals(View.GONE,a.details.getVisibility());assertTrue(a.playerFrame.getHeight()>=NicoliveUi.dp(a,72));assertTrue(a.composer.getBottom()<=a.body.getHeight());assertTrue(a.chat.getHeight()>0);}
 @Test public void readingHistoryKeepsAnchorAndShowsNewArrivalsAfterBufferIsFull(){ServiceController<NicoliveService> owner=Robolectric.buildService(NicoliveService.class);NicoliveService service=owner.create().get();try{service.id="lv123";a.watching=true;a.requested="lv123";a.service=service;a.viewer();for(int i=0;i<2000;i++){NicoliveData.Chat c=new NicoliveData.Chat();c.text="item "+i;service.history.add(c);}service.deliveredCount=2000;a.changed();layout(a.root,360,760);a.atBottom=false;a.chat.setSelectionFromTop(1000,0);layout(a.root,360,760);service.history.removeFirst();service.history.add(new NicoliveData.Chat());service.deliveredCount++;a.changed();assertEquals(1,a.newComments);assertEquals(View.VISIBLE,a.latest.getVisibility());a.latest.performClick();assertTrue(a.atBottom);assertEquals(0,a.newComments);}finally{a.service=null;owner.destroy();}}
 @Test public void commentTabsDoNotRecreatePlayer(){a.watching=true;a.viewer();NicolivePlayerFrame frame=a.playerFrame;((Button)a.tabs.getChildAt(1)).performClick();assertEquals(View.GONE,a.chat.getVisibility());assertEquals(View.VISIBLE,a.information.getVisibility());((Button)a.tabs.getChildAt(0)).performClick();assertEquals(View.VISIBLE,a.chat.getVisibility());assertSame(frame,a.playerFrame);}
 @Test public void anonymousAndSharedRawIdsDoNotCollide()throws Exception{NicoliveNg ng=new NicoliveNg(a);ng.prefs.edit().clear().putString("saveNGList","{\"data\":{\"items\":[{\"type\":\"word\",\"source\":\"blocked\"},{\"type\":\"id\",\"source\":\"123\"}]}}").commit();ng.reload();NicoliveData.Chat c=new NicoliveData.Chat();c.text="normal";c.user="live-anon:123";assertFalse(ng.blocked(c));c.user="raw:123";assertTrue(ng.blocked(c));c.user="raw:456";c.text="a blocked message";assertTrue(ng.blocked(c));ng.addUser("live-anon:456");c.text="normal";c.user="live-anon:456";assertTrue(ng.blocked(c));}
 @Test public void manifestDeclaresLiveActivityServiceAndPermissions()throws Exception{AssetManager assets=a.getAssets();int cookie=(Integer)AssetManager.class.getMethod("addAssetPath",String.class).invoke(assets,System.getProperty("test.apk"));android.content.res.XmlResourceParser xml=assets.openXmlResourceParser(cookie,"AndroidManifest.xml");boolean activity=false,service=false,permission=false;for(int event;(event=xml.next())!=org.xmlpull.v1.XmlPullParser.END_DOCUMENT;){if(event!=org.xmlpull.v1.XmlPullParser.START_TAG)continue;String name=xml.getAttributeValue("http://schemas.android.com/apk/res/android","name");if("activity".equals(xml.getName())&&"e.e.a.NicoliveActivity".equals(name))activity=true;if("service".equals(xml.getName())&&"e.e.a.NicoliveService".equals(name)){service=true;assertFalse(xml.getAttributeBooleanValue("http://schemas.android.com/apk/res/android","exported",true));assertEquals(2,xml.getAttributeIntValue("http://schemas.android.com/apk/res/android","foregroundServiceType",0));}if("uses-permission".equals(xml.getName())&&"android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK".equals(name))permission=true;}xml.close();assertTrue(activity);assertTrue(service);assertTrue(permission);}
 @Test public void overlayQueueIsBoundedAndUsesExistingAppearance(){a.watching=true;a.viewer();layout(a.root,360,760);NicoliveCommentsView view=a.playerFrame.comments;view.layout(0,0,360,200);for(int i=0;i<10000;i++){NicoliveData.Chat c=new NicoliveData.Chat();c.text="comment";view.add(c,1000);}assertTrue(view.items.size()<=80);view.clear();assertEquals(0,view.items.size());}
 @Test public void rotationKeepsSurfaceDraftAndScrollViews(){a.watching=true;a.viewer();a.input.setText("draft");Object surface=a.playerFrame.video,frame=a.playerFrame,list=a.chat,root=a.root;for(int i=0;i<100;i++){a.fullscreen=i%2==0;a.viewer();android.content.res.Configuration c=new android.content.res.Configuration();c.orientation=a.fullscreen?2:1;a.onConfigurationChanged(c);layout(a.root,a.fullscreen?760:360,a.fullscreen?360:760);assertSame(surface,a.playerFrame.video);assertSame(frame,a.playerFrame);assertSame(root,a.root);assertSame(list,a.chat);assertEquals("draft",a.input.getText().toString());assertEquals(a.fullscreen?View.VISIBLE:View.GONE,a.playerFrame.reconnect.getVisibility());}assertTrue(a.playerFrame.bottom.getHeight()<=NicoliveUi.dp(a,36));}
 @Test public void swipeSwitchesCategoriesAndCommentPanesButNotVerticalScroll(){layout(a.root,360,760);swipe(a.root,300,410,60,420);assertEquals(1,a.category);assertEquals(0,a.hubTab);layout(a.root,360,760);swipe(a.root,60,410,300,420);assertEquals(0,a.category);a.watching=true;a.viewer();layout(a.root,360,760);swipe(a.root,300,550,60,560);assertTrue(a.info);swipe(a.root,60,550,300,560);assertFalse("right swipe returns to comments",a.info);swipe(a.root,140,600,150,420);assertFalse("vertical scroll keeps current tab",a.info);}
 static void swipe(View v,float x,float y,float end,float bottom){long t=SystemClock.uptimeMillis();NicoliveServiceTest.event(v,t,t,MotionEvent.ACTION_DOWN,x,y);NicoliveServiceTest.event(v,t,t+50,MotionEvent.ACTION_MOVE,end,bottom);NicoliveServiceTest.event(v,t,t+100,MotionEvent.ACTION_UP,end,bottom);}
 @Test public void statisticsUseCommaSeparatedNumbersAndTwoIcons(){CharSequence value=NicoliveUi.statistics(a,21465,8243);assertTrue(value.toString().contains("21,465"));assertTrue(value.toString().contains("8,243"));assertEquals(2,((android.text.Spanned)value).getSpans(0,value.length(),android.text.style.ImageSpan.class).length);ArrayList<Map<String,Object>> menu=new ArrayList<Map<String,Object>>();NicoliveEntry.addMenu(a,menu);assertFalse(((String)menu.get(0).get("subtitle")).isEmpty());}

 @Test public void qualityMenuMarksCurrentQualityAndUsesStableChoices(){ServiceController<NicoliveService> c=Robolectric.buildService(NicoliveService.class);NicoliveService live=c.create().get();try{a.service=live;live.qualities.add("abr");live.qualities.add("low");live.selected="low";a.playerSettings();AlertDialog d=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();assertTrue(d.getListView().getAdapter().getItem(1).toString().startsWith("✓"));assertFalse(d.getListView().getAdapter().getItem(0).toString().startsWith("✓"));live.qualities.clear();d.getListView().performItemClick(null,1,1);d.dismiss();}finally{a.service=null;c.destroy();}}

 public static class LoadingScreen extends Screen {int loads;@Override void load(){loads++;loading=true;}}
 @Test public void initialStartFetchesOnceAndInterruptedFeedRestartsOnReturn(){ActivityController<LoadingScreen> c=Robolectric.buildActivity(LoadingScreen.class).setup();try{LoadingScreen screen=c.get();assertEquals(1,screen.loads);c.pause().stop();assertTrue(screen.resumeLoad);c.restart().start().resume();assertEquals(2,screen.loads);assertFalse(screen.resumeLoad);}finally{c.pause().stop().destroy();}}

 @Test public void changingBroadcastDoesNotKeepAnotherBroadcastsDraft(){a.watching=true;a.requested="lv123";a.viewer();a.input.setText("old draft");a.watch("lv456");assertEquals("",a.input.getText().toString());assertEquals("",a.draft);}


 @Test public void repeatedCommentNotificationsDoNotRebindUnchangedProgramText(){
  ServiceController<NicoliveService> sc=Robolectric.buildService(NicoliveService.class);NicoliveService service=sc.create().get();
  try{a.service=service;a.watching=true;a.requested=service.id="lv123";service.program=new NicoliveData.Program("lv123");service.program.title="Stable title";a.viewer();a.changed();final int[] edits={0};a.title.addTextChangedListener(new android.text.TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){edits[0]++;}public void afterTextChanged(android.text.Editable e){}});for(int i=0;i<100;i++)a.changed();assertEquals(0,edits[0]);service.program=new NicoliveData.Program("lv123");service.program.title="Updated title";a.changed();assertEquals("Updated title",a.title.getText().toString());assertEquals(1,edits[0]);}finally{a.service=null;sc.destroy();}
 }

 @Test public void ngRemovalKeepsOtherRuleTypeWithSameText(){ServiceController<NicoliveService> sc=Robolectric.buildService(NicoliveService.class);NicoliveService service=sc.create().get();try{a.service=service;service.ng.prefs.edit().putStringSet("nicolive_ng_users",Collections.singleton("same")).putStringSet("nicolive_ng_words",Collections.singleton("same")).commit();a.ngSettings();AlertDialog dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();ListView list=dialog.getListView();list.setItemChecked(0,true);list.getOnItemClickListener().onItemClick(list,null,0,0);assertTrue(list.isItemChecked(0));dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();Shadows.shadowOf(Looper.getMainLooper()).idle();assertFalse(service.ng.prefs.getStringSet("nicolive_ng_users",Collections.emptySet()).contains("same"));assertTrue(service.ng.prefs.getStringSet("nicolive_ng_words",Collections.emptySet()).contains("same"));}finally{a.service=null;sc.destroy();}}
}
