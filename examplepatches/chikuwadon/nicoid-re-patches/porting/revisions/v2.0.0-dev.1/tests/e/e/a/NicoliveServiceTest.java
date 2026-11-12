package e.e.a;
import android.app.*;import android.os.*;import android.view.*;import org.junit.*;import static org.junit.Assert.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.android.controller.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk={28,34,36},manifest=Config.NONE)
public class NicoliveServiceTest {
 ServiceController<NicoliveService> controller;NicoliveService s;
 @Before public void setup(){controller=Robolectric.buildService(NicoliveService.class);s=controller.create().get();}
 @After public void cleanup(){if(controller!=null)controller.destroy();}
 @Test public void activityToPopupSurfaceTransferKeepsOnePlayer(){Activity a=Robolectric.buildActivity(Activity.class).setup().get();NicolivePlayerFrame first=new NicolivePlayerFrame(a,false),second=new NicolivePlayerFrame(a,true);Object player=s.player;s.attach(first);s.attach(second);assertNull(first.owner);assertSame(s,second.owner);assertSame(player,s.player);s.detach(first);assertSame(second,s.frame);s.detach(second);assertNull(s.frame);}
 @Test public void explicitStopReleasesPlayerAndRemovesPolling(){assertSame(s,NicoliveService.active);s.attach(new NicolivePlayerFrame(s,false));s.stopPlayback();assertNull(s.frame);assertTrue(s.stopped);assertNull(s.player);assertNull(s.session);assertFalse(s.main.hasCallbacks(s.tick));s.stopPlayback();}
 @Test public void popupResizeAlwaysStaysWithinScreen(){s.popupParams=new WindowManager.LayoutParams();s.popupParams.x=99999;s.popupParams.y=-999;s.resizePopup(999999);assertTrue(s.popupParams.width<=s.getResources().getDisplayMetrics().widthPixels);assertTrue(s.popupParams.x>=0);assertTrue(s.popupParams.y>=0);assertTrue(s.popupParams.x+s.popupParams.width<=s.getResources().getDisplayMetrics().widthPixels);s.resizePopup(1);assertTrue(s.popupParams.width>1);}
 @Test public void openingVideoStopsTheLiveOwner(){NicoliveEntry.beforeVideo();Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(s.stopped);assertNull(s.player);}
 @Test public void japaneseEntryIsBetaAndIsAddedOnlyOnce() {
  android.content.res.Configuration config=new android.content.res.Configuration(s.getResources().getConfiguration());
  config.setLocale(java.util.Locale.JAPANESE);
  android.content.Context context=s.createConfigurationContext(config);
  java.util.ArrayList<java.util.Map<String,Object>> rows=new java.util.ArrayList<>();
  NicoliveEntry.addMenu(context,rows);
  NicoliveEntry.addMenu(context,rows);
  assertEquals(1,rows.size());
  assertEquals("ニコ生 (β)",rows.get(0).get("title"));
  assertEquals(NicoliveActivity.class.getName(),((android.content.Intent)rows.get(0).get("intent")).getComponent().getClassName());
 }
 @Test public void mediaNotificationIncludesProgramAndBroadcaster() {
  s.program=new NicoliveData.Program("lv123");
  s.program.title="試験番組";
  s.program.owner="放送者";
  Notification notice=s.notification();
  assertEquals("試験番組",notice.extras.getCharSequence(Notification.EXTRA_TITLE));
  assertEquals("放送者",notice.extras.getCharSequence(Notification.EXTRA_TEXT));
  assertEquals(s.mediaSession.getSessionToken(),notice.extras.getParcelable(Notification.EXTRA_MEDIA_SESSION));
  assertEquals(2,notice.actions.length);
 }
 @Test public void staleNotificationWithoutAProgramStopsIdleService() {
  s.onStartCommand(new android.content.Intent().setAction("reconnect"),0,1);
  assertTrue(s.stopped);
  assertNull(s.player);
 }
 public static class CommandService extends NicoliveService {
  int openCount;
  @Override void open(String requested) {openCount++;id=requested;terminal=false;}
 }
 @Test public void openingAnEndedProgramStartsItAgainWithoutRestartingActivePlayback() {
  ServiceController<CommandService> controller=Robolectric.buildService(CommandService.class).create();
  CommandService live=controller.get();
  try {
   live.id="lv123";
   android.content.Intent open=new android.content.Intent().putExtra("program","lv123");
   live.onStartCommand(open,0,1);
   assertEquals(0,live.openCount);
   live.terminal=true;
   live.onStartCommand(open,0,2);
   assertEquals(1,live.openCount);
  } finally {controller.destroy();}
 }
 static void measure(View v,int w,int h){v.measure(View.MeasureSpec.makeMeasureSpec(w,1073741824),View.MeasureSpec.makeMeasureSpec(h,1073741824));v.layout(0,0,w,h);}
 NicolivePlayerFrame popup(){s.id="lv123";s.popupParams=new WindowManager.LayoutParams();s.popupParams.width=192;s.popupParams.height=108;s.popupParams.x=0;s.popupParams.y=20;s.popupParams.type=WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY;s.popupParams.flags=WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;s.popupParams.gravity=Gravity.TOP|Gravity.LEFT;NicolivePlayerFrame frame=new NicolivePlayerFrame(s,true);s.popup=frame;s.attach(frame);s.manager.addView(frame,s.popupParams);measure(frame,192,108);return frame;}
 static void event(View v,long down,long at,int action,float x,float y){MotionEvent e=MotionEvent.obtain(down,at,action,x,y,0);v.dispatchTouchEvent(e);e.recycle();}
 static void multi(View v,long down,long at,int action,float x1,float x2){MotionEvent.PointerProperties[] properties={new MotionEvent.PointerProperties(),new MotionEvent.PointerProperties()};MotionEvent.PointerCoords[] coords={new MotionEvent.PointerCoords(),new MotionEvent.PointerCoords()};for(int i=0;i<2;i++){properties[i].id=i;properties[i].toolType=MotionEvent.TOOL_TYPE_FINGER;coords[i].y=35;coords[i].pressure=1;coords[i].size=1;}coords[0].x=x1;coords[1].x=x2;MotionEvent e=MotionEvent.obtain(down,at,action,2,properties,coords,0,0,1,1,0,0,android.view.InputDevice.SOURCE_TOUCHSCREEN,0);v.dispatchTouchEvent(e);e.recycle();}
 @Test public void draggingThePictureMovesPopupOutsideTheOldTopStrip(){NicolivePlayerFrame frame=popup();long t=SystemClock.uptimeMillis();event(frame,t,t,MotionEvent.ACTION_DOWN,60,40);event(frame,t,t+20,MotionEvent.ACTION_MOVE,100,70);event(frame,t,t+40,MotionEvent.ACTION_UP,100,70);assertEquals(40,s.popupParams.x);assertEquals(50,s.popupParams.y);}
 @Test public void tappingPlaybackControlDoesNotDragThePopup(){NicolivePlayerFrame frame=popup();long t=SystemClock.uptimeMillis();int x=s.popupParams.x,y=s.popupParams.y;assertFalse(s.playRequested());event(frame,t,t,MotionEvent.ACTION_DOWN,24,84);event(frame,t,t+20,MotionEvent.ACTION_UP,24,84);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(s.playRequested());assertEquals(x,s.popupParams.x);assertEquals(y,s.popupParams.y);}
 @Test public void pinchReceivesDownAndResizesWithinBounds(){NicolivePlayerFrame frame=popup();long t=SystemClock.uptimeMillis();int width=s.popupParams.width;event(frame,t,t,MotionEvent.ACTION_DOWN,40,35);multi(frame,t,t+20,MotionEvent.ACTION_POINTER_DOWN|(1<<8),40,140);multi(frame,t,t+40,MotionEvent.ACTION_MOVE,20,180);multi(frame,t,t+60,MotionEvent.ACTION_MOVE,0,220);multi(frame,t,t+70,MotionEvent.ACTION_MOVE,-30,250);multi(frame,t,t+80,MotionEvent.ACTION_POINTER_UP|(1<<8),0,220);event(frame,t,t+100,MotionEvent.ACTION_UP,0,35);assertTrue(s.popupParams.width>width);assertTrue(s.popupParams.x>=0);assertTrue(s.popupParams.x+s.popupParams.width<=s.getResources().getDisplayMetrics().widthPixels);}
 @Test public void repeatedHandoffsKeepTheSessionAndPlayerForTwoSimulatedMinutes()throws Exception{Activity a=Robolectric.buildActivity(Activity.class).setup().get();s.id="lv123";s.session=new NicoliveSession("lv123","",new NicoliveSession.Listener(){public void program(NicoliveData.Program p){}public void stream(org.json.JSONObject p){}public void status(String p,boolean e){}public void comment(NicoliveData.Chat c){}public void commentState(boolean b){}public void posted(boolean b,String p){}});Object player=s.player,session=s.session;int generation=s.serial;for(int i=0;i<60;i++){NicolivePlayerFrame floating=popup(),normal=new NicolivePlayerFrame(a,false);s.returnToFrame(normal);assertNull(s.popup);assertNull(floating.owner);assertSame(normal,s.frame);assertSame(s,normal.owner);assertSame(player,s.player);assertSame(session,s.session);assertEquals(generation,s.serial);Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(2));}NicoliveSession transport=s.session;s.stopPlayback();transport.closeTask.get(5,java.util.concurrent.TimeUnit.SECONDS);assertTrue(transport.closed);assertNull(s.player);}
 @Test public void controlsHideDuringPlaybackAndTapRevealsThem(){NicolivePlayerFrame frame=popup();s.player.play();frame.revealControls();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(4));assertEquals(View.GONE,frame.bottom.getVisibility());long t=SystemClock.uptimeMillis();event(frame,t,t,MotionEvent.ACTION_DOWN,80,40);event(frame,t,t+20,MotionEvent.ACTION_UP,80,40);assertEquals(View.VISIBLE,frame.bottom.getVisibility());s.pause();Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(4));assertEquals(View.VISIBLE,frame.bottom.getVisibility());}
 public static class PlayingService extends NicoliveService {long epoch=100000;@Override boolean playing(){return true;}@Override long playbackEpoch(){return epoch;}}
 @Test public void futureCommentsSurviveUntilPresentationAndToggleRepopulates(){ServiceController<PlayingService> c=Robolectric.buildService(PlayingService.class);PlayingService live=c.create().get();try{NicolivePlayerFrame frame=new NicolivePlayerFrame(live,false);measure(frame,360,200);live.attach(frame);NicoliveData.Chat chat=new NicoliveData.Chat();chat.text="visible";chat.vpos=10010;live.program=new NicoliveData.Program("lv123");live.history.add(chat);frame.comments.add(chat,100100);android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(360,200,android.graphics.Bitmap.Config.ARGB_8888);frame.comments.draw(new android.graphics.Canvas(bitmap));assertEquals(1,frame.comments.items.size());live.epoch=100150;frame.comments.draw(new android.graphics.Canvas(bitmap));assertEquals(1,frame.comments.items.size());frame.cc.performClick();assertFalse(frame.comments.enabled);assertEquals(0,frame.comments.items.size());frame.cc.performClick();assertTrue(frame.comments.enabled);assertEquals(1,frame.comments.items.size());assertTrue(frame.cc.isSelected());live.epoch=110000;frame.comments.draw(new android.graphics.Canvas(bitmap));assertEquals(0,frame.comments.items.size());bitmap.recycle();}finally{c.destroy();}}

}
