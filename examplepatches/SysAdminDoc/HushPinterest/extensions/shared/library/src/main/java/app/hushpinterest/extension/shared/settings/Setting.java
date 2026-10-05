/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Forked from MorpheApp/morphe-patches (GPL-3.0), by way of
 * icysymmetra/tiktok-patches-for-morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Imported carrying no notice of its own. Morphe hard forked ReVanced, so parts of
 * this file may originate there.
 */
package app.hushpinterest.extension.shared.settings;

import static app.hushpinterest.extension.shared.StringRef.str;


import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.StringRef;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.preference.SharedPrefCategory;

public abstract class Setting<T> {

    /**
     * Indicates if a {@link Setting} is available to edit and use.
     * Typically, this is dependent upon other BooleanSetting(s) set to 'true',
     * but this can be used to call into extension code and check other conditions.
     */
    public interface Availability {
        boolean isAvailable();

        /**
         * @return parent settings (dependencies) of this availability.
         */
        default List<Setting<?>> getParentSettings() {
            return Collections.emptyList();
        }
    }

    /**
     * Availability based on a single parent setting being enabled.
     */
    public static Availability parent(BooleanSetting parent) {
        return new Availability() {
            @Override
            public boolean isAvailable() {
                return parent.savedValue();
            }

            @Override
            public List<Setting<?>> getParentSettings() {
                return Collections.singletonList(parent);
            }
        };
    }

    /**
     * Availability based on a single parent setting being disabled.
     */
    public static Availability parentNot(BooleanSetting parent) {
        return new Availability() {
            @Override
            public boolean isAvailable() {
                return !parent.savedValue();
            }

            @Override
            public List<Setting<?>> getParentSettings() {
                return Collections.singletonList(parent);
            }
        };
    }

    /**
     * Availability based on all parents being enabled.
     */
    public static Availability parentsAll(BooleanSetting... parents) {
        return new Availability() {
            @Override
            public boolean isAvailable() {
                for (BooleanSetting parent : parents) {
                    if (!parent.savedValue()) return false;
                }
                return true;
            }

            @Override
            public List<Setting<?>> getParentSettings() {
                return Collections.unmodifiableList(Arrays.asList(parents));
            }
        };
    }

    /**
     * Availability based on any parent being enabled.
     */
    public static Availability parentsAny(BooleanSetting... parents) {
        return new Availability() {
            @Override
            public boolean isAvailable() {
                for (BooleanSetting parent : parents) {
                    if (parent.savedValue()) return true;
                }
                return false;
            }

            @Override
            public List<Setting<?>> getParentSettings() {
                return Collections.unmodifiableList(Arrays.asList(parents));
            }
        };
    }

    /**
     * All settings that were instantiated.
     * When a new setting is created, it is automatically added to this list.
     */
    private static final List<Setting<?>> SETTINGS = new ArrayList<>();

    /**
     * Map of setting path to setting object.
     */
    private static final Map<String, Setting<?>> PATH_TO_SETTINGS = new HashMap<>();

    /**
     * The preferences file every setting is saved to. A constant, so code that runs before
     * HushPinterest has a context can name the file without loading this class.
     */
    public static final String PREFERENCES_NAME = "morphe_prefs";

    /**
     * Preference all instances are saved to.
     */
    public static final SharedPrefCategory preferences = new SharedPrefCategory(PREFERENCES_NAME);

    @Nullable
    public static Setting<?> getSettingFromPath(String str) {
        return PATH_TO_SETTINGS.get(str);
    }

    /**
     * @return All settings that have been created.
     */
    public static List<Setting<?>> allLoadedSettings() {
        return Collections.unmodifiableList(SETTINGS);
    }

    /**
     * @return All settings that have been created, sorted by keys.
     */
    private static List<Setting<?>> allLoadedSettingsSorted() {
        //noinspection ComparatorCombinators
        Collections.sort(SETTINGS, (Setting<?> o1, Setting<?> o2) -> o1.key.compareTo(o2.key));
        return allLoadedSettings();
    }

    /**
     * The key used to store the value in the shared preferences.
     */
    public final String key;

    /**
     * The default value of the setting.
     */
    public final T defaultValue;

