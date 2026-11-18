package io.github.sabopura.morphe.extension.twitch.chat;

import android.content.*;
import android.net.Uri;

import io.github.sabopura.morphe.extension.twitch.ui.UserSearchSheet;

import org.json.*;

public final class UserSearch {
    private static final String FIELDS = "{id login displayName description}";
    private static final String LOGIN = "[A-Za-z0-9_]{1,25}";

    /** A public profile as the lookup returns it. */
    public static final class Profile {
        public final String id, login, displayName, description;

        Profile(String id, String login, String displayName, String description) {
            this.id = id;
            this.login = login;
            this.displayName = displayName;
            this.description = description;
        }
    }

    /** Answers on the main thread. */
    public interface Listener {
        void found(Profile profile);

        void missing();

        void failed();
    }

    public static void show(Context c) {
        UserSearchSheet.show(c);
    }

    /** What was typed, without spaces or a leading @, or null when it cannot be a login or an ID. */
    public static String query(String typed) {
        String value = typed.trim().replaceFirst("^@", "");
        return value.matches(LOGIN) ? value : null;
    }

    /** All-digit input may be a user ID or a login name, so it asks for both at once. */
    static JSONObject lookupBody(String value) throws JSONException {
        String query = value.matches("[0-9]+")
                ? "query($id:ID!,$login:String!){byId:user(id:$id)" + FIELDS + " byLogin:user(login:$login)" + FIELDS + "}"
                : "query($login:String!){byLogin:user(login:$login)" + FIELDS + "}";
        JSONObject variables = new JSONObject().put("login", value);
        if (value.matches("[0-9]+")) variables.put("id", value);
        return new JSONObject().put("query", query).put("variables", variables);
    }

    private static JSONObject firstUser(JSONObject data) {
        JSONObject byId = data.optJSONObject("byId");
        return byId != null ? byId : data.optJSONObject("byLogin");
    }

    /** The profile in a lookup reply, or null when no such user exists; throws for any other reply. */
    static Profile profile(JSONObject reply) throws JSONException {
        JSONObject user = firstUser(reply.getJSONObject("data"));
        if (user == null) return null;
        String login = user.getString("login");
        if (!login.matches(LOGIN)) throw new JSONException("login");
        return new Profile(user.optString("id"), login, user.optString("displayName", login),
                user.optString("description"));
    }

    /** Looks up a value from {@link #query} off the main thread; false when too many requests already wait. */
    public static boolean lookup(String value, Listener listener) {
        return PublicApi.submit(() -> {
            Profile profile;
            try {
                profile = profile(new JSONObject(PublicApi.twitchMetadata(lookupBody(value).toString())));
            } catch (Throwable e) {
                PublicApi.UI.post(listener::failed);
                return;
            }
            PublicApi.UI.post(() -> {
                if (profile == null) listener.missing();
                else listener.found(profile);
            });
        });
    }

    /** Opens the channel's page in this app; false when nothing could open it. */
    public static boolean open(Context c, String login) {
        try {
            c.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.twitch.tv/" + login))
                    .setPackage(c.getPackageName()));
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
