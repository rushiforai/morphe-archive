package com.stremio.morphe;

import android.app.ActivityManager;
import android.app.NotificationManager;
import android.app.job.JobScheduler;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.media.tv.TvContract;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.provider.BaseColumns;
import android.util.Log;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Account-boundary storage and process handling for the Morphe multi-account patch.
 *
 * Stremio's Rust/core state and Android preferences use separate files per account.
 * This class handles the remaining Android-side state outside those files.
 */
public final class MorpheIsolation {
    private static final String TAG = "MorpheIsolation";
    private static final String CORE = "core";
    private static final String META = "morphe_profiles";
    private static final String ACTIVE = "morphe.active_slot";
    private static final String PROFILE_NAME = "name.";
    private static final String MANUAL_PROFILE_NAME = "manual_name.";
    private static final String PROFILE_IDS = "profile_ids";
    private static final String PENDING_SLOT = "pending.slot";
    private static final String PENDING_PREVIOUS_SLOT = "pending.previous_slot";
    private static final String PENDING_NEXT_BEFORE = "pending.next_before";
    private static final String DEFAULT_SLOT = "account_a";
    private static final String CORE_PREFS_PREFIX = "morphe_core_";
    private static final String CORE_MIGRATED = "core_file_migrated.";
    private static final String PROFILE_PREFS_PREFIX = "morphe_account_prefs_";
    private static final String SERVER_SETTINGS_DIRECTORY = "morphe_server_settings";
    private static final String SERVER_SETTINGS_FILE = "server-settings.json";
    private static final String SLOT_STORAGE_DIRECTORY = "morphe_account_storage";
    private static final String SLOT_INITIALIZED_MARKER = ".initialized";
    private static final String LEGACY_SERVER_DIRECTORY = "morphe_legacy_server_settings";
    private static final String LEGACY_MIGRATED = "default_prefs_migrated";
    private static final String SLOT_MARKER = "_morphe_account_slot";
    private static volatile String lastError = "";

    private MorpheIsolation() {}

    /**
     * Reloads the core preference file when another app process may have changed it.
     * The chooser runs in :profile_chooser while Stremio writes login state in the
     * main process, so a normal cached SharedPreferences instance is unsafe here.
     */
    @SuppressWarnings("deprecation")
    private static SharedPreferences freshLegacyCorePreferences(Context context) {
        Context app = context.getApplicationContext();
        SharedPreferences preferences = app.getSharedPreferences(CORE, Context.MODE_MULTI_PROCESS);
        preferences.getAll(); // Wait for a reload requested by MODE_MULTI_PROCESS.
        return preferences;
    }

    @SuppressWarnings("deprecation")
    public static SharedPreferences freshProfileMetadata(Context context) {
        SharedPreferences preferences = context.getApplicationContext()
                .getSharedPreferences(META, Context.MODE_MULTI_PROCESS);
        preferences.getAll();
        return preferences;
    }

    /** Returns the active account's core file, preserving Stremio's original key path. */
    public static SharedPreferences corePreferences(Context context) {
        Context app = context.getApplicationContext();
        String slot = activeSlot(app, DEFAULT_SLOT);
        SharedPreferences target = app.getSharedPreferences(corePreferencesName(slot), Context.MODE_PRIVATE);
        if (!migrateLegacyCoreNamespace(app, slot, target)) {
            throw new IllegalStateException("Could not migrate Morphe core data for " + slot);
        }
        return target;
    }

    /** Reloads one account's core file after the main process may have changed it. */
    @SuppressWarnings("deprecation")
    public static SharedPreferences freshAccountCorePreferences(Context context, String slot) {
        Context app = context.getApplicationContext();
        String safeSlot = validSlot(slot);
        SharedPreferences target = app.getSharedPreferences(
                corePreferencesName(safeSlot), Context.MODE_MULTI_PROCESS);
        target.getAll();
        if (!migrateLegacyCoreNamespace(app, safeSlot, target)) {
            throw new IllegalStateException("Could not migrate Morphe core data for " + safeSlot);
        }
        target.getAll();
        return target;
    }

    public static String corePreferencesName(String slot) {
        return CORE_PREFS_PREFIX + validSlot(slot);
    }

    public static String activeSlot(Context context, String fallback) {
        Context app = context.getApplicationContext();
        String safeFallback = validSlot(fallback);
        SharedPreferences control = app.getSharedPreferences(META, Context.MODE_PRIVATE);
        String stored = control.getString(ACTIVE, null);
        if (isValidSlot(stored)) return stored;

        // One-time migration from builds that kept this control marker in core.xml.
        SharedPreferences core = freshLegacyCorePreferences(app);
        String legacy = validSlot(core.getString(ACTIVE, safeFallback));
        if (!control.edit().putString(ACTIVE, legacy).commit()) {
            Log.e(TAG, "Could not migrate active account marker to chooser control storage");
        }
        return legacy;
    }

    /** Establishes the first account without inventing a provisional account. */
    public static boolean initializeActiveSlot(Context context, String destinationSlot) {
        String destination = validSlot(destinationSlot);
        SharedPreferences control = context.getApplicationContext()
                .getSharedPreferences(META, Context.MODE_PRIVATE);
        if (!control.edit().putString(ACTIVE, destination).commit()) {
            lastError = "initial active account marker";
            return false;
        }
        lastError = "";
        return true;
    }

    /** Marks a newly-created local account as provisional until Stremio authenticates it. */
    public static boolean beginPendingAccount(Context context, String slot, String previousSlot,
                                              int nextBefore) {
        SharedPreferences.Editor editor = context.getApplicationContext()
                .getSharedPreferences(META, Context.MODE_PRIVATE).edit()
                .putString(PENDING_SLOT, validSlot(slot))
                .putInt(PENDING_NEXT_BEFORE, Math.max(1, nextBefore));
        if (isValidSlot(previousSlot)) editor.putString(PENDING_PREVIOUS_SLOT, previousSlot);
        else editor.remove(PENDING_PREVIOUS_SLOT);
        if (!editor.commit()) {
            lastError = "provisional account marker";
            return false;
        }
        lastError = "";
        return true;
    }