    /**
     * If the app should be rebooted, if this setting is changed
     */
    public final boolean rebootApp;

    /**
     * If this setting should be included when importing/exporting settings.
     */
    public final boolean includeWithImportExport;

    /**
     * If this setting is available to edit and use.
     * Not to be confused with its status returned from {@link #get()}.
     */
    @Nullable
    private final Availability availability;

    /**
     * Confirmation message to display, if the user tries to change the setting from the default value.
     */
    @Nullable
    public final StringRef userDialogMessage;

    // Must be volatile, as some settings are read/write from different threads.
    // Of note, the object value is persistently stored using SharedPreferences (which is thread safe).
    /**
     * The value of the setting.
     */
    protected volatile T value;

    // Process-local successful saved edits, guarded by Setting.class. Temporary values and
    // failed writes, including their recovery writes, don't advance this revision.
    private long savedWriteRevision;
    private T lastSavedValue;
    @Nullable private Object lastSavedStoredValue;
    private static int savedWritesInProgress;

    /**
     * Pause HushPinterest, decided once when the process starts (see {@link HushPinterestPause}). While it
     * is on, every setting that changes Pinterest answers the value that leaves Pinterest as it ships.
     */
    private static volatile boolean pausedForProcess;

    /** HushPinterest's own state rather than a change to Pinterest: it keeps its value while paused. */
    private volatile boolean keptWhenPaused;

    /** Whether this process runs with HushPinterest paused. */
    public static boolean isPaused() {
        return pausedForProcess;
    }

    static void setPausedForProcess(boolean paused) {
        pausedForProcess = paused;
    }

    /**
     * Marks settings that hold HushPinterest's own state (a remembered position, an observed list, a
     * counter, a diagnostics option) so they keep answering their value while HushPinterest is paused.
     * Every other setting answers {@link #pausedValue()} then.
     */
    public static void keepWhenPaused(Setting<?>... settings) {
        for (Setting<?> setting : settings) setting.keptWhenPaused = true;
    }

    public boolean isKeptWhenPaused() {
        return keptWhenPaused;
    }

    public Setting(String key, T defaultValue) {
        this(key, defaultValue, false, true, null, null);
    }
    public Setting(String key, T defaultValue, boolean rebootApp) {
        this(key, defaultValue, rebootApp, true, null, null);
    }
    public Setting(String key, T defaultValue, boolean rebootApp, boolean includeWithImportExport) {
        this(key, defaultValue, rebootApp, includeWithImportExport, null, null);
    }
    public Setting(String key, T defaultValue, String userDialogMessage) {
        this(key, defaultValue, false, true, userDialogMessage, null);
    }
    public Setting(String key, T defaultValue, Availability availability) {
        this(key, defaultValue, false, true, null, availability);
    }
    public Setting(String key, T defaultValue, boolean rebootApp, String userDialogMessage) {
        this(key, defaultValue, rebootApp, true, userDialogMessage, null);
    }
    public Setting(String key, T defaultValue, boolean rebootApp, Availability availability) {
        this(key, defaultValue, rebootApp, true, null, availability);
    }
    public Setting(String key, T defaultValue, boolean rebootApp, String userDialogMessage, Availability availability) {
        this(key, defaultValue, rebootApp, true, userDialogMessage, availability);
    }

    /**
     * A setting backed by a shared preference.
     *
     * @param key                     The key used to store the value in the shared preferences.
     * @param defaultValue            The default value of the setting.
     * @param rebootApp               If the app should be rebooted, if this setting is changed.
     * @param includeWithImportExport If this setting should be shown in the import/export dialog.
     * @param userDialogMessage       Confirmation message to display, if the user tries to change the setting from the default value.
     * @param availability            Condition that must be true, for this setting to be available to configure.
     */
    public Setting(String key,
                   T defaultValue,
                   boolean rebootApp,
                   boolean includeWithImportExport,
                   @Nullable String userDialogMessage,
                   @Nullable Availability availability
    ) {
        this.key = Objects.requireNonNull(key);
        this.value = this.defaultValue = Objects.requireNonNull(defaultValue);
        this.rebootApp = rebootApp;
        this.includeWithImportExport = includeWithImportExport;
        this.userDialogMessage = (userDialogMessage == null) ? null : new StringRef(userDialogMessage);
        this.availability = availability;

        SETTINGS.add(this);
        if (PATH_TO_SETTINGS.put(key, this) != null) {
            Logger.printException(() -> this.getClass().getSimpleName()
                    + " error: Duplicate Setting key found: " + key);
        }

        load();
        lastSavedValue = value;
        lastSavedStoredValue = preferences.preferences.getAll().get(key);
    }

