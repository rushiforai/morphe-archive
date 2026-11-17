// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.backup;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.Setting;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.settings.IncludedPatches;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * Export and import settings: BaconReader's settings, the patches' settings and the accounts' colors, in a YAML file
 * that both the Morphe and the Reseam patches read.
 */
@SuppressWarnings("unused")
public final class SettingsBackupPatch {
    /** The file's layout. A file with another {@code format} isn't read. */
    private static final int FORMAT = 1;
    private static final String KEY_FORMAT = "format";
    private static final String SECTION_BACONREADER = "baconreader";
    private static final String SECTION_PATCHES = "patches";
    private static final String SECTION_ACCOUNT_COLORS = "account_colors";

    // A settings file is a few kilobytes; anything much bigger was picked by mistake.
    private static final int MAX_FILE_BYTES = 1024 * 1024;

    // For any other type, Android's file providers add the type's extension to the name: ".yaml.txt".
    private static final String FILE_TYPE = "application/octet-stream";

    /** The patches' own file, where Account colors keeps each account's color. */
    private static final String PATCHES_PREFERENCES = "baconreader_patches";
    private static final String ACCOUNT_COLOR_PREFIX = "account_colors.color.";

    /** The settings' keys start with it; the file names them without it, as the Reseam patches do. */
    private static final String KEY_PREFIX = "revanced_baconreader_";

    /**
     * BaconReader's preferences that aren't settings: its accounts and logins (older versions kept them here, before
     * moving them to the database), and what it keeps about this device and install. They are neither exported nor
     * changed by an import.
     */
    private static final Set<String> PRIVATE_KEYS = new HashSet<>(Arrays.asList(
            "accounts",
            "username",
            "device_identifier",
            "DataId",
            "firstLaunchTs",
            "LastAppVersion",
            "app_retained",
            "timeSessionTotal",
            "lastNotifiedMessageTime",
            "RedGifsExpireTime",
            "SHOW_REVIEW_TS",
            "reviewVisible",
            "WhatsNewDialogShownNew",
            "KEY_ALREADY_SHOWN",
            // The analytics key BaconReader stores, and its flag to clear its cache once.
            "FLURRY_KEY",
            "clear_app_data_cache",
            // A folder Android gave this install access to, which another one can't use.
            "storage_uri",
            "storage_image"
    ));

    // The ads' consent strings, kept by their libraries in the same file.
    private static final String[] PRIVATE_PREFIXES = {"IABTCF_", "IABGPP_", "IABUSPrivacy"};

    private SettingsBackupPatch() {
    }