    public static boolean hasPendingAccount(Context context) {
        return isValidSlot(freshProfileMetadata(context).getString(PENDING_SLOT, null));
    }

    /** A login is complete only when Stremio has stored an authenticated user object. */
    public static boolean isAuthenticatedAccount(Context context, String slot) {
        if (!isValidSlot(slot)) return false;
        String profileJson = freshAccountCorePreferences(context, slot).getString("profile", null);
        if (profileJson == null || profileJson.trim().isEmpty()) return false;
        try {
            JSONObject auth = new JSONObject(profileJson).optJSONObject("auth");
            return auth != null && auth.optJSONObject("user") != null;
        } catch (Exception error) {
            return false;
        }
    }

    /** Promotes the provisional account after the authenticated destination is reached. */
    public static boolean commitPendingAccountIfAuthenticated(Context context) {
        SharedPreferences metadata = freshProfileMetadata(context);
        String pending = metadata.getString(PENDING_SLOT, null);
        if (!isValidSlot(pending) || !isAuthenticatedAccount(context, pending)) return false;
        if (!metadata.edit().remove(PENDING_SLOT).remove(PENDING_PREVIOUS_SLOT)
                .remove(PENDING_NEXT_BEFORE).commit()) {
            lastError = "provisional account commit";
            return false;
        }
        lastError = "";
        return true;
    }

    /**
     * Resolves a provisional account whenever the chooser opens. Authenticated accounts are
     * committed; abandoned accounts are removed and the previously active storage is restored.
     */
    public static boolean reconcilePendingAccount(Context context, boolean cancelRequested) {
        SharedPreferences metadata = freshProfileMetadata(context);
        String pending = metadata.getString(PENDING_SLOT, null);
        if (!isValidSlot(pending)) return true;
        if (!cancelRequested && isAuthenticatedAccount(context, pending)) {
            return commitPendingAccountIfAuthenticated(context);
        }

        String previous = metadata.getString(PENDING_PREVIOUS_SLOT, null);
        if (!isValidSlot(previous) || pending.equals(previous)) previous = null;
        String current = activeSlot(context, pending);

        if (previous != null) {
            if (pending.equals(current)) {
                if (!switchAccountRuntime(context, pending, previous)) return false;
                if (!commitActiveSlot(context, pending, previous)) {
                    rollbackAccountSwitch(context, pending, previous);
                    return false;
                }
            } else if (!previous.equals(current)) {
                lastError = "provisional account active marker";
                return false;
            }
        } else {
            if (!closeCurrentRuntime(context)) return false;
            if (!metadata.edit().remove(ACTIVE).commit()) {
                lastError = "provisional active account marker";
                return false;
            }
        }

        if (!deleteProfilePreferences(context, pending)) {
            lastError = "provisional Android preferences";
            return false;
        }
        if (!deleteCoreProfile(context, pending, null)) {
            lastError = "provisional core data";
            return false;
        }

        String ids = metadata.getString(PROFILE_IDS, "");
        StringBuilder remaining = new StringBuilder();
        if (ids != null && !ids.isEmpty()) {
            for (String id : ids.split("\\|")) {
                if (!isValidSlot(id) || pending.equals(id)) continue;
                if (remaining.length() > 0) remaining.append('|');
                remaining.append(id);
            }
        }
        SharedPreferences.Editor cleanup = metadata.edit().putString(PROFILE_IDS, remaining.toString())
                .putInt("next_profile", Math.max(1, metadata.getInt(PENDING_NEXT_BEFORE, 1)))
                .remove(PENDING_SLOT).remove(PENDING_PREVIOUS_SLOT).remove(PENDING_NEXT_BEFORE);
        for (String key : metadata.getAll().keySet()) {
            if (key.endsWith("." + pending)) cleanup.remove(key);
        }
        if (!cleanup.commit()) {
            lastError = "provisional account-list cleanup";
            return false;
        }
        lastError = "";
        return true;
    }

    /** Commits the chooser-owned active marker without writing Stremio's core.xml. */
    public static boolean commitActiveSlot(Context context, String expectedSlot, String destinationSlot) {
        String expected = validSlot(expectedSlot);
        String destination = validSlot(destinationSlot);
        SharedPreferences control = context.getApplicationContext()
                .getSharedPreferences(META, Context.MODE_PRIVATE);
        String current = validSlot(control.getString(ACTIVE, expected));
        if (!expected.equals(current)) {
            lastError = "active account changed while chooser was open";
            Log.e(TAG, lastError);
            return false;
        }

        if (!control.edit().putString(ACTIVE, destination).commit()) {
            lastError = "active account marker";
            return false;
        }
        if (!destination.equals(control.getString(ACTIVE, null))) {
            lastError = "active account marker verification";
            Log.e(TAG, lastError);
            return false;
        }
        lastError = "";
        return true;
    }

    /**
     * Returns a manual name immediately, an authenticated Stremio identity when
     * available, or null while a new account is still waiting for login data.
     */
    @SuppressWarnings("deprecation")
    public static String synchronizedProfileName(Context context, String slot) {
        Context app = context.getApplicationContext();
        String safeSlot = validSlot(slot);
        SharedPreferences metadata = app.getSharedPreferences(META, Context.MODE_MULTI_PROCESS);
        metadata.getAll();
        String stored = metadata.getString(PROFILE_NAME + safeSlot, null);
        if (metadata.getBoolean(MANUAL_PROFILE_NAME + safeSlot, false)) {
            return normalizedStoredName(stored);
        }

        String profileJson = freshAccountCorePreferences(app, safeSlot)
                .getString("profile", null);
        String authenticatedName = accountNameFromProfile(profileJson);
        if (authenticatedName == null) return null;
        if (!authenticatedName.equals(normalizedStoredName(stored))
                && !metadata.edit().putString(PROFILE_NAME + safeSlot, authenticatedName).commit()) {
            Log.e(TAG, "Could not synchronize Stremio account name");
        }
        return authenticatedName;
    }

