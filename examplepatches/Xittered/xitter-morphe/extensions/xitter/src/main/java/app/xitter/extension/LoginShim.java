package app.xitter.extension;

import android.util.Base64;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import okhttp3.FormBody;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okio.Buffer;

/**
 * Signing in. X's app signs in through a server-driven flow (POST /1.1/onboarding/task.json)
 * whose screens it draws natively; Xitter signs in through the web client's dialog instead. The
 * flow is answered here with the app's own screens, a username step and a password step, and the
 * password is checked by the instance's form sign-in (POST /login). The session it returns is
 * handed to the app as the account's OAuth token, which the app then stores and sends like X's.
 */
final class LoginShim {
    private static final String TAG = XitterNetwork.TAG;

    // the flows a signed-out app starts; they all lead to the sign-in screens
    private static final Set<String> SIGN_IN_FLOWS = new HashSet<>(Arrays.asList(
            "login", "welcome", "signup", "password_reset", "single_sign_on", "sso_init", "login_challenge"));

    private static final String PREFIX = "xitter_";
    private static final String STEP_USERNAME = "XitterEnterUsername";
    private static final String STEP_PASSWORD = "XitterEnterPassword";
    private static final String STEP_DONE = "LoginSuccessSubtask";

    private LoginShim() {}

    static boolean handles(HttpUrl url) {
        return url.encodedPath().endsWith("/onboarding/task.json");
    }

    static Response handle(Interceptor.Chain chain, Request request, HttpUrl target) throws IOException {
        JSONObject body = readBody(request.body());
        String flow = request.url().queryParameter("flow_name");
        String flowToken = body.optString("flow_token", "");
        boolean ours = flowToken.startsWith(PREFIX) || (flow != null && SIGN_IN_FLOWS.contains(flow));
        if (!ours) {
            // any other flow (settings, verification...) is the instance's to answer
            Request.Builder out = request.newBuilder().url(target);
            XitterInterceptor.sign(request, out);
            return chain.proceed(out.build());
        }
        try {
            return step(request, flowToken, body.optJSONArray("subtask_inputs"));
        } catch (JSONException e) {
            Log.e(TAG, "sign-in flow", e);
            return error(request, 0, "Something went wrong. Try again.");
        }
    }

    private static Response step(Request request, String flowToken, JSONArray inputs) throws JSONException, IOException {
        JSONObject input = inputs != null && inputs.length() > 0 ? inputs.optJSONObject(inputs.length() - 1) : null;
        String subtask = input == null ? "" : input.optString("subtask_id");

        if (STEP_USERNAME.equals(subtask)) {
            JSONObject text = input.optJSONObject("enter_text");
            String username = text == null ? "" : text.optString("text").trim();
            if (username.startsWith("@")) username = username.substring(1);
            if (username.isEmpty()) return flow(request, PREFIX + "start", usernameScreen());
            return flow(request, PREFIX + "pw." + encode(username), passwordScreen(username));
        }

        if (STEP_PASSWORD.equals(subtask) && flowToken.startsWith(PREFIX + "pw.")) {
            String username = decode(flowToken.substring((PREFIX + "pw.").length()));
            JSONObject entry = input.optJSONObject("enter_password");
            String password = entry == null ? "" : entry.optString("password");
            return signIn(request, username, password);
        }

        if (flowToken.startsWith(PREFIX + "done")) {
            // the app confirms the opened account; the flow ends here
            return flow(request, PREFIX + "done", new JSONArray());
        }

        return flow(request, PREFIX + "start", usernameScreen());
    }

