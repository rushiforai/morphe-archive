package app.morphe.extension.syncforreddit.api;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Base64;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * What the app identifies itself to Reddit and to Imgur as, answered from what has been set in
 * the app and from what was given when patching otherwise.
 *
 * <p>These were only ever written into the app while it was being patched, which is fine by
 * hand and awkward for anything building copies on its own: the four of them are the one thing
 * a build cannot be made without. Reading them here lets a copy be patched with none of them
 * and told afterwards.
 *
 * <p><b>They are kept in a file of our own</b>, not in the settings Sync writes its own to.
 * Sync's Backup walks the settings it knows and writes them out, and a client id belongs to
 * whoever asked Reddit for it: a backup is copied between devices and posted to people who are
 * helping, and these should not travel with it. A file Sync has never heard of cannot be
 * written into one.
 *
 * <p>What was given when patching is copied in here the first time the app runs, so that it is
 * afterwards held by the device rather than by the build. Patching the app again without
 * naming one therefore keeps the one already in use instead of emptying it. Where the new build
 * names a <i>different</i> one it is taken instead, since that is the build saying so — unless
 * the value was typed in here, which always wins.
 *
 * @noinspection unused
 */
public final class ClientSettings {
    public static final String CLIENT_ID = "sync_up_client_id";
    public static final String REDIRECT_URI = "sync_up_redirect_uri";
    public static final String USER_AGENT = "sync_up_user_agent";
    public static final String IMGUR_CLIENT_ID = "sync_up_imgur_client_id";

    /** Every one of them, in the order they are shown. */
    public static final String[] ALL = {CLIENT_ID, REDIRECT_URI, USER_AGENT, IMGUR_CLIENT_ID};

    /** The file they are kept in, which is ours and not one Sync writes to. */
    private static final String STORE = "sync_up_client";

    /**
     * Beside a value, what was given when patching at the time it was written. Its being there
     * is what says the value came from the build rather than from someone typing it.
     */
    private static final String GIVEN = "__given_when_patching";

    /** What Reddit is asked for a token with. */
    private static final String BASIC = "Basic ";

    /** How the Client-ID is written in the header Imgur is sent. */
    private static final String CLIENT_ID_HEADER = "Client-ID ";

    /** Whether what the build was given has been copied in yet, this run. */
    private static volatile boolean settled;

    private ClientSettings() {}

    // What was given when patching. Each is overridden by the patch; an empty answer means
    // nothing was given, which is allowed now that they can be set here instead.

    public static String bakedClientId() {
        // Overridden by patch.
        return "";
    }

    public static String bakedRedirectUri() {
        // Overridden by patch.
        return "";
    }

    public static String bakedUserAgent() {
        // Overridden by patch.
        return "";
    }

    public static String bakedImgurClientId() {
        // Overridden by patch.
        return "";
    }

    /** The address Reddit is asked to authorize at, as the app holds it. */
    public static String bakedAuthorizationUrl() {
        // Overridden by patch.
        return "";
    }

    /** @return What was given when patching for this setting, which may be nothing. */
    public static String bakedFor(String key) {
        if (CLIENT_ID.equals(key)) {
            return bakedClientId();
        }
        if (REDIRECT_URI.equals(key)) {
            return bakedRedirectUri();
        }
        if (USER_AGENT.equals(key)) {
            return bakedUserAgent();
        }
        if (IMGUR_CLIENT_ID.equals(key)) {
            return bakedImgurClientId();
        }
        return "";
    }

    /** @return Whether the build named one of these, so that there is a default to go back to. */
    public static boolean hasDefault(String key) {
        return !isBlank(bakedFor(key));
    }

    /** @return Our own file, which Sync neither reads nor writes. */
    @Nullable
    private static SharedPreferences file() {
        Context context = Utils.getContext();
        if (context == null) {
            return null;
        }
        try {
            return context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not reach what is set: " + ex);
            return null;
        }
    }

    /** @return That file, with what the build was given copied in if that has not happened. */
    @Nullable
    public static SharedPreferences store() {
        SharedPreferences store = file();
        if (store != null && !settled) {
            settle(store);
        }
        return store;
    }

