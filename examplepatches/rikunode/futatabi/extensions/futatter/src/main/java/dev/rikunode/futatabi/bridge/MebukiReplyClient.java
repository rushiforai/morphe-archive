package dev.rikunode.futatabi.bridge;

import android.content.Context;

import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import android.util.Base64;

/** Explicit user-initiated text reply; official single-fetch action and authenticated readback. */
final class MebukiReplyClient {
    private static final String SITE = "https://mebuki.moe";
    private final Context context;
    private final MebukiAdapter adapter;

    MebukiReplyClient(Context context, MebukiAdapter adapter) {
        this.context = context;
        this.adapter = adapter;
    }

    // Manifest: app (parent) / pathless _main / t/:tslug (hasAction).
    static String threadPath(String slug){
        if(slug==null||!slug.matches("[A-Za-z0-9_-]{8,24}"))throw new IllegalArgumentException("Invalid thread slug");
        return "/app/t/"+slug;
    }

    synchronized BridgeServer.BridgeResponse reply(JSONObject payload) throws Exception {
        MebukiPostDiagnostic diag=new MebukiPostDiagnostic(context);
        try{return reply(payload,diag);}finally{diag.save();}
    }

    private BridgeServer.BridgeResponse reply(JSONObject payload,MebukiPostDiagnostic diag) throws Exception {
        String id = payload.optString("threadId", "");
        if (!id.matches("[0-9]{13}")) return BridgeServer.BridgeResponse.text(400, "Select a valid thread");
        String slug = adapter.slugForThreadId(id);
        if (slug == null || !slug.matches("[A-Za-z0-9_-]{8,24}"))
            return BridgeServer.BridgeResponse.text(404, "Unknown thread");

        String content = payload.optString("content", "").replace("\r\n","\n").replace('\r','\n').replaceFirst("[\\s\\uFEFF]+$","");
        if (content.trim().isEmpty() || content.length() > 5000 ||
                content.split("\\r?\\n", -1).length > 100)
            return BridgeServer.BridgeResponse.text(400, "Reply must contain 1-5000 characters, 100 lines max");
        if (payload.has("attachments")) return BridgeServer.BridgeResponse.text(400, "Attachments not yet verified");
        String replyToId = payload.optString("replyToId", "");
        if (!replyToId.isEmpty() && !replyToId.matches("[A-Za-z0-9_-]{1,128}"))
            return BridgeServer.BridgeResponse.text(400, "Invalid replyToId");
        String cookie = MebukiSession.saved(context);
        if (!MebukiSession.safeCookie(cookie)){diag.before=MebukiPostDiagnostic.Read.NOT_SAVED;return failure(401,"Mebuki login required");}
        diag.stage=MebukiPostDiagnostic.Stage.BEFORE_READ;diag.save();
        MebukiThreadData before;
        try { before=MebukiSession.readThread(slug,cookie); }
        catch(MebukiSession.ReadFailure ex) {
            diag.stage=MebukiPostDiagnostic.Stage.BEFORE_FAILED;diag.before=MebukiPostDiagnostic.readFailure(ex);
            String reason=ex.getMessage();
            return failure("ANONYMOUS".equals(reason)||"NOT_SAVED".equals(reason)||"HTTP 401".equals(reason)
                    ?401:503,"Session or thread unavailable");
        } catch(Exception ex){diag.stage=MebukiPostDiagnostic.Stage.BEFORE_FAILED;diag.before=MebukiPostDiagnostic.readFailure(ex);return failure(503,"Session or thread unavailable");}
        diag.before=MebukiPostDiagnostic.Read.OK;diag.beforeCount=before.count;
        if(!cookie.equals(MebukiSession.saved(context))){diag.stage=MebukiPostDiagnostic.Stage.SESSION_CHANGED;return failure(401,"Session changed");}
        if(payload.optBoolean("stockQuote")&&replyToId.isEmpty()){
            java.util.regex.Matcher quote=java.util.regex.Pattern.compile("^>No\\.([0-9]{13})\\n").matcher(content);
            if(quote.find()){
                replyToId=before.replyTarget(id,quote.group(1));
                if(replyToId==null)return failure(400,"Unknown quote target");
                content=content.substring(quote.end());
                if(content.trim().isEmpty())return failure(400,"Empty reply");
            }
        }
        if(!replyToId.isEmpty()&&!before.hasTarget(replyToId))return failure(400,"Unknown reply target");

        byte[] nonce = new byte[18];
        new SecureRandom().nextBytes(nonce);
        String boundary = "futatabi-" + Base64.encodeToString(nonce,
                Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        if (!replyToId.isEmpty()) append(buffer, boundary, "replyToId", replyToId);
        append(buffer, boundary, "content", content.replace("\n","\r\n"));
        append(buffer, boundary, "showUsername", payload.optBoolean("showUsername", false) ? "on" : "");
        append(buffer, boundary, "showThreadOwner", payload.optBoolean("showThreadOwner", false) ? "on" : "");
        buffer.write(("--" + boundary + "--\r\n").getBytes(StandardCharsets.UTF_8));

        String documentPath=threadPath(slug);
        URL url = new URL(SITE + documentPath + ".data");
        if (!("https".equals(url.getProtocol()) && "mebuki.moe".equals(url.getHost())))
            throw new IllegalArgumentException("Unexpected submission host");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(7000);
        connection.setReadTimeout(12000);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        // CookieManager applies domain, path, Secure and HttpOnly selection.
        // Do not silently change identities: only use path-specific WebView
        // cookies if the root header still matches the explicitly saved one.
        String actionCookie=cookie;
        try{
            android.webkit.CookieManager manager=android.webkit.CookieManager.getInstance();
            String root=manager.getCookie(SITE);
            if(!MebukiSession.safeCookie(root))diag.scope=MebukiPostDiagnostic.CookieScope.SAVED_ONLY;
            else if(!cookie.equals(root))diag.scope=MebukiPostDiagnostic.CookieScope.WEBVIEW_ROOT_CHANGED;
            else{
                String scoped=manager.getCookie(url.toString());
                if(MebukiSession.safeCookie(scoped)&&sameRootCookies(cookie,scoped)){
                    actionCookie=scoped;diag.scope=cookie.equals(scoped)?MebukiPostDiagnostic.CookieScope.ACTION_SAME:MebukiPostDiagnostic.CookieScope.ACTION_SCOPED;
                }else {diag.scope=MebukiPostDiagnostic.CookieScope.ACTION_UNAVAILABLE;connection.disconnect();return failure(401,"Action cookie unavailable");}
            }
        }catch(RuntimeException ex){diag.scope=MebukiPostDiagnostic.CookieScope.ACTION_UNAVAILABLE;}
        connection.setRequestProperty("Cookie", actionCookie);
        connection.setUseCaches(false);
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        connection.setRequestProperty("Origin", SITE);
        connection.setRequestProperty("Referer", SITE + documentPath);
        connection.setRequestProperty("Accept", "*/*");
        // Match the Android WebView used for the owner-operated login.
        // No synthetic Sec-Fetch or anti-bot headers, no challenge bypass.
        try{
            String ua=android.webkit.WebSettings.getDefaultUserAgent(context);
            if(ua!=null&&!ua.isEmpty()&&ua.length()<=1024&&ua.indexOf('\r')<0&&ua.indexOf('\n')<0){
                connection.setRequestProperty("User-Agent",ua);diag.webViewUa=true;
            }
        }catch(RuntimeException ignored){}
        connection.setFixedLengthStreamingMode(buffer.size());
        try {
            if(!cookie.equals(MebukiSession.saved(context))){
                diag.stage=MebukiPostDiagnostic.Stage.SESSION_CHANGED;
                return failure(401,"Session changed");
            }
            diag.stage=MebukiPostDiagnostic.Stage.SEND;diag.save();
            try(java.io.OutputStream output=connection.getOutputStream()){buffer.writeTo(output);}
            int status=connection.getResponseCode();
            diag.status=status;
            diag.router=connection.getHeaderField("X-Remix-Response")!=null;
            diag.setCookie=connection.getHeaderField("Set-Cookie")!=null;
            diag.stage=MebukiPostDiagnostic.Stage.RESPONSE;
            diag.save();
            String redirect=connection.getHeaderField("X-Remix-Redirect");
            if(redirect==null&&status>=300&&status<400)redirect=connection.getHeaderField("Location");
            boolean challenge="challenge".equalsIgnoreCase(connection.getHeaderField("cf-mitigated"));
            InputStream stream=status<400?connection.getInputStream():connection.getErrorStream();
            String response="";
            if(stream!=null)try(InputStream in=stream){
                response=new String(AimogeWriteClient.bounded(in,64_000),StandardCharsets.UTF_8);
            }
            diag.kind=MebukiActionResponse.classify(status,connection.getContentType(),diag.router,redirect,challenge,response,slug);
            diag.save();
            if(status==401||status==403||status==429||status==400||status==405||status==422)
                return failure(status,"Action rejected");
            if(status>=400||diag.kind==MebukiActionResponse.Kind.ROUTER_ERROR||
                    diag.kind==MebukiActionResponse.Kind.CHALLENGE||
                    diag.kind==MebukiActionResponse.Kind.OTHER_REDIRECT)return uncertain();
        }catch(Exception ex){diag.kind=MebukiActionResponse.Kind.TRANSPORT_ERROR;return uncertain();}
        finally{connection.disconnect();}
        if(!cookie.equals(MebukiSession.saved(context))){diag.stage=MebukiPostDiagnostic.Stage.SESSION_CHANGED;return uncertain();}
        try{
            diag.stage=MebukiPostDiagnostic.Stage.AFTER_READ;diag.save();
            MebukiThreadData after=MebukiSession.readThread(slug,cookie);
            diag.after=MebukiPostDiagnostic.Read.OK;diag.afterCount=after.count;
            MebukiThreadData.Confirmation result=after.confirmReply(id,before,content,replyToId);
            diag.match=result.reason;
            if(!cookie.equals(MebukiSession.saved(context))){diag.stage=MebukiPostDiagnostic.Stage.SESSION_CHANGED;return uncertain();}
            diag.stage=MebukiPostDiagnostic.Stage.FINISHED;
            if(result.number==null||!diag.kind.eligible())return uncertain();
            diag.confirmed=true;
            return BridgeServer.BridgeResponse.json(201,new JSONObject().put("confirmed",true)
                    .put("thisno",result.number).toString());
        }catch(Exception ex){diag.stage=MebukiPostDiagnostic.Stage.AFTER_FAILED;diag.after=MebukiPostDiagnostic.readFailure(ex);return uncertain();}
    }

    private static boolean sameRootCookies(String root,String scoped){
        java.util.Map<String,String> names=new java.util.HashMap<>();
        for(String part:scoped.split(";")){
            String item=part.trim();int eq=item.indexOf('=');
            if(eq<1||names.put(item.substring(0,eq),item)!=null)return false;
        }
        for(String part:root.split(";")){
            String item=part.trim();int eq=item.indexOf('=');
            if(eq<1||!item.equals(names.get(item.substring(0,eq))))return false;
        }
        return true;
    }

    private static BridgeServer.BridgeResponse failure(int code,String message){
        return BridgeServer.BridgeResponse.text(code,message);
    }
    private static BridgeServer.BridgeResponse uncertain(){
        return BridgeServer.BridgeResponse.json(202,"{\"confirmed\":false}");
    }

    private static void append(ByteArrayOutputStream out, String boundary, String key, String value)
            throws Exception {
        out.write(("--" + boundary + "\r\nContent-Disposition: form-data; name=\"" +
                key + "\"\r\n\r\n").getBytes(StandardCharsets.UTF_8));
        out.write(value.getBytes(StandardCharsets.UTF_8));
        out.write("\r\n".getBytes(StandardCharsets.US_ASCII));
    }
}
