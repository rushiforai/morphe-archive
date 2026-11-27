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
        private String response="";
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
            String body=bytes.toString(StandardCharsets.UTF_8);
            if(url.getFile().equals("/upload/")){
                check(headers.get("content-type")!=null&&headers.get("content-type").startsWith("multipart/form-data; boundary="),"multipart encoding");
                check("text/html, */*; q=0.01".equals(headers.get("accept")),"official HTML Accept");
                int filePart=body.indexOf("name=\"file1\""),upPart=body.indexOf("name=\"upname\""),threadPart=body.indexOf("name=\"thread\"");
                check(filePart>=0&&filePart<upPart&&upPart<threadPart
                        &&body.contains("filename=\"attachment.png\"")
                        &&body.contains("Content-Type: image/png")
                        &&body.contains("name=\"upname\"\r\n\r\n6")
                        &&body.contains("name=\"thread\"\r\n\r\n"+BOARD)
                        &&body.endsWith("--\r\n")&&body.contains("abc"),"official reply upload fields/order");
                response="fixture upload accepted";
                return 201; // jQuery .done() treats any 2xx as success
            }
            check("application/x-www-form-urlencoded; charset=UTF-8".equals(headers.get("content-type")),"encoding");
            Map<String,String> form=new HashMap<>();
            for(String field:body.split("&")){
                String[] v=field.split("=",2);
                form.put(URLDecoder.decode(v[0],StandardCharsets.UTF_8),URLDecoder.decode(v[1],StandardCharsets.UTF_8));
            }
            check(BOARD.equals(form.get("thread")) && "".equals(form.get("name")) && ">>5\nfixture".equals(form.get("text")),"form fields");
            if (url.getFile().equals("/inc/comment.php?preCheck")) { preBody=body;response="{}";return 200; }
            check(url.getFile().equals("/inc/comment.php") && body.equals(preBody),"identical final payload");
            response="{\"number\":\"6\",\"thread\":\""+BOARD+"\",\"jump\":\""+REF+"#res6\"}";
            return 200;
        }
        public InputStream getInputStream(){return new ByteArrayInputStream(response.getBytes(StandardCharsets.UTF_8));}
        public InputStream getErrorStream(){return new ByteArrayInputStream("fixture error".getBytes(StandardCharsets.UTF_8));}
    }
    public static void main(String[] args)throws Exception {
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler(){
            protected URLConnection openConnection(URL u){return new Mock(u);}
        } : null);
        Context ctx=new Context();
        ctx.getSharedPreferences("futatabi_animanch_private",0).edit().putString("board."+THREAD,BOARD).commit();
        AnimanchAdapter a=new AnimanchAdapter(ctx);
        JSONObject attachment=new JSONObject().put("mime","image/png").put("name","attachment.png").put("base64","YWJj");
        BridgeServer.BridgeResponse r=a.post(new JSONObject().put("threadId",THREAD)
                .put("body",">No.2735092000005\nfixture").put("attachments",new org.json.JSONArray().put(attachment)));
        check(r.status==201&&new JSONObject(new String(r.bytes,StandardCharsets.UTF_8)).optBoolean("attachmentUploaded"),"HTTP 201 upload accepted");
        check(requests.equals(List.of("GET /board/"+BOARD+"/","POST /inc/comment.php?preCheck","POST /inc/comment.php","POST /upload/")),"order");
        System.out.println("Animanch reply image contract PASS: session, preCheck, comment, official multipart fields/order, HTTP 201 success; no real POST");
    }
}
