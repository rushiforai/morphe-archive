package dev.rikunode.futatabi.bridge;

import android.content.Context;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.JSONObject;

/** Synthetic transport only: final request is captured, not sent. */
public final class AnimanchPostContractTest {
    private static final String BOARD = "7675092", THREAD = "2735092000000";
    private static final String HOST = "https://bbs.animanch.com";
    private static final String REF = HOST + "/board/" + BOARD + "/";
    private static final String COOKIE = "PHPSESSID=fixture_only";
    private static final List<String> requests = new ArrayList<>();
    private static String preBody;
    private static void check(boolean b, String stage) { if (!b) throw new AssertionError(stage); }
    static final class Mock extends HttpURLConnection {
        private final ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        private final Map<String,String> headers = new HashMap<>();
        private String method;
        Mock(URL u) { super(u); }
        public void connect() {}
        public void disconnect() {}
        public boolean usingProxy() { return false; }
        public void setRequestMethod(String m) { method = m; }
        public void setRequestProperty(String k,String v) { headers.put(k.toLowerCase(Locale.ROOT),v); }
        public OutputStream getOutputStream() { return bytes; }
        public Map<String,List<String>> getHeaderFields() {
            return method.equals("GET") ? Map.of("set-cookie", List.of(COOKIE+"; Path=/; Secure")) : Map.of();
        }
        public int getResponseCode() {
            check(url.getHost().equals("bbs.animanch.com"),"destination");
            requests.add(method+" "+url.getFile());
            if ("GET".equals(method)) { check(url.toString().equals(REF),"form page"); return 200; }
            check("POST".equals(method) && HOST.equals(headers.get("origin")) && REF.equals(headers.get("referer"))
                    && "XMLHttpRequest".equals(headers.get("x-requested-with")) && COOKIE.equals(headers.get("cookie")),"AJAX session");
            check("application/x-www-form-urlencoded; charset=UTF-8".equals(headers.get("content-type")),"encoding");
            String body=bytes.toString(StandardCharsets.UTF_8);
            Map<String,String> form=new HashMap<>();
            for(String field:body.split("&")){
                String[] v=field.split("=",2);
                form.put(URLDecoder.decode(v[0],StandardCharsets.UTF_8),URLDecoder.decode(v[1],StandardCharsets.UTF_8));
            }
            check(BOARD.equals(form.get("thread")) && "".equals(form.get("name")) && ">>5\nfixture".equals(form.get("text")),"form fields");
            if (url.getFile().equals("/inc/comment.php?preCheck")) { preBody=body;return 200; }
            check(url.getFile().equals("/inc/comment.php") && body.equals(preBody),"identical final payload");
            return 403; // never simulate publication success
        }
        public InputStream getInputStream(){return new ByteArrayInputStream(new byte[0]);}
        public InputStream getErrorStream(){return new ByteArrayInputStream("fixture stopped before submission".getBytes(StandardCharsets.UTF_8));}
    }
    public static void main(String[] args)throws Exception {
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler(){
            protected URLConnection openConnection(URL u){return new Mock(u);}
        } : null);
        Context ctx=new Context();
        ctx.getSharedPreferences("futatabi_animanch_private",0).edit().putString("board."+THREAD,BOARD).commit();
        AnimanchAdapter a=new AnimanchAdapter(ctx);
        BridgeServer.BridgeResponse r=a.post(new JSONObject().put("threadId",THREAD).put("body",">No.2735092000005\nfixture"));
        check(r.status==403,"failure propagated");
        check(requests.equals(List.of("GET /board/"+BOARD+"/","POST /inc/comment.php?preCheck","POST /inc/comment.php")),"order");
        System.out.println("Animanch post contract PASS: session, headers, anchor reverse, identical final payload; no real POST");
    }
}