    /**
     * Migrate an old Setting value previously stored in a different SharedPreference.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void migrateFromOldPreferences(SharedPrefCategory oldPrefs, Setting setting) {
        if (!Utils.isMainProcess()) {
            Logger.printInfo(() -> "Ignored settings migration from a secondary process: " + setting.key);
            return;
        }
        String settingKey = setting.key;
        if (!oldPrefs.preferences.contains(settingKey)) {
            return; // Nothing to do.
        }

        Object newValue = setting.savedValue();
        final Object migratedValue;
        if (setting instanceof BooleanSetting) {
            migratedValue = oldPrefs.getBoolean(settingKey, (Boolean) newValue);
        } else if (setting instanceof IntegerSetting) {
            migratedValue = oldPrefs.getIntegerString(settingKey, (Integer) newValue);
        } else if (setting instanceof LongSetting) {
            migratedValue = oldPrefs.getLongString(settingKey, (Long) newValue);
        } else if (setting instanceof FloatSetting) {
            migratedValue = oldPrefs.getFloatString(settingKey, (Float) newValue);
        } else if (setting instanceof StringSetting) {
            migratedValue = oldPrefs.getString(settingKey, (String) newValue);
        } else {
            Logger.printException(() -> "Unknown setting: " + setting);
            // Remove otherwise it'll show a toast on every launch.
            oldPrefs.preferences.edit().remove(settingKey).apply();
            return;
        }

        if (migratedValue.equals(newValue)) {
            Logger.printDebug(() -> "Value does not need migrating: " + settingKey);
            oldPrefs.removeKey(settingKey);
            return; // Old value is already equal to the new setting value.
        }

        Logger.printDebug(() -> "Migrating old preference value into current preference: " + settingKey);
        if (setting.save(migratedValue)) {
            oldPrefs.removeKey(settingKey);
        } else {
            Logger.printException(() -> "Kept old preference after migration failed: " + settingKey);
        }
    }

    /**
     * Sets, but does _not_ persistently save the value.
     * This method is only to be used by the Settings preference code.
     * <p>
     * This intentionally is a static method to deter
     * accidental usage when {@link #save(Object)} was intended.
     */
    public static void privateSetValueFromString(Setting<?> setting, String newValue) {
        setting.setValueFromString(newValue);

        // Clear the preference value since default is used, to allow changing
        // the default for a future release.  Without this after upgrading
        // the saved value will be whatever was the default when the app was first installed.
        if (setting.isSetToDefault()) {
            try {
                setting.removeFromPreferences();
            } catch (RuntimeException failure) {
                // The framework already stored the selected default. Leaving that explicit value
                // is semantically correct, even if the cleanup that normally removes it failed.
                Logger.printException(() -> "Could not clear explicit default: " + setting.key, failure);
            }
        }
    }

    /**
     * Sets the value of {@link #value}, but do not save to {@link #preferences}.
     */
    protected abstract void setValueFromString(String newValue);

    /**
     * The value this setting will really hold, given one it has been asked to hold. A
     * setting with a range gives back the nearest value inside it; every other setting gives
     * back what it was handed.
     *
     * <p>Every path that assigns {@link #value} goes through this, because a value arrives
     * from a restored backup file as readily as from a dialog, and only the dialog asks
     * questions about it.
     */
    @NonNull
    protected T coerce(@NonNull T newValue) {
        return newValue;
    }

    /**
     * Load and set the value of {@link #value}.
     */
    protected abstract void load();

