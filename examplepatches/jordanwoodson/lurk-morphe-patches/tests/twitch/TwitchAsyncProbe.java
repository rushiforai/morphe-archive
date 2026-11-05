import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import com.sun.net.httpserver.HttpServer;
import io.github.jordanwoodson.extension.shared.twitch.TwitchBackupStream;
import io.github.jordanwoodson.extension.shared.settings.Settings;

@SuppressWarnings("unchecked")
public class TwitchAsyncProbe {
    static final Class<?> TYPE=TwitchBackupStream.class;
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    static Object call(Object obj,String name,Object... args)throws Exception {
        Class<?> type=obj instanceof Class?(Class<?>)obj:obj.getClass();
        for(Method m:type.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);try{return m.invoke(obj instanceof Class?null:obj,args);}catch(InvocationTargetException e){throw new RuntimeException(e.getCause());}}
        throw new NoSuchMethodException(name);
    }
    static Object get(Object obj,String name)throws Exception{Field f=obj.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(obj);}
    static void set(Object obj,String name,Object value)throws Exception{Field f=obj.getClass().getDeclaredField(name);f.setAccessible(true);f.set(obj,value);}
    static Object make(String name,Object... args)throws Exception{Class<?> c=Class.forName(TYPE.getName()+"$"+name);for(Constructor<?> ctor:c.getDeclaredConstructors())if(ctor.getParameterCount()==args.length){ctor.setAccessible(true);return ctor.newInstance(args);}throw new AssertionError(name);}
    static String playlist(long first,String prefix){return "#EXTM3U\n#EXT-X-TARGETDURATION:2\n#EXT-X-MEDIA-SEQUENCE:"+first+"\n#EXTINF:2,live\n"+prefix+"1.ts\n#EXTINF:2,live\n"+prefix+"2.ts\n";}
    static long now(){return System.nanoTime()/1000000;}
    static boolean modern(){try{Class.forName(TYPE.getPackageName()+".TwitchRequest");return true;}catch(Exception e){return false;}}
    static void http(String scenario)throws Exception{
        HttpServer server=HttpServer.create(new InetSocketAddress("127.0.0.1",0),0);
        server.setExecutor(Executors.newCachedThreadPool(r->{Thread t=new Thread(r);t.setDaemon(true);return t;}));
        server.createContext("/",exchange->{try{
            if(scenario.equals("headers"))Thread.sleep(180);
            if(scenario.equals("cancel-http"))Thread.sleep(700);
            exchange.sendResponseHeaders(200,0);
            try(OutputStream out=exchange.getResponseBody()){
                if(scenario.equals("oversize")){out.write(new byte[2*1024*1024]);}
                else for(int i=0;i<12;i++){out.write('x');out.flush();Thread.sleep(60);}
            }
        }catch(Exception ignored){}finally{exchange.close();}});server.start();
        try {
            if(scenario.equals("cancel-http")){Thread cancel=new Thread(()->{try{Thread.sleep(100);}catch(Exception ignored){}Settings.values.put("avoid_stitched_ads","false");});cancel.start();}
            long start=now();long deadline=(modern()?now():System.currentTimeMillis())+300;
            Object result=call(TYPE,"http","http://127.0.0.1:"+server.getAddress().getPort()+"/",null,deadline);
            long took=now()-start;
            check(result==null,"unbounded "+scenario+" response accepted after "+took+" ms");
            check(took<(scenario.equals("cancel-http")?350:650),"absolute deadline overrun "+scenario+": "+took+" ms");
        } finally{server.stop(0);}
    }
    static void stale(String scenario)throws Exception{
        Object rendition=make("Rendition","v","http://127.0.0.1:1/current.m3u8",720,1000L);
        Map<String,Object> variants=new HashMap<>();variants.put("v",rendition);
        Object stream=make("Stream","https://usher.ttvnw.net/api/channel/hls/a.m3u8","a",variants);
        Object own=get(stream,"own"),known=make("Media",stream,rendition);
        call(TYPE,"onMedia",known,own,playlist(100,"own"));
        if(scenario.equals("partial-stale")){String result=(String)call(TYPE,"onMedia",known,own,playlist(99,"late"));check(result!=null&&result.contains("#EXT-X-MEDIA-SEQUENCE:100\n"),"overlapping late playlist regressed sequence");return;}
        if(scenario.equals("same-stale")){String result=(String)call(TYPE,"onMedia",known,own,playlist(90,"late"));check(result!=null&&!result.contains("late1.ts"),"same-source stale response regressed the playlist");return;}
        if(scenario.equals("all-stale")){
            Object parsed=call(Class.forName(TYPE.getName()+"$Playlist"),"parse",playlist(10,"old"));
            Object trimmed=call(parsed,"trimmedBelow",100L);
            check(((String)call(trimmed,"text")).contains("#EXT-X-MEDIA-SEQUENCE:100\n"),"entirely stale playlist regressed sequence");
            check(!((String)call(trimmed,"text")).contains("old1.ts"),"entirely stale segments retained");return;
        }
        Object current=make("Source",variants,0L,null,true,"backup");set(stream,"current",current);set(known,"lastSource",current);
        if(scenario.equals("first-stale")) {set(known,"servedFirst",-1L);set(known,"servedLast",-1L);try{set(known,"lastPlaylist",null);}catch(NoSuchFieldException ignored){}}
        if(scenario.equals("disabled")){
            Field f=TYPE.getDeclaredField("media");f.setAccessible(true);((Map)f.get(null)).put("http://own/a.m3u8",known);
            Settings.values.put("avoid_stitched_ads","false");
            // Mid-break: the player keeps the picture-by-picture session, numbered as served, until the break
            // is over. Its own playlist now would move the media sequence back.
            check(TwitchBackupStream.requestUrl(new Object(),"http://own/a.m3u8").equals("http://127.0.0.1:1/current.m3u8"),
                "switching off mid-break sent the player to its own, differently numbered playlist");
            String during=(String)call(TYPE,"onMedia",known,current,playlist(500,"backup"));
            check(during!=null&&during.contains("backup1.ts")&&get(stream,"current")==current,"switching off mid-break dropped the served backup");
            // A stream this never changed is left alone, and no new break starts while off.
            set(stream,"current",own);
            check(TwitchBackupStream.requestUrl(new Object(),"http://own/a.m3u8").equals("http://own/a.m3u8"),"disabled patch still redirects an unchanged stream");
            String ads=playlist(102,"own").replace(",live",",Advertisement");
            check(call(TYPE,"onMedia",known,own,ads)==null&&get(stream,"current")==own,"a break started while switched off");
            return;
        }
        if(scenario.equals("proxy")){
            // Playlist proxy: masters come from the proxy's host (including channel-only URLs), so no
            // stream is tracked and every playlist passes unchanged.
            for(String url:new String[]{"https://proxy.example/api/channel/hls/a.m3u8?token=t",
                    "https://proxy.example/live/a",
                    "https://proxy.example/playlist?url="+URLEncoder.encode("https://usher.ttvnw.net/api/channel/hls/a.m3u8","UTF-8")}){
                check(!(Boolean)call(TYPE,"isUsherMaster",url),"proxied master taken for usher: "+url);
                Request req=new Request(){public String getUrl(){return url;}};
                check(!TwitchBackupStream.consume(null,req,null),"proxied master consumed");
            }
            check((Boolean)call(TYPE,"isUsherMaster","https://usher.ttvnw.net/api/channel/hls/a.m3u8"),"usher master not recognized");
            return;
        }
        if(scenario.equals("first-stale")) {
            try {call(TYPE,"onMedia",known,own,playlist(90,"late"));throw new AssertionError("first retired response synthesized a playlist instead of failing");}
            catch(RuntimeException expected) {check(expected.getCause()!=null&&expected.getCause().getClass().getSimpleName().equals("UnavailablePlaylist"),"unexpected first-response failure: "+expected);}
            return;
        }
        String result=(String)call(TYPE,"onMedia",known,own,playlist(90,"late"));
        check(get(known,"lastSource")==current,"delayed clean old-source response changed served source");
        check(result!=null&&!result.contains("late1.ts"),"delayed old-source body leaked after source transition");
    }
    public interface Provider {int writeTo(ByteBuffer buffer)throws IOException;}
    public static class Consumer {private final Provider provider;Consumer(Provider p){provider=p;}}
    public static class Request {volatile boolean cancelled;public String getUrl(){return "https://usher.ttvnw.net/api/channel/hls/a.m3u8";} public boolean isCancelled(){return cancelled;}public Object lock(){return this;}}
    public interface Callback {void onData(ByteBuffer b,boolean last);void onError(Exception e);}
    static void provider(String scenario)throws Exception{
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);Request req=new Request();int[] calls={0};
        Consumer consumer=new Consumer(b->{entered.countDown();while(true)try{release.await();break;}catch(InterruptedException ignored){}return -1;});
        Callback cb=new Callback(){public void onData(ByteBuffer b,boolean last){calls[0]++;}public void onError(Exception e){calls[0]++;}};
        ExecutorService executor=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r);t.setDaemon(true);return t;});
        Future<?> done=executor.submit(()->TwitchBackupStream.consume(consumer,req,cb));
        try{check(entered.await(2,TimeUnit.SECONDS),"provider not entered");
            if(scenario.equals("cancel-provider")){req.cancelled=true;try{done.get(600,TimeUnit.MILLISECONDS);}catch(TimeoutException e){throw new AssertionError("cancelled consumer stuck in provider read");}check(calls[0]==0,"cancelled request delivered");}
            else{try{done.get(7,TimeUnit.SECONDS);}catch(TimeoutException e){throw new AssertionError("consumer deadline did not bound blocked provider");}}
        }finally{release.countDown();executor.shutdownNow();}
    }
    static void saturatedProviders()throws Exception {
        CountDownLatch entered=new CountDownLatch(3),release=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger reads=new java.util.concurrent.atomic.AtomicInteger();
        List<Request> requests=new ArrayList<>();List<Future<?>> futures=new ArrayList<>();
        ExecutorService callers=Executors.newFixedThreadPool(20,r->{Thread t=new Thread(r);t.setDaemon(true);return t;});
        Callback cb=new Callback(){public void onData(ByteBuffer b,boolean last){}public void onError(Exception e){}};
        try {
            for(int i=0;i<20;i++){Request req=new Request();requests.add(req);
                Consumer consumer=new Consumer(b->{reads.incrementAndGet();entered.countDown();while(true)try{release.await();break;}catch(InterruptedException ignored){}return -1;});
                futures.add(callers.submit(()->TwitchBackupStream.consume(consumer,req,cb)));}
            check(entered.await(2,TimeUnit.SECONDS),"provider workers did not start");Thread.sleep(100);
            check(reads.get()==3,"unbounded blocked provider workers: "+reads.get());
            for(Request req:requests)req.cancelled=true;
            for(Future<?> future:futures)future.get(600,TimeUnit.MILLISECONDS);
            release.countDown();Thread.sleep(100);
            check(reads.get()==3,"cancelled queued provider work started after release");
        } finally {release.countDown();callers.shutdownNow();}
    }
    static void adTimeout(String scenario)throws Exception {
        CountDownLatch started=new CountDownLatch(1),release=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger requests=new java.util.concurrent.atomic.AtomicInteger();
        URL.setURLStreamHandlerFactory(protocol->protocol.equals("https")?new URLStreamHandler(){
            protected URLConnection openConnection(URL url){requests.incrementAndGet();return new HttpURLConnection(url){
                public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
                public OutputStream getOutputStream(){return new ByteArrayOutputStream();}
                public int getResponseCode(){started.countDown();while(true)try{release.await();break;}catch(InterruptedException ignored){}return 503;}
            };}}:null);
        Object rendition=make("Rendition","v","http://own/a.m3u8",720,1000L);
        Map<String,Object> variants=new HashMap<>();variants.put("v",rendition);
        Object stream=make("Stream","https://usher.ttvnw.net/api/channel/hls/a.m3u8","a",variants);
        Object known=make("Media",stream,rendition);Field media=TYPE.getDeclaredField("media");media.setAccessible(true);((Map)media.get(null)).put("http://own/a.m3u8",known);
        String ad=playlist(100,"own").replace(",live",",Advertisement");byte[] bytes=ad.getBytes(StandardCharsets.UTF_8);int[] at={0};
        Consumer consumer=new Consumer(b->{if(at[0]>0)return -1;b.put(bytes);at[0]++;return bytes.length;});
        Request req=new Request(){public String getUrl(){return "http://own/a.m3u8";}};
        ByteArrayOutputStream delivered=new ByteArrayOutputStream();int[] errors={0};
        Callback cb=new Callback(){public void onData(ByteBuffer b,boolean last){while(b.hasRemaining())delivered.write(b.get());}public void onError(Exception e){errors[0]++;}};
        ExecutorService executor=Executors.newSingleThreadExecutor();Future<?> done=executor.submit(()->TwitchBackupStream.consume(consumer,req,cb));
        try{check(started.await(2,TimeUnit.SECONDS),"backup discovery did not start");
            if(scenario.equals("cancel-chain")){req.cancelled=true;done.get(600,TimeUnit.MILLISECONDS);release.countDown();Thread.sleep(100);
                check(requests.get()==1&&delivered.size()==0&&errors[0]==0,"cancelled discovery chained or delivered");}
            else{done.get(7,TimeUnit.SECONDS);check(errors[0]==0&&delivered.toString("UTF-8").equals(ad),"expired discovery lost existing ad fallback");}
        }finally{release.countDown();executor.shutdownNow();}
    }

    static void subsequentHook(String scenario) throws Exception {
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1);
        URL.setURLStreamHandlerFactory(protocol -> protocol.equals("https") ? new URLStreamHandler() {
            protected URLConnection openConnection(URL url) { return new HttpURLConnection(url) {
                public InputStream getInputStream(){return new ByteArrayInputStream(playlist(100,"main").getBytes(StandardCharsets.UTF_8));}
                public void connect() {} public void disconnect() {} public boolean usingProxy() { return false; }
                public int getResponseCode() {
                    entered.countDown();
                    while (true) try { release.await(); return 200; } catch (InterruptedException ignored) {}
                }
            }; }
        } : null);
        Object rendition = make("Rendition", "v", "https://own/a.m3u8", 720, 1000L);
        Map<String,Object> variants = new HashMap<>(); variants.put("v", rendition);
        Object stream = make("Stream", "https://usher.ttvnw.net/api/channel/hls/a.m3u8", "a", variants);
        Object backup = make("Source", variants, 0L, null, true, "backup");
        set(stream, "current", backup);
        Object known = make("Media", stream, rendition);
        Field media = TYPE.getDeclaredField("media"); media.setAccessible(true);
        ((Map)media.get(null)).put("https://own/a.m3u8", known);
        Request req = new Request() { public String getUrl() { return "https://own/a.m3u8"; } };
        TwitchBackupStream.requestUrl(req, req.getUrl());
        byte[] bytes = playlist(100,"backup").getBytes(StandardCharsets.UTF_8); int[] at = {0};
        Consumer consumer = new Consumer(b -> { if (at[0]++ > 0) return -1; b.put(bytes); return bytes.length; });
        ByteArrayOutputStream delivered=new ByteArrayOutputStream();int[] failures={0};
        Callback cb = new Callback() { public void onData(ByteBuffer b, boolean last) {while(b.hasRemaining())delivered.write(b.get());} public void onError(Exception e) {failures[0]++;} };
        ExecutorService callers = Executors.newFixedThreadPool(2, r -> { Thread t = new Thread(r); t.setDaemon(true); return t; });
        try {
            Future<?> consume = callers.submit(() -> TwitchBackupStream.consume(consumer, req, cb));
            check(entered.await(2,TimeUnit.SECONDS), "main fetch not started");
            if(scenario.equals("stream-lock")){req.cancelled = true;consume.get(600,TimeUnit.MILLISECONDS);}
            set(known, "unanswered", 3);
            Future<?> request = callers.submit(() -> TwitchBackupStream.requestUrl(new Object(), "https://own/a.m3u8"));
            try { request.get(600,TimeUnit.MILLISECONDS); }
            catch (TimeoutException e) { throw new AssertionError("HTTP retained stream monitor and blocked requestUrl"); }
            Object expected=get(stream,"main");check(get(stream,"current")==expected,"unanswered backup did not return to main");
            release.countDown();consume.get(1,TimeUnit.SECONDS);Thread.sleep(80);
            check(get(stream,"current")==expected,"late HTTP overwrote the newer source generation");
            check((Integer)get(stream,"mainFailures")==0&&(Long)get(stream,"freshAfter")==0L,
                    "late HTTP mutated retry state after its generation retired");
            check(!delivered.toString("UTF-8").contains("backup1.ts"),"late generation delivered retired backup segments");
            if(scenario.equals("stream-generation"))check(delivered.size()==0&&failures[0]==1,"first retired response delivered a manufactured empty instead of onError");
        } finally { release.countDown(); callers.shutdownNow(); }
    }
    public static void main(String[] args)throws Exception{
        Settings.values.put("avoid_stitched_ads","true");String s=args[0];
        if(s.equals("stream-lock")||s.equals("stream-generation"))subsequentHook(s);
        else if(Arrays.asList("headers","trickle","oversize","cancel-http").contains(s))http(s);
        else if(s.equals("saturation"))saturatedProviders();
        else if(s.equals("ad-timeout")||s.equals("cancel-chain"))adTimeout(s);
        else if(s.endsWith("provider"))provider(s);else stale(s);
        System.out.println("PASS: Twitch async "+s);
    }
}
