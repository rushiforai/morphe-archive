package dev.twitchpatches.extension.emotes;

import java.util.Arrays;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

final class FavoriteEmoteDetails {
    private static final List<String> KINDS = Arrays.asList("SUBSCRIPTIONS", "FOLLOWER", "BITS_BADGE_TIERS", "OTHER");
    final String token;
    final String channel;
    final String kind;

    private FavoriteEmoteDetails(String token, String channel, String kind) {
        this.token = token;
        this.channel = channel;
        this.kind = kind;
    }

    static FavoriteEmoteDetails of(String token, String channel, String kind) {
        boolean valid = token != null && !token.isEmpty() && token.length() <= 128 &&
                channel != null && channel.matches("\\d{1,20}") && KINDS.contains(kind);
        return valid ? new FavoriteEmoteDetails(token, channel, kind) : null;
    }

    static FavoriteEmoteDetails from(JSONObject value) {
        return value == null ? null : of(value.optString("token"), value.optString("channel"), value.optString("kind"));
    }

    JSONObject toJson() throws JSONException {
        return new JSONObject().put("token", token).put("channel", channel).put("kind", kind);
    }
}