    /**
     * Persistently saves the value.
     */
    public final boolean save(T newValue) {
        // Every Setting shares one preference file. Keep the live-value swap, disk commit and
        // possible rollback in the same class lock as saveAll(), so a failed write cannot roll a
        // newer successful write back after the newer caller has already returned.
        synchronized (Setting.class) {
            if (!Utils.isMainProcess()) {
                Logger.printInfo(() -> "Ignored persistent setting write from a secondary process: " + key);
                return false;
            }
            newValue = coerce(Objects.requireNonNull(newValue));
            T previousValue = value;
            final T previousSaved;
            final Object previousStored;
            try {
                previousStored = preferences.preferences.getAll().get(key);
                previousSaved = storedValue();
            } catch (RuntimeException unreadable) {
                Logger.printException(() -> "Could not read setting before save: " + key, unreadable);
                return false;
            }
            lastSavedValue = previousSaved;
            lastSavedStoredValue = previousStored;
            if (value.equals(newValue) && previousSaved.equals(newValue)) {
                return true;
            }

            // Must set before saving to preferences (otherwise importing fails to update UI correctly).
            savedWritesInProgress++;
            value = newValue;
            try {
                persistCurrentValue();
                Object savedStored = preferences.preferences.getAll().get(key);
                if (!previousSaved.equals(newValue)) savedWriteRevision++;
                lastSavedValue = newValue;
                lastSavedStoredValue = savedStored;
                return true;
            } catch (RuntimeException failure) {
                // The live value may have been temporary. Restore the actual stored representation,
                // including an absent key, rather than persisting that temporary value.
                value = previousValue;
                try {
                    restoreStored(Collections.singletonMap(this, previousStored)).commit();
                } catch (RuntimeException rollbackFailure) {
                    failure.addSuppressed(rollbackFailure);
                }
                try {
                    if (Objects.equals(previousStored, preferences.preferences.getAll().get(key))) {
                        value = previousValue;
                    } else {
                        load();
                        value = coerce(value);
                    }
                    lastSavedValue = storedValue();
                    lastSavedStoredValue = preferences.preferences.getAll().get(key);
                } catch (RuntimeException unreadable) {
                    failure.addSuppressed(unreadable);
                }
                Logger.printException(() -> "Could not save setting: " + key, failure);
                return false;
            } finally {
                savedWritesInProgress--;
            }
        }
    }

    private void persistCurrentValue() {
        if (defaultValue.equals(value)) removeFromPreferences();
        else saveToPreferences();
    }

    /** Reads the existing storage formats without replacing a temporary live value. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private T storedValue() {
        Object stored;
        if (defaultValue instanceof Boolean) stored = preferences.getBoolean(key, (Boolean) defaultValue);
        else if (defaultValue instanceof Integer) stored = preferences.getIntegerString(key, (Integer) defaultValue);
        else if (defaultValue instanceof Long) stored = preferences.getLongString(key, (Long) defaultValue);
        else if (defaultValue instanceof Float) stored = preferences.getFloatString(key, (Float) defaultValue);
        else if (defaultValue instanceof Enum) stored = preferences.getEnum(key, (Enum) defaultValue);
        else stored = preferences.getString(key, (String) defaultValue);
        return coerce((T) stored);
    }

    /**
     * Save {@link #value} to {@link #preferences}.
     */
    protected abstract void saveToPreferences();

    /**
     * Remove {@link #value} from {@link #preferences}.
     */
    protected final void removeFromPreferences() {
        Logger.printDebug(() -> "Clearing stored preference value (reset to default): " + key);
        preferences.removeKey(key);
    }

    /**
     * What the setting says now, which is what every hook reads. While HushPinterest is paused, a
     * setting that changes Pinterest answers {@link #pausedValue()}; the saved value is untouched.
     */
    @NonNull
    public final T get() {
        return pausedForProcess && !keptWhenPaused ? pausedValue() : value;
    }

    /**
     * The value this setting holds, paused or not. The settings screen reads this rather than
     * what a paused Pinterest is answered. It can include an unsaved temporary value.
     */
    @NonNull
    public final T savedValue() {
        return value;
    }

    /** The typed choice in storage, without adopting or persisting a temporary live value. */
    @NonNull
    public final T persistedValue() {
        synchronized (Setting.class) {
            return storedValue();
        }
    }

    /** The successful saved edits to this setting, even if later edits return it to an old value. */
    public final long savedWriteRevision() {
        synchronized (Setting.class) {
            return savedWriteRevision;
        }
    }

