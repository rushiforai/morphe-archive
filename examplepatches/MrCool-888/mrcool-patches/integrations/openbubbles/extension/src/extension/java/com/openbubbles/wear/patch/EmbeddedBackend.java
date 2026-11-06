package com.openbubbles.wear.patch;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import com.localob.messaging.app.service.BackendForegroundService;
import com.localob.messaging.app.service.BackendState;
import com.openbubbles.wear.bridge.EmbeddedRuntime;
import com.openbubbles.wear.bridge.AvatarCache;
import org.json.JSONObject;

/** In-process adapter from the Wear protocol to OpenBubbles' existing backend. */
public final class EmbeddedBackend implements EmbeddedRuntime.Backend {
    private static final String TAG = "OBWearPatch";
    private static final int MAX_REQUEST_CHARS = 16_384;
    private static final int MAX_RESPONSE_BYTES = 500_000;
    private final Context context;

    public EmbeddedBackend(Context context) {
        this.context = context.getApplicationContext();
        BridgeOps.initializeNames(this.context);
    }

    @Override
    public String execute(String json) {
        JSONObject request = null;
        try {
            if (json == null || json.length() > MAX_REQUEST_CHARS) return error(null, "Invalid bridge request.");
            request = new JSONObject(json);
            String requestId = request.optString("requestId", null);
            if (request.optInt("apiVersion", -1) != BridgeOps.API_VERSION) {
                return error(requestId, "Unsupported Wear bridge API version.");
            }
            String op = request.optString("op", "");
            if (!op.equals("status") && !isEnabled()) {
                return new JSONObject(error(requestId,
                        "Wear companion bridge is disabled in OpenBubbles Settings → Morphe patches."))
                        .put("enabled", false).toString();
            }
            if (op.equals("status") || op.equals("chats") || op.equals("thread") ||
                    op.equals("send") || op.equals("markRead") || op.equals("reaction") ||
                    op.equals("reactionEvents"))
                prepareBackend(!op.equals("status"));

            JSONObject response;
            switch (op) {
                case "status":
                    response = BridgeOps.status(context).put("enabled", isEnabled());
                    break;
                case "chats": response = BridgeOps.chats(request); break;
                case "thread": response = BridgeOps.thread(request); break;
                case "send":
                    JSONObject sendRequest = request;
                    response = SendJournal.run(context.getSharedPreferences("wear_send_journal", Context.MODE_PRIVATE),
                            request, () -> BridgeOps.send(sendRequest));
                    break;
                case "reaction": response = BridgeOps.react(request); break;
                case "reactionEvents":
                    response = BridgeOps.reactionEvents(request)
                            .put("hidePreview", com.localob.messaging.backend.prefs.SetupPrefs.INSTANCE.getHideTextPreviews());
                    break;
                case "markRead": response = BridgeOps.markRead(context, request); break;
                case "dismissNotification":
                    PhoneNotificationReceiver.dismissMatching(context, request.optString("threadId"), request.optLong("postedAt"));
                    response = new JSONObject().put("apiVersion", BridgeOps.API_VERSION).put("ok", true);
                    break;
                default: return error(requestId, "Unknown bridge operation.");
            }
            attachAvatar(response.optJSONObject("thread"));
            org.json.JSONArray chats = response.optJSONArray("chats");
            if (chats != null) for (int i = 0; i < chats.length(); i++) attachAvatar(chats.optJSONObject(i));
            String encoded = response.toString();
            if (encoded.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > MAX_RESPONSE_BYTES) {
                if (op.equals("reaction") && response.optBoolean("ok")) {
                    response.remove("message");
                    response.remove("thread");
                    response.put("historyUnavailable", true);
                    encoded = response.toString();
                }
                if (encoded.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > MAX_RESPONSE_BYTES)
                    return error(null, "The conversation is too large to transfer. Load a smaller recent history.");
            }
            return encoded;
        } catch (Throwable t) {
            Log.w(TAG, "Embedded bridge request failed", t);
            return error(request == null ? null : request.optString("requestId", null), friendly(t));
        }
    }

    @Override public boolean isEnabled() { return PatchSettings.isEnabled(context); }

    private void attachAvatar(JSONObject chat) {
        if (chat == null) return;
        String source = chat.optString("avatarUri");
        chat.remove("avatarUri");
        try {
            String avatar = AvatarCache.INSTANCE.cache(context, source.isEmpty() ? null : android.net.Uri.parse(source));
            if (avatar == null && !chat.optBoolean("isGroup"))
                avatar = AvatarCache.INSTANCE.forAddress(context, chat.optString("address", null));
            if (avatar != null) chat.put("avatarId", avatar);
        } catch (Throwable error) {
            // Optional artwork must never turn an acknowledged send into a failure.
            Log.d(TAG, "Chat artwork unavailable", error);
        }
    }

    private static void prepareBackend(boolean wait) {
        try {
            // OpenBubbles owns backend startup. Never start or replace its foreground service here.
            long deadline = SystemClock.elapsedRealtime() + 8_000;
            while (wait && SystemClock.elapsedRealtime() < deadline) {
                BackendState state = BackendForegroundService.Companion.getState().getValue();
                if (!(state instanceof BackendState.Starting)) break;
                Thread.sleep(100);
            }
        } catch (Throwable t) {
            Log.w(TAG, "OpenBubbles backend is not ready", t);
        }
    }

    private static String error(String requestId, String message) {
        try {
            JSONObject out = new JSONObject().put("apiVersion", BridgeOps.API_VERSION);
            if (requestId != null) out.put("requestId", requestId);
            return out.put("ok", false).put("error", message).toString();
        } catch (Throwable ignored) {
            return "{\"apiVersion\":1,\"ok\":false,\"error\":\"Bridge error\"}";
        }
    }

    private static String friendly(Throwable t) {
        String message = t.getMessage();
        if (message == null || message.trim().isEmpty()) return "OpenBubbles could not complete the request.";
        return message.length() > 300 ? message.substring(0, 300) : message;
    }
}