    /** Called by the "Export settings" row: asks where to save the file. */
    public static void exportSettings(Activity activity) {
        try {
            String date = new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT).format(new Date());
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType(FILE_TYPE)
                    .putExtra(Intent.EXTRA_TITLE, "baconreader-settings-" + date + ".yaml");
            DocumentRequest.start(activity, intent, true);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not export the settings", ex);
        }
    }

    /** Called by the "Import settings" row: asks for the file. */
    public static void importSettings(Activity activity) {
        try {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*");
            DocumentRequest.start(activity, intent, false);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not import the settings", ex);
        }
    }

    static void exportTo(Activity activity, Uri uri) {
        try {
            byte[] bytes = export(activity).getBytes(StandardCharsets.UTF_8);
            try (OutputStream stream = activity.getContentResolver().openOutputStream(uri, "wt")) {
                if (stream == null) throw new IOException("The file can't be written");
                stream.write(bytes);
            }
            Toast.makeText(activity, str("revanced_baconreader_settings_backup_exported", displayName(activity, uri)),
                    Toast.LENGTH_LONG).show();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not export the settings", ex);
            Toast.makeText(activity, str("revanced_baconreader_settings_backup_export_failed", String.valueOf(ex.getMessage())),
                    Toast.LENGTH_LONG).show();
        }
    }

    static void importFrom(Activity activity, Uri uri) {
        String name = displayName(activity, uri);
        Map<String, Map<String, Object>> file;
        try {
            file = read(activity, uri);
        } catch (SettingsYaml.SettingsYamlException ex) {
            showFailure(activity, str("revanced_baconreader_settings_backup_bad_line",
                    String.valueOf(ex.line), ex.getMessage()));
            return;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not read " + name, ex);
            return;
        }
        if (file == null) {
            showFailure(activity, str("revanced_baconreader_settings_backup_not_a_backup"));
            return;
        }
        int count = 0;
        for (Map<String, Object> section : file.values()) count += section.size();
        final Map<String, Map<String, Object>> settings = file;
        new AlertDialog.Builder(activity)
                .setTitle(str("revanced_baconreader_settings_backup_import_title"))
                .setMessage(str("revanced_baconreader_settings_backup_import_message", name, String.valueOf(count)))
                .setPositiveButton(str("revanced_baconreader_settings_backup_import"), (dialog, which) -> {
                    try {
                        apply(activity, settings);
                        Utils.restartApp(activity);
                    } catch (Exception ex) {
                        ErrorDialog.printException(() -> "Could not import the settings", ex);
                    }
                })
                .setNegativeButton(str("revanced_baconreader_settings_backup_cancel"), null)
                .show();
    }

    private static void showFailure(Activity activity, String message) {
        new AlertDialog.Builder(activity)
                .setTitle(str("revanced_baconreader_settings_backup_import_failed"))
                .setMessage(message)
                .setNegativeButton(str("revanced_baconreader_settings_backup_close"), null)
                .show();
    }

    private static String export(Context context) {
        SettingsYaml.Document document = new SettingsYaml.Document();
        document.scalars.put(KEY_FORMAT, FORMAT);

        Map<String, Object> baconReader = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        for (Map.Entry<String, ?> entry : appPreferences(context).getAll().entrySet()) {
            if (entry.getValue() != null && isExported(entry.getKey())) {
                baconReader.put(entry.getKey(), entry.getValue());
            }
        }
        document.maps.put(SECTION_BACONREADER, baconReader);

        Map<String, Object> patches = new LinkedHashMap<>();
        for (Setting<?> setting : patchSettings()) patches.put(name(setting), setting.get());
        document.maps.put(SECTION_PATCHES, patches);

        Map<String, Object> accountColors = new TreeMap<>();
        for (Map.Entry<String, ?> entry : patchesPreferences(context).getAll().entrySet()) {
            if (entry.getKey().startsWith(ACCOUNT_COLOR_PREFIX) && entry.getValue() instanceof Integer) {
                accountColors.put(entry.getKey().substring(ACCOUNT_COLOR_PREFIX.length()), entry.getValue());
            }
        }
        document.maps.put(SECTION_ACCOUNT_COLORS, accountColors);

        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ROOT).format(new Date());
        return SettingsYaml.write(Arrays.asList(
                "BaconReader settings, exported on " + date + " by the BaconReader patches "
                        + Utils.getPatchesReleaseVersion() + " (Morphe).",
                "Import them in BaconReader: Settings > Patches > Backup > Import settings.",
                "Accounts, logins and what BaconReader keeps about this device are not in this file."
        ), document);
    }

    /** The file's sections, or null when it isn't a settings file. */
    private static Map<String, Map<String, Object>> read(Context context, Uri uri)
            throws IOException, SettingsYaml.SettingsYamlException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (InputStream stream = context.getContentResolver().openInputStream(uri)) {
            if (stream == null) throw new IOException("The file can't be read");
            byte[] buffer = new byte[8192];
            int read;
            while ((read = stream.read(buffer)) != -1) {
                bytes.write(buffer, 0, read);
                if (bytes.size() > MAX_FILE_BYTES) return null;
            }
        }
        SettingsYaml.Document document = SettingsYaml.read(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
        if (!Integer.valueOf(FORMAT).equals(document.scalars.get(KEY_FORMAT))) return null;
        Map<String, Map<String, Object>> sections = new LinkedHashMap<>();
        for (String section : new String[]{SECTION_BACONREADER, SECTION_PATCHES, SECTION_ACCOUNT_COLORS}) {
            Map<String, Object> values = document.maps.get(section);
            if (values != null) sections.put(section, values);
        }
        return sections;
    }

    /**
     * Replaces each section the file has. A setting it doesn't list goes back to its default, so the result is the
     * exported settings, whatever was set before.
     */
    private static void apply(Context context, Map<String, Map<String, Object>> file) {
        Map<String, Object> baconReader = file.get(SECTION_BACONREADER);
        if (baconReader != null) {
            SharedPreferences preferences = appPreferences(context);
            Map<String, ?> current = preferences.getAll();
            SharedPreferences.Editor editor = preferences.edit();
            for (String key : current.keySet()) {
                if (isExported(key) && !baconReader.containsKey(key)) editor.remove(key);
            }
            for (Map.Entry<String, Object> entry : baconReader.entrySet()) {
                String key = entry.getKey();
                if (!isExported(key)) continue;
                Object converted = convert(entry.getValue(), current.get(key));
                if (converted == null) {
                    Logger.printInfo(() -> "Skipped " + key + ": " + entry.getValue() + " doesn't fit " + current.get(key));
                } else {
                    put(editor, key, converted);
                }
            }
            editor.commit();
        }

        Map<String, Object> patches = file.get(SECTION_PATCHES);
        if (patches != null) {
            for (Setting<?> setting : patchSettings()) {
                Object value = patches.get(name(setting));
                if (setting instanceof BooleanSetting) {
                    Object converted = value == null ? null : convert(value, Boolean.FALSE);
                    ((BooleanSetting) setting).save(converted instanceof Boolean
                            ? (Boolean) converted : ((BooleanSetting) setting).defaultValue);
                } else if (setting instanceof IntegerSetting) {
                    IntegerSetting integer = (IntegerSetting) setting;
                    Object converted = value == null ? null : convert(value, 0);
                    Integer choices = CHOICES.get(setting);
                    boolean valid = converted instanceof Integer
                            && (choices == null || ((Integer) converted >= 0 && (Integer) converted < choices));
                    integer.save(valid ? (Integer) converted : integer.defaultValue);
                } else {
                    @SuppressWarnings("unchecked")
                    Setting<String> text = (Setting<String>) setting;
                    text.save(value == null || value instanceof Set ? text.defaultValue : String.valueOf(value));
                }
            }
            // The settings are saved in the background, and the restart doesn't wait for them.
            context.getSharedPreferences(Setting.preferences.name, Context.MODE_PRIVATE).edit().commit();
        }

        Map<String, Object> accountColors = file.get(SECTION_ACCOUNT_COLORS);
        if (accountColors != null) {
            SharedPreferences preferences = patchesPreferences(context);
            SharedPreferences.Editor editor = preferences.edit();
            for (String key : preferences.getAll().keySet()) {
                if (key.startsWith(ACCOUNT_COLOR_PREFIX)) editor.remove(key);
            }
            for (Map.Entry<String, Object> entry : accountColors.entrySet()) {
                Object color = convert(entry.getValue(), 0);
                if (color instanceof Integer) {
                    editor.putInt(ACCOUNT_COLOR_PREFIX + entry.getKey().toLowerCase(Locale.ROOT), (Integer) color);
                }
            }
            editor.commit();
        }
    }

    /** The lists' numbers of entries, as the settings screen shows them: a value must be one of them. */
    private static final Map<Setting<?>, Integer> CHOICES = new LinkedHashMap<>();

    static {
        CHOICES.put(Settings.USER_AVATAR_SIZE, 4);
        CHOICES.put(Settings.AUTO_LOAD_MORE_COMMENTS, 6);
    }

    /** The settings of the applied patches, as the settings screen shows them. */
    private static List<Setting<?>> patchSettings() {
        List<Setting<?>> settings = new ArrayList<>();
        if (IncludedPatches.accountColors()) {
            settings.add(Settings.ACCOUNT_COLORS);
        }
        if (IncludedPatches.userAvatars()) {
            Collections.addAll(settings, Settings.USER_AVATARS, Settings.USER_AVATAR_SIZE, Settings.USER_AVATAR_BACKGROUND);
        }
        if (IncludedPatches.redditChat()) {
            settings.add(Settings.CHECK_CHAT_MESSAGES);
        }
        if (IncludedPatches.openWebPagesInBrowser()) {
            settings.add(Settings.OPEN_WEB_PAGES_IN_BROWSER);
        }
        if (IncludedPatches.improvePostMediaLoading()) {
            Collections.addAll(settings, Settings.LOADING_PREVIEW, Settings.LINK_PREVIEW_JAVASCRIPT,
                    Settings.LINK_PREVIEW_JAVASCRIPT_BLOCKED, Settings.LINK_PREVIEW_JAVASCRIPT_ALLOWED);
        }
        if (IncludedPatches.videoAutoplayInDetailView()) {
            settings.add(Settings.AUTOPLAY_VIDEOS_IN_DETAIL_VIEW);
        }
        if (IncludedPatches.loadMoreComments()) {
            Collections.addAll(settings, Settings.COMMENT_LIMIT, Settings.AUTO_LOAD_MORE_COMMENTS);
        }
        if (IncludedPatches.embedCommentImages()) {
            Collections.addAll(settings, Settings.SHOW_IMAGES, Settings.IMAGES_FULL_WIDTH,
                    Settings.IMAGES_LONG_PRESS_DOWNLOAD, Settings.IMAGES_WIFI_ONLY, Settings.IMAGES_TAP_TO_LOAD,
                    Settings.SHOW_VIDEOS, Settings.YOUTUBE_TITLES, Settings.YOUTUBE_THUMBNAILS, Settings.X_POSTS,
                    Settings.BLUESKY_POSTS);
        }
        return settings;
    }

    /** The name in the file, the same for both patchers: the key without its prefix. */
    private static String name(Setting<?> setting) {
        return setting.key.startsWith(KEY_PREFIX) ? setting.key.substring(KEY_PREFIX.length()) : setting.key;
    }

    private static boolean isExported(String key) {
        if (PRIVATE_KEYS.contains(key)) return false;
        for (String prefix : PRIVATE_PREFIXES) {
            if (key.startsWith(prefix)) return false;
        }
        return !key.toLowerCase(Locale.ROOT).contains("token");
    }

    /** {@code value} as the type of {@code like}, the value the key has now; null when it can't be. */
    private static Object convert(Object value, Object like) {
        if (like == null) return value;
        try {
            if (like instanceof Boolean) {
                if (value instanceof Boolean) return value;
                if (value instanceof String) {
                    String text = ((String) value).toLowerCase(Locale.ROOT);
                    if (text.equals("true")) return Boolean.TRUE;
                    if (text.equals("false")) return Boolean.FALSE;
                }
                return null;
            }
            if (like instanceof Integer) {
                if (value instanceof Integer) return value;
                if (value instanceof Long) {
                    long number = (Long) value;
                    return number >= Integer.MIN_VALUE && number <= Integer.MAX_VALUE ? (int) number : null;
                }
                if (value instanceof String) return Integer.parseInt(((String) value).trim());
                return null;
            }
            if (like instanceof Long) {
                if (value instanceof Integer) return ((Integer) value).longValue();
                if (value instanceof Long) return value;
                if (value instanceof String) return Long.parseLong(((String) value).trim());
                return null;
            }
            if (like instanceof Float) {
                if (value instanceof Float) return value;
                if (value instanceof Integer) return ((Integer) value).floatValue();
                if (value instanceof Long) return ((Long) value).floatValue();
                if (value instanceof String) return Float.parseFloat(((String) value).trim());
                return null;
            }
            if (like instanceof String) return value instanceof Set ? null : String.valueOf(value);
            if (like instanceof Set) return value instanceof Set ? value : null;
        } catch (NumberFormatException ex) {
            return null;
        }
        return null;
    }

    private static void put(SharedPreferences.Editor editor, String key, Object value) {
        if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else if (value instanceof Set) {
            Set<String> items = new LinkedHashSet<>();
            for (Object item : (Set<?>) value) items.add(String.valueOf(item));
            editor.putStringSet(key, items);
        } else editor.putString(key, String.valueOf(value));
    }

    private static SharedPreferences appPreferences(Context context) {
        return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    private static SharedPreferences patchesPreferences(Context context) {
        return context.getSharedPreferences(PATCHES_PREFERENCES, Context.MODE_PRIVATE);
    }

    private static String displayName(Context context, Uri uri) {
        try (Cursor cursor = context.getContentResolver()
                .query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null) return name;
            }
        } catch (Exception ignored) {
            // The file's address names it too.
        }
        String last = uri.getLastPathSegment();
        return last != null ? last : uri.toString();
    }
}
