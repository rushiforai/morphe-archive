package nl.johninnl.tests.npophone;

import android.app.Activity;
import android.content.*;
import android.media.session.*;
import android.net.Uri;
import android.os.*;
import android.view.KeyEvent;
import dalvik.system.PathClassLoader;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Exercise emitted APK boundaries with a real app context, media session and synthetic HTTPS. */
public class NpoPhoneProbeActivity extends Activity {
    ClassLoader apk;
    Object unsafe;
    Method allocate;
    int cases;
    final StringBuilder results = new StringBuilder();
    static Connection connection;
    static boolean openFails;
    static final IOException OPEN_FAILURE=new IOException("fixture open failure");
    static final String VALID = "{\"issuer\":\"https://fixture.invalid\",\"authorization_endpoint\":\"https://fixture.invalid/auth\",\"token_endpoint\":\"https://fixture.invalid/token\",\"jwks_uri\":\"https://fixture.invalid/keys\",\"response_types_supported\":[\"code\"],\"subject_types_supported\":[\"public\"],\"id_token_signing_alg_values_supported\":[\"RS256\"]}";

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        final String input=getIntent().getStringExtra("apk"), id=getIntent().getStringExtra("run");
        new Thread(() -> {
            String outcome;
            try {
                apk=new PathClassLoader(input,getClassLoader());
                // AppCompat's vector self-check uses the target APK's public
                // resources. Load those resources without opening app storage.
                android.content.res.loader.ResourcesLoader resources=new android.content.res.loader.ResourcesLoader();
                try(ParcelFileDescriptor file=ParcelFileDescriptor.open(new File(input),ParcelFileDescriptor.MODE_READ_ONLY)) {
                    resources.addProvider(android.content.res.loader.ResourcesProvider.loadFromApk(file));
                }
                getResources().addLoaders(resources);
                Class<?> u=Class.forName("sun.misc.Unsafe");
                for(Field field:u.getDeclaredFields()) if(field.getType()==u) {
                    field.setAccessible(true); unsafe=field.get(null); if(unsafe!=null)break;
                }
                check(unsafe!=null,"Unsafe fixture allocator unavailable");
                allocate=u.getMethod("allocateInstance",Class.class);
                URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
                    @Override protected URLConnection openConnection(URL url) throws IOException {
                        check("fixture.invalid".equals(url.getHost()),"unexpected real endpoint");
                        if(openFails)throw OPEN_FAILURE;
                        return connection;
                    }
                } : null);
                gates(); receiver(); bitmap(); indicator(); discovery();
                outcome="PASS cases="+cases+"\n"+results;
            } catch(Throwable failure) {
                StringWriter trace=new StringWriter();failure.printStackTrace(new PrintWriter(trace));
                outcome="FAIL\n"+results+trace;
            }
            try(FileOutputStream out=openFileOutput(id+".txt",MODE_PRIVATE)) {
                out.write(outcome.getBytes(StandardCharsets.UTF_8));
            } catch(IOException error) {throw new RuntimeException(error);}
        },"NpoPhoneProbe").start();
    }

    interface Test {void run() throws Exception;}
    static void check(boolean value,String message) {if(!value)throw new AssertionError(message);}
    void test(String name,Test body) throws Exception {body.run();cases++;results.append("PASS ").append(name).append('\n');}
    Class<?> type(String name) throws Exception {return Class.forName(name,false,apk);}
    Object instance(String name) throws Exception {return allocate.invoke(unsafe,type(name));}
    void field(Object target,String name,Object value) throws Exception {
        Field field=target.getClass().getDeclaredField(name);field.setAccessible(true);field.set(target,value);
    }
    Object field(Object target,String name) throws Exception {
        Field field=target.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(target);
    }
    Object invoke(String owner,String name,Class<?>[] types,Object target,Object... args) throws Exception {
        Method method=type(owner).getDeclaredMethod(name,types);method.setAccessible(true);
        try{return method.invoke(target,args);}catch(InvocationTargetException error) {
            Throwable cause=error.getCause();if(cause instanceof Exception)throw (Exception)cause;
            if(cause instanceof Error)throw (Error)cause;throw error;
        }
    }
    void voidGate(String owner,String name,Class<?>[] types,Object... args) throws Exception {
        test(owner+"."+name,() -> invoke(owner,name,types,instance(owner),args));
    }
    void gates() throws Exception {
        final String ima="nl.npo.player.library.sterads.presentation.ads.ImaAdManager";
        for(boolean debugLogging:new boolean[]{true,false}) {
            final boolean branch=debugLogging;
            test("IMA null loader branch "+branch,() -> check(invoke(ima,"getAdsLoader",new Class<?>[]{Context.class,boolean.class},instance(ima),null,branch)==null,"IMA loader attached"));
        }
        for(String owner:new String[]{"nl.npo.player.library.sw.a","nl.npo.player.library.domain.streamLink.model.StreamLinkAssets",
            "nl.npo.player.library.data.offline.model.OnDiskSourceConfig","nl.npo.player.library.data.extensions.NPOSourceConfigKt$copyInternal$newSourceConfig$1","nl.npo.player.library.tv.a"}) {
            test("preroll "+owner,() -> check(invoke(owner,"getPreRollAdUrl",new Class<?>[0],instance(owner))==null,"preroll returned"));
        }
        voidGate("nl.npo.player.library.v10.d","a",new Class<?>[]{type("nl.npo.tag.sdk.model.EventType"),type("nl.npo.tag.sdk.model.PageEvent")},null,null);
        Object unit=type("nl.npo.player.library.hq.d0").getField("a").get(null);
        test("Topspin typed Unit",() -> check(invoke("nl.npo.player.library.q10.c","a",new Class<?>[]{type("nl.npo.tag.sdk.model.TagEvent"),int.class,type("nl.npo.player.library.oq.c")},instance("nl.npo.player.library.q10.c"),null,0,null)==unit,"Topspin return type"));
        test("DAM typed Unit",() -> check(invoke("nl.npo.player.library.t10.c","b",new Class<?>[]{type("nl.npo.player.library.oq.c")},instance("nl.npo.player.library.t10.c"),(Object)null)==unit,"DAM return type"));
        test("session data empty",() -> check("".equals(invoke("nl.npo.player.library.npotag.model.PlayerPageTrackerImpl","getSessionData",new Class<?>[]{type("nl.npo.player.library.mq.c")},instance("nl.npo.player.library.npotag.model.PlayerPageTrackerImpl"),(Object)null)),"session identifier returned"));
        test("STER input null",() -> check(invoke("nl.npo.player.library.data.streamLink.model.StreamInfoRequest","getSter",new Class<?>[0],instance("nl.npo.player.library.data.streamLink.model.StreamInfoRequest"))==null,"STER input returned"));
        test("Sentry disabled",() -> check(Boolean.FALSE.equals(invoke("io.sentry.s6","isEnabled",new Class<?>[0],instance("io.sentry.s6"))),"Sentry enabled"));
        for(String name:new String[]{"com.bitmovin.player.api.Player","com.bitmovin.player.api.source.Source"}) {
            test("Bitmovin identity "+name,() -> {
                Class<?> parameter=type(name);
                Object value=parameter.isInterface()?java.lang.reflect.Proxy.newProxyInstance(apk,new Class<?>[]{parameter},(p,m,a)->null):instance(name);
                Class<?> config=type(name.endsWith("Player")?"com.bitmovin.player.api.analytics.AnalyticsPlayerConfig":"com.bitmovin.player.api.analytics.AnalyticsSourceConfig");
                Class<?>[] parameters=name.endsWith("Player")?new Class<?>[]{parameter,Context.class,config}:new Class<?>[]{parameter,config};
                Object[] args=name.endsWith("Player")?new Object[]{value,null,null}:new Object[]{value,null};
                check(invoke("com.bitmovin.player.analytics.internal.AnalyticsConfiguratorKt","configureAnalytics",parameters,null,args)==value,"functional identity changed");
            });
        }
        test("STER configuration null",() -> check(invoke(ima,"supplyOptionalConfiguration",new Class<?>[0],instance(ima))==null,"STER configuration returned"));
        voidGate("nl.npo.player.library.jm.p2","a",new Class<?>[]{type("nl.npo.player.library.jm.n3"),int.class},null,0);
        voidGate("nl.npo.player.library.ak.a","M",new Class<?>[]{type("nl.npo.player.library.qk.a")},(Object)null);
        voidGate("com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver","onReceive",new Class<?>[]{Context.class,Intent.class},null,null);
        test("advertising-ID diagnostics disabled",() -> invoke("nl.npo.player.library.el.a","d",new Class<?>[]{type("nl.npo.player.library.ea.x"),long.class,Throwable.class},null,null,0L,null));
        test("CCT typed fatal response",() -> {
            Object value=invoke("nl.npo.player.library.p7.x0","c",new Class<?>[]{type("nl.npo.player.library.ks.c")},instance("nl.npo.player.library.p7.x0"),(Object)null);
            check(value.getClass()==type("nl.npo.player.library.nm.k"),"wrong CCT response class");
            check(((Integer)field(value,"a"))==403 && ((Long)field(value,"b"))==0L && field(value,"c")==null,"CCT must discard locally without redirect");
        });
    }

    Object receiver(int branch,Object owner) throws Exception {
        Object receiver=instance("nl.npo.player.library.j9.e2");field(receiver,"a",branch);field(receiver,"b",owner);return receiver;
    }
    void receive(Object receiver,Intent intent) throws Exception {
        invoke("nl.npo.player.library.j9.e2","onReceive",new Class<?>[]{Context.class,Intent.class},receiver,this,intent);
    }
    void receiver() throws Exception {
        test("network dispatch queued with original receiver/context",() -> {
            final ArrayList<Runnable> queue=new ArrayList<>();Object observer=instance("nl.npo.player.library.v6.s");
            field(observer,"c",(Executor)queue::add);Object receiver=receiver(2,observer);
            receive(receiver,new Intent("android.net.conn.CONNECTIVITY_CHANGE"));
            check(queue.size()==1,"network update not queued once");Object work=queue.get(0);
            check(work.getClass()==type("io.sentry.g7") && ((Integer)field(work,"h"))==23,"wrong shipped network runnable");
            check(field(work,"i")==receiver && field(work,"j")==this,"network arguments changed");
        });
        test("unrelated audio action ignored",() -> receive(receiver(1,null),new Intent("fixture.other")));
        test("null audio action ignored",() -> receive(receiver(1,null),new Intent()));
        test("noisy audio reaches every original listener once",() -> {
            Object owner=instance("nl.npo.player.library.jv.c");CopyOnWriteArraySet<Object> listeners=new CopyOnWriteArraySet<>();field(owner,"b",listeners);
            ArrayList<Object> flows=new ArrayList<>();Class<?> overflow=type("kotlinx.coroutines.channels.BufferOverflow");
            Object suspend=overflow.getField("SUSPEND").get(null);
            for(int i=0;i<2;i++) {
                Object flow=type("nl.npo.player.library.bu.d1").getConstructor(int.class,int.class,overflow).newInstance(2,2,suspend);flows.add(flow);
                Object sink=instance("nl.npo.player.library.xw.x");field(sink,"a",flow);
                Object listener=instance("nl.npo.player.library.xw.p");field(listener,"h",sink);listeners.add(listener);
            }
            receive(receiver(1,owner),new Intent("android.media.AUDIO_BECOMING_NOISY"));
            Object expected=type("nl.npo.player.library.fw.i").getField("a").get(null);
            for(Object flow:flows) {
                int found=0;
                for(Field f:flow.getClass().getDeclaredFields())if(f.getType()==Object[].class) {
                    f.setAccessible(true);Object[] buffer=(Object[])f.get(flow);
                    if(buffer!=null)for(Object event:buffer)if(event==expected)found++;
                }
                check(found==1,"noisy singleton was not emitted once");
            }
        });
        test("unrelated media action ignored",() -> receive(receiver(0,null),new Intent("fixture.other")));
        test("media action without key ignored",() -> receive(receiver(0,null),new Intent(Intent.ACTION_MEDIA_BUTTON)));
        test("media key reaches real Android MediaSession",() -> {
            HandlerThread worker=new HandlerThread("NpoMediaCallback");worker.start();
            MediaSession session=new MediaSession(this,"NpoPhonePatchProbe");CountDownLatch received=new CountDownLatch(1);
            session.setCallback(new MediaSession.Callback(){@Override public boolean onMediaButtonEvent(Intent event){received.countDown();return true;}},new Handler(worker.getLooper()));
            session.setFlags(MediaSession.FLAG_HANDLES_MEDIA_BUTTONS|MediaSession.FLAG_HANDLES_TRANSPORT_CONTROLS);
            session.setPlaybackState(new PlaybackState.Builder().setActions(PlaybackState.ACTION_PLAY_PAUSE).setState(PlaybackState.STATE_PAUSED,0,1).build());session.setActive(true);
            try {
                Object nativeController=instance("nl.npo.player.library.k9.y");field(nativeController,"a",session.getController());
                Object controller=instance("nl.npo.player.library.f9.j");field(controller,"i",nativeController);
                Object compat=instance("nl.npo.player.library.k9.r0");field(compat,"i",controller);
                Object owner=instance("nl.npo.player.library.j9.g2");field(owner,"k",compat);
                Intent event=new Intent(Intent.ACTION_MEDIA_BUTTON).putExtra(Intent.EXTRA_KEY_EVENT,new KeyEvent(KeyEvent.ACTION_DOWN,KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE));
                receive(receiver(0,owner),event);
                check(received.await(3,TimeUnit.SECONDS),"media-button dispatch did not reach the session");
            } finally {session.release();worker.quitSafely();}
        });
    }

    static class Stream extends ByteArrayInputStream {
        int closes;boolean fail;
        Stream(String body){super(body.getBytes(StandardCharsets.UTF_8));}
        @Override public synchronized int read(byte[] out,int offset,int length) {
            if(fail)throw new IllegalStateException("fixture unexpected read failure");
            return super.read(out,offset,length);
        }
        @Override public void close() throws IOException {closes++;super.close();}
    }

    static class BitmapBinder extends Binder {
        final android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(2,2,android.graphics.Bitmap.Config.ARGB_8888);
        int calls;
        Uri requested;
        boolean empty, remoteFailure, malformed;
        String thread;
        BitmapBinder(){bitmap.setPixel(1,1,0xff00ff00);}
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags) throws RemoteException {
            if(code==IBinder.INTERFACE_TRANSACTION){reply.writeString("com.google.android.gms.cast.framework.media.internal.IFetchBitmapTask");return true;}
            check(code==1,"wrong Cast bitmap transaction");
            data.enforceInterface("com.google.android.gms.cast.framework.media.internal.IFetchBitmapTask");
            requested=data.readInt()==0?null:Uri.CREATOR.createFromParcel(data);calls++;thread=Thread.currentThread().getName();
            if(remoteFailure)throw new RemoteException("fixture bitmap service failure");
            reply.writeNoException();reply.writeInt(empty?0:1);
            if(!empty&&!malformed)bitmap.writeToParcel(reply,1);
            return true;
        }
    }
    Object bitmapTask(BitmapBinder binder,Object callback) throws Exception {
        Object task=type("nl.npo.player.library.ll.c").getConstructor(Context.class,int.class,int.class,type("nl.npo.player.library.ll.b")).newInstance(this,32,32,callback);
        Object proxy=instance("nl.npo.player.library.ll.d");
        Class<?> base=type("nl.npo.player.library.im.a");
        Field transport=base.getDeclaredField("j"),descriptor=base.getDeclaredField("k"),kind=base.getDeclaredField("i");
        transport.setAccessible(true);descriptor.setAccessible(true);kind.setAccessible(true);
        transport.set(proxy,binder);descriptor.set(proxy,"com.google.android.gms.cast.framework.media.internal.IFetchBitmapTask");kind.setInt(proxy,1);
        field(task,"a",proxy);return task;
    }
    Object fetchBitmap(Object task,Uri... uris) throws Exception {
        return invoke("nl.npo.player.library.ll.c","doInBackground",new Class<?>[]{Object[].class},task,(Object)uris);
    }
    Object bitmapCallback(CountDownLatch delivered,java.util.concurrent.atomic.AtomicReference<Object> result,
                          java.util.concurrent.atomic.AtomicReference<Looper> callbackLooper) throws Exception {
        return java.lang.reflect.Proxy.newProxyInstance(apk,new Class<?>[]{type("nl.npo.player.library.ll.a")},(proxy,method,args)->{
            if(method.getName().equals("a")){result.set(args[0]);callbackLooper.set(Looper.myLooper());delivered.countDown();return null;}
            if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
            if(method.getName().equals("equals"))return proxy==args[0];
            return "BitmapProbeListener";
        });
    }
    void bitmap() throws Exception {
        final Uri uri=Uri.parse("https://fixture.invalid/bitmap.png");
        test("bitmap empty arguments skip Binder",() -> {
            BitmapBinder binder=new BitmapBinder();check(fetchBitmap(bitmapTask(binder,null))==null&&binder.calls==0,"empty arguments sent");
        });
        test("bitmap multiple arguments skip Binder",() -> {
            BitmapBinder binder=new BitmapBinder();check(fetchBitmap(bitmapTask(binder,null),uri,uri)==null&&binder.calls==0,"multiple arguments sent");
        });
        test("bitmap null URI skips Binder",() -> {
            BitmapBinder binder=new BitmapBinder();check(fetchBitmap(bitmapTask(binder,null),(Uri)null)==null&&binder.calls==0,"null URI sent");
        });
        test("bitmap unavailable service returns null",() -> {
            BitmapBinder binder=new BitmapBinder();Object task=bitmapTask(binder,null);field(task,"a",null);
            check(fetchBitmap(task,uri)==null&&binder.calls==0,"missing service not handled");
        });
        test("bitmap genuine URI and pixel data survive Binder",() -> {
            BitmapBinder binder=new BitmapBinder();Object value=fetchBitmap(bitmapTask(binder,null),uri);
            check(value instanceof android.graphics.Bitmap&&binder.calls==1&&uri.equals(binder.requested),"bitmap RPC contract changed");
            android.graphics.Bitmap image=(android.graphics.Bitmap)value;
            check(image.getWidth()==2&&image.getHeight()==2&&image.getPixel(1,1)==0xff00ff00,"bitmap data was replaced");
        });
        test("bitmap null remote result remains null",() -> {
            BitmapBinder binder=new BitmapBinder();binder.empty=true;
            check(fetchBitmap(bitmapTask(binder,null),uri)==null&&binder.calls==1,"empty bitmap response changed");
        });
        test("bitmap RemoteException returns null",() -> {
            BitmapBinder binder=new BitmapBinder();binder.remoteFailure=true;
            check(fetchBitmap(bitmapTask(binder,null),uri)==null&&binder.calls==1,"remote failure changed");
        });
        test("bitmap malformed parcel rethrows",() -> {
            BitmapBinder binder=new BitmapBinder();binder.malformed=true;boolean failed=false;
            try{fetchBitmap(bitmapTask(binder,null),uri);}catch(RuntimeException expected){failed=true;}
            check(failed&&binder.calls==1,"invalid bitmap reply hidden");
        });
        test("original bitmap callback receives data and clears task",() -> {
            BitmapBinder binder=new BitmapBinder();Object holder=instance("nl.npo.player.library.ll.b");
            CountDownLatch delivered=new CountDownLatch(1);java.util.concurrent.atomic.AtomicReference<Object> result=new java.util.concurrent.atomic.AtomicReference<>();
            java.util.concurrent.atomic.AtomicReference<Looper> callbackLooper=new java.util.concurrent.atomic.AtomicReference<>();
            field(holder,"e",bitmapCallback(delivered,result,callbackLooper));Object task=bitmapTask(binder,holder);field(holder,"d",task);
            invoke("nl.npo.player.library.ll.c","onPostExecute",new Class<?>[]{Object.class},task,binder.bitmap);
            check(delivered.getCount()==0&&result.get()==binder.bitmap&&field(holder,"d")==null,"bitmap callback or cleanup changed");
        });
        test("original bitmap callback clears task without listener",() -> {
            BitmapBinder binder=new BitmapBinder();Object holder=instance("nl.npo.player.library.ll.b");Object task=bitmapTask(binder,holder);field(holder,"d",task);
            invoke("nl.npo.player.library.ll.c","onPostExecute",new Class<?>[]{Object.class},task,binder.bitmap);
            check(field(holder,"d")==null,"listener-free callback cleanup changed");
        });
        test("real AsyncTask delivers Binder bitmap on main callback",() -> {
            BitmapBinder binder=new BitmapBinder();Object holder=instance("nl.npo.player.library.ll.b");
            CountDownLatch delivered=new CountDownLatch(1);java.util.concurrent.atomic.AtomicReference<Object> result=new java.util.concurrent.atomic.AtomicReference<>();
            java.util.concurrent.atomic.AtomicReference<Looper> callbackLooper=new java.util.concurrent.atomic.AtomicReference<>();
            field(holder,"e",bitmapCallback(delivered,result,callbackLooper));Object task=bitmapTask(binder,holder);field(holder,"d",task);
            ((AsyncTask)task).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR,(Object[])new Uri[]{uri});
            check(delivered.await(5,TimeUnit.SECONDS)&&result.get() instanceof android.graphics.Bitmap,"AsyncTask bitmap callback missing");
            check(callbackLooper.get()==Looper.getMainLooper(),"AsyncTask callback did not run on main Looper");
            check(binder.calls==1&&binder.thread.contains("AsyncTask")&&uri.equals(binder.requested),"wrong asynchronous bitmap request");
            CountDownLatch cleared=new CountDownLatch(1);java.util.concurrent.atomic.AtomicBoolean valid=new java.util.concurrent.atomic.AtomicBoolean();
            new Handler(Looper.getMainLooper()).post(()->{try{valid.set(field(holder,"d")==null);}catch(Exception ignored){}cleared.countDown();});
            check(cleared.await(2,TimeUnit.SECONDS)&&valid.get(),"asynchronous task was not cleared");
        });
    }
    static class Connection extends HttpURLConnection {
        final Stream stream;boolean connectIo;
        final IOException connectFailure=new IOException("fixture connect failure");
        Connection(String body) throws Exception {super(new URL("https://fixture.invalid/discovery"));stream=new Stream(body);}
        @Override public void connect() throws IOException {if(connectIo)throw connectFailure;}
        @Override public InputStream getInputStream(){return stream;}
        @Override public void disconnect(){}
        @Override public boolean usingProxy(){return false;}
    }
    Object discoveryTask() throws Exception {
        Object task=instance("nl.npo.player.library.ru.k");field(task,"a",Uri.parse("https://fixture.invalid/discovery"));return task;
    }
    Object indicatorTask(int resource) throws Exception {
        return type("nl.npo.player.library.m9.a").getConstructor(type("nl.npo.player.library.m9.b"),int.class,Context.class).newInstance(null,resource,this);
    }
    Object indicator(Object task,Object[] params) throws Exception {
        return invoke("nl.npo.player.library.m9.a","doInBackground",new Class<?>[]{Object[].class},task,(Object)params);
    }
    void indicator() throws Exception {
        android.util.SparseArray<Object> cache=(android.util.SparseArray<Object>)type("nl.npo.player.library.m9.b").getField("w").get(null);
        final int resource=android.R.drawable.ic_media_play;
        test("Cast indicator cache miss inflates a real drawable",() -> {
            cache.clear();Object value=indicator(indicatorTask(resource),new Void[0]);
            check(value instanceof android.graphics.drawable.Drawable&&((android.graphics.drawable.Drawable)value).getConstantState()!=null,"indicator was replaced with no drawable");
            check(cache.get(resource)==null,"background loader changed the main-thread cache");
        });
        test("Cast indicator cache hit defers to original callback",() -> {
            Object state=new android.graphics.drawable.ColorDrawable(0xff00ff00).getConstantState();cache.put(resource,state);
            check(indicator(indicatorTask(resource),new Void[0])==null&&cache.get(resource)==state,"cached indicator semantics changed");
        });
        test("Cast indicator does not clone cached state in background",() -> {
            final int[] clones={0};android.graphics.drawable.Drawable.ConstantState state=new android.graphics.drawable.Drawable.ConstantState(){
                @Override public android.graphics.drawable.Drawable newDrawable(){clones[0]++;return new android.graphics.drawable.ColorDrawable();}
                @Override public int getChangingConfigurations(){return 0;}
            };
            cache.put(resource,state);check(indicator(indicatorTask(resource),new Void[0])==null&&clones[0]==0,"cached drawable cloned on wrong thread");
        });
        test("Cast indicator retains invalid-resource errors",() -> {
            cache.clear();boolean failed=false;
            try{indicator(indicatorTask(0x7fffffff),new Void[0]);}catch(android.content.res.Resources.NotFoundException expected){failed=true;}
            check(failed,"invalid indicator resource hidden");
        });
        test("Cast indicator accepts unused null varargs",() -> {
            cache.clear();check(indicator(indicatorTask(resource),null) instanceof android.graphics.drawable.Drawable,"unused arguments affected inflation");
        });
        test("Cast indicator cache is keyed by resource ID",() -> {
            cache.clear();cache.put(resource,new android.graphics.drawable.ColorDrawable().getConstantState());
            check(indicator(indicatorTask(android.R.drawable.ic_media_next),new Void[0]) instanceof android.graphics.drawable.Drawable,"wrong cache key used");cache.clear();
        });
    }
    Object discovery(Object task) throws Exception {
        return invoke("nl.npo.player.library.ru.k","doInBackground",new Class<?>[]{Object[].class},task,(Object)new Object[0]);
    }
    void discoveryError(Object task,int code,String templateField,Class<?> causeType,Throwable expectedCause) throws Exception {
        Object error=field(task,"d"),template=type("nl.npo.player.library.ru.c").getField(templateField).get(null);
        check(error!=null&&error.getClass()==type("nl.npo.player.library.ru.e"),"genuine SDK discovery error missing");
        // Shipped ru.e: h=category, i=code; ru.c: d=network, f=JSON, a=invalid discovery.
        check(Integer.valueOf(0).equals(field(error,"h"))&&Integer.valueOf(code).equals(field(error,"i")),"wrong discovery error category/code");
        for(String name:new String[]{"h","i","j","k","l"})
            check(Objects.equals(field(error,name),field(template,name)),"SDK error template changed: "+name);
        Throwable cause=((Throwable)error).getCause();
        check(cause!=null&&cause.getClass()==causeType,"wrong or missing discovery error cause");
        if(expectedCause!=null)check(cause==expectedCause,"discovery error replaced original cause");
    }
    void discovery() throws Exception {
        test("genuine discovery configuration and stream cleanup",() -> {
            connection=new Connection(VALID);Object task=discoveryTask();Object value=discovery(task);
            check(value!=null && value.getClass()==type("nl.npo.player.library.ru.l"),"discovery result type");
            check(field(task,"d")==null && connection.stream.closes==1 && "GET".equals(connection.getRequestMethod()),"discovery HTTP/cleanup contract");
        });
        test("discovery open IO maps to typed error",() -> {
            openFails=true;try {Object task=discoveryTask();check(discovery(task)==null,"network error returned result");discoveryError(task,3,"d",IOException.class,OPEN_FAILURE);}finally{openFails=false;}
        });
        test("discovery connection IO maps to typed error",() -> {
            connection=new Connection(VALID);connection.connectIo=true;Object task=discoveryTask();check(discovery(task)==null,"connect error returned result");discoveryError(task,3,"d",IOException.class,connection.connectFailure);
        });
        test("discovery malformed JSON maps and closes",() -> {
            connection=new Connection("{broken");Object task=discoveryTask();check(discovery(task)==null && connection.stream.closes==1,"JSON cleanup/error lost");
            discoveryError(task,5,"f",org.json.JSONException.class,null);
        });
        test("discovery missing field maps and closes",() -> {
            connection=new Connection("{}");Object task=discoveryTask();check(discovery(task)==null && connection.stream.closes==1,"required discovery field ignored");
            discoveryError(task,0,"a",type("nl.npo.player.library.ru.m"),null);
        });
        test("discovery unexpected read failure closes and rethrows",() -> {
            connection=new Connection(VALID);connection.stream.fail=true;boolean failed=false;
            try{discovery(discoveryTask());}catch(IllegalStateException expected){failed=true;}
            check(failed && connection.stream.closes==1,"unexpected exception/cleanup lost");
        });
    }
}