    /** Records a framework preference's successfully adopted saved edit, after its UI work succeeds. */
    public final void noteSavedPreferenceChange() {
        synchronized (Setting.class) {
            if (savedWritesInProgress != 0) return;
            T stored = storedValue();
            Object raw = preferences.preferences.getAll().get(key);
            if (!stored.equals(coerce(lastSavedValue))) savedWriteRevision++;
            lastSavedValue = stored;
            lastSavedStoredValue = raw;
        }
    }

    /** Own write callbacks refresh the UI without adopting or rewriting an intermediate store. */
    public static synchronized boolean isSavedWriteInProgress() {
        return savedWritesInProgress != 0;
    }

    /** Queued owned-write callbacks already have their stored value and representation accounted for. */
    public final boolean isSavedPreferenceUnchanged() {
        synchronized (Setting.class) {
            return storedValue().equals(coerce(lastSavedValue))
                    && Objects.equals(lastSavedStoredValue, preferences.preferences.getAll().get(key));
        }
    }

    /**
     * The answer while paused. For a value setting the default is the unpatched behaviour: an
     * empty list, a zero limit, "auto", "default". A switch answers false instead.
     */
    @NonNull
    protected T pausedValue() {
        return defaultValue;
    }

    /**
     * Identical to calling {@link #save(Object)} using {@link #defaultValue}.
     *
     * @return The newly saved default value.
     */
    public T resetToDefault() {
        save(defaultValue);
        return defaultValue;
    }

    /** A batch that didn't land. Whether every setting it named is back on its value from before is known and said. */
    public static final class BatchFailed extends java.io.IOException {
        /** Every named setting has its previous live value and exact stored representation. */
        public final boolean restored;

        BatchFailed(boolean restored, @Nullable Throwable cause) {
            super(restored ? "Could not save settings" : "Could not save settings or roll back; use Undo", cause);
            this.restored = restored;
        }
    }