    /**
     * Copies what the build was given into the file, and takes anything an older build of ours
     * left in Sync's own settings out of them.
     */
    private static synchronized void settle(SharedPreferences store) {
        if (settled) {
            return;
        }
        settled = true;
        try {
            carryOver(store);

            for (String key : ALL) {
                String given = bakedFor(key);
                if (isBlank(given)) {
                    // The build named nothing, so there is nothing to copy and nothing it can
                    // be asking to change. Whatever is held stays held.
                    continue;
                }

                String held = store.getString(key, null);
                boolean neverSet = isBlank(held);
                // Where it was last written from the build and the build now says something
                // else, the build is asking for the new one. Where it was typed in here there
                // is no such mark, and what was typed stays.
                boolean cameFromAnOlderBuild = !neverSet
                        && store.contains(key + GIVEN)
                        && !given.equals(store.getString(key + GIVEN, null));

                if (neverSet || cameFromAnOlderBuild) {
                    store.edit().putString(key, given).putString(key + GIVEN, given).apply();
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not settle what the build was given: " + ex);
        }
    }

    /**
     * Moves anything the first version of this feature wrote into Sync's own settings over to
     * our file, and takes it out of Sync's, so that it stops being something a backup can carry.
     */
    private static void carryOver(SharedPreferences store) {
        Context context = Utils.getContext();
        if (context == null) {
            return;
        }
        try {
            SharedPreferences syncs = PreferenceManager.getDefaultSharedPreferences(context);
            SharedPreferences.Editor emptying = syncs.edit();
            boolean anything = false;

            for (String key : ALL) {
                if (!syncs.contains(key)) {
                    continue;
                }
                String held = syncs.getString(key, null);
                if (!isBlank(held) && isBlank(store.getString(key, null))) {
                    store.edit().putString(key, held.trim()).apply();
                }
                emptying.remove(key);
                anything = true;
            }

            if (anything) {
                emptying.apply();
                Logger.printInfo(() -> "client: moved what was set out of Sync's own settings");
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not move what an older build set: " + ex);
        }
    }

    /** @return What is set, or what was given when patching where nothing is. */
    public static String text(String key, String whenUnset) {
        try {
            SharedPreferences store = store();
            String set = store == null ? null : store.getString(key, null);
            return isBlank(set) ? whenUnset : set.trim();
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not read " + key + ": " + ex);
            return whenUnset;
        }
    }

    /** Writes one in, as something typed here rather than as something the build gave. */
    public static void set(String key, @Nullable String value) {
        SharedPreferences store = store();
        if (store == null) {
            return;
        }
        try {
            if (isBlank(value)) {
                // Emptying one is asking for whatever the build gave, which is what going back
                // to the default means.
                reset(key);
                return;
            }
            store.edit().putString(key, value.trim()).remove(key + GIVEN).apply();
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not keep " + key + ": " + ex);
        }
    }

    /** Puts one back to what the build was given, or to nothing where it was given nothing. */
    public static void reset(String key) {
        SharedPreferences store = store();
        if (store == null) {
            return;
        }
        try {
            String given = bakedFor(key);
            if (isBlank(given)) {
                store.edit().remove(key).remove(key + GIVEN).apply();
            } else {
                store.edit().putString(key, given).putString(key + GIVEN, given).apply();
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not put " + key + " back: " + ex);
        }
    }

    /** @return Whether this one is still what the build gave rather than something typed here. */
    public static boolean isDefault(String key) {
        SharedPreferences store = store();
        if (store == null) {
            return true;
        }
        String held = store.getString(key, null);
        if (isBlank(held)) {
            return true;
        }
        return store.contains(key + GIVEN) && held.equals(bakedFor(key));
    }

    public static String clientId() {
        return text(CLIENT_ID, bakedClientId());
    }

    /** @return Whether there is a client id at all, without which the app cannot sign in. */
    public static boolean hasClientId() {
        return !isBlank(clientId());
    }

    public static String redirectUri() {
        return text(REDIRECT_URI, bakedRedirectUri());
    }

    public static String userAgent() {
        return text(USER_AGENT, bakedUserAgent());
    }

    public static String imgurClientId() {
        return text(IMGUR_CLIENT_ID, bakedImgurClientId());
    }

    /**
     * What Reddit is asked for a token with: the client id as a name with no password beside it.
     *
     * <p>Built here rather than written in while patching, since it is the client id in another
     * form and would otherwise go on saying what the old one was.
     */
    public static String basicAuth() {
        try {
            byte[] named = (clientId() + ":").getBytes(StandardCharsets.UTF_8);
            return BASIC + Base64.encodeToString(named, Base64.NO_WRAP);
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not build what asks for a token: " + ex);
            return BASIC;
        }
    }

    /** The authorization address with whichever client id is in use written into it. */
    public static String authorizationUrl() {
        String address = bakedAuthorizationUrl();
        try {
            return address.replaceFirst("client_id=[^&]*", "client_id=" + clientId());
        } catch (Exception ex) {
            Logger.printInfo(() -> "client: could not name the client in the address: " + ex);
            return address;
        }
    }

    /** The header Imgur is sent, naming whichever client id is in use. */
    public static String imgurHeader() {
        return CLIENT_ID_HEADER + imgurClientId();
    }

    private static boolean isBlank(@Nullable String value) {
        return value == null || value.trim().isEmpty();
    }
}
