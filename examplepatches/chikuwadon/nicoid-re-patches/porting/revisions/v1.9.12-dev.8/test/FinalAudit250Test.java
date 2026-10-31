package e.e.a;
import android.app.*;import android.content.*;import android.preference.*;import android.view.*;import android.widget.*;
import java.io.*;import java.net.*;import java.util.*;import java.util.concurrent.*;
import org.junit.*;import static org.junit.Assert.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk={28,34},manifest=Config.NONE)
public class FinalAudit250Test {
 Activity a;@Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().get();}
 @After public void cleanup(){for(java.lang.ref.WeakReference<SearchSuggestions.Candidates> ref:new ArrayList<>(SearchSuggestions.attached.values())){SearchSuggestions.Candidates c=ref.get();if(c!=null)c.dispose();}SearchSuggestions.attached.clear();a.finish();}
 static class Connection extends HttpURLConnection {
  byte[] body;int status=200,disconnects;boolean closed;NetworkTask cancelOnRead;
  Connection(String body)throws Exception{super(new URL("https://sug.search.nicovideo.jp/suggestion/complete/test"));this.body=body.getBytes("UTF-8");}
  public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){disconnects++;}
  public int getResponseCode(){return status;}
  public InputStream getInputStream(){return new ByteArrayInputStream(body){public synchronized int read(byte[] b,int off,int len){int n=super.read(b,off,len);if(cancelOnRead!=null)cancelOnRead.cancel();return n;}public void close()throws IOException{closed=true;super.close();}};}
 }
 @Test public void disabledSuggestionsCanBeEnabledAgainWithoutStaleRegistration(){
  AutoCompleteTextView input=new AutoCompleteTextView(a);PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("search_suggestions_enabled",true).commit();SearchSuggestions.attach(input);Object first=input.getAdapter();assertNotNull(first);
  PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("search_suggestions_enabled",false).commit();SearchSuggestions.attach(input);assertNull(input.getAdapter());assertFalse(SearchSuggestions.attached.containsKey(input));
  PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("search_suggestions_enabled",true).commit();SearchSuggestions.attach(input);assertNotNull(input.getAdapter());assertNotSame(first,input.getAdapter());Object second=input.getAdapter();SearchSuggestions.attach(input);assertSame(second,input.getAdapter());
 }
 @Test public void detachCancelsDebounceAndDoesNotScheduleWhileDetached(){
  AutoCompleteTextView input=new AutoCompleteTextView(a);SearchSuggestions.attach(input);SearchSuggestions.Candidates c=SearchSuggestions.attached.get(input).get();input.setText("test");assertNotNull(c.scheduled);int generation=c.version;c.onViewDetachedFromWindow(input);assertNull(c.scheduled);assertFalse(c.active);assertTrue(c.version>generation);input.setText("another");assertNull(c.scheduled);assertNull(c.task);
 }
 @Test public void tagSuggestionsRemainAvailableWhenGeneralSuggestionsAreOff(){AutoCompleteTextView input=new AutoCompleteTextView(a);PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("search_suggestions_enabled",false).commit();SearchSuggestions.attachTag(input);assertNotNull(input.getAdapter());}
 @Test public void validSuggestionResponseKeepsEightCandidateLimitAndClosesResources()throws Exception{
  Connection c=new Connection("{\"candidates\":[\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\"]}");List<String> result=SearchSuggestions.read(c,new NetworkTask());assertEquals(8,result.size());assertEquals("a",result.get(0));assertEquals("h",result.get(7));assertTrue(c.closed);assertEquals(1,c.disconnects);assertNull(c.getRequestProperty("Cookie"));assertFalse(c.getInstanceFollowRedirects());
 }
 @Test public void oversizedSuggestionResponseIsRejectedAndClosed()throws Exception{Connection c=new Connection(new String(new char[65537]).replace('\0','x'));try{SearchSuggestions.read(c,new NetworkTask());fail();}catch(IOException expected){}assertTrue(c.closed);assertTrue(c.disconnects>0);}
 @Test public void suggestionCancellationInterruptsReadAndStillClosesStream()throws Exception{Connection c=new Connection("{\"candidates\":[\"value\"]}");NetworkTask task=new NetworkTask();c.cancelOnRead=task;try{SearchSuggestions.read(c,task);fail();}catch(InterruptedIOException expected){}assertTrue(task.cancelled());assertTrue(c.closed);assertTrue(c.disconnects>0);}
 @Test public void cancelledSuggestionCannotStartReading()throws Exception{Connection c=new Connection("{\"candidates\":[]}");NetworkTask task=new NetworkTask();task.cancel();try{SearchSuggestions.read(c,task);fail();}catch(InterruptedIOException expected){}assertFalse(c.closed);}
 @Test public void errorResponseDoesNotReadOrLogUntrustedBody()throws Exception{Connection c=new Connection("private contents");c.status=500;try{SearchSuggestions.read(c,new NetworkTask());fail();}catch(IOException expected){assertEquals("Suggestion HTTP 500",expected.getMessage());}assertFalse(c.closed);assertEquals(1,c.disconnects);}
 @Test public void nullListLoaderIsAnOptionalNonRankingLifecycleState(){
  StringBuilder entries=org.robolectric.util.ReflectionHelpers.getStaticField(ModernDebug.class,"entries");int before=entries.length();RankingPages190.install(null);RankingPaging190Test.Fragment fragment=new RankingPaging190Test.Fragment();RankingPages190.install(fragment);assertEquals(before,entries.length());assertEquals(0,fragment.i0);assertFalse(RankingPages190.isRanking(null));
 }
 @Test public void initializedRankingStillBindsNativePagingAndCustomAdapter(){RankingPaging190Test.Fragment fragment=new RankingPaging190Test.Fragment();fragment.c0=new RankingPaging190Test.Loader();fragment.c0.a="https://www.nicovideo.jp/ranking/genre/custom-test?term=hour";RankingPages190.install(fragment);assertEquals(100,fragment.i0);assertEquals(6,fragment.h0);assertEquals(6,fragment.p0.e);}
 @Test public void cancellingQueuedRequestReleasesWorkWithoutRunningIt()throws Exception{
  ThreadPoolExecutor worker=new ThreadPoolExecutor(1,1,0,TimeUnit.SECONDS,new LinkedBlockingQueue<Runnable>());CountDownLatch busy=new CountDownLatch(1),release=new CountDownLatch(1);java.util.concurrent.atomic.AtomicBoolean ran=new java.util.concurrent.atomic.AtomicBoolean();
  try{worker.submit(()->{busy.countDown();try{release.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}});assertTrue(busy.await(2,TimeUnit.SECONDS));NetworkTask task=new NetworkTask();task.start(worker,()->ran.set(true));assertEquals(1,worker.getQueue().size());task.cancel();assertEquals(0,worker.getQueue().size());assertFalse(ran.get());}finally{release.countDown();worker.shutdownNow();}
 }

 @Test public void terminalFrameCannotPinADetachedPlayerInStaticCache(){
  Revision244Test.ResizeOwner owner=new Revision244Test.ResizeOwner();FrameLayout player=new FrameLayout(a);owner.e=player;
  android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(10,10,android.graphics.Bitmap.Config.ARGB_8888);
  PopupFrame233.present(owner,player,bitmap);assertFalse(PopupFrame233.frames.containsKey(player));assertEquals(0,player.getChildCount());bitmap.recycle();
 }
 @Test public void terminalFrameStillFitsAttachedPlayerAndClearsOnDetach(){
  Revision244Test.ResizeOwner owner=new Revision244Test.ResizeOwner();FrameLayout player=new FrameLayout(a);owner.e=player;a.setContentView(player);
  android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(10,10,android.graphics.Bitmap.Config.ARGB_8888);
  PopupFrame233.present(owner,player,bitmap);PopupFrame233.State state=PopupFrame233.frames.get(player);assertNotNull(state);assertNotNull(state.image);assertEquals(-1,state.image.getLayoutParams().width);assertEquals(-1,state.image.getLayoutParams().height);
  a.setContentView(new FrameLayout(a));assertNull(state.image);PopupFrame233.clear(owner);assertFalse(PopupFrame233.frames.containsKey(player));bitmap.recycle();
 }
 public static class WindowOwner extends Revision244Test.ResizeOwner {public WindowManager b;public SeekBar d;public static float w0;public static int u0,v0;}
 @Test public void resizingCommitsOneWindowUpdateAfterFittingControls(){
  PreferenceManager.getDefaultSharedPreferences(a).edit().putString("player_controls_visibility_mode","popup").commit();
  WindowOwner owner=new WindowOwner();FrameLayout root=new FrameLayout(a);RelativeLayout stage=new RelativeLayout(a),menu=new RelativeLayout(a);stage.addView(menu,new RelativeLayout.LayoutParams(-1,1));root.addView(stage,new FrameLayout.LayoutParams(400,300));a.setContentView(root);root.layout(0,0,400,300);stage.layout(0,0,400,300);owner.a=root;owner.e=new View(a);owner.e.setLayoutParams(new LinearLayout.LayoutParams(-1,-1));owner.U.width=400;owner.U.height=300;
  final int[] updates={0};owner.b=(WindowManager)java.lang.reflect.Proxy.newProxyInstance(WindowManager.class.getClassLoader(),new Class[]{WindowManager.class},(proxy,method,args)->{if(method.getName().equals("updateViewLayout"))updates[0]++;return null;});
  PopupControls193 binding=new PopupControls193(owner,root,stage,menu);binding.row.setTag(2131231183,binding);updates[0]=0;
  PopupLayout236.request(owner,320,20,30);assertEquals(1,updates[0]);assertEquals(320,owner.U.width);assertEquals(20,owner.U.x);assertEquals(30,owner.U.y);PopupLayout236.cancel(binding);binding.prefs.unregisterOnSharedPreferenceChangeListener(binding);
 }
 @Test public void insecureSuggestionRedirectIsRejectedBeforeSendingQueryToAnotherHost()throws Exception{
  Connection c=new Connection("private"){public String getHeaderField(String name){return "http://attacker.invalid/path";}};c.status=302;
  try{SearchSuggestions.read(c,new NetworkTask());fail();}catch(IOException expected){assertEquals("Invalid authenticated API destination",expected.getMessage());}assertEquals(1,c.disconnects);assertFalse(c.closed);
 }
}
