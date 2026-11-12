package e.e.a;

import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.json.*;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import androidx.media3.datasource.*;
import androidx.media3.exoplayer.hls.playlist.*;
import android.net.Uri;

/** Optional read-only check. Never posts to a broadcast or modifies an account. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=36,manifest=Config.NONE)
public class NicoliveLiveApiTest {
 @Test public void actualGuestWatchAndHlsParsingAndCommentReceive()throws Exception{
  final CountDownLatch ready=new CountDownLatch(1),refreshed=new CountDownLatch(1);
  final AtomicReference<JSONObject> stream=new AtomicReference<JSONObject>();
  final AtomicInteger comments=new AtomicInteger(),streams=new AtomicInteger();
  final AtomicReference<String> failure=new AtomicReference<String>();
  final AtomicBoolean connected=new AtomicBoolean();
  NicoliveSession.Listener noop=new NicoliveSession.Listener(){public void program(NicoliveData.Program p){}public void stream(JSONObject s){}public void status(String t,boolean e){}public void comment(NicoliveData.Chat c){}public void commentState(boolean b){}public void posted(boolean b,String t){}};
  NicoliveBrowser browser=new NicoliveBrowser();String html;
  try{html=new String(browser.work.submit(()->browser.bytes("https://live.nicovideo.jp/","",2097152,true)).get(30,TimeUnit.SECONDS),"UTF-8");System.out.println("Live feed decoded bytes="+html.getBytes("UTF-8").length);}finally{browser.close();}
  NicoliveData.Program selected=null;
  for(NicoliveData.Program p:NicoliveData.listings(html))if(p.onAir()&&(selected==null||p.comments>selected.comments))selected=p;
  assertNotNull(selected);
  final NicoliveSession session=new NicoliveSession(selected.id,"",new NicoliveSession.Listener(){
   public void program(NicoliveData.Program p){assertFalse(p.loggedIn);System.out.println("Program: onAir="+p.onAir()+", canWatch="+p.canWatch);}
   public void stream(JSONObject s){stream.set(s);if(streams.incrementAndGet()==1)ready.countDown();else refreshed.countDown();System.out.println("Stream received; count="+streams.get());}
   public void status(String text,boolean end){System.out.println("Session: "+text+" terminal="+end);if(end)failure.set(text);}
   public void comment(NicoliveData.Chat c){if(!c.text.isEmpty())comments.incrementAndGet();}
   public void commentState(boolean value){if(connected.getAndSet(value)!=value)System.out.println("Comments connected="+value);}
   public void posted(boolean success,String text){fail("This test never posts comments");}
  });
  try{
   session.start();assertTrue("watch timeout; stream="+(stream.get()!=null)+", failure="+failure.get(),ready.await(45,TimeUnit.SECONDS));
   JSONObject data=stream.get();assertNotNull(data);assertTrue(data.getJSONArray("availableQualities").length()>0);verifyMedia(data);
   int seconds=Integer.getInteger("live.soakSeconds",90);waitConnected(session,failure,seconds);
   // Reconnection is initiated on the same main thread that runs the Android test.
   session.reconnect();assertTrue("Fresh stream after reconnect",refreshed.await(45,TimeUnit.SECONDS));verifyMedia(stream.get());waitConnected(session,failure,10);
   System.out.println("Guest live check: "+selected.id+", initial connected seconds="+seconds+", streams="+streams.get()+", comments="+comments.get()+", media=OK, reconnect=OK");
  }finally{session.close();session.closeTask.get(10,TimeUnit.SECONDS);}
  assertTrue(session.closed);assertTrue(session.workers.isShutdown());assertTrue(session.timers.isShutdown());
 }
 static void waitConnected(NicoliveSession session,AtomicReference<String> failure,int seconds)throws Exception{
  for(int i=0;i<seconds;i++){Thread.sleep(1000);assertFalse(session.closed);assertNull(failure.get());if((i+1)%30==0)System.out.println("Connection maintained for "+(i+1)+" seconds");}
 }
 static void verifyMedia(JSONObject data)throws Exception{
  String uri=data.getString("uri");org.robolectric.android.controller.ServiceController<NicoliveService> controller=Robolectric.buildService(NicoliveService.class);NicoliveService owner=controller.create().get();
  try{
   owner.mediaCookies=data.optJSONArray("cookies");if(owner.mediaCookies==null)owner.mediaCookies=new JSONArray();HlsPlaylistParser parser=new HlsPlaylistParser();HlsMultivariantPlaylist master;
   try(DataSourceInputStream in=new DataSourceInputStream(owner.new CookieSource(owner.mediaCookies),new DataSpec(Uri.parse(uri)))){HlsPlaylist playlist=parser.parse(Uri.parse(uri),in);assertTrue(playlist instanceof HlsMultivariantPlaylist);master=(HlsMultivariantPlaylist)playlist;}
   assertFalse(master.variants.isEmpty());Uri variant=master.variants.get(0).url;HlsMediaPlaylist media;
   try(DataSourceInputStream in=new DataSourceInputStream(owner.new CookieSource(owner.mediaCookies),new DataSpec(variant))){HlsPlaylist playlist=parser.parse(variant,in);assertTrue(playlist instanceof HlsMediaPlaylist);media=(HlsMediaPlaylist)playlist;}
   assertFalse(media.segments.isEmpty());assertTrue("Program date time for comment alignment",media.hasProgramDateTime);Uri segment=Uri.parse(java.net.URI.create(media.baseUri).resolve(media.segments.get(media.segments.size()-1).url).toString());
   try(DataSourceInputStream in=new DataSourceInputStream(owner.new CookieSource(owner.mediaCookies),new DataSpec(segment))){assertTrue(in.read(new byte[4096])>0);}
  }finally{controller.destroy();}
 }
}