    /** Returns the interface locale stored inside one account's isolated Stremio profile. */
    public static String interfaceLocale(Context context, String slot) {
        if (!isValidSlot(slot)) return null;
        String profileJson = freshAccountCorePreferences(context, slot).getString("profile", null);
        if (profileJson == null || profileJson.trim().isEmpty()) return null;
        try {
            return findInterfaceLocale(new JSONObject(profileJson));
        } catch (Exception error) {
            Log.w(TAG, "Could not read interface language from Stremio profile metadata");
            return null;
        }
    }

    private static String findInterfaceLocale(Object value) {
        if (value instanceof JSONObject) {
            JSONObject object = (JSONObject) value;
            String[] directKeys = new String[]{"interfaceLanguage", "interface_language"};
            for (String key : directKeys) {
                String direct = object.optString(key, "").trim();
                if (!direct.isEmpty()) return direct;
            }
            java.util.Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String found = findInterfaceLocale(object.opt(keys.next()));
                if (found != null) return found;
            }
        } else if (value instanceof org.json.JSONArray) {
            org.json.JSONArray array = (org.json.JSONArray) value;
            for (int i = 0; i < array.length(); i++) {
                String found = findInterfaceLocale(array.opt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String accountNameFromProfile(String profileJson) {
        if (profileJson == null || profileJson.trim().isEmpty()) return null;
        try {
            JSONObject auth = new JSONObject(profileJson).optJSONObject("auth");
            JSONObject user = auth == null ? null : auth.optJSONObject("user");
            if (user == null) return null;

            String[] nameFields = new String[]{"displayName", "display_name", "name", "username",
                    "fullName", "fullname"};
            for (String field : nameFields) {
                String value = normalizedAccountName(user.optString(field, ""), false);
                if (value != null) return value;
            }
            return normalizedAccountName(user.optString("email", ""), true);
        } catch (Exception error) {
            Log.w(TAG, "Could not read account name from Stremio profile metadata");
            return null;
        }
    }

    private static String normalizedAccountName(String value, boolean emailFallback) {
        if (value == null) return null;
        String normalized = value.trim();
        if (normalized.isEmpty()) return null;
        if (emailFallback) {
            int at = normalized.indexOf('@');
            if (at > 0) normalized = normalized.substring(0, at);
            int separator = firstSeparator(normalized);
            if (separator > 1) normalized = normalized.substring(0, separator);
            normalized = normalized.replace('_', ' ').replace('-', ' ').replace('.', ' ').trim();
            if (!normalized.isEmpty()) {
                normalized = normalized.substring(0, 1).toUpperCase() + normalized.substring(1);
            }
        }
        normalized = normalized.replaceAll("\\s+", " ").trim();
        if (normalized.isEmpty()) return null;
        return normalized.substring(0, Math.min(12, normalized.length()));
    }

    private static String normalizedStoredName(String value) {
        if (value == null) return null;
        String normalized = value.trim();
        return normalized.isEmpty() ? null : normalized;
    }

    private static int firstSeparator(String value) {
        int result = -1;
        for (char separator : new char[]{'.', '_', '-'}) {
            int index = value.indexOf(separator);
            if (index >= 0 && (result < 0 || index < result)) result = index;
        }
        return result;
    }

    /** Removes one account's dedicated core file and its retained rollback namespace. */
    public static boolean deleteCoreProfile(Context context, String slot, String replacementActiveSlot) {
        String safeSlot = validSlot(slot);
        SharedPreferences core = freshAccountCorePreferences(context, safeSlot);
        SharedPreferences legacy = freshLegacyCorePreferences(context);
        SharedPreferences metadata = freshProfileMetadata(context);
        Map<String, ?> coreBefore = new HashMap<String, Object>(core.getAll());
        Map<String, ?> legacyBefore = new HashMap<String, Object>(legacy.getAll());
        boolean migrationBefore = metadata.getBoolean(CORE_MIGRATED + safeSlot, false);
        if (!core.edit().clear().commit()) {
            lastError = "account core file";
            return false;
        }

        SharedPreferences.Editor editor = legacy.edit();
        String prefix = "morphe." + safeSlot + ".";
        for (String key : legacyBefore.keySet()) {
            if (key.startsWith(prefix)) editor.remove(key);
        }
        if (!editor.commit()) {
            replacePreferences(core, coreBefore);
            lastError = "legacy account core namespace";
            return false;
        }
        SharedPreferences verifiedLegacy = freshLegacyCorePreferences(context);
        for (String key : verifiedLegacy.getAll().keySet()) {
            if (key.startsWith(prefix)) {
                replacePreferences(core, coreBefore);
                replacePreferences(verifiedLegacy, legacyBefore);
                lastError = "legacy account core namespace verification";
                return false;
            }
        }
        if (!metadata.edit().remove(CORE_MIGRATED + safeSlot).commit()) {
            replacePreferences(core, coreBefore);
            replacePreferences(verifiedLegacy, legacyBefore);
            lastError = "account core migration marker";
            return false;
        }

        String replacement = replacementActiveSlot == null ? null : validSlot(replacementActiveSlot);
        if (replacement != null && !commitActiveSlot(context, safeSlot, replacement)) {
            replacePreferences(core, coreBefore);
            replacePreferences(verifiedLegacy, legacyBefore);
            SharedPreferences.Editor restore = metadata.edit();
            if (migrationBefore) restore.putBoolean(CORE_MIGRATED + safeSlot, true);
            else restore.remove(CORE_MIGRATED + safeSlot);
            restore.commit();
            return false;
        }
        lastError = "";
        return true;
    }

    public static boolean hasProfiles(Context context) {
        String ids = context.getApplicationContext().getSharedPreferences(META, Context.MODE_PRIVATE)
                .getString(PROFILE_IDS, "");
        return ids != null && !ids.trim().isEmpty();
    }

    /** Returns the Android/default preference store belonging to the active account. */
    public static SharedPreferences profilePreferences(Context context) {
        Context app = context.getApplicationContext();
        String slot = activeSlot(app, DEFAULT_SLOT);
        SharedPreferences target = app.getSharedPreferences(profilePreferencesName(slot), Context.MODE_PRIVATE);
        migrateLegacyDefaultPreferences(app, target);
        if (!slot.equals(target.getString(SLOT_MARKER, null))) {
            if (!target.edit().putString(SLOT_MARKER, slot).commit()) {
                Log.e(TAG, "Could not write account preference marker for " + slot);
            }
        }
        return target;
    }

    public static String profilePreferencesName(String slot) {
        return PROFILE_PREFS_PREFIX + validSlot(slot);
    }

    /** Deletes every Android-side store belonging to one removed account. */
    public static boolean deleteProfilePreferences(Context context, String slot) {
        String safeSlot = validSlot(slot);
        String name = profilePreferencesName(safeSlot);
        boolean deleted = context.deleteSharedPreferences(name);
        File directory = new File(context.getDataDir(), "shared_prefs");
        File xml = new File(directory, name + ".xml");
        File backup = new File(directory, name + ".xml.bak");
        boolean xmlGone = !xml.exists() || xml.delete();
        boolean backupGone = !backup.exists() || backup.delete();
        File serverSettings = accountServerSettings(context, safeSlot);
        boolean serverSettingsGone = !serverSettings.exists() || serverSettings.delete();
        boolean storageGone = deleteRecursively(slotRoot(context, safeSlot));
        boolean externalStorageGone = deleteExternalSlotStorage(context, safeSlot);
        return (deleted || (!xml.exists() && !backup.exists())) && xmlGone && backupGone
                && serverSettingsGone && storageGone && externalStorageGone;
    }

    /**
     * Terminates every Stremio process except the profile chooser, then atomically
     * rotates Android-side storage from the outgoing account to the destination.
     */
    public static boolean switchAccountRuntime(Context context, String outgoingSlot,
                                               String destinationSlot) {
        List<String> failures = new ArrayList<String>();
        if (!stopRuntimeServices(context)) failures.add("Stremio runtime service");
        if (!terminateOtherProcesses(context)) failures.add("stale Stremio process");
        if (failures.isEmpty() && !preserveLegacyServerSettings(context, outgoingSlot)) {
            failures.add("legacy streaming-server settings");
        }
        if (failures.isEmpty()) {
            cancelNotifications(context, failures);
            cancelScheduledJobs(context, failures);
            clearTvRows(context, failures);
        }
        if (failures.isEmpty() && !rotateStorage(context, outgoingSlot, destinationSlot)) {
            failures.add("account storage rotation");
        }
        // Job/service cancellation can race with a system-triggered process start.
        // Recheck immediately before the caller is allowed to commit a new slot.
        if (failures.isEmpty() && !terminateOtherProcesses(context)) {
            failures.add("respawned Stremio process");
        }
        setResult(failures);
        return failures.isEmpty();
    }

    /** Reverses a completed storage rotation if the active-slot commit fails. */
    public static boolean rollbackAccountSwitch(Context context, String outgoingSlot,
                                                String destinationSlot) {
        boolean success = rotateStorage(context, destinationSlot, outgoingSlot);
        if (!success) lastError = "account storage rollback";
        return success;
    }

    /** Restores an inactive account after the previously active account was removed. */
    public static boolean restoreAccountStorage(Context context, String slot) {
        List<MoveRecord> moves = new ArrayList<MoveRecord>();
        String safeSlot = validSlot(slot);
        if (!prepareDestinationStorage(context, safeSlot)) return false;
        try {
            for (StorageArea area : storageAreas(context, safeSlot)) {
                if (!isLiveAreaEmpty(area)) throw new IllegalStateException("live " + area.label + " is not empty");
                moveChildren(area.vault, area.live, area.filter, moves);
            }
            markSlotInitialized(context, safeSlot);
            return true;
        } catch (Exception error) {
            Log.e(TAG, "Could not restore account storage for " + safeSlot, error);
            rollbackMoves(moves);
            lastError = "account storage restore";
            return false;
        }
    }

    /** Used when deleting the active account; switching uses switchAccountRuntime. */
    public static boolean closeCurrentRuntime(Context context) {
        List<String> failures = new ArrayList<String>();
        if (!stopRuntimeServices(context)) failures.add("Stremio runtime service");
        if (!terminateOtherProcesses(context)) failures.add("stale Stremio process");
        if (failures.isEmpty()) {
            preserveLegacyServerSettings(context, activeSlot(context, DEFAULT_SLOT));
            clearBoundaryData(context, failures);
        }
        if (failures.isEmpty() && !terminateOtherProcesses(context)) failures.add("respawned Stremio process");
        setResult(failures);
        return failures.isEmpty();
    }

    private static boolean stopRuntimeServices(Context context) {
        String[] services = new String[]{
                "com.stremio.common.players.MediaPlaybackService",
                "com.stremio.tv.ServerService",
                "androidx.work.impl.foreground.SystemForegroundService",
                "com.google.android.gms.measurement.AppMeasurementService",
                "com.google.firebase.sessions.SessionLifecycleService"
        };
        boolean success = true;
        for (String service : services) {
            try {
                Intent intent = new Intent();
                intent.setClassName(context.getPackageName(), service);
                context.stopService(intent);
            } catch (RuntimeException error) {
                success = false;
                Log.e(TAG, "Could not stop runtime service " + service, error);
            }
        }
        return success;
    }

    /** Adopts the current live directories as the active account's first container. */
    public static boolean migrateLegacyBoundaryData(Context context) {
        profilePreferences(context);
        List<String> failures = new ArrayList<String>();
        String activeSlot = activeSlot(context, DEFAULT_SLOT);
        if (!stopRuntimeServices(context)) failures.add("Stremio runtime service");
        if (!terminateOtherProcesses(context)) failures.add("stale Stremio process");
        if (failures.isEmpty() && !preserveLegacyServerSettings(context, activeSlot)) {
            failures.add("legacy streaming-server settings");
        }
        if (failures.isEmpty()) {
            cancelNotifications(context, failures);
            cancelScheduledJobs(context, failures);
            clearTvRows(context, failures);
        }
        if (failures.isEmpty() && !markSlotInitialized(context, activeSlot)) {
            failures.add("active storage marker");
        }
        if (failures.isEmpty() && !terminateOtherProcesses(context)) failures.add("respawned Stremio process");
        setResult(failures);
        return failures.isEmpty();
    }

    /** Clears only the active account after Stremio's core-error recovery action. */
    public static boolean resetActiveAccount(Context context, SharedPreferences core,
                                             SharedPreferences accountPreferences) {
        List<String> failures = new ArrayList<String>();
        String slot = activeSlot(context, DEFAULT_SLOT);
        if (!core.edit().clear().commit()) failures.add("active core file");
        if (failures.isEmpty() && !removeLegacyCoreNamespace(context, slot)) {
            failures.add("legacy active core namespace");
        }
        if (!accountPreferences.edit().clear().commit()) failures.add("active Android preferences");
        cancelNotifications(context, failures);
        clearTvRows(context, failures);
        setResult(failures);
        return failures.isEmpty();
    }

    public static String getLastError() {
        return lastError;
    }

    private static void migrateLegacyDefaultPreferences(Context context, SharedPreferences target) {
        SharedPreferences metadata = context.getSharedPreferences(META, Context.MODE_PRIVATE);
        if (metadata.getBoolean(LEGACY_MIGRATED, false)) return;

        String legacyName = context.getPackageName() + "_preferences";
        SharedPreferences legacy = context.getSharedPreferences(legacyName, Context.MODE_PRIVATE);
        Map<String, ?> values = legacy.getAll();
        if (!values.isEmpty()) {
            SharedPreferences.Editor editor = target.edit();
            for (Map.Entry<String, ?> entry : values.entrySet()) {
                putPreference(editor, entry.getKey(), entry.getValue());
            }
            if (!editor.commit()) {
                Log.e(TAG, "Could not migrate legacy default preferences");
                return;
            }
        }
        if (!metadata.edit().putBoolean(LEGACY_MIGRATED, true).commit()) {
            Log.e(TAG, "Could not record default-preference migration");
        }
    }

    /** Copies old prefixed keys once, leaving the source intact for downgrade rollback. */
    private static boolean migrateLegacyCoreNamespace(Context context, String slot,
                                                      SharedPreferences target) {
        String safeSlot = validSlot(slot);
        SharedPreferences metadata = freshProfileMetadata(context);
        if (metadata.getBoolean(CORE_MIGRATED + safeSlot, false)) return true;

        SharedPreferences legacy = freshLegacyCorePreferences(context);
        String prefix = "morphe." + safeSlot + ".";
        Map<String, ?> existing = target.getAll();
        SharedPreferences.Editor editor = target.edit();
        Map<String, Object> copied = new HashMap<String, Object>();
        for (Map.Entry<String, ?> entry : legacy.getAll().entrySet()) {
            if (!entry.getKey().startsWith(prefix)) continue;
            String key = entry.getKey().substring(prefix.length());
            if (!existing.containsKey(key)) {
                copied.put(key, entry.getValue());
                putPreference(editor, key, entry.getValue());
            }
        }
        if (!editor.commit()) {
            lastError = "account core migration";
            return false;
        }

        Map<String, ?> verified = target.getAll();
        for (Map.Entry<String, Object> entry : copied.entrySet()) {
            if (!preferenceValuesEqual(entry.getValue(), verified.get(entry.getKey()))) {
                lastError = "account core migration verification";
                return false;
            }
        }
        if (!metadata.edit().putBoolean(CORE_MIGRATED + safeSlot, true).commit()) {
            lastError = "account core migration marker";
            return false;
        }
        lastError = "";
        return true;
    }

    private static boolean removeLegacyCoreNamespace(Context context, String slot) {
        SharedPreferences legacy = freshLegacyCorePreferences(context);
        String prefix = "morphe." + validSlot(slot) + ".";
        SharedPreferences.Editor editor = legacy.edit();
        for (String key : legacy.getAll().keySet()) {
            if (key.startsWith(prefix)) editor.remove(key);
        }
        if (!editor.commit()) return false;
        for (String key : freshLegacyCorePreferences(context).getAll().keySet()) {
            if (key.startsWith(prefix)) return false;
        }
        return true;
    }

    private static boolean preferenceValuesEqual(Object expected, Object actual) {
        return expected == null ? actual == null : expected.equals(actual);
    }

    @SuppressWarnings("unchecked")
    private static void putPreference(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof String) editor.putString(key, (String) value);
        else if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else if (value instanceof Set) editor.putStringSet(key, new HashSet<String>((Set<String>) value));
    }

    private static boolean replacePreferences(SharedPreferences preferences, Map<String, ?> values) {
        SharedPreferences.Editor editor = preferences.edit().clear();
        for (Map.Entry<String, ?> entry : values.entrySet()) {
            putPreference(editor, entry.getKey(), entry.getValue());
        }
        return editor.commit();
    }

    private static boolean terminateOtherProcesses(Context context) {
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager == null) return false;
        int ownPid = Process.myPid();
        int ownUid = Process.myUid();

        for (int attempt = 0; attempt < 8; attempt++) {
            boolean found = false;
            List<ActivityManager.RunningAppProcessInfo> processes = manager.getRunningAppProcesses();
            if (processes == null) return true;
            for (ActivityManager.RunningAppProcessInfo process : processes) {
                if (process.uid == ownUid && process.pid != ownPid) {
                    found = true;
                    Process.killProcess(process.pid);
                }
            }
            if (!found) return true;
            SystemClock.sleep(60L);
        }

        List<ActivityManager.RunningAppProcessInfo> remaining = manager.getRunningAppProcesses();
        if (remaining == null) return true;
        for (ActivityManager.RunningAppProcessInfo process : remaining) {
            if (process.uid == ownUid && process.pid != ownPid) return false;
        }
        return true;
    }

    private interface StorageFilter {
        boolean include(File file);
    }

    private static final StorageFilter INCLUDE_ALL = new StorageFilter() {
        @Override public boolean include(File file) { return true; }
    };

    private static final StorageFilter NON_ACCOUNT_PREFERENCES = new StorageFilter() {
        @Override public boolean include(File file) {
            String name = file.getName();
            if (name.endsWith(".xml.bak")) name = name.substring(0, name.length() - 8);
            else if (name.endsWith(".xml")) name = name.substring(0, name.length() - 4);
            return !CORE.equals(name) && !META.equals(name)
                    && !name.startsWith(CORE_PREFS_PREFIX)
                    && !name.startsWith(PROFILE_PREFS_PREFIX);
        }
    };

    private static final class StorageArea {
        final String label;
        final File live;
        final File vault;
        final StorageFilter filter;

        StorageArea(String label, File live, File vault, StorageFilter filter) {
            this.label = label;
            this.live = live;
            this.vault = vault;
            this.filter = filter;
        }
    }

    private static final class MoveRecord {
        final File source;
        final File destination;

        MoveRecord(File source, File destination) {
            this.source = source;
            this.destination = destination;
        }
    }

    private static boolean rotateStorage(Context context, String outgoingSlot, String destinationSlot) {
        String outgoing = validSlot(outgoingSlot);
        String destination = validSlot(destinationSlot);
        if (outgoing.equals(destination)) return true;
        if (!prepareDestinationStorage(context, destination)) return false;

        List<MoveRecord> moves = new ArrayList<MoveRecord>();
        try {
            List<StorageArea> outgoingAreas = storageAreas(context, outgoing);
            for (StorageArea area : outgoingAreas) {
                if (!isAreaEmpty(area.vault, area.filter)) {
                    throw new IllegalStateException("active vault " + area.label + " is not empty");
                }
                moveChildren(area.live, area.vault, area.filter, moves);
            }

            List<StorageArea> destinationAreas = storageAreas(context, destination);
            for (StorageArea area : destinationAreas) {
                if (!isLiveAreaEmpty(area)) {
                    throw new IllegalStateException("live " + area.label + " was not emptied");
                }
                moveChildren(area.vault, area.live, area.filter, moves);
            }
            if (!markSlotInitialized(context, outgoing) || !markSlotInitialized(context, destination)) {
                throw new IllegalStateException("could not mark account storage initialized");
            }
            return true;
        } catch (Exception error) {
            Log.e(TAG, "Could not rotate account storage from " + outgoing + " to " + destination, error);
            rollbackMoves(moves);
            return false;
        }
    }

    private static List<StorageArea> storageAreas(Context context, String slot) {
        File data = context.getDataDir();
        File root = slotRoot(context, slot);
        List<StorageArea> areas = new ArrayList<StorageArea>();
        areas.add(new StorageArea("files", context.getFilesDir(), new File(root, "files"), INCLUDE_ALL));
        areas.add(new StorageArea("cache", context.getCacheDir(), new File(root, "cache"), INCLUDE_ALL));
        areas.add(new StorageArea("databases", new File(data, "databases"),
                new File(root, "databases"), INCLUDE_ALL));
        areas.add(new StorageArea("no_backup", context.getNoBackupFilesDir(),
                new File(root, "no_backup"), INCLUDE_ALL));
        areas.add(new StorageArea("shared_prefs", new File(data, "shared_prefs"),
                new File(root, "shared_prefs"), NON_ACCOUNT_PREFERENCES));

        if (Build.VERSION.SDK_INT >= 19) {
            File[] externalCaches = context.getExternalCacheDirs();
            if (externalCaches != null) {
                for (int i = 0; i < externalCaches.length; i++) {
                    File external = externalCaches[i];
                    if (external == null || external.getParentFile() == null) continue;
                    File externalVault = new File(new File(new File(external.getParentFile(),
                            SLOT_STORAGE_DIRECTORY), validSlot(slot)), "external_cache_" + i);
                    areas.add(new StorageArea("external_cache_" + i, external, externalVault, INCLUDE_ALL));
                }
            }
        }
        return areas;
    }

    private static boolean prepareDestinationStorage(Context context, String slot) {
        String safeSlot = validSlot(slot);
        File root = slotRoot(context, safeSlot);
        if (!root.isDirectory() && !root.mkdirs()) return false;
        if (isSlotInitialized(context, safeSlot)) return true;

        File legacy = accountServerSettings(context, safeSlot);
        if (!legacy.isFile()) return true;
        File destination = new File(new File(new File(root, "files"), "stremio-server"),
                SERVER_SETTINGS_FILE);
        return copyAtomically(legacy, destination);
    }

    private static boolean preserveLegacyServerSettings(Context context, String activeSlot) {
        File oldDirectory = new File(context.getFilesDir(), SERVER_SETTINGS_DIRECTORY);
        File[] snapshots = oldDirectory.listFiles();
        if (snapshots != null) {
            for (File snapshot : snapshots) {
                if (!snapshot.isFile() || !snapshot.getName().endsWith(".json")) continue;
                File destination = new File(legacyServerRoot(context), snapshot.getName());
                if (!copyAtomically(snapshot, destination)) return false;
            }
        }

        File live = new File(new File(context.getFilesDir(), "stremio-server"), SERVER_SETTINGS_FILE);
        return !live.isFile() || copyAtomically(live, accountServerSettings(context, activeSlot));
    }

    private static void moveChildren(File sourceDirectory, File destinationDirectory,
                                     StorageFilter filter, List<MoveRecord> moves) throws Exception {
        if (!sourceDirectory.exists()) return;
        if (!sourceDirectory.isDirectory()) throw new IllegalStateException(sourceDirectory + " is not a directory");
        if (!destinationDirectory.isDirectory() && !destinationDirectory.mkdirs()) {
            throw new IllegalStateException("could not create " + destinationDirectory);
        }
        File[] children = sourceDirectory.listFiles();
        if (children == null) throw new IllegalStateException("could not list " + sourceDirectory);
        for (File source : children) {
            if (!filter.include(source)) continue;
            File destination = new File(destinationDirectory, source.getName());
            if (destination.exists()) throw new IllegalStateException("destination exists: " + destination);
            if (!source.renameTo(destination)) throw new IllegalStateException("could not move " + source);
            moves.add(new MoveRecord(source, destination));
        }
    }

    private static boolean isLiveAreaEmpty(StorageArea area) {
        return isAreaEmpty(area.live, area.filter);
    }

    private static boolean isAreaEmpty(File directory, StorageFilter filter) {
        if (!directory.exists()) return true;
        File[] children = directory.listFiles();
        if (children == null) return false;
        for (File child : children) if (filter.include(child)) return false;
        return true;
    }

    private static boolean rollbackMoves(List<MoveRecord> moves) {
        boolean success = true;
        for (int i = moves.size() - 1; i >= 0; i--) {
            MoveRecord move = moves.get(i);
            File parent = move.source.getParentFile();
            if (parent != null && !parent.isDirectory() && !parent.mkdirs()) success = false;
            if (move.source.exists() || !move.destination.renameTo(move.source)) success = false;
        }
        if (!success) Log.e(TAG, "Account storage transaction rollback was incomplete");
        return success;
    }

    private static File slotRoot(Context context, String slot) {
        return new File(new File(context.getDataDir(), SLOT_STORAGE_DIRECTORY), validSlot(slot));
    }

    private static File legacyServerRoot(Context context) {
        return new File(context.getDataDir(), LEGACY_SERVER_DIRECTORY);
    }

    private static boolean deleteExternalSlotStorage(Context context, String slot) {
        if (Build.VERSION.SDK_INT < 19) return true;
        File[] externalCaches = context.getExternalCacheDirs();
        if (externalCaches == null) return true;
        boolean success = true;
        for (File external : externalCaches) {
            if (external == null || external.getParentFile() == null) continue;
            File root = new File(new File(external.getParentFile(), SLOT_STORAGE_DIRECTORY),
                    validSlot(slot));
            if (!deleteRecursively(root)) success = false;
        }
        return success;
    }

    private static boolean isSlotInitialized(Context context, String slot) {
        return new File(slotRoot(context, slot), SLOT_INITIALIZED_MARKER).isFile();
    }

    private static boolean markSlotInitialized(Context context, String slot) {
        File root = slotRoot(context, slot);
        if (!root.isDirectory() && !root.mkdirs()) return false;
        File marker = new File(root, SLOT_INITIALIZED_MARKER);
        if (marker.isFile()) return true;
        FileOutputStream output = null;
        try {
            output = new FileOutputStream(marker, false);
            output.write(validSlot(slot).getBytes("UTF-8"));
            output.getFD().sync();
            return true;
        } catch (Exception error) {
            Log.e(TAG, "Could not mark storage initialized for " + slot, error);
            return false;
        } finally {
            try { if (output != null) output.close(); } catch (Exception ignored) {}
        }
    }

    private static void clearBoundaryData(Context context, List<String> failures) {
        cancelNotifications(context, failures);
        cancelScheduledJobs(context, failures);
        clearTvRows(context, failures);

        if (!purgeContents(context.getCacheDir(), null)) failures.add("internal cache");
        if (Build.VERSION.SDK_INT >= 19) {
            File[] externalCaches = context.getExternalCacheDirs();
            if (externalCaches != null) {
                for (File cache : externalCaches) {
                    if (cache != null && !purgeContents(cache, null)) failures.add("external cache");
                }
            }
        }

        if (!purgeContents(context.getFilesDir(), null)) failures.add("files");
        clearDatabases(context, failures);
        if (!purgeContents(context.getNoBackupFilesDir(), null)) failures.add("no-backup jobs/session data");
        clearNonAccountPreferences(context, failures);
    }

    private static void cancelNotifications(Context context, List<String> failures) {
        try {
            NotificationManager notifications =
                    (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (notifications != null) notifications.cancelAll();
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not clear notifications", error);
            failures.add("notifications");
        }
    }

    private static void cancelScheduledJobs(Context context, List<String> failures) {
        try {
            JobScheduler jobs = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
            if (jobs != null) jobs.cancelAll();
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not cancel scheduled jobs", error);
            failures.add("scheduled jobs");
        }
    }

    private static void clearTvRows(Context context, List<String> failures) {
        if (Build.VERSION.SDK_INT < 26) return;
        PackageManager packages = context.getPackageManager();
        if (!packages.hasSystemFeature(PackageManager.FEATURE_LEANBACK)
                && !packages.hasSystemFeature(PackageManager.FEATURE_TELEVISION)) return;
        try {
            ContentResolver resolver = context.getContentResolver();
            int previewPrograms = deleteRowsForPackage(resolver, TvContract.PreviewPrograms.CONTENT_URI,
                    context.getPackageName());
            int watchNext = deleteRowsForPackage(resolver, TvContract.WatchNextPrograms.CONTENT_URI,
                    context.getPackageName());
            int channels = deleteRowsForPackage(resolver, TvContract.Channels.CONTENT_URI,
                    context.getPackageName());
            Log.i(TAG, "Cleared TV rows: channels=" + channels + ", preview=" + previewPrograms
                    + ", watchNext=" + watchNext);
        } catch (Exception error) {
            Log.e(TAG, "Could not clear Android TV channels", error);
            failures.add("Android TV channels");
        }
    }

    private static int deleteRowsForPackage(ContentResolver resolver, Uri uri, String packageName) {
        int deleted = 0;
        // TvProvider scopes an unfiltered query to rows owned by the calling package.
        // It explicitly rejects SQL selection clauses for preview/watch-next tables.
        Cursor cursor = resolver.query(uri, new String[]{BaseColumns._ID},
                null, null, null);
        if (cursor == null) throw new IllegalStateException("TV provider returned no cursor for " + uri);
        try {
            int idIndex = cursor.getColumnIndexOrThrow(BaseColumns._ID);
            while (cursor.moveToNext()) {
                Uri row = ContentUris.withAppendedId(uri, cursor.getLong(idIndex));
                deleted += resolver.delete(row, null, null);
            }
        } finally {
            cursor.close();
        }
        return deleted;
    }

    private static void clearDatabases(Context context, List<String> failures) {
        String[] databases = context.databaseList();
        if (databases == null) return;
        for (String database : databases) {
            if (!context.deleteDatabase(database)) {
                File path = context.getDatabasePath(database);
                if (path.exists()) failures.add("database " + database);
            }
        }
    }

    private static void clearNonAccountPreferences(Context context, List<String> failures) {
        File directory = new File(context.getDataDir(), "shared_prefs");
        File[] files = directory.listFiles();
        if (files == null) return;
        Set<String> names = new HashSet<String>();
        for (File file : files) {
            String name = file.getName();
            if (name.endsWith(".xml.bak")) names.add(name.substring(0, name.length() - 8));
            else if (name.endsWith(".xml")) names.add(name.substring(0, name.length() - 4));
        }
        for (String name : names) {
            if (CORE.equals(name) || META.equals(name) || name.startsWith(PROFILE_PREFS_PREFIX)) continue;
            context.deleteSharedPreferences(name);
            File xml = new File(directory, name + ".xml");
            File backup = new File(directory, name + ".xml.bak");
            if ((xml.exists() && !xml.delete()) || (backup.exists() && !backup.delete())) {
                failures.add("shared preferences " + name);
            }
        }
    }

    private static void clearTelemetryFiles(Context context, List<String> failures) {
        File files = context.getFilesDir();
        File[] targets = new File[]{
                new File(files, ".crashlytics.v3"),
                new File(files, "datastore"),
                new File(files, "generatefid.lock")
        };
        for (File target : targets) {
            if (!deleteRecursively(target)) failures.add("telemetry/session file " + target.getName());
        }
    }

    private static void clearServerCache(Context context, List<String> failures) {
        File serverDirectory = new File(context.getFilesDir(), "stremio-server");
        File settings = new File(serverDirectory, SERVER_SETTINGS_FILE);
        Set<String> preserve = new HashSet<String>();
        preserve.add(SERVER_SETTINGS_FILE);
        if (!purgeContents(serverDirectory, preserve)) failures.add("streaming-server cache");

        if (!settings.isFile()) return;
        try {
            StringBuilder value = new StringBuilder();
            BufferedReader reader = new BufferedReader(new FileReader(settings));
            try {
                String line;
                while ((line = reader.readLine()) != null) value.append(line);
            } finally {
                reader.close();
            }
            String cacheRoot = new JSONObject(value.toString()).optString("cacheRoot", "");
            if (cacheRoot.isEmpty()) return;
            File root = new File(cacheRoot).getCanonicalFile();
            if (root.equals(serverDirectory.getCanonicalFile())) return;

            boolean owned = isInside(context.getCacheDir(), root)
                    || isInside(context.getFilesDir(), root);
            if (!owned && Build.VERSION.SDK_INT >= 19) {
                File[] externalCaches = context.getExternalCacheDirs();
                if (externalCaches != null) {
                    for (File external : externalCaches) {
                        if (external != null && isInside(external, root)) owned = true;
                    }
                }
            }
            if (!owned) {
                failures.add("streaming cache outside app storage");
                Log.e(TAG, "Refusing to purge non-app cacheRoot: " + root);
            } else if (!purgeContents(root, null)) {
                failures.add("streaming cacheRoot");
            }
        } catch (Exception error) {
            Log.e(TAG, "Could not inspect streaming-server cache", error);
            failures.add("streaming-server settings");
        }
    }

    private static boolean snapshotCurrentServerSettings(Context context) {
        String slot = activeSlot(context, DEFAULT_SLOT);
        File live = new File(new File(context.getFilesDir(), "stremio-server"), SERVER_SETTINGS_FILE);
        if (!live.isFile()) return true;
        return copyAtomically(live, accountServerSettings(context, slot));
    }

    private static File accountServerSettings(Context context, String slot) {
        File directory = legacyServerRoot(context);
        return new File(directory, validSlot(slot) + ".json");
    }

    private static boolean copyAtomically(File source, File destination) {
        File parent = destination.getParentFile();
        if (parent == null || (!parent.isDirectory() && !parent.mkdirs())) return false;
        File temporary = new File(parent, destination.getName() + ".tmp");
        FileInputStream input = null;
        FileOutputStream output = null;
        try {
            input = new FileInputStream(source);
            output = new FileOutputStream(temporary, false);
            byte[] buffer = new byte[16384];
            int count;
            while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
            output.getFD().sync();
            output.close();
            output = null;
            if (destination.exists() && !destination.delete()) return false;
            return temporary.renameTo(destination);
        } catch (Exception error) {
            Log.e(TAG, "Could not copy account streaming-server settings", error);
            return false;
        } finally {
            try { if (input != null) input.close(); } catch (Exception ignored) {}
            try { if (output != null) output.close(); } catch (Exception ignored) {}
            if (temporary.exists() && !temporary.equals(destination)) temporary.delete();
        }
    }

    private static boolean isInside(File parent, File child) throws Exception {
        String parentPath = parent.getCanonicalPath();
        String childPath = child.getCanonicalPath();
        return childPath.startsWith(parentPath + File.separator);
    }

    private static boolean purgeContents(File directory, Set<String> preserve) {
        if (directory == null || !directory.exists()) return true;
        File[] children = directory.listFiles();
        if (children == null) return directory.isDirectory();
        boolean success = true;
        for (File child : children) {
            if (preserve != null && preserve.contains(child.getName())) continue;
            if (!deleteRecursively(child)) success = false;
        }
        return success;
    }

    private static boolean deleteRecursively(File file) {
        if (file == null || !file.exists()) return true;
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children == null) return false;
            for (File child : children) {
                if (!deleteRecursively(child)) return false;
            }
        }
        return file.delete() || !file.exists();
    }

    private static String validSlot(String slot) {
        if (isValidSlot(slot)) return slot;
        return DEFAULT_SLOT;
    }

    private static boolean isValidSlot(String slot) {
        return slot != null && slot.matches("[a-z0-9_]{1,32}");
    }

    private static void setResult(List<String> failures) {
        if (failures.isEmpty()) {
            lastError = "";
            Log.i(TAG, "Account boundary isolated successfully");
        } else {
            StringBuilder message = new StringBuilder();
            for (String failure : failures) {
                if (message.length() > 0) message.append(", ");
                message.append(failure);
            }
            lastError = message.toString();
            Log.e(TAG, "Account boundary cleanup failed: " + lastError);
        }
    }
}
