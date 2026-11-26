package dev.rikunode.futatabi.bridge;

import android.content.Context;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.lang.reflect.Field;

/** Host socket fixture: no login, upstream network, or live post. */
public final class BridgePeerContractTest {
    static void check(boolean ok,String label) { if(!ok) throw new AssertionError(label); }
    static void rejected() throws Exception {
        try(Socket socket=BridgeServer.connectVerified()) { throw new AssertionError("unexpected connection"); }
        catch(IOException expected) {}
    }
    static String request(Socket s,String path) throws Exception {
        s.setSoTimeout(3000);
        s.getOutputStream().write(("GET "+path+" HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n").getBytes(StandardCharsets.US_ASCII));
        s.getOutputStream().flush();
        return new BufferedReader(new InputStreamReader(s.getInputStream(),StandardCharsets.US_ASCII)).readLine();
    }
    public static void main(String[] args) throws Exception {
        URL.setURLStreamHandlerFactory(p -> "https".equals(p) ? new URLStreamHandler() {
            protected URLConnection openConnection(URL u) { throw new AssertionError("unexpected upstream request"); }
        } : null);
        rejected();
        try(ServerSocket foreign=new ServerSocket(18765,16,InetAddress.getByName("127.0.0.1"))) {
            foreign.setSoTimeout(150);
            rejected();
            try(Socket unexpected=foreign.accept()) { throw new AssertionError("connected to foreign listener"); }
            catch(SocketTimeoutException expected) {}
        }
        BridgeServer server=new BridgeServer(new Context());
        Field field=BridgeServer.class.getDeclaredField("listener"); field.setAccessible(true);
        Thread t=new Thread(() -> { try { server.run(); } catch(RuntimeException e) { if(!"Stub!".equals(e.getMessage())) throw e; } });
        t.setDaemon(true); t.start();
        try {
            long end=System.nanoTime()+3_000_000_000L;
            while(field.get(null)==null && System.nanoTime()<end) Thread.sleep(10);
            check(field.get(null)!=null,"listener start");
            try(Socket s=BridgeServer.connectVerified()) { check(request(s,"/unknown").contains("404"),"verified reverse socket"); }
            String[] paths={"/animanch/","/animanch/futaba.php?mode=cat","/animanch/res/123.htm","/animanch/thumb/123.jpg","/animanch/cat/123.jpg","/animanch/src/123.jpg","/ext/threads?board=animanch","/ext/reply-targets?board=animanch&id=123"};
            for(String path:paths) {
                check(BridgeServer.requiresOwnPeer("GET",path),"route "+path);
                try(Socket s=new Socket("127.0.0.1",18765)) { check(request(s,path).contains("403"),"unverified "+path); }
            }
            check(!BridgeServer.requiresOwnPeer("GET","/ext/login/aimoge/callback?state=fixture"),"external PKCE callback");
            System.out.println("PASS no listener, foreign listener, accepted peer and "+paths.length+" unverified GET routes; no upstream");
        } finally {
            ServerSocket listener=(ServerSocket)field.get(null);
            if(listener!=null) listener.close();
            t.join(3000);
        }
    }
}
