package io.github.emotionbug.patches.runtime;

import org.json.JSONException;
import org.json.JSONObject;

/** A single persisted snapshot prevents mixing progress from different model hashes or transfers. */
final class ModelDownloadProgress {
    static final String KEY = "model_download_progress";
    final String sha256, token, state, message;
    final long bytes;

    ModelDownloadProgress(String sha256, String token, String state, long bytes, String message) {
        this.sha256 = sha256; this.token = token; this.state = state;
        this.bytes = Math.max(0, bytes); this.message = message;
    }

    String encode() {
        try {
            return new JSONObject().put("sha256", sha256).put("token", token).put("state", state)
                    .put("bytes", bytes).put("message", message).toString();
        } catch (JSONException impossible) { throw new IllegalStateException(impossible); }
    }

    static ModelDownloadProgress read(String encoded, String currentHash, String activeToken) {
        try {
            JSONObject value = new JSONObject(encoded);
            String hash = value.getString("sha256"), token = value.getString("token");
            if (currentHash != null && currentHash.equals(hash)
                    && (activeToken == null || activeToken.equals(token))) {
                return new ModelDownloadProgress(hash, token, value.getString("state"),
                        value.getLong("bytes"), value.getString("message"));
            }
        } catch (JSONException unavailable) { /* Legacy/unavailable progress has no current-model authority. */ }
        return new ModelDownloadProgress("", "", "absent", 0, "");
    }
}
