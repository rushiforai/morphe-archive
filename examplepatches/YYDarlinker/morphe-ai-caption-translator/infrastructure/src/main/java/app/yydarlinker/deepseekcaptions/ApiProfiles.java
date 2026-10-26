package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.preference.Preference;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

/**
 * The API profiles: each has its own endpoint, model, prompt and key. A profile is known by a
 * random id, never by its name or by the host of its endpoint. The first profile is the one the
 * settings of older releases live in; it keeps its store and the id {@link #LEGACY}.
 */
final class ApiProfiles {
    static final Object LOCK = new Object();
    static final String LEGACY = "default";
    private static final String INDEX = "caption_api_profiles";
    private static final String NAMES = "names";
    private static final String ACTIVE = "active";
    private static final String LEGACY_DELETED = "legacy_deleted";
    private static final String LEGACY_STORE = "deepseek_caption_translator";
    private static final int MAX_PROFILES = 30, MAX_NAME = 60;

    private static final List<WeakReference<Editor>> editors = new ArrayList<>();
    private static boolean flushing;
    private static volatile long revision;

    private ApiProfiles() {}

    /** A part of the UI that edits the active profile and can write its edits back. */
    interface Editor {
        /** Writes the edits; false if they are invalid and the profile must not change. */
        boolean flushProfile();

        /** Whether the most recent flush committed a new value before returning. */
        default boolean flushChanged() {
            return false;
        }

        /** Persistence completed but a subsequent runtime notification failed. */
        default void configurationRefreshFailed() {}

        void profileChanged();
    }

    /** Counts every change of the active profile or of its credentials. */
    static long revision() {
        return revision;
    }

    static boolean flushing() {
        return flushing;
    }

    static void register(Editor editor) {
        synchronized (LOCK) {
            editors.removeIf(ref -> ref.get() == null || ref.get() == editor);
            editors.add(new WeakReference<>(editor));
        }
    }

    static void unregister(Editor editor) {
        synchronized (LOCK) {
            editors.removeIf(ref -> ref.get() == null || ref.get() == editor);
        }
    }

    /** The editors that are alive and not in a finished activity. */
    private static List<Editor> liveEditors() {
        List<Editor> live = new ArrayList<>();
        synchronized (LOCK) {
            for (WeakReference<Editor> ref : editors) {
                Editor editor = ref.get();
                if (editor != null && !inFinishedActivity(editor)) live.add(editor);
            }
        }
        return live;
    }

    private static boolean inFinishedActivity(Editor editor) {
        if (!(editor instanceof Preference)) return false;
        Context context = ((Preference) editor).getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                return activity.isFinishing() || activity.isDestroyed();
            }
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return false;
    }

    // ---- Index and stores ----

    private static SharedPreferences index(Context context) {
        return context.getSharedPreferences(INDEX, Context.MODE_PRIVATE);
    }

    static String active(Context context) {
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
    static SharedPreferences values(Context context, String id) {
        return context.getSharedPreferences(
                LEGACY.equals(id) ? LEGACY_STORE : "caption_profile_" + id, Context.MODE_PRIVATE);
    }

    static SharedPreferences values(Context context) {
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

    static boolean flushCurrent() {
        return flush(false, true).accepted;
    }

    static boolean flushExceptKey() {
        return flush(true, true).accepted;
    }

    private static final class FlushResult {
        final boolean accepted, changed;

        FlushResult(boolean accepted, boolean changed) {
            this.accepted = accepted;
            this.changed = changed;
        }
    }

    /** Direct saves notify here; selection owns the one final notification on success. */
    private static FlushResult flush(boolean skipKey, boolean notifySuccess) {
        boolean changed = false;
        Context refreshContext = null;
        RuntimeException failure = null;
        Error fatal = null;
        boolean result = true;
        List<Editor> live = liveEditors();
        for (Editor editor : live) {
            if (refreshContext == null && editor instanceof Preference)
                refreshContext = ((Preference) editor).getContext();
        }
        flushing = true;
        try {
            for (Editor editor : live) {
                boolean keyField =
                        editor instanceof Preference
                                && DeepSeekTextPreference.KEY_API_KEY.equals(
                                        ((Preference) editor).getKey());
                if (skipKey && keyField) continue;
                boolean accepted;
                try {
                    accepted = editor.flushProfile();
                } finally {
                    changed |= editor.flushChanged();
                }
                if (!accepted) {
                    result = false;
                    break;
                }
            }
        } catch (RuntimeException error) {
            failure = error;
            result = false;
        } catch (Error error) {
            fatal = error;
            result = false;
        } finally {
            flushing = false;
        }
        if (changed && (!result || notifySuccess))
            refreshSavedConfiguration(refreshContext, fatal != null ? fatal : failure);
        if (fatal != null) throw fatal;
        if (failure != null) throw failure;
        return new FlushResult(result, changed);
    }

    private static void refreshSavedConfiguration(Context context, Throwable original) {
        try {
            CaptionActions.refreshConfiguration(context);
        } catch (RuntimeException | Error notification) {
            for (Editor editor : liveEditors()) {
                if (editor.flushChanged()) editor.configurationRefreshFailed();
            }
            // The saved data remains saved; preserve a preceding editor/switch failure as primary.
            if (original == null) throw notification;
            if (original != notification) original.addSuppressed(notification);
        }
    }

    /** Makes [id] the active profile, once the edits of the old one are saved. */
    static boolean select(Context context, String id) {
        synchronized (LOCK) {
            if (!list(context).containsKey(id)) throw unknown();
            // A valid index still allows an explicit selection when active itself is corrupt.
            try {
                if (id.equals(active(context))) return true;
            } catch (ConfigRead.Failure unreadableActive) {
                // Do not guess a replacement. The caller supplied this validated target.
            }
        }
        // The edits are written while the old profile is still active.
        FlushResult saved = flush(false, false);
        if (!saved.accepted) return false;
        boolean selected = false;
        Throwable failure = null;
        try {
            try {
                synchronized (LOCK) {
                    index(context).edit().putString(ACTIVE, id).apply();
                }
            } catch (RuntimeException | Error writeFailure) {
                // apply can notify a listener after changing the in-process value. Revoke the old
                // binding if that happened, without claiming disk persistence or swallowing failure.
                try {
                    selected = id.equals(active(context));
                    if (selected) profileChanged(context);
                } catch (RuntimeException | Error rebindFailure) {
                    if (writeFailure != rebindFailure) writeFailure.addSuppressed(rebindFailure);
                }
                throw writeFailure;
            }
            selected = true;
            profileChanged(context);
        } catch (RuntimeException | Error error) {
            failure = error;
            throw error;
        } finally {
            // Even a failed switch/rebind must not swallow fields already saved by this flush.
            if (saved.changed || selected) refreshSavedConfiguration(context, failure);
        }
        return true;
    }

    static void changed(Context context) {
        Throwable failure = null;
        try {
            profileChanged(context);
        } catch (RuntimeException | Error error) {
            failure = error;
            throw error;
        } finally {
            refreshSavedConfiguration(context, failure);
        }
    }

    private static void profileChanged(Context context) {
        synchronized (LOCK) {
            revision++;
        }
        for (Editor editor : liveEditors()) editor.profileChanged();
        DeepSeekModelPreference.onCredentialsChanged(context);
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
    static void clearKey(Context context, String id) {
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