    private static Response signIn(Request request, String username, String password) throws IOException, JSONException {
        XitterNetwork.Instance instance = XitterNetwork.instance();
        OkHttpClient client = new OkHttpClient.Builder()
                .followRedirects(false)
                .connectTimeout(20, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .build();

        Request login = new Request.Builder()
                .url(instance.origin + instance.base + "/login")
                .post(new FormBody.Builder().add("username", username).add("password", password).build())
                .build();
        String authToken = null, csrf = null, userId = null;
        try (Response r = client.newCall(login).execute()) {
            if (r.code() == 401) return error(request, 399, "Wrong username or password.");
            if (r.code() == 429) return error(request, 88, "Too many tries. Wait a few minutes and try again.");
            for (String c : r.headers("Set-Cookie")) {
                String pair = c.split(";", 2)[0];
                int eq = pair.indexOf('=');
                if (eq <= 0) continue;
                String name = pair.substring(0, eq).trim(), value = pair.substring(eq + 1).trim();
                if (name.equals("auth_token")) authToken = value;
                else if (name.equals("ct0")) csrf = value;
                else if (name.equals("twid")) userId = URLDecoder.decode(value, "UTF-8").replace("u=", "");
            }
        }
        if (authToken == null || csrf == null) {
            return error(request, 0, "The instance didn't sign you in. Accounts with two-factor sign-in can't sign in from the app yet.");
        }

        Session session = new Session(authToken, csrf);
        JSONObject user = viewer(client, instance, session);
        if (user == null) {
            user = new JSONObject().put("screen_name", username).put("name", username);
        }
        if (!user.has("id_str") && userId != null) user.put("id_str", userId);
        if (user.has("id_str") && !user.has("id")) {
            try {
                user.put("id", Long.parseLong(user.getString("id_str")));
            } catch (NumberFormatException ignored) {
            }
        }

        JSONObject open = new JSONObject()
                .put("user", user)
                .put("oauth_token", session.oauthToken())
                .put("oauth_token_secret", csrf)
                .put("known_device_token", "")
                .put("next_link", link("task", "next_link", null));
        JSONArray subtasks = new JSONArray().put(new JSONObject().put("subtask_id", STEP_DONE).put("open_account", open));
        return flow(request, PREFIX + "done", subtasks);
    }

    /** The signed-in account in X's REST form, from the instance's Viewer query. */
    private static JSONObject viewer(OkHttpClient client, XitterNetwork.Instance instance, Session session) {
        Request r = new Request.Builder()
                .url(instance.origin + instance.base + "/graphql/xitter/Viewer?variables=%7B%7D&features=%7B%7D")
                // XitterInterceptor turns this into the session's cookie and csrf header
                .header("Authorization", "OAuth oauth_token=\"" + session.oauthToken() + "\"")
                .build();
        try (Response response = client.newCall(r).execute()) {
            if (!response.isSuccessful() || response.body() == null) return null;
            JSONObject json = new JSONObject(response.body().string());
            JSONObject result = json.getJSONObject("data").getJSONObject("viewer")
                    .getJSONObject("user_results").getJSONObject("result");
            JSONObject legacy = result.optJSONObject("legacy");
            if (legacy == null) legacy = new JSONObject();
            String id = result.optString("rest_id", legacy.optString("id_str", ""));
            if (!id.isEmpty()) legacy.put("id_str", id);
            JSONObject core = result.optJSONObject("core");
            if (core != null) {
                // newer user shapes keep the names and avatar outside "legacy"
                if (!legacy.has("screen_name") && core.has("screen_name")) legacy.put("screen_name", core.getString("screen_name"));
                if (!legacy.has("name") && core.has("name")) legacy.put("name", core.getString("name"));
                if (!legacy.has("created_at") && core.has("created_at")) legacy.put("created_at", core.getString("created_at"));
            }
            JSONObject avatar = result.optJSONObject("avatar");
            if (!legacy.has("profile_image_url_https") && avatar != null && avatar.has("image_url")) {
                legacy.put("profile_image_url_https", avatar.getString("image_url"));
            }
            return legacy;
        } catch (Exception e) {
            Log.w(TAG, "viewer lookup after sign-in failed", e);
            return null;
        }
    }

    // ---- the screens ----

    private static JSONArray usernameScreen() throws JSONException {
        String name = XitterNetwork.instance().host;
        JSONObject enterText = new JSONObject()
                .put("primary_text", text("Sign in to " + name))
                .put("secondary_text", text("Enter your username on this Xitter instance."))
                .put("hint_text", "Username")
                .put("multiline", false)
                .put("auto_correction_enabled", false)
                .put("next_link", link("task", "next_link", "Next"));
        return new JSONArray().put(new JSONObject().put("subtask_id", STEP_USERNAME).put("enter_text", enterText));
    }

    private static JSONArray passwordScreen(String username) throws JSONException {
        JSONObject enterPassword = new JSONObject()
                .put("primary_text", text("Enter your password"))
                .put("hint", "Password")
                .put("name", "@" + username)
                .put("next_link", link("task", "next_link", "Log in"));
        return new JSONArray().put(new JSONObject().put("subtask_id", STEP_PASSWORD).put("enter_password", enterPassword));
    }

    private static JSONObject text(String s) throws JSONException {
        return new JSONObject().put("text", s).put("entities", new JSONArray());
    }

    private static JSONObject link(String type, String id, String label) throws JSONException {
        JSONObject l = new JSONObject().put("link_type", type).put("link_id", id);
        if (label != null) l.put("label", label);
        return l;
    }

    private static Response flow(Request request, String token, JSONArray subtasks) throws JSONException {
        JSONObject r = new JSONObject().put("flow_token", token).put("status", "success").put("subtasks", subtasks);
        return XitterInterceptor.json(request, 200, r.toString());
    }

    private static Response error(Request request, int code, String message) {
        try {
            JSONObject e = new JSONObject().put("code", code).put("message", message);
            return XitterInterceptor.json(request, 400, new JSONObject().put("errors", new JSONArray().put(e)).toString());
        } catch (JSONException ex) {
            return XitterInterceptor.json(request, 400, "{\"errors\":[]}");
        }
    }

    // ---- helpers ----

    private static JSONObject readBody(RequestBody body) {
        if (body == null) return new JSONObject();
        try {
            Buffer buffer = new Buffer();
            body.writeTo(buffer);
            String s = buffer.readUtf8();
            return s.isEmpty() ? new JSONObject() : new JSONObject(s);
        } catch (Exception e) {
            return new JSONObject();
        }
    }

    private static String encode(String s) {
        return Base64.encodeToString(s.getBytes(StandardCharsets.UTF_8), Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }

    private static String decode(String s) {
        try {
            return new String(Base64.decode(s, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING), StandardCharsets.UTF_8);
        } catch (IllegalArgumentException e) {
            return "";
        }
    }
}
