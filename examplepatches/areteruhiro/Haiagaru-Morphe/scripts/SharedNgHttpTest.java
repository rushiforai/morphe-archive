package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import com.sun.net.httpserver.HttpServer;

/** Delayed headers, GAS redirects, uncertain POST delivery, interrupted bodies and budget exhaustion. */
public final class SharedNgHttpTest {
    static int checks;
    static final String SOURCE="https://script.google.com/macros/s/test/exec",CONTENT="https://script.googleusercontent.com/macros/echo?test=1";
    static void ok(boolean condition,String label){if(!condition)throw new AssertionError(label);checks++;}
    static final class Time implements SharedNgHttp.Clock {long now;public long nanos(){return now;}void add(int millis){now+=millis*1_000_000L;}}
    static class Response extends HttpURLConnection {
        final Time time;int code=200,headerDelay;boolean disconnected;String location;byte[] data="{\"ok\":true}".getBytes(StandardCharsets.UTF_8);ByteArrayOutputStream sent=new ByteArrayOutputStream();InputStream stream;
        Response(Time time)throws Exception {super(new URL(SOURCE));this.time=time;}
        public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){disconnected=true;}
        public int getResponseCode()throws IOException {if(headerDelay>getReadTimeout()){time.add(getReadTimeout());throw new SocketTimeoutException("read timed out");}time.add(headerDelay);return code;}
        public String getHeaderField(String name){return location;}
        public InputStream getInputStream(){return stream==null?new ByteArrayInputStream(data):stream;}
        public OutputStream getOutputStream(){return sent;}
    }
    static void fails(Class<? extends Exception> type,String text,Throwing work)throws Exception {
        try{work.run();throw new AssertionError("Expected "+type);}catch(Exception error){ok(type.isInstance(error)&&error.getMessage().contains(text),"expected failure: "+text);}
    }
    interface Throwing {void run()throws Exception;}
    static void fixture()throws Exception {
        Time time=new Time();Response slow=new Response(time);slow.headerDelay=20_000;
        ok(SharedNgHttp.request("GET",SOURCE,null,u->slow,time).contains("true"),"20-second server work survives the old 15-second boundary");
        ok(slow.getReadTimeout()<=60_000&&slow.getConnectTimeout()==15_000&&slow.disconnected,"bounded waits and cleanup");
        time=new Time();Response redir=new Response(time),finalResponse=new Response(time);redir.code=302;redir.location=CONTENT;
        List<Response> chain=List.of(redir,finalResponse);AtomicInteger opens=new AtomicInteger();String body="{\"reports\":[\"日本語\"]}";
        SharedNgHttp.request("POST",SOURCE,body,u->chain.get(opens.getAndIncrement()),time);
        ok(opens.get()==2&&redir.getRequestMethod().equals("POST")&&finalResponse.getRequestMethod().equals("GET"),"GAS POST redirect becomes a bodyless GET");
        ok(redir.sent.toString("UTF-8").equals(body)&&finalResponse.sent.size()==0,"JSON body and Unicode preserved only on POST");
        ok(redir.disconnected&&finalResponse.disconnected,"both redirected connections closed");
        Time retryTime=new Time();Response timeout=new Response(retryTime),recovered=new Response(retryTime);timeout.headerDelay=70_000;AtomicInteger tries=new AtomicInteger();
        ok(SharedNgHttp.request("GET",SOURCE,null,u->tries.getAndIncrement()==0?timeout:recovered,retryTime).contains("true"),"timed-out GET retries once");
        ok(tries.get()==2&&recovered.getReadTimeout()<=30_000,"retry shares the remaining 90-second budget");
        Time postTime=new Time();Response uncertain=new Response(postTime);uncertain.headerDelay=70_000;AtomicInteger posts=new AtomicInteger();
        fails(SocketTimeoutException.class,"タイムアウト",()->SharedNgHttp.request("POST",SOURCE,body,u->{posts.incrementAndGet();return uncertain;},postTime));
        ok(posts.get()==1&&uncertain.disconnected,"uncertain POST is never replayed");
        Time afterPostTime=new Time();Response accepted=new Response(afterPostTime),lostContent=new Response(afterPostTime);accepted.code=303;accepted.location=CONTENT;lostContent.headerDelay=70_000;AtomicInteger afterPost=new AtomicInteger();
        fails(SocketTimeoutException.class,"タイムアウト",()->SharedNgHttp.request("POST",SOURCE,body,u->afterPost.getAndIncrement()==0?accepted:lostContent,afterPostTime));
        ok(afterPost.get()==2,"lost POST redirect response does not replay the original POST");
        Time exhausted=new Time();AtomicInteger exhaustedOpens=new AtomicInteger();
        fails(SocketTimeoutException.class,"保存済み",()->SharedNgHttp.request("GET",SOURCE,null,u->{exhaustedOpens.incrementAndGet();try{Response r=new Response(exhausted);r.headerDelay=70_000;return r;}catch(Exception e){throw new IOException(e);}},exhausted));
        ok(exhaustedOpens.get()==2&&exhausted.now==90_000_000_000L,"repeated timeout stops at shared deadline");
        Time dripTime=new Time();AtomicInteger dripOpens=new AtomicInteger();
        fails(SocketTimeoutException.class,"タイムアウト",()->SharedNgHttp.request("GET",SOURCE,null,u->{dripOpens.incrementAndGet();try{Response r=new Response(dripTime);r.stream=new InputStream(){public int read(){dripTime.add(10_000);return ' ';}public int read(byte[] b,int off,int len){b[off]=' ';return read()<0?-1:1;}};return r;}catch(Exception e){throw new IOException(e);}},dripTime));
        ok(dripTime.now==90_000_000_000L&&dripOpens.get()==1,"drip-fed response cannot renew the overall budget");
        Time brokenTime=new Time();AtomicInteger brokenOpens=new AtomicInteger();Response broken=new Response(brokenTime);broken.stream=new InputStream(){public int read()throws IOException{throw new IOException("truncated body");}};
        fails(IOException.class,"truncated",()->SharedNgHttp.request("GET",SOURCE,null,u->{brokenOpens.incrementAndGet();return broken;},brokenTime));
        ok(brokenOpens.get()==1&&broken.disconnected,"partial non-timeout failure is surfaced and closed");
        for(String bad:new String[]{"http://script.google.com/","https://script.google.com.evil.invalid/","https://user@script.google.com/","https://script.google.com:444/","https://127.0.0.1/"}) {
            AtomicInteger reached=new AtomicInteger();fails(IOException.class,"不正",()->SharedNgHttp.request("GET",bad,null,u->{reached.incrementAndGet();return slow;},new Time()));ok(reached.get()==0,"unsafe target never opened");
        }
        Time badRedirectTime=new Time();Response badRedirect=new Response(badRedirectTime);badRedirect.code=302;badRedirect.location="https://example.invalid/";
        fails(IOException.class,"不正",()->SharedNgHttp.request("GET",SOURCE,null,u->badRedirect,badRedirectTime));ok(badRedirect.disconnected,"unsafe redirect closes original connection");
        Time absentTime=new Time();Response absent=new Response(absentTime);absent.code=302;
        fails(IOException.class,"転送先がありません",()->SharedNgHttp.request("GET",SOURCE,null,u->absent,absentTime));
        Time loopTime=new Time();AtomicInteger loops=new AtomicInteger();
        fails(IOException.class,"転送回数",()->SharedNgHttp.request("GET",SOURCE,null,u->{loops.incrementAndGet();try{Response r=new Response(loopTime);r.code=302;r.location=SOURCE;return r;}catch(Exception e){throw new IOException(e);}},loopTime));ok(loops.get()==3,"redirect loop bounded");
        Time largeTime=new Time();Response large=new Response(largeTime);large.data=new byte[SharedNgHttp.MAX_BYTES+1];
        fails(IOException.class,"大きすぎます",()->SharedNgHttp.request("GET",SOURCE,null,u->large,largeTime));ok(large.disconnected,"oversized response closed");
        Time statusTime=new Time();Response unavailable=new Response(statusTime);unavailable.code=503;AtomicInteger statusOpens=new AtomicInteger();
        fails(IOException.class,"HTTP 503",()->SharedNgHttp.request("GET",SOURCE,null,u->{statusOpens.incrementAndGet();return unavailable;},statusTime));ok(statusOpens.get()==1,"HTTP failures do not trigger a retry storm");
    }
    static void realDelay()throws Exception {
        HttpServer server=HttpServer.create(new InetSocketAddress("127.0.0.1",0),0);AtomicInteger requests=new AtomicInteger();
        server.createContext("/slow",exchange->{requests.incrementAndGet();try{Thread.sleep(16_000);byte[] body="{\"ok\":true}".getBytes(StandardCharsets.UTF_8);exchange.sendResponseHeaders(200,body.length);try(OutputStream out=exchange.getResponseBody()){out.write(body);}}catch(InterruptedException e){Thread.currentThread().interrupt();}finally{exchange.close();}});
        server.setExecutor(java.util.concurrent.Executors.newCachedThreadPool(r->{Thread t=new Thread(r);t.setDaemon(true);return t;}));server.start();
        URL local=new URL("http://127.0.0.1:"+server.getAddress().getPort()+"/slow");
        try {
            HttpURLConnection old=(HttpURLConnection)local.openConnection();old.setReadTimeout(15_000);try{fails(SocketTimeoutException.class,"timed out",old::getResponseCode);}finally{old.disconnect();}
            long start=System.nanoTime();String response=SharedNgHttp.request("GET",SOURCE,null,u->(HttpURLConnection)local.openConnection(),System::nanoTime);
            ok(response.contains("true")&&System.nanoTime()-start>=16_000_000_000L,"real delayed HTTP headers complete with production transport");
            ok(requests.get()==2,"healthy slow response is not retried");
        }finally{server.stop(0);}
    }
    public static void main(String[] args)throws Exception {fixture();if(Arrays.asList(args).contains("--real-delay"))realDelay();System.out.println("PASS "+checks+" shared NG transport checks");}
}