    /**
     * Apply a validated batch in one preference transaction. Call on a worker thread.
     *
     * @throws BatchFailed when the batch was attempted and didn't land. Exact recovery preserves
     *                     the previous live values. Partial recovery adopts the surviving store.
     *                     Anything else is thrown before a write.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static synchronized void saveAll(Map<Setting<?>, Object> updates) throws java.io.IOException {
        if (!Utils.isMainProcess()) {
            throw new java.io.IOException("Persistent settings are writable only from the main process");
        }
        Map<Setting<?>, Object> previous = new HashMap<>();
        Map<Setting<?>, Object> previousSaved = new HashMap<>();
        Map<Setting<?>, Object> previousStored = new HashMap<>();
        Map<Setting<?>, Object> bounded = new HashMap<>();
        for (var entry : updates.entrySet()) {
            Setting setting = entry.getKey();
            Object next = entry.getValue();
            Class<?> type = setting.defaultValue instanceof Enum
                    ? ((Enum) setting.defaultValue).getDeclaringClass() : setting.defaultValue.getClass();
            if (next == null || !type.isInstance(next)) {
                throw new IllegalArgumentException("Invalid value for " + setting.key);
            }
            // A backup file is not a dialog and was never asked to stay in range. Into a copy
            // rather than back into the caller's map, which need not accept being written to.
            bounded.put(setting, setting.coerce(next));
            previous.put(setting, setting.savedValue());
        }
        Map<String, ?> storedBefore = preferences.preferences.getAll();
        for (Setting<?> setting : bounded.keySet()) {
            previousStored.put(setting, storedBefore.get(setting.key));
            previousSaved.put(setting, setting.storedValue());
            ((Setting) setting).lastSavedValue = previousSaved.get(setting);
            setting.lastSavedStoredValue = previousStored.get(setting);
        }
        savedWritesInProgress++;
        try {
            Throwable failure = null;
            boolean committing = false;
            try {
                var editor = stage(bounded);
                committing = true;
                if (editor.commit()) {
                    Map<String, ?> savedStored = preferences.preferences.getAll();
                    for (var entry : bounded.entrySet()) {
                        if (!entry.getValue().equals(previousSaved.get(entry.getKey()))) {
                            entry.getKey().savedWriteRevision++;
                        }
                        ((Setting) entry.getKey()).lastSavedValue = entry.getValue();
                        entry.getKey().lastSavedStoredValue = savedStored.get(entry.getKey().key);
                    }
                    return;
                }
            } catch (RuntimeException thrown) {
                // An editor that wouldn't open, a value it refused or a commit that threw.
                failure = thrown;
            }
            boolean restored = true;
            for (var entry : previous.entrySet()) ((Setting) entry.getKey()).value = entry.getValue();
            if (committing) {
                // A commit that failed may still have landed, so the values from before are written back.
                try {
                    restored = restoreStored(previousStored).commit();
                } catch (RuntimeException thrown) {
                    restored = false;
                }
            }
            boolean storageMatches = true;
            try {
                Map<String, ?> surviving = preferences.preferences.getAll();
                for (var entry : previousStored.entrySet()) {
                    if (!Objects.equals(entry.getValue(), surviving.get(entry.getKey().key))) storageMatches = false;
                }
            } catch (RuntimeException unreadable) {
                storageMatches = false;
            }
            restored &= storageMatches;
            // Exact recovery preserves the prior live value even when it was temporary. A partial
            // recovery adopts the surviving store, so hooks never run a value the failed batch lost.
            for (var entry : previous.entrySet()) {
                Setting setting = entry.getKey();
                setting.value = entry.getValue();
                try {
                    if (!storageMatches) {
                        setting.load();
                        setting.value = setting.coerce(setting.value);
                    }
                    setting.lastSavedValue = setting.storedValue();
                    setting.lastSavedStoredValue = preferences.preferences.getAll().get(setting.key);
                } catch (RuntimeException unreadable) {
                    setting.value = entry.getValue();
                    restored = false;
                }
            }
            throw new BatchFailed(restored, failure);
        } finally {
            savedWritesInProgress--;
        }
    }

    /** An editor holding [values], each already the setting's live value, so an import's page shows them. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private static android.content.SharedPreferences.Editor stage(Map<Setting<?>, Object> values) {
        var editor = preferences.preferences.edit();
        for (var entry : values.entrySet()) {
            Setting setting = entry.getKey();
            Object next = entry.getValue();
            setting.value = next;
            if (setting.defaultValue.equals(next)) editor.remove(setting.key);
            else if (next instanceof Boolean) editor.putBoolean(setting.key, (Boolean) next);
            else editor.putString(setting.key, next instanceof Enum ? ((Enum) next).name() : next.toString());
        }
        return editor;
    }

    /** Restores only the named keys, using the exact representation captured before their write. */
    @SuppressWarnings("unchecked")
    private static android.content.SharedPreferences.Editor restoreStored(Map<Setting<?>, Object> values) {
        var editor = preferences.preferences.edit();
        for (var entry : values.entrySet()) {
            String key = entry.getKey().key;
            Object stored = entry.getValue();
            if (stored == null) editor.remove(key);
            else if (stored instanceof Boolean) editor.putBoolean(key, (Boolean) stored);
            else if (stored instanceof String) editor.putString(key, (String) stored);
            else if (stored instanceof Integer) editor.putInt(key, (Integer) stored);
            else if (stored instanceof Long) editor.putLong(key, (Long) stored);
            else if (stored instanceof Float) editor.putFloat(key, (Float) stored);
            else if (stored instanceof Set) editor.putStringSet(key, (Set<String>) stored);
            else throw new IllegalArgumentException("Unknown stored preference type: " + key);
        }
        return editor;
    }

    /**
     * @return if this setting can be configured and used.
     */
    public boolean isAvailable() {
        return availability == null || availability.isAvailable();
    }

    /**
     * Get the parent Settings that this setting depends on.
     * @return List of parent Settings, or empty list if no dependencies exist.
     *         Defensive: handles null availability or missing getParentSettings() override.
     */
    public List<Setting<?>> getParentSettings() {
        return availability == null
                ? Collections.emptyList()
                : Objects.requireNonNullElse(availability.getParentSettings(), Collections.emptyList());
    }

    /**
     * @return if the currently set value is the same as {@link #defaultValue}.
     */
    public boolean isSetToDefault() {
        return value.equals(defaultValue);
    }

    @NonNull
    @Override
    public String toString() {
        return key + "=" + savedValue();
    }

    // region Import / export

}
