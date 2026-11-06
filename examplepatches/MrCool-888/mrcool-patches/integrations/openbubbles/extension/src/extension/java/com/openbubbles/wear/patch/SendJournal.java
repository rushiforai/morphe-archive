package com.openbubbles.wear.patch;

import android.content.SharedPreferences;
import android.util.Log;
import org.json.JSONArray;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Journals before sending, so a companion crash cannot turn a replay into a second message. */
final class SendJournal {
    private static final int MAX_RESULTS = 200;

    interface Send { JSONObject run() throws Exception; }

    static synchronized JSONObject run(SharedPreferences prefs, JSONObject request, Send send) throws Exception {
        String id = request.optString("requestId", "");
        if (!id.matches("[A-Za-z0-9._:-]{1,128}")) {
            throw new IllegalArgumentException("A valid send request ID is required.");
        }
        String fingerprint = fingerprint(request);
        String key = "result:" + id;
        String saved = prefs.getString(key, null);
        if (saved != null) {
            JSONObject record = new JSONObject(saved);
            if (!fingerprint.equals(record.getString("fingerprint"))) {
                throw new IllegalArgumentException("This send request ID was already used for a different message.");
            }
            return record.getJSONObject("response");
        }
        JSONObject uncertain = new JSONObject().put("apiVersion", BridgeOps.API_VERSION)
                .put("requestId", id).put("ok", false)
                .put("error", "The previous send was interrupted. Check OpenBubbles before retrying to avoid a duplicate.");
        JSONArray ids = new JSONArray(prefs.getString("index", "[]"));
        JSONArray retained = new JSONArray();
        SharedPreferences.Editor editor = prefs.edit();
        int first = Math.max(0, ids.length() - MAX_RESULTS + 1);
        for (int i = 0; i < ids.length(); i++) {
            if (i < first) editor.remove("result:" + ids.getString(i));
            else retained.put(ids.getString(i));
        }
        retained.put(id);
        JSONObject record = new JSONObject().put("fingerprint", fingerprint).put("response", uncertain);
        if (!editor.putString("index", retained.toString()).putString(key, record.toString()).commit()) {
            throw new IllegalStateException("Could not save the send request. Free phone storage before retrying.");
        }
        JSONObject result = send.run();
        // History is fetched separately; replay records need only the actual send result.
        JSONObject compact = new JSONObject(result.toString());
        compact.remove("thread");
        record.put("response", compact);
        if (!prefs.edit().putString(key, record.toString()).commit()) {
            Log.w("OBWearPatch", "Send completed, but its result could not be saved; replays will fail closed");
        }
        return result;
    }

    private static String fingerprint(JSONObject request) throws Exception {
        String text = request.optString("threadId", "") + "\u0000" + request.optString("address", "")
                + "\u0000" + request.optString("text", "");
        // Preserve fingerprints for already-journaled ordinary sends.
        if (request.has("replyToMessageId") && !request.isNull("replyToMessageId")) {
            text += "\u0000" + request.optString("replyToMessageId") + "\u0000" + request.optInt("replyToPartIndex", 0);
        }
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));
        StringBuilder out = new StringBuilder();
        for (byte value : digest) out.append(String.format(java.util.Locale.ROOT, "%02x", value & 0xff));
        return out.toString();
    }
}
