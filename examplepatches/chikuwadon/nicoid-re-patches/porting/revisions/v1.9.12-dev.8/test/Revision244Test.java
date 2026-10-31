package e.e.a;
import android.app.*;import android.content.*;import android.preference.PreferenceManager;import android.view.*;import android.widget.*;import android.graphics.*;import java.util.*;import org.json.*;
import org.junit.*;import static org.junit.Assert.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import org.robolectric.shadows.ShadowLooper;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class Revision244Test {
 Activity a;
 @Before public void setUp(){org.robolectric.shadows.ShadowLog.stream=System.out;a=Robolectric.buildActivity(Activity.class).setup().get();MultiTabs227.prefs=PreferenceManager.getDefaultSharedPreferences(a);MultiTabs227.prefs.edit().putBoolean(MultiTabs227.ENABLE,true).commit();MultiTabs227.model=new SavedTabs227("{}");MultiTabs227.lastSaved=null;}
 @After public void done(){for(MultiTabs227.Host h:new ArrayList<>(MultiTabs227.HOSTS.values())){TabRecovery244.clear(h);h.removeBar();}MultiTabs227.HOSTS.clear();MultiTabs227.model=null;TabPreview235.CACHE.evictAll();}
 MultiTabs227.Host host()throws Exception {LinearLayout main=new LinearLayout(a);main.setId(0x7f0800dd);main.addView(new FrameLayout(a),new LinearLayout.LayoutParams(-1,-1));a.setContentView(main);MultiTabs227.Host h=new MultiTabs227.Host(a);MultiTabs227.HOSTS.put(a,h);return h;}
 public static class Row{Map<String,Object> data=new HashMap<>();public Object a(String key){return data.get(key);}}
 @Test public void watchLaterUsesFullMembershipItemIdInsteadOfVideoAlias()throws Exception{Row row=new Row();row.data.put("videourl","http://www.nicovideo.jp/watch/so123");row.data.put("item_id",-1);AccountRemoval227.capture(row,new JSONObject().put("watchId","1580000000").put("itemId",5000000001L));assertTrue(AccountRemoval227.path(true,"deflist",row).endsWith("itemIds=5000000001"));}

 @Test public void normalMylistKeepsItemIdentifier()throws Exception{Row row=new Row();row.data.put("item_id",123456);assertTrue(AccountRemoval227.path(false,"42",row).endsWith("mylists/42/items?itemIds=123456"));}
 @Test public void legacyWatchLaterUsesRowMembershipAndRejectsVideoId()throws Exception{Row row=new Row();row.data.put("item_id",123);row.data.put("videourl","https://www.nicovideo.jp/watch/sm9?x=1");assertTrue(AccountRemoval227.path(true,"deflist",row).endsWith("itemIds=123"));row.data.put("item_id","sm9");try{AccountRemoval227.path(true,"deflist",row);fail();}catch(IllegalArgumentException expected){}}

 @Test public void presentingSelectedViewRemovesStaleGestureTranslation(){FrameLayout box=new FrameLayout(a);View other=new View(a),chosen=new View(a);box.addView(chosen);box.addView(other);chosen.setTranslationX(500);chosen.setAlpha(0);chosen.setVisibility(View.GONE);TabRecovery244.present(chosen);assertSame(chosen,box.getChildAt(1));assertEquals(0,chosen.getTranslationX(),0);assertEquals(1,chosen.getAlpha(),0);assertEquals(View.VISIBLE,chosen.getVisibility());}
 @Test public void longPressWithoutDragKeepsExistingStrip()throws Exception{MultiTabs227.Host h=host();h.bar();View old=h.bar;HorizontalScrollView scroll=h.tabScroll;View cell=h.strip.getChildAt(0);TabDrag228 drag=new TabDrag228(h,cell,MultiTabs227.data().find(h.currentId),scroll);drag.armed=true;drag.moved=false;scroll.scrollTo(100,0);drag.finish(true);assertSame(old,h.bar);assertSame(scroll,h.tabScroll);}
 @Test public void closeSelectedAndUndoPreservesDescriptor()throws Exception{MultiTabs227.Host h=host();SavedTabs227.Tab t=MultiTabs227.data().find(h.currentId);h.bar();h.close(t);assertEquals(0,MultiTabs227.data().tabs.size());View row=TabRecovery244.notices.get(h);assertNotNull(row);((ViewGroup)row).getChildAt(1).performClick();assertSame(t,MultiTabs227.data().find(t.id));assertNull(TabRecovery244.notices.get(h));}
 @Test public void onlySelectedTabShowsCloseButton()throws Exception{MultiTabs227.Host h=host();SavedTabs227.Tab second=new SavedTabs227.Tab();second.label="second";MultiTabs227.data().tabs.add(second);h.bar();LinearLayout heading=(LinearLayout)((ViewGroup)h.strip.getChildAt(0)).getChildAt(0);LinearLayout next=(LinearLayout)((ViewGroup)h.strip.getChildAt(1)).getChildAt(0);assertEquals(2,heading.getChildCount());assertEquals(1,next.getChildCount());assertEquals("×",((TextView)heading.getChildAt(1)).getText().toString());}
 @Test public void symbolsUseDifferentArtwork(){assertEquals("muted",new PlayerIcons.Icon("muted",false).name);assertEquals("background",new PlayerIcons.Icon("background",false).name);PlayerIcons.Icon m=new PlayerIcons.Icon("muted",false);m.setBounds(0,0,24,24);m.draw(new Canvas());PlayerIcons.Icon b=new PlayerIcons.Icon("background",false);b.setBounds(0,0,24,24);b.draw(new Canvas());}
 @Test public void relatedRoutesExcludedFromLifecycleBinding(){assertTrue(TabRecovery244.related(new Intent().putExtra("type",13)));assertTrue(TabRecovery244.related(new Intent(Intent.ACTION_VIEW,android.net.Uri.parse("https://flapi.nicovideo.jp/api/getrelation?video=sm9"))));assertFalse(TabRecovery244.related(new Intent().putExtra("type",9)));}
 @Test public void edgeActionsRespectActualTargetPosition()throws Exception{MultiTabs227.Host h=host();SavedTabs227.Tab first=MultiTabs227.data().find(h.currentId);first.kind=0;SavedTabs227.Tab last=new SavedTabs227.Tab();last.label="last";last.kind=3;MultiTabs227.data().tabs.add(last);h.actions(first);CharSequence[] options=org.robolectric.Shadows.shadowOf(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog()).getItems();assertEquals(3,options.length);assertEquals("右に移動",options[1].toString());org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().dismiss();h.actions(last);options=org.robolectric.Shadows.shadowOf(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog()).getItems();assertEquals(2,options.length);assertEquals("左に移動",options[0].toString());assertEquals(first.id,h.currentId);}
 public static class RetainedPlayer extends FrameLayout {boolean playing=true;float speed=1.25f;int uriLoads;boolean release;RetainedPlayer(Context c){super(c);}public boolean isPlaying(){return playing;}public long getDuration(){return 100000;}public long getCurrentPosition(){return 12345;}public float getPlaybackSpeed(){return speed;}public boolean setPlaybackSpeed(float s){speed=s;return true;}public void setReleaseOnDetachFromWindow(boolean b){release=b;}public void start(){playing=true;}public void pause(){playing=false;}public void setVideoURI(android.net.Uri u){uriLoads++;}}
 @Test public void handoverMovesSameVideoWithoutMediaLoad()throws Exception{com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();RetainedPlayer player=new RetainedPlayer(a);FrameLayout popup=new FrameLayout(a);popup.addView(player);service.e=player;service.f="https://www.nicovideo.jp/watch/sm9?from=popup";com.sauzask.nicoid.NicoidPopupViewService.k0=new Object();PopupReturn244.Pending pending=new PopupReturn244.Pending(service);pending.token=77;pending.timeout=()->{};PopupReturn244.pending=pending;a.setIntent(new Intent().putExtra(PopupReturn244.TOKEN,77L));FrameLayout normal=new FrameLayout(a);View empty=new View(a);normal.addView(empty);com.sauzask.nicoid.NicoidVideoFragment owner=new com.sauzask.nicoid.NicoidVideoFragment();owner.A1=a;owner.a0=empty;owner.k0=9000;PopupReturn244.created(owner);assertTrue(PopupReturn244.adopt(owner));assertSame(player,owner.a0);assertSame(normal,player.getParent());assertNull(empty.getParent());assertEquals(0,owner.k0);assertEquals(0,player.uriLoads);assertTrue(player.playing);assertEquals(12345,player.getCurrentPosition());assertEquals(1.25f,player.speed,0);assertTrue(PopupReturn244.retaining(a,new Intent().setClassName(a,"com.sauzask.nicoid.NicoidPopupViewService")));assertSame(pending.model,PopupReturn244.keep(null));pending.timeout=()->{};PopupReturn244.ready(owner);org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertNull(PopupReturn244.pending);assertSame(empty,service.e);assertEquals(1,owner.prepared);assertSame(player,owner.a0);assertTrue(player.playing);assertEquals(0,player.uriLoads);service.stopSelf();}
 @Test public void handoverRejectsAnotherVideoAndForeignIntent()throws Exception{com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();RetainedPlayer player=new RetainedPlayer(a);service.e=player;PopupReturn244.Pending pending=new PopupReturn244.Pending(service);pending.token=78;PopupReturn244.pending=pending;a.setIntent(new Intent().putExtra(PopupReturn244.TOKEN,78L));com.sauzask.nicoid.NicoidVideoFragment owner=new com.sauzask.nicoid.NicoidVideoFragment();owner.A1=a;owner.b0="sm10";assertFalse(PopupReturn244.adopt(owner));assertFalse(PopupReturn244.retaining(a,new Intent().setClassName(a,"other.Service")));PopupReturn244.pending=null;service.stopSelf();}


 static class RecordingCanvas extends Canvas {int arcs,paths;@Override public void drawArc(float l,float t,float r,float b,float start,float sweep,boolean center,Paint p){arcs++;}@Override public void drawPath(Path path,Paint p){paths++;}}
 @Test public void actualPopupHeadphonesSymbolHasHeadband(){RecordingCanvas c=new RecordingCanvas();PlayerIcons.Icon icon=new PlayerIcons.Icon("headphones",false);icon.setBounds(0,0,48,48);icon.draw(c);assertEquals(1,c.arcs);assertEquals(2,c.paths);}
 @Test public void deletionDiagnosticsDoNotExposeResponseOrTokens(){assertEquals("HTTP 403",AccountRemoval227.error(new java.io.IOException("HTTP 403")));assertEquals("IOException",AccountRemoval227.error(new java.io.IOException("user_session=private")));}
 @Test public void commentTransferStopsNativeTextureWorker()throws Exception{e.e.a.u view=new e.e.a.u(a);FrameLayout root=new FrameLayout(a);root.addView(view);CommentTransfer245.stop(root);assertTrue(view.u);}


 @Test public void watchLaterErrorExtractsOnlySafeCodes()throws Exception{String body="{\"meta\":{\"errorCode\":\"INVALID_PARAMETER\"},\"data\":{\"errorDetail\":\"AB001\"},\"message\":\"private contents\"}";assertEquals("HTTP 400 INVALID_PARAMETER/AB001",WatchLater245.failure(400,body.getBytes("UTF-8")));assertEquals("HTTP 400",WatchLater245.failure(400,"{\"meta\":{\"errorCode\":\"user_session=secret\"}}".getBytes("UTF-8")));assertEquals("HTTP 400",WatchLater245.failure(400,"not json".getBytes("UTF-8")));}


 public static class PreparedLoader {public Object k;public android.os.Bundle m=new android.os.Bundle();}
 @Test public void preparedLoaderMovesToNormalOwnerWithoutReload()throws Exception{com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();service.e=new RetainedPlayer(a);PreparedLoader loader=new PreparedLoader();loader.k=service;service.z=loader;PopupReturn244.Pending p=new PopupReturn244.Pending(service);p.token=91;PopupReturn244.pending=p;a.setIntent(new Intent().putExtra(PopupReturn244.TOKEN,91L));com.sauzask.nicoid.NicoidVideoFragment owner=new com.sauzask.nicoid.NicoidVideoFragment();owner.A1=a;assertTrue(PopupReturn244.reuseLoader(owner));assertSame(loader,owner.h1);assertSame(owner,loader.k);assertTrue(PopupReturn244.retainedLoader(loader));assertFalse(PopupReturn244.retainedLoader(new Object()));PopupReturn244.pending=null;service.stopSelf();}


 @Test public void pinnedPopupDoesNotStarveLayoutFrames(){FrameLayout root=new FrameLayout(a);View top=new View(a),seek=new View(a);root.addView(top);root.addView(seek);top.setVisibility(View.GONE);seek.setAlpha(0f);View[] controls={top,seek,null,null};assertTrue(PopupVisibility246.draw(root,controls,true));assertEquals(View.VISIBLE,top.getVisibility());assertEquals(1f,seek.getAlpha(),0);assertTrue(PopupVisibility246.draw(root,controls,true));top.setVisibility(View.GONE);assertTrue(PopupVisibility246.draw(root,controls,false));assertEquals(View.GONE,top.getVisibility());}
 @Test public void popupHoldCancellationMethodExists()throws Exception{PopupPinchLayout root=new PopupPinchLayout(a,null);PopupPinchLayout.class.getMethod("cancelHoldTargets").invoke(root);}

 @Test public void pinnedContainerStopsNativeFadeBeforeItChangesGeometry(){
  final android.content.res.Resources original=a.getResources();
  android.content.res.Resources resources=new android.content.res.Resources(original.getAssets(),original.getDisplayMetrics(),original.getConfiguration()){@Override public String getResourceEntryName(int id){return id==123?"controller":"videoLayout";}};
  android.content.Context context=new android.content.ContextWrapper(a){@Override public android.content.res.Resources getResources(){return resources;}};
  android.preference.PreferenceManager.getDefaultSharedPreferences(context).edit().putString("player_controls_visibility_mode","popup").commit();
  PinnedPopup247 control=new PinnedPopup247(context);control.setId(123);control.setLayoutParams(new FrameLayout.LayoutParams(320,48));control.setVisibility(View.GONE);control.setAlpha(0f);control.startAnimation(new android.view.animation.AlphaAnimation(1f,0f));assertEquals(View.VISIBLE,control.getVisibility());assertEquals(1f,control.getAlpha(),0);assertNull(control.getAnimation());
  control.setLayoutParams(new FrameLayout.LayoutParams(240,36));assertEquals(240,control.getLayoutParams().width);assertEquals(36,control.getLayoutParams().height);
  android.preference.PreferenceManager.getDefaultSharedPreferences(context).edit().putString("player_controls_visibility_mode","off").commit();control.setVisibility(View.GONE);assertEquals(View.GONE,control.getVisibility());control.setAlpha(.5f);assertEquals(.5f,control.getAlpha(),0);
 }
 @Test public void ordinaryPopupContainerStillHidesWhileControlsPinned(){
  PinnedPopup247 container=new PinnedPopup247(a);container.setId(View.NO_ID);container.setVisibility(View.GONE);assertEquals(View.GONE,container.getVisibility());
 }
 @Test public void popupToolbarFitsWeightedTextSlots(){assertEquals(32,PopupLayout236.buttonSize(400,32,8.7f));assertEquals(22,PopupLayout236.buttonSize(200,32,8.7f));assertTrue(PopupLayout236.buttonSize(200,32,8.7f)*8.7f<=200);}
 public static class TestSettings extends android.preference.PreferenceActivity {}
 @Test public void horizontalSeekSettingIsPresentWithEnabledDefault(){android.preference.PreferenceActivity screen=Robolectric.buildActivity(TestSettings.class).setup().get();android.preference.PreferenceScreen prefs=screen.getPreferenceManager().createPreferenceScreen(screen);screen.setPreferenceScreen(prefs);android.preference.PreferenceCategory group=new android.preference.PreferenceCategory(screen);group.setKey("player");prefs.addPreference(group);HorizontalSeek233.settings(screen);android.preference.CheckBoxPreference setting=(android.preference.CheckBoxPreference)screen.findPreference("gesture_horizontal_seek");assertNotNull(setting);assertTrue(setting.isChecked());setting.setChecked(false);HorizontalSeek233.settings(screen);assertSame(setting,screen.findPreference("gesture_horizontal_seek"));assertFalse(setting.isChecked());screen.finish();}
 @Test public void pinnedCenterFollowsControllerInsteadOfExpiring(){
  final android.content.res.Resources original=a.getResources();
  android.content.res.Resources resources=new android.content.res.Resources(original.getAssets(),original.getDisplayMetrics(),original.getConfiguration()){@Override public int getIdentifier(String name,String type,String pkg){return name.equals("controller")?101:name.equals("viewctrllay")?102:0;}};
  android.content.Context context=new android.content.ContextWrapper(a){@Override public android.content.res.Resources getResources(){return resources;}};
  FrameLayout root=new FrameLayout(context);View controller=new View(context),center=new View(context);controller.setId(101);center.setId(102);root.addView(controller);root.addView(center);center.setVisibility(View.INVISIBLE);Revision201.center(root);assertEquals(View.VISIBLE,center.getVisibility());controller.setVisibility(View.INVISIBLE);Revision201.center(root);assertEquals(View.INVISIBLE,center.getVisibility());
 }
 @Test public void pinnedLinearControllerRejectsNativeHideAndFade(){
  final android.content.res.Resources original=a.getResources();
  android.content.res.Resources resources=new android.content.res.Resources(original.getAssets(),original.getDisplayMetrics(),original.getConfiguration()){@Override public String getResourceEntryName(int id){return "controller";}};
  Context context=new android.content.ContextWrapper(a){@Override public android.content.res.Resources getResources(){return resources;}};
  PreferenceManager.getDefaultSharedPreferences(context).edit().putString("player_controls_visibility_mode","popup").commit();
  PinnedPopupLinear248 control=new PinnedPopupLinear248(context);control.setId(123);control.setVisibility(View.GONE);control.setAlpha(0f);control.startAnimation(new android.view.animation.AlphaAnimation(1f,0f));assertEquals(View.VISIBLE,control.getVisibility());assertEquals(1f,control.getAlpha(),0);assertNull(control.getAnimation());
  PreferenceManager.getDefaultSharedPreferences(context).edit().putString("player_controls_visibility_mode","off").commit();control.setVisibility(View.INVISIBLE);assertEquals(View.INVISIBLE,control.getVisibility());
 }
 @Test public void retainedMetadataIsDeliveredOnceWithoutStartingLoader()throws Exception{
  com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();service.e=new RetainedPlayer(a);PreparedLoader loader=new PreparedLoader();loader.m.putString("title","retained title");loader.m.putString("description","retained description");PopupReturn244.Pending p=new PopupReturn244.Pending(service);p.loader=loader;com.sauzask.nicoid.NicoidVideoFragment owner=new com.sauzask.nicoid.NicoidVideoFragment();PopupReturn244.deliverMetadata(p,owner);PopupReturn244.deliverMetadata(p,owner);assertEquals(1,owner.metadataCallbacks);assertEquals("retained title",owner.receivedMetadata.getString("title"));owner.receivedMetadata.putString("title","edited");assertEquals("retained title",loader.m.getString("title"));service.stopSelf();
 }
 @Test public void notificationCloseSurvivesLossOfInMemoryReceiverAndRejectsOldToken(){
  Object first=new Object();android.app.PendingIntent pending=MediaClose248.action(a,first,41063,2);Intent intent=org.robolectric.Shadows.shadowOf(pending).getSavedIntent();assertEquals("com.sauzask.nicoid.NicoidPopupViewService",intent.getComponent().getClassName());assertTrue(MediaClose248.valid(a,intent));MediaClose248.TOKENS.clear();assertTrue(MediaClose248.valid(a,intent));Intent forged=new Intent(intent).putExtra("token","00000000-0000-0000-0000-000000000000");assertFalse(MediaClose248.valid(a,forged));MediaClose248.action(a,new Object(),41063,2);assertFalse(MediaClose248.valid(a,intent));
 }
 @Test public void closeDeliveredAfterProcessLossCancelsNotification(){
  android.app.PendingIntent pending=MediaClose248.action(a,new Object(),41063,2);Intent intent=org.robolectric.Shadows.shadowOf(pending).getSavedIntent();MediaClose248.TOKENS.clear();com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();assertTrue(MediaClose248.consume(service,intent));assertFalse(MediaClose248.valid(service,intent));assertTrue(org.robolectric.Shadows.shadowOf(service).isStoppedBySelf());
 }
 @Test public void pinnedPopupPlaybackButtonLivesInToolbarAndPreservesClick(){
  LinearLayout row=new LinearLayout(a);RelativeLayout stage=new RelativeLayout(a),center=new RelativeLayout(a);Button play=new Button(a);final int[] clicked={0};play.setOnClickListener(v->clicked[0]++);center.addView(play);stage.addView(center);PopupBar248.place(row,stage,center,true);assertSame(row,center.getParent());assertEquals(0,row.indexOfChild(center));assertEquals(0,stage.getChildCount());play.performClick();assertEquals(1,clicked[0]);PopupBar248.place(row,stage,center,false);assertSame(stage,center.getParent());play.performClick();assertEquals(2,clicked[0]);
 }
 @Test public void popupTextShrinksWithItsSlotRatherThanWrappingOrOverlapping(){
  TextView speed=new TextView(a),quality=new TextView(a);speed.setText("1.25×");quality.setText("720p");PopupControls193.size(speed,43,32);float large=speed.getTextSize();PopupControls193.size(speed,21,16);PopupControls193.size(quality,21,16);assertTrue(speed.getTextSize()<large);assertTrue(speed.getPaint().measureText(speed.getText().toString())<=21);assertTrue(quality.getPaint().measureText(quality.getText().toString())<=21);
 }
 @Test public void explicitCloseStopsLiveSessionAsWellAsRemovingNotification()throws Exception{
  RetainedPlayer player=new RetainedPlayer(a);Class<?> type=Class.forName("e.e.a.MediaControls$State");java.lang.reflect.Constructor<?> constructor=type.getDeclaredConstructor();constructor.setAccessible(true);Object state=constructor.newInstance();
  org.robolectric.util.ReflectionHelpers.setField(state,"owner",new Object());org.robolectric.util.ReflectionHelpers.setField(state,"player",player);org.robolectric.util.ReflectionHelpers.setField(state,"context",a.getApplicationContext());org.robolectric.util.ReflectionHelpers.setField(state,"notificationId",41063);org.robolectric.util.ReflectionHelpers.setField(state,"tick",(Runnable)()->{});org.robolectric.util.ReflectionHelpers.setField(state,"session",new android.media.session.MediaSession(a,"test"));
  java.lang.reflect.Field active=MediaControls.class.getDeclaredField("active");active.setAccessible(true);active.set(null,state);
  Intent intent=org.robolectric.Shadows.shadowOf(MediaClose248.action(a,state,41063,2)).getSavedIntent();com.sauzask.nicoid.NicoidPopupViewService service=Robolectric.buildService(com.sauzask.nicoid.NicoidPopupViewService.class).create().get();assertTrue(MediaClose248.consume(service,intent));assertFalse(player.playing);assertNull(active.get(null));
 }

 public static class ResizeOwner {
  public View a,e;public WindowManager.LayoutParams U=new WindowManager.LayoutParams();
  public float f0,T=90,S=1000;public int o=2000,p=1600,l=0,i=16,g=9;public SharedPreferences Q;
 }
 public static class CountingSeek extends SeekBar {
  int downs,moves;CountingSeek(Context c){super(c);setMax(100);}
  @Override public boolean onTouchEvent(MotionEvent e){if(e.getActionMasked()==MotionEvent.ACTION_DOWN)downs++;if(e.getActionMasked()==MotionEvent.ACTION_MOVE)moves++;return super.onTouchEvent(e);}
 }
 PopupPinchLayout resizeRoot(ResizeOwner owner,CountingSeek seek){
  PopupPinchLayout root=new PopupPinchLayout(a,null);root.addView(seek,new LinearLayout.LayoutParams(400,60));root.layout(0,0,400,300);seek.layout(0,240,400,300);
  owner.a=root;owner.e=new View(a);owner.e.layout(0,0,400,225);owner.U.width=400;owner.U.height=300;owner.Q=a.getSharedPreferences("resize_test",0);
  org.robolectric.util.ReflectionHelpers.setField(root,"owner",new java.lang.ref.WeakReference<Object>(owner));return root;
 }
 void event(PopupPinchLayout root,int action,float x,float y){MotionEvent e=MotionEvent.obtain(100,120,action,x,y,0);try{root.dispatchTouchEvent(e);}finally{e.recycle();}}
 @Test public void bottomRightResizeOwnsEntireStreamBeforeSeekBar(){
  ResizeOwner owner=new ResizeOwner();CountingSeek seek=new CountingSeek(a);PopupPinchLayout root=resizeRoot(owner,seek);
  event(root,MotionEvent.ACTION_DOWN,399,299);assertNotNull(PopupResize236.drags.get(owner));
  event(root,MotionEvent.ACTION_MOVE,330,250);event(root,MotionEvent.ACTION_UP,330,250);
  assertTrue(owner.U.width<400);assertEquals(0,seek.downs);assertEquals(0,seek.moves);assertEquals(0,seek.getProgress());assertNull(PopupResize236.drags.get(owner));
 }
 @Test public void ordinarySeekDragRemainsAvailableIncludingEndOfBar(){
  ResizeOwner owner=new ResizeOwner();CountingSeek seek=new CountingSeek(a);PopupPinchLayout root=resizeRoot(owner,seek);
  event(root,MotionEvent.ACTION_DOWN,200,270);event(root,MotionEvent.ACTION_MOVE,399,270);event(root,MotionEvent.ACTION_UP,399,270);
  assertEquals(1,seek.downs);assertTrue(seek.moves>0);assertTrue(seek.getProgress()>90);assertEquals(400,owner.U.width);
 }
 @Test public void resizeCancelDoesNotLeakOwnershipToNextSeek(){
  ResizeOwner owner=new ResizeOwner();CountingSeek seek=new CountingSeek(a);PopupPinchLayout root=resizeRoot(owner,seek);
  event(root,MotionEvent.ACTION_DOWN,399,299);event(root,MotionEvent.ACTION_CANCEL,399,299);assertNull(PopupResize236.drags.get(owner));
  event(root,MotionEvent.ACTION_DOWN,200,270);event(root,MotionEvent.ACTION_UP,200,270);assertEquals(1,seek.downs);
 }
 @Test public void resizeHandleIsDensityAwareNarrowAndDoesNotCoverToolbar(){
  assertTrue(PopupEdge249.hit(399,299,400,300,1));assertFalse(PopupEdge249.hit(380,299,400,300,1));
  assertTrue(PopupEdge249.hit(780,590,800,600,2));assertFalse(PopupEdge249.hit(750,590,800,600,2));
  assertFalse(PopupEdge249.hit(399,10,400,300,1));assertFalse(PopupEdge249.hit(400,299,400,300,1));assertFalse(PopupEdge249.hit(Float.NaN,299,400,300,1));
 }
 @Test public void newFingerTransitionsEdgeResizeIntoPinchAndConsumesTail(){
  ResizeOwner owner=new ResizeOwner();CountingSeek seek=new CountingSeek(a);PopupPinchLayout root=resizeRoot(owner,seek);event(root,MotionEvent.ACTION_DOWN,399,299);
  MotionEvent.PointerProperties[] properties=new MotionEvent.PointerProperties[2];MotionEvent.PointerCoords[] coords=new MotionEvent.PointerCoords[2];
  for(int i=0;i<2;i++){properties[i]=new MotionEvent.PointerProperties();properties[i].id=i;properties[i].toolType=MotionEvent.TOOL_TYPE_FINGER;coords[i]=new MotionEvent.PointerCoords();coords[i].x=100+200*i;coords[i].y=200;coords[i].pressure=1;coords[i].size=1;}
  MotionEvent e=MotionEvent.obtain(100,130,MotionEvent.ACTION_POINTER_DOWN|(1<<MotionEvent.ACTION_POINTER_INDEX_SHIFT),2,properties,coords,0,0,1,1,0,0,0,0);
  try{assertTrue(root.dispatchTouchEvent(e));}finally{e.recycle();}
  assertNull(PopupResize236.drags.get(owner));assertTrue((Boolean)org.robolectric.util.ReflectionHelpers.getField(root,"consuming"));
  event(root,MotionEvent.ACTION_CANCEL,300,200);assertFalse((Boolean)org.robolectric.util.ReflectionHelpers.getField(root,"consuming"));assertEquals(0,seek.downs);
 }
 @Test public void issue79QuietGestureSettingAlreadyExistsAndStaysOptional(){
  android.preference.PreferenceActivity screen=Robolectric.buildActivity(TestSettings.class).setup().get();android.preference.PreferenceScreen prefs=screen.getPreferenceManager().createPreferenceScreen(screen);screen.setPreferenceScreen(prefs);
  android.preference.PreferenceCategory group=new android.preference.PreferenceCategory(screen);group.setKey("player");prefs.addPreference(group);PlayerGestures219.settings(screen);
  android.preference.CheckBoxPreference setting=(android.preference.CheckBoxPreference)screen.findPreference("gesture_quiet_controls");assertNotNull(setting);assertFalse(setting.isChecked());setting.setChecked(true);PlayerGestures219.settings(screen);assertSame(setting,screen.findPreference("gesture_quiet_controls"));assertTrue(setting.isChecked());screen.finish();
 }
 @Test public void issue95ActiveHoldIgnoresMovementAndRestoresOriginalSpeed()throws Exception{
  RetainedPlayer player=new RetainedPlayer(a);Class<?> type=Class.forName("e.e.a.HoldSpeed$State");java.lang.reflect.Constructor<?> c=type.getDeclaredConstructor();c.setAccessible(true);Object state=c.newInstance();
  org.robolectric.util.ReflectionHelpers.setField(state,"activity",new java.lang.ref.WeakReference<Activity>(a));org.robolectric.util.ReflectionHelpers.setField(state,"video",player);org.robolectric.util.ReflectionHelpers.setField(state,"original",1.25f);org.robolectric.util.ReflectionHelpers.setField(state,"holding",true);org.robolectric.util.ReflectionHelpers.setField(state,"consume",true);player.speed=2f;
  java.util.Map states=org.robolectric.util.ReflectionHelpers.getStaticField(HoldSpeed.class,"states");states.put(a,state);PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("gesture_horizontal_seek",false).commit();
  MotionEvent move=MotionEvent.obtain(100,200,MotionEvent.ACTION_MOVE,700,900,0);assertTrue(HoldSpeed.touch(a,move));move.recycle();assertEquals(2f,player.speed,0);
  MotionEvent up=MotionEvent.obtain(100,220,MotionEvent.ACTION_UP,700,900,0);assertTrue(HoldSpeed.touch(a,up));up.recycle();assertEquals(1.25f,player.speed,0);assertNull(states.get(a));
 }

 @Test public void repeatedResizeCancelAndSeekStreamsDoNotRetainOwners(){
  ResizeOwner owner=new ResizeOwner();CountingSeek seek=new CountingSeek(a);PopupPinchLayout root=resizeRoot(owner,seek);
  for(int i=0;i<100;i++){event(root,MotionEvent.ACTION_DOWN,399,299);event(root,MotionEvent.ACTION_CANCEL,399,299);assertNull(PopupResize236.drags.get(owner));event(root,MotionEvent.ACTION_DOWN,200,270);event(root,MotionEvent.ACTION_UP,200,270);}
  assertEquals(100,seek.downs);assertEquals(400,owner.U.width);
 }
}
