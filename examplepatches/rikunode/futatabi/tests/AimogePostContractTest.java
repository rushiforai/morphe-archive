package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import org.json.*;

/** Test with a synthetic Context and mock transport only. No live POST. */
public final class AimogePostContractTest {
    static final String TOKEN = "fixture-only-not-real";
    static final String THREAD = "01900000-0000-7000-8000-000000000111";
    static final String ATTACHMENT = "01900000-0000-7000-8000-000000000114";
    static final String SALT = "fixture-salt";
    static final String SIGNATURE = "a".repeat(64);
    static int challenges, attempts, presigns;
    static boolean failChallenge;
    static final String[] expectedPath = {"/threads/" + THREAD + "/posts"};
    static void check(boolean b, String stage) { if (!b) throw new AssertionError(stage); }
    static String challenge() throws Exception {
        return AimogeWriteClient.sha256((SALT + 42).getBytes(StandardCharsets.UTF_8));
    }
    static final class Mock extends HttpURLConnection {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        String method;
        Map<String,String> headers = new HashMap<>();
        Mock(URL u) { super(u); }
        public void connect() {}
        public void disconnect() {}
        public boolean usingProxy() { return false; }
        public void setRequestMethod(String s) { method = s; }
        public void setRequestProperty(String k,String v) { headers.put(k.toLowerCase(Locale.ROOT),v); }
        public OutputStream getOutputStream() { return data; }
        public int getResponseCode() {
            if (url.getPath().equals("/altcha")) { challenges++; return failChallenge ? 503 : 200; }
            if (url.getPath().equals("/attachments/presign")) { presigns++; return 200; }
            // Stop at the transport boundary, never make a real submission or simulate success.
            attempts++;
            return 403;
        }
        public InputStream getErrorStream() {
            try {
                if (url.getPath().equals("/altcha")) return new ByteArrayInputStream(new byte[0]);
                check(url.getPath().equals(expectedPath[0]),"post path");
                check("POST".equals(method) && TOKEN.equals(headers.get("x-aimg-token")),"app credential");
                check("aimg".equals(headers.get("x-board-key")) && "2026-11-11".equals(headers.get("x-api-version")),"API headers");
                check(!headers.containsKey("cookie"),"no clearance cookies");
                JSONObject body=new JSONObject(data.toString("UTF-8"));
                UUID.fromString(body.getString("requestId"));
                check(body.getString("body").equals(url.getPath().equals("/threads/aimg") ? "fixture" : ">No.123456789\nfixture") && body.getString("deleteKey").equals("fixture-key"),"content");
                JSONObject proof=new JSONObject(new String(java.util.Base64.getDecoder().decode(body.getString("altcha")),StandardCharsets.UTF_8));
                check(proof.getInt("number")==42 && proof.getString("signature").equals(SIGNATURE)
                        && proof.getString("challenge").equals(challenge()) && proof.getString("salt").equals(SALT)
                        && proof.getString("algorithm").equals("SHA-256"),"proof");
                if (url.getPath().equals("/threads/aimg")) check(body.getString("attachmentId").equals(ATTACHMENT),"required attachment");
                return new ByteArrayInputStream("{\"error\":{\"code\":\"FIXTURE_STOP\",\"message\":\"No post sent\"}}".getBytes(StandardCharsets.UTF_8));
            } catch (Exception e) { throw new AssertionError(e); }
        }
        public InputStream getInputStream() throws IOException {
            try {
                check(url.getHost().equals("api.nijiurachan.net"),"destination");
                JSONObject r=new JSONObject();
                if (url.getPath().equals("/altcha")) {
                    check("GET".equals(method) && !headers.containsKey("x-aimg-token"),"public challenge");
                    r.put("algorithm","SHA-256").put("challenge",challenge()).put("salt",SALT).put("signature",SIGNATURE).put("maxnumber",100);
                } else if (url.getPath().equals("/attachments/presign")) {
                    check(TOKEN.equals(headers.get("x-aimg-token")),"presign credential");
                    check("attachment.jpg".equals(new JSONObject(data.toString("UTF-8")).getString("fileName")),"normalized attachment name");
                    r.put("attachmentId",ATTACHMENT).put("reused",true);
                } else throw new AssertionError("unexpected path");
                return new ByteArrayInputStream(r.toString().getBytes(StandardCharsets.UTF_8));
            } catch (Exception e) { throw new IOException(e); }
        }
    }
    static BridgeServer.BridgeResponse send(ExtensionApi api, JSONObject p) throws Exception {
        return api.route("POST","/ext/aimoge/post",Map.of("x-futatabi-token",api.localToken()),p.toString().getBytes(StandardCharsets.UTF_8));
    }
    public static void main(String[] args) throws Exception {
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler(){
            protected URLConnection openConnection(URL u){return new Mock(u);}
        } : null);
        Context context=new Context();
        ExtensionApi api=new ExtensionApi(context,null,null,null);
        SharedPreferences prefs=context.getSharedPreferences("futatabi_extension_private",0);
        JSONObject p=new JSONObject().put("body","fixture").put("deleteKey","fixture-key");
        check(send(api,p).status==401 && attempts==0,"no login");
        prefs.edit().putString("credential",TOKEN).putLong("credential_expires",System.currentTimeMillis()+600000).commit();
        check(send(api,p).status==400 && challenges==0 && attempts==0,"new thread no attachment");
        p.put("threadId",THREAD).put("body", PostPresentation.quote("aimoge", "123456789", "fixture"));
        failChallenge=true;
        check(send(api,p).status==503 && attempts==0,"challenge failure stops posting");
        failChallenge=false;
        check(send(api,p).status==403 && attempts==1 && challenges==2,"reply request checked, no success");
        p.remove("threadId");
        p.put("body", "fixture");
        p.put("attachments",new JSONArray().put(new JSONObject().put("base64","AQID").put("mime","image/jpeg").put("name","private-fixture-name.jpg")));
        expectedPath[0]="/threads/aimg";
        check(send(api,p).status==403 && attempts==2 && presigns==1 && challenges==3,"new thread request checked, no success");
        System.out.println("PASS: missing credential, required image, challenge failure, reply and new-thread request construction, explicit upstream failure propagation; synthetic transport only");
    }
}
