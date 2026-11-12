package e.e.a;

import android.os.*;
import java.io.*;
import java.net.*;
import java.lang.reflect.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import okhttp3.*;
import okhttp3.internal.connection.RealConnection;
import org.json.*;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={28,34,36},manifest=Config.NONE)
public class NicoliveConnectionTest {
 NicoliveSession session;
 final AtomicInteger streams=new AtomicInteger();
 @Before public void setup(){assertSame(Looper.getMainLooper(),Looper.myLooper());session=new NicoliveSession("lv123","",new NicoliveSession.Listener(){public void program(NicoliveData.Program p){}public void stream(JSONObject s){streams.incrementAndGet();}public void status(String t,boolean end){}public void comment(NicoliveData.Chat c){}public void commentState(boolean b){}public void posted(boolean b,String t){}});}
 @After public void cleanup()throws Exception{if(session!=null){session.close();session.closeTask.get(5,TimeUnit.SECONDS);}}

 @Test public void idleTlsConnectionIsEvictedOffUiThread()throws Exception{
  final Thread main=Thread.currentThread();final AtomicReference<Thread> closer=new AtomicReference<Thread>();
  Socket socket=new Socket(){@Override public synchronized void close(){closer.set(Thread.currentThread());if(Thread.currentThread()==main)throw new NetworkOnMainThreadException();}};
  OkHttpClient client=session.client;
  Address address=new Address("live.nicovideo.jp",443,client.dns(),client.socketFactory(),client.sslSocketFactory(),client.hostnameVerifier(),client.certificatePinner(),client.proxyAuthenticator(),java.net.Proxy.NO_PROXY,client.protocols(),client.connectionSpecs(),client.proxySelector());
  RealConnection connection=new RealConnection(client.connectionPool().delegate,new Route(address,java.net.Proxy.NO_PROXY,new InetSocketAddress("127.0.0.1",443)));
  connection.socket=socket;connection.rawSocket=socket;
  synchronized(client.connectionPool().delegate){client.connectionPool().delegate.connections.add(connection);}
  assertEquals(1,client.connectionPool().connectionCount());
  session.close();session.closeTask.get(5,TimeUnit.SECONDS);
  assertNotNull(closer.get());assertNotSame(main,closer.get());assertEquals(0,client.connectionPool().connectionCount());
 }

 @Test public void websocketAndHttpCancellationAlsoStayOffUiThread()throws Exception{
  final Thread main=Thread.currentThread();final AtomicReference<Thread> socketCloser=new AtomicReference<Thread>(),callCloser=new AtomicReference<Thread>();
  session.socket=(WebSocket)java.lang.reflect.Proxy.newProxyInstance(getClass().getClassLoader(),new Class[]{WebSocket.class},(p,m,a)->{if(m.getName().equals("cancel"))socketCloser.set(Thread.currentThread());return null;});
  Call call=(Call)java.lang.reflect.Proxy.newProxyInstance(getClass().getClassLoader(),new Class[]{Call.class},(p,m,a)->{if(m.getName().equals("cancel"))callCloser.set(Thread.currentThread());if(m.getName().equals("hashCode"))return 123;if(m.getName().equals("equals"))return p==a[0];return null;});
  session.calls.add(call);session.close();session.closeTask.get(5,TimeUnit.SECONDS);
  assertNotNull(socketCloser.get());assertNotNull(callCloser.get());assertNotSame(main,socketCloser.get());assertNotSame(main,callCloser.get());assertTrue(session.calls.isEmpty());assertTrue(session.workers.isShutdown());assertTrue(session.timers.isShutdown());
 }

 @Test public void retiredSessionCannotDeliverStreamOrStartAnotherRequest()throws Exception{
  int token=session.generation;session.close();session.message(null,new JSONObject("{\"type\":\"stream\",\"data\":{\"uri\":\"https://delivery.live.nicovideo.jp/test\"}}"),token);assertEquals(0,streams.get());
  try{session.getText("https://live.nicovideo.jp/",1024);fail("Closed session started I/O");}catch(IOException expected){}
  assertTrue(session.calls.isEmpty());
 }

 @Test public void seatTimerStopsWithTheSession()throws Exception{
  session.message(null,new JSONObject("{\"type\":\"seat\",\"data\":{\"keepIntervalSec\":30}}"),session.generation);ScheduledFuture<?> timer=session.seat;assertNotNull(timer);session.close();assertTrue(timer.isCancelled());assertTrue(session.timers.isShutdown());
 }

 @Test public void browserPauseAndCloseDisconnectInBackground()throws Exception{
  NicoliveBrowser browser=new NicoliveBrowser();final Thread main=Thread.currentThread();final CountDownLatch disconnected=new CountDownLatch(1);final AtomicReference<Thread> closer=new AtomicReference<Thread>();
  HttpURLConnection connection=new HttpURLConnection(new URL("https://live.nicovideo.jp/")){public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){closer.set(Thread.currentThread());disconnected.countDown();}};
  try{browser.requests.add(connection);browser.pauseImages();assertTrue(disconnected.await(5,TimeUnit.SECONDS));assertNotSame(main,closer.get());}finally{browser.close();}
 }
}
