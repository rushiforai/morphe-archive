package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/** Authenticated local API, separate from the read-only Futaba compatibility routes. */
final class ExtensionApi {
    static final String CALLBACK = "http://127.0.0.1:18765/ext/login/aimoge/callback";
    private static final String STORE = "futatabi_extension_private";
    private final SharedPreferences prefs;
    private final AimogeAdapter aimoge;
    private final AnimanchAdapter animanch;
    private final MebukiAdapter mebuki;
    private final MebukiReplyClient mebukiReplies;
    private final AimogeWriteClient client;
    private final SecureRandom random = new SecureRandom();

    ExtensionApi(Context context, AimogeAdapter adapter, AnimanchAdapter animanchAdapter, MebukiAdapter mebukiAdapter) {
        prefs = context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
        aimoge = adapter;
        animanch = animanchAdapter;
        mebuki = mebukiAdapter;
        mebukiReplies = new MebukiReplyClient(context, mebukiAdapter);
        client = new AimogeWriteClient();
        synchronized (this) {
            if (!prefs.contains("local_token")) prefs.edit().putString("local_token", randomUrl(32)).commit();
            if (!prefs.contains("installation_id"))
                prefs.edit().putString("installation_id", UUID.randomUUID().toString()).commit();
        }
    }

    String localToken() { return prefs.getString("local_token", ""); }
    private String randomUrl(int bytes) {
        byte[] buffer = new byte[bytes];
        random.nextBytes(buffer);
        return Base64.encodeToString(buffer, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }

    private boolean authorized(Map<String,String> headers) {
        String supplied = headers.getOrDefault("x-futatabi-token", "");
        byte[] a = supplied.getBytes(StandardCharsets.US_ASCII);
        byte[] b = localToken().getBytes(StandardCharsets.US_ASCII);
        return b.length > 0 && a.length == b.length && MessageDigest.isEqual(a, b);
    }

    BridgeServer.BridgeResponse route(String method, String path, Map<String,String> headers, byte[] body) {
        try {
            if ("GET".equals(method) && path.startsWith("/ext/login/aimoge/callback?"))
                return callback(path);
            if (!authorized(headers)) return BridgeServer.BridgeResponse.text(403, "Not authorized");
            if ("GET".equals(method) && "/ext/status".equals(path)) return status();
            if ("GET".equals(method) && path.startsWith("/ext/threads?board=")) {
                String board = query(path).get("board");
                if ("aimoge".equals(board))
                    return BridgeServer.BridgeResponse.json(200, aimoge.threadsJson().toString());
                if ("animanch".equals(board))
                    return BridgeServer.BridgeResponse.json(200, animanch.threadsJson().toString());
                if ("mebuki".equals(board))
                    return BridgeServer.BridgeResponse.json(200, mebuki.threadsJson().toString());
                return BridgeServer.BridgeResponse.text(404, "Unsupported board");
            }
            if ("GET".equals(method) && path.startsWith("/ext/reply-targets?")) {
                Map<String,String> q = query(path);
                String id = q.getOrDefault("id", "");
                if ("aimoge".equals(q.get("board")))
                    return BridgeServer.BridgeResponse.json(200, aimoge.replyTargets(id).toString());
                if ("animanch".equals(q.get("board")) && id.matches("[0-9]{13}"))
                    return BridgeServer.BridgeResponse.json(200, animanch.replyTargets(id).toString());
                return BridgeServer.BridgeResponse.text(400, "Invalid reply target");
            }
            if ("POST".equals(method) && "/ext/login/aimoge/start".equals(path))
                return startLogin();
            if ("POST".equals(method) && "/ext/login/aimoge/logout".equals(path)) {
                prefs.edit().remove("credential").remove("credential_expires").commit();
                return BridgeServer.BridgeResponse.json(200, "{\"loggedIn\":false}");
            }
            if ("POST".equals(method) && "/ext/aimoge/post".equals(path)) {
                if (body.length == 0 || body.length > 28_000_000)
                    return BridgeServer.BridgeResponse.text(413, "Invalid request size");
                return submit(new JSONObject(new String(body, StandardCharsets.UTF_8)));
            }
            if ("POST".equals(method) && "/ext/animanch/post".equals(path)) {
                if (body.length == 0 || body.length > 14_000_000)
                    return BridgeServer.BridgeResponse.text(413, "Invalid request size");
                return animanch.post(new JSONObject(new String(body, StandardCharsets.UTF_8)));
            }
            if ("POST".equals(method) && "/ext/mebuki/reply".equals(path)) {
                if (body.length == 0 || body.length > 24_000)
                    return BridgeServer.BridgeResponse.text(413, "Invalid request size");
                return submitMebuki(new JSONObject(new String(body, StandardCharsets.UTF_8)));
            }
            return BridgeServer.BridgeResponse.text(404, "Not found");
        } catch (IllegalArgumentException ex) {
            return BridgeServer.BridgeResponse.text(400, ex.getMessage());
        } catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "Request failed: " + ex.getClass().getSimpleName());
        }
    }

    BridgeServer.BridgeResponse submitMebuki(JSONObject payload) throws Exception {
        return mebukiReplies.reply(payload);
    }

    private BridgeServer.BridgeResponse status() throws Exception {
        JSONObject out = new JSONObject();
        out.put("aimoge", loggedIn());
        out.put("animanch", false);
        MebukiSession.State mebukiState = MebukiSession.verify(prefs.getString(MebukiSession.KEY, ""));
        out.put("mebuki", mebukiState == MebukiSession.State.AUTHENTICATED);
        out.put("mebukiSessionState", mebukiState.name());
        return BridgeServer.BridgeResponse.json(200, out.toString());
    }

    private boolean loggedIn() {
        String credential = prefs.getString("credential", "");
        long expires = prefs.getLong("credential_expires", 0);
        return !credential.isEmpty() && expires > System.currentTimeMillis();
    }

    private synchronized BridgeServer.BridgeResponse startLogin() throws Exception {
        String verifier = randomUrl(32);
        String state = randomUrl(32);
        byte[] challengeBytes = MessageDigest.getInstance("SHA-256").digest(verifier.getBytes(StandardCharsets.US_ASCII));
        String challenge = Base64.encodeToString(challengeBytes, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
        JSONObject request = new JSONObject();
        request.put("redirectUri", CALLBACK);
        request.put("installationId", prefs.getString("installation_id", ""));
        request.put("state", state);
        request.put("codeChallenge", challenge);
        request.put("codeChallengeMethod", "S256");
        AimogeWriteClient.Result upstream;
        try { upstream = client.post("/app-authorizations", request, null); }
        catch (AimogeWriteClient.DnsUnavailableException ex) {
            return BridgeServer.BridgeResponse.text(503, "Aimoge authorization start: DNS failed for api.nijiurachan.net. Check connectivity and retry login.");
        }
        if (upstream.status != 201)
            return BridgeServer.BridgeResponse.json(upstream.status, safeJson(upstream.text));
        JSONObject reply = upstream.json();
        String url = reply.getString("authorizationUrl");
        java.net.URI auth = new java.net.URI(url);
        if (!"https".equals(auth.getScheme()) || !"nijiurachan.net".equalsIgnoreCase(auth.getHost())
                || auth.getUserInfo() != null || (auth.getPort() != -1 && auth.getPort() != 443)
                || url.length() > 4096) throw new IllegalStateException("Invalid authorization URL");
        if (!prefs.edit().putString("pkce_verifier", verifier).putString("pkce_state", state)
                .putLong("pkce_started", System.currentTimeMillis()).commit())
            throw new IllegalStateException("PKCE state save failed");
        JSONObject result = new JSONObject();
        result.put("authorizationUrl", url);
        return BridgeServer.BridgeResponse.json(200, result.toString());
    }

    private synchronized BridgeServer.BridgeResponse callback(String url) throws Exception {
        Map<String,String> values = query(url);
        String state = values.getOrDefault("state", "");
        String code = values.getOrDefault("code", "");
        String expected = prefs.getString("pkce_state", "");
        long created = prefs.getLong("pkce_started", 0);
        if (state.length() < 32 || expected.isEmpty() ||
                !MessageDigest.isEqual(state.getBytes(StandardCharsets.US_ASCII),
                        expected.getBytes(StandardCharsets.US_ASCII)) ||
                System.currentTimeMillis() - created > 10 * 60_000L)
            return BridgeServer.BridgeResponse.text(403, "Invalid or expired state");
        if (!code.matches("^[A-Za-z0-9_-]{43}$"))
            return BridgeServer.BridgeResponse.text(400, "Invalid code");
        String verifier = prefs.getString("pkce_verifier", "");
        if (!verifier.matches("^[A-Za-z0-9._~-]{43,128}$"))
            return BridgeServer.BridgeResponse.text(403, "Missing PKCE verifier");
        JSONObject request = new JSONObject();
        request.put("redirectUri", CALLBACK);
        request.put("code", code);
        request.put("codeVerifier", verifier);
        AimogeWriteClient.Result response;
        boolean retain = false;
        try {
            response = client.post("/app-credentials", request, null);
        } catch (AimogeWriteClient.DnsUnavailableException ex) {
            retain = true;
            return BridgeServer.BridgeResponse.text(503,
                    "Aimoge credential exchange: DNS failed for api.nijiurachan.net. Restore connectivity and reload this page before authorization expires. No credential was saved.");
        } finally {
            if (!retain && !prefs.edit().remove("pkce_state").remove("pkce_verifier")
                    .remove("pkce_started").commit()) throw new IllegalStateException("PKCE state clear failed");
        }
        if (response.status != 201) return BridgeServer.BridgeResponse.text(400, "Authorization could not be completed");
        JSONObject result = response.json();
        String credential = result.getString("credential");
        long expiry = java.time.Instant.parse(result.getString("expiresAt")).toEpochMilli();
        if (credential.isEmpty() || expiry <= System.currentTimeMillis())
            return BridgeServer.BridgeResponse.text(400, "Invalid credential result");
        if (!prefs.edit().putString("credential", credential).putLong("credential_expires", expiry).commit())
            return BridgeServer.BridgeResponse.text(503, "Credential save failed; start login again");
        return new BridgeServer.BridgeResponse(200, "text/html; charset=utf-8",
                "<html><body>Login complete. Return to futatabi.</body></html>".getBytes(StandardCharsets.UTF_8));
    }

    BridgeServer.BridgeResponse submit(JSONObject payload) throws Exception {
        if (!loggedIn()) return BridgeServer.BridgeResponse.text(401, "Aimoge login required");
        String body = payload.optString("body", "");
        if (body.isEmpty() || body.codePointCount(0, body.length()) > 4000)
            return BridgeServer.BridgeResponse.text(400, "Body must contain 1-4000 characters");
        String threadId = payload.optString("threadId", "");
        if (!threadId.isEmpty()) UUID.fromString(threadId);
        String deleteKey = payload.optString("deleteKey", "");
        if (deleteKey.isEmpty()) deleteKey = randomUrl(24);
        if (deleteKey.length() > 64) return BridgeServer.BridgeResponse.text(400, "Delete key too long");
        String credential = prefs.getString("credential", "");
        JSONObject send = new JSONObject();
        send.put("requestId", UUID.randomUUID().toString());
        send.put("body", body);
        send.put("deleteKey", deleteKey);
        if(!threadId.isEmpty()){
            if(payload.optBoolean("sage"))send.put("sage",true);
            else if(payload.optBoolean("age"))send.put("age",true);
        } else if(payload.optBoolean("sage")) send.put("sage",true);
        JSONArray attachments = payload.optJSONArray("attachments");
        if (attachments != null && attachments.length() > (threadId.isEmpty() ? 1 : 3))
            return BridgeServer.BridgeResponse.text(400, "Too many attachments");
        if (threadId.isEmpty() && (attachments == null || attachments.length() == 0))
            return BridgeServer.BridgeResponse.text(400, "New thread requires an image");
        JSONArray ids = new JSONArray();
        if (attachments != null) {
            for (int i = 0; i < attachments.length(); i++) {
                JSONObject file = attachments.getJSONObject(i);
                byte[] data = Base64.decode(file.getString("base64"), Base64.DEFAULT);
                String id = client.presignAndUpload(data, file.getString("mime"),
                        file.optString("name", ""), credential);
                ids.put(id);
            }
        }
        if (ids.length() > 0) {
            if (threadId.isEmpty()) send.put("attachmentId", ids.getString(0));
            else send.put("attachmentIds", ids);
        }
        String path = threadId.isEmpty() ? "/threads/aimg" : "/threads/" + threadId + "/posts";
        // Obtain a fresh official challenge immediately before submission.
        // The app credential is the documented x-aimg-token; no browser token
        // or clearance cookie is copied or requested by the native client.
        AimogeWriteClient.Result challenge = client.get("/altcha");
        if (challenge.status != 200)
            return BridgeServer.BridgeResponse.text(challenge.status, "ALTCHA challenge HTTP " + challenge.status);
        try { send.put("altcha", AimogeProof.solve(challenge.json())); }
        catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "ALTCHA preparation failed: " + ex.getClass().getSimpleName());
        }
        AimogeWriteClient.Result response = client.post(path, send, credential);
        if (response.status != 201)
            return BridgeServer.BridgeResponse.json(response.status, safeJson(response.text));
        JSONObject result = response.json();
        if (aimoge != null && !threadId.isEmpty()) aimoge.invalidateThread(threadId);
        String key = "history_" + UUID.randomUUID();
        JSONObject history = new JSONObject();
        history.put("result", result);
        history.put("deleteKey", deleteKey);
        history.put("createdAt", System.currentTimeMillis());
        prefs.edit().putString(key, history.toString()).commit();
        return BridgeServer.BridgeResponse.json(201, result.toString());
    }

    private static String safeJson(String raw) {
        try { return new JSONObject(raw).toString(); }
        catch (Exception ignored) {
            JSONObject obj = new JSONObject();
            try { obj.put("error", raw.substring(0, Math.min(raw.length(), 2000))); }
            catch (Exception ignore) {}
            return obj.toString();
        }
    }

    private static Map<String,String> query(String url) throws Exception {
        Map<String,String> values = new HashMap<>();
        int q = url.indexOf('?');
        if (q < 0) return values;
        for (String entry : url.substring(q + 1).split("&")) {
            String[] parts = entry.split("=", 2);
            values.put(URLDecoder.decode(parts[0], "UTF-8"),
                    URLDecoder.decode(parts.length > 1 ? parts[1] : "", "UTF-8"));
        }
        return values;
    }
}
