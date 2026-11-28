package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.ProviderEndpoint;
import app.yydarlinker.aicaptions.host.CaptionActions;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.UUID;
import org.json.JSONArray;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * The API profiles: each has its own endpoint, model, prompt and key. A profile is known by a
 * random id, never by its name or by the host of its endpoint. The first profile is the one the
 * settings of older releases live in; it keeps its store and the id {@link #LEGACY}.
 */
public final class ApiProfiles {
    public static final Object LOCK = new Object();
    static final String LEGACY = "default";
    private static final String INDEX = "caption_api_profiles";
    private static final String NAMES = "names";
    private static final String ACTIVE = "active";
    private static final String LEGACY_DELETED = "legacy_deleted";
    static final int MAX_PROFILES = 30;
    private static final int MAX_NAME = 60;

    private static volatile long revision;

    private ApiProfiles() {}

    static long revision() {
        return revision;
    }

    // ---- Index and stores ----

    private static SharedPreferences index(Context context) {
        return context.getSharedPreferences(INDEX, Context.MODE_PRIVATE);
    }

    public static String active(Context context) {
        synchronized (LOCK) {
            String id = activeSnapshot(context);
            if (!list(context).containsKey(id)) throw new ConfigRead.Failure();
            return id;
        }
    }

    /** An atomic id read for diagnostic redaction; does not wait behind credential decryption. */
    static String activeSnapshot(Context context) {
        return ConfigRead.string(index(context), ACTIVE, LEGACY);
    }

    /** The store of one profile. */
    public static SharedPreferences values(Context context, String id) {
        return LEGACY.equals(id) ? CaptionStorage.SETTINGS.open(context)
                : context.getSharedPreferences("caption_profile_" + id, Context.MODE_PRIVATE);
    }

    public static SharedPreferences values(Context context) {
        return values(context, active(context));
    }

    /** The names of the profiles other than the first, by id. */
    private static JSONObject names(Context context) {
        try {
            JSONObject result = new JSONObject(ConfigRead.string(index(context), NAMES, "{}"));
            for (Iterator<String> ids = result.keys(); ids.hasNext(); ) {
                String id = ids.next();
                if (id.isEmpty() || !(result.get(id) instanceof String))
                    throw new ConfigRead.Failure();
            }
            return result;
        } catch (JSONException invalid) {
            throw new ConfigRead.Failure();
        }
    }

    private static void saveNames(
            Context context, JSONObject names, boolean legacyDeleted, String active) {
        SharedPreferences.Editor edit = index(context).edit().putString(NAMES, names.toString());
        if (legacyDeleted) edit.putBoolean(LEGACY_DELETED, true);
        if (active != null) edit.putString(ACTIVE, active);
        edit.apply();
    }

    /** The profiles by id, in order, with their names. */
    static LinkedHashMap<String, String> list(Context context) {
        synchronized (LOCK) {
            LinkedHashMap<String, String> result = new LinkedHashMap<>();
            if (!ConfigRead.bool(index(context), LEGACY_DELETED, false))
                result.put(LEGACY, CaptionStrings.get(context, "profile_default"));
            JSONObject names = names(context);
            for (Iterator<String> ids = names.keys(); ids.hasNext(); ) {
                String id = ids.next();
                result.put(id, names.optString(id));
            }
            return result;
        }
    }

    private static String checkedName(Context context, String name) {
        String clean = name == null ? "" : name.trim();
        if (clean.isEmpty() || clean.length() > MAX_NAME)
            throw new IllegalArgumentException(CaptionStrings.get(context, "profile_name_error"));
        return clean;
    }

    private static IllegalArgumentException unknown() {
        return new IllegalArgumentException("Unknown API profile");
    }

    static void rename(Context context, String id, String name) {
        synchronized (LOCK) {
            String clean = checkedName(context, name);
            if (!list(context).containsKey(id)) throw unknown();
            try {
                saveNames(context, names(context).put(id, clean), false, null);
            } catch (JSONException invalid) {
                throw new IllegalStateException("Invalid API profiles", invalid);
            }
        }
    }

    /** A new profile with the endpoint [base]; it copies neither the key nor the model. */
    static String create(Context context, String name, String base) {
        synchronized (LOCK) {
            String clean = checkedName(context, name);
            if (list(context).size() >= MAX_PROFILES)
                throw new IllegalStateException(CaptionStrings.get(context, "profile_limit"));
            String endpoint = ProviderEndpoint.validate(base);
            String id = UUID.randomUUID().toString();
            values(context, id)
                    .edit()
                    .putString("base_url", endpoint)
                    .putString("model", "")
                    .apply();
            try {
                saveNames(context, names(context).put(id, clean), false, null);
            } catch (JSONException invalid) {
                throw new IllegalStateException("Invalid API profiles", invalid);
            }
            return id;
        }
    }

    // ---- Switching ----

    /** Explicit selection can recover a bad active ID when the index itself is readable. */
    public static boolean select(Context context, String id) {
        boolean selected = false;
        Throwable failure = null;
        try {
            synchronized (LOCK) {
                if (!list(context).containsKey(id)) throw unknown();
                try {
                    if (id.equals(active(context))) return true;
                } catch (ConfigRead.Failure invalidSelection) {
                    // Use the validated ID explicitly supplied by the user.
                }
                try {
                    index(context).edit().putString(ACTIVE, id).apply();
                    selected = true;
                } catch (RuntimeException | Error writeFailure) {
                    try {
                        selected = id.equals(active(context));
                    } catch (RuntimeException | Error readFailure) {
                        if (writeFailure != readFailure) writeFailure.addSuppressed(readFailure);
                    }
                    throw writeFailure;
                }
            }
        } catch (RuntimeException | Error error) {
            failure = error;
            throw error;
        } finally {
            if (selected) notifyChange(context, failure);
        }
        return true;
    }

    static void changed(Context context) {
        synchronized (LOCK) {
            revision++;
        }
        CaptionActions.refreshConfiguration(context);
    }

    private static void notifyChange(Context context, Throwable original) {
        try {
            changed(context);
        } catch (RuntimeException | Error notification) {
            if (original == null) throw notification;
            if (original != notification) original.addSuppressed(notification);
        }
    }

    // ---- Removing ----

    /**
     * Deletes one profile and its key, never the global settings. The first profile shares its
     * store with them, so only its own entries are removed.
     */
    static void delete(Context context, String id) {
        boolean wasActive = false, attempted = false;
        Throwable failure = null;
        try {
        synchronized (LOCK) {
            LinkedHashMap<String, String> saved = list(context);
            if (!saved.containsKey(id)) throw unknown();
            if (saved.size() <= 1)
                throw new IllegalStateException(CaptionStrings.get(context, "profile_keep_one"));
            wasActive = id.equals(active(context));
            saved.remove(id);
            JSONObject names = names(context);
            names.remove(id);
            attempted = true;
            saveNames(
                    context,
                    names,
                    LEGACY.equals(id),
                    wasActive ? saved.keySet().iterator().next() : null);
            SecureApiKey.clear(context, id);
            SharedPreferences.Editor store = values(context, id).edit();
            if (LEGACY.equals(id))
                store.remove("base_url").remove("model").remove("prompt").remove("planner_model");
            else store.clear();
            store.apply();
        }
        } catch (RuntimeException | Error error) {
            failure = error;
            throw error;
        } finally {
            if (wasActive && attempted) {
                try {
                    // Partial deletion must also revoke the removed active profile. No repair or
                    // cleanup of the remaining stores is attempted here.
                    if (!id.equals(activeSnapshot(context))) changed(context);
                } catch (RuntimeException | Error notification) {
                    if (failure == null) throw notification;
                    if (failure != notification) failure.addSuppressed(notification);
                }
            }
        }
    }

    /** Forgets the key of one profile. */
    public static void clearKey(Context context, String id) {
        boolean wasActive = false, existed = false, cleared = false;
        Throwable failure = null;
        try {
        synchronized (LOCK) {
            // A confirmation that is out of date must not touch another profile.
            if (!list(context).containsKey(id)) return;
            wasActive = id.equals(active(context));
            existed = SecureApiKey.hasStoredEntries(context, id);
            SecureApiKey.clear(context, id);
            cleared = true;
        }
        } catch (RuntimeException | Error error) {
            failure = error;
            throw error;
        } finally {
            if (wasActive && (cleared || (existed && !SecureApiKey.hasStoredEntries(context, id)))) {
                try {
                    changed(context);
                } catch (RuntimeException | Error notification) {
                    if (failure == null) throw notification;
                    if (failure != notification) failure.addSuppressed(notification);
                }
            }
        }
    }
}
