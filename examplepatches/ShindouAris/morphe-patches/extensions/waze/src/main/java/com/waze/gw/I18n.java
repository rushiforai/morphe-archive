package com.waze.gw;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Mod translations. Code refers to a text by a stable ID ({@code "settings.not_connected"}); every language,
 * Vietnamese included, is a pack that maps IDs to text.
 *
 * <ul>
 * <li>UI ({@link #tr}): the language Waze shows. No pack for it -> English; an ID missing from its pack -> English,
 *     then Vietnamese, then the ID itself.</li>
 * <li>TTS ({@link #ttsText}): the language of the voice selected in Waze, which is independent of the UI language.
 *     No translation -> null, and {@link WazeTtsBridge} stays silent rather than read the wrong language.</li>
 * </ul>
 *
 * Packs are bundled JSON ({@code assets/i18n/<tag>.json}: {@code {"lang":"en","strings":{"id":"text"}}}); a pack
 * the user imported ({@code files/i18n/<tag>.json}) overrides or adds to the bundled one. English is the base: a
 * pack entry whose ID is not in English, or whose {n}/printf placeholders differ from it, is ignored.
 */
final class I18n {
    private static final String TAG = "WazeGW-I18n";
    private static final long RESOLVE_MS = 5000L;
    private static final int MAX_PACK_BYTES = 2 * 1024 * 1024;

    private static final Map<String, Map<String, String>> packs = new ConcurrentHashMap<String, Map<String, String>>();
    private static final Map<String, String> NO_PACK = new HashMap<String, String>();

    private static volatile String uiTag = "vi";
    private static volatile long uiAt;
    private static volatile String voiceTag;
    private static volatile long voiceAt;
    private static volatile Map<String, String> voiceLocales;
    private static volatile long voiceFileStamp = -1L;
    private static volatile String lastSilent = "";

    private I18n() { }

    // ---- UI ---------------------------------------------------------------------------------------------------

    /** UI text for an ID, in the language Waze shows. */
    static String tr(String id) {
        if (id == null) return null;
        return resolve(uiTag(), id);
    }

    /** UI text with {0}, {1}... placeholders. */
    static String f(String id, Object... args) {
        return I18nText.format(tr(id), args);
    }

    /** Vietnamese text for an ID, whatever the UI language (e.g. text that goes to Vietnamese map editors). */
    static String vi(String id) {
        return id == null ? null : resolve("vi", id);
    }

    /**
     * Language of the comment sent to the map editors with a report: Vietnamese in Vietnam, otherwise the language of
     * the UI (English when that is Vietnamese or has no report texts of its own).
     */
    static String reportTag() {
        if (Region.inVietnam()) return "vi";
        String ui = uiTag();
        return "vi".equals(ui) ? "en" : ui;
    }

    /** A report comment: the text of {@code id} in the report language, then the "[Reported from WazeMod]" tag. */
    static String reportComment(String id, Object... args) {
        String tag = reportTag();
        return I18nText.format(resolve(tag, id), args) + " " + resolve(tag, "comment.tag");
    }

    /** Text in {@code tag}, then English, then Vietnamese, then the ID itself (never null, never blank). */
    private static String resolve(String tag, String id) {
        String text = lookup(tag, id);
        if (text == null && !"en".equals(tag)) text = lookup("en", id);
        if (text == null && !"vi".equals(tag)) text = lookup("vi", id);
        return text != null ? text : id;
    }

    /** The tag the UI is shown in: vi, a tag that has a pack, or en. */
    static String uiTag() {
        long now = System.currentTimeMillis();
        if (now - uiAt < RESOLVE_MS) return uiTag;
        String locale = wazeLocaleTag();
        if (locale == null) {
            // Waze is not ready yet (start-up): use the language it had last time rather than assuming Vietnamese.
            restoreLastUi();
            return uiTag;
        }
        uiTag = supportedOrEnglish(locale);
        uiAt = now;
        rememberUi(uiTag);
        return uiTag;
    }

    private static final String UI_PREFS = "waze_hud_gw";
    private static final String UI_PREF_KEY = "i18n_ui_tag";
    private static volatile boolean uiRestored;
    private static volatile String savedUiTag;

    private static void restoreLastUi() {
        if (uiRestored) return;
        Context app = app();
        if (app == null) return;
        uiRestored = true;
        try {
            String saved = app.getSharedPreferences(UI_PREFS, Context.MODE_PRIVATE).getString(UI_PREF_KEY, null);
            if (saved != null && saved.length() > 0) {
                savedUiTag = saved;
                uiTag = saved;
            }
        } catch (Throwable ignored) { }
    }

    private static void rememberUi(String tag) {
        if (tag.equals(savedUiTag)) return;
        Context app = app();
        if (app == null) return;
        try {
            app.getSharedPreferences(UI_PREFS, Context.MODE_PRIVATE).edit().putString(UI_PREF_KEY, tag).apply();
            savedUiTag = tag;
        } catch (Throwable ignored) { }
    }

    // ---- TTS --------------------------------------------------------------------------------------------------

    /** Spoken text for the selected voice, or null when there is no translation (stay silent). */
    static String ttsText(String id) {
        if (id == null) return null;
        String tag = voiceTag();
        if (tag == null) return silent("unknown voice language", id);
        if (!voiceIsTts) return silent("recorded voice, no TTS", id);
        String text = lookup(tag, id);
        return text != null ? text : silent("no " + tag + " translation", id);
    }

    /**
     * False while Waze has a recorded (PROMPT) voice selected: such a voice cannot speak free text (it does not even
     * read street names), so Mod prompts and the Mod's built-in clips stay silent (the user's own recordings still
     * play). True when it is a TTS voice or Waze's voice type cannot be read.
     */
    static boolean voiceCanSpeak() {
        voiceTag();   // refreshes voiceIsTts
        return voiceIsTts;
    }

    private static volatile boolean voiceIsTts = true;

    /** Spoken text with placeholders, or null to stay silent. */
    static String ttsFormat(String id, Object... args) {
        String text = ttsText(id);
        return text == null ? null : I18nText.format(text, args);
    }

    /** Language tag of the voice Waze will speak with, null when it cannot be determined. */
    static String voiceTag() {
        long now = System.currentTimeMillis();
        if (now - voiceAt < RESOLVE_MS && voiceAt != 0L) return voiceTag;
        String tag = null;
        boolean tts = true;
        String source = "none";
        try {
            // Waze's own record of the selected voice carries its language; it follows a change of voice at once.
            // The config id + legacy CSV below only knows the old TTS catalog, and ends up at a stale default for
            // the newer voices, which is why a changed voice language used to change nothing.
            String[] asset = selectedVoiceAsset();
            if (asset != null) {
                tag = I18nText.tagForVoiceLocale(blankToNull(asset[1]));
                if (tag == null) tag = I18nText.tagForVoiceLocale(blankToNull(asset[2]));
                if (tag != null) source = "voice asset id=" + asset[0] + " locale=" + asset[1] + " lang=" + asset[2];
            }
            Map<String, String> locales = voiceCatalog();
            String id = Gateway.cfgString("CONFIG_VALUE_VOICES_SELECTED_VOICE_ID");
            String locale = locales == null || id.length() == 0 ? null : locales.get(id);
            // Only Waze's own record of the selected voice says it is a recorded (PROMPT) one; not finding the id in
            // the TTS catalog proves nothing (the default voice, custom ids), so an unknown voice counts as TTS.
            Boolean prompt = selectedVoiceIsPrompt();
            tts = prompt == null || !prompt.booleanValue();
            if (tag != null) {
                // language already known from the selected voice
            } else if (locale == null && !tts) {
                tag = I18nText.tagForPromptName(id);   // a recorded voice's id is its prompt name ("vietnamese")
                if (tag != null) source = "prompt name " + id;
            } else if (locale == null && locales != null) {
                // Nothing selected yet: Waze falls back to its TTS voice id.
                String ttsId = Gateway.cfgString("CONFIG_VALUE_TTS_VOICE_ID");
                locale = ttsId.length() == 0 ? null : locales.get(ttsId);
                if (locale != null) source = "TTS voice id " + ttsId + " locale=" + locale;
            } else if (locale != null) {
                source = "catalog id " + id + " locale=" + locale;
            }
            if (tag == null) tag = I18nText.tagForVoiceLocale(locale);
            if (tag == null) {
                String promptName = Gateway.cfgString("CONFIG_VALUE_PROMPTS_PROMPT_NAME");
                tag = I18nText.tagForPromptName(promptName);
                if (tag != null) source = "prompt set " + promptName;
            }
        } catch (Throwable t) {
            Log.w(TAG, "voice language lookup failed: " + t);
        }
        if (tts != voiceIsTts) Log.i(TAG, "selected voice " + (tts ? "can" : "cannot") + " speak Mod prompts");
        String logged = String.valueOf(tag);
        if (!logged.equals(lastVoiceLogged)) {
            lastVoiceLogged = logged;
            Log.i(TAG, "voice language -> " + logged + " (" + source + ")");
        }
        voiceIsTts = tts;
        voiceTag = tag;
        voiceAt = now;
        return tag;
    }

    private static volatile String lastVoiceLogged = "";

    private static String blankToNull(String s) {
        return s == null || s.trim().length() == 0 ? null : s.trim();
    }

    /**
     * The voice Waze has selected, from its voice repository (the repository object -> Voice state c() -> VoiceAsset a()):
     * {id, locale, lang}, or null when it cannot be read (not created yet, other Waze version). The methods are looked
     * up on the object's own class: the interface it is registered as does not declare them.
     */
    private static String[] selectedVoiceAsset() {
        for (String name : new String[]{"com.waze.sound.b.c", "com.waze.sound.b.a"}) {
            try {
                Object repository = WazeKoin.get(Class.forName(name));
                if (repository == null) continue;
                Object state = repository.getClass().getMethod("c").invoke(repository);
                if (state == null) continue;
                Object voice = state.getClass().getMethod("a").invoke(state);
                if (voice == null) continue;
                Class<?> type = voice.getClass();
                Object id = type.getMethod("f").invoke(voice);
                Object locale = type.getMethod("h").invoke(voice);              // e.g. ja-JA
                Object lang = type.getMethod("g").invoke(voice);
                return new String[]{id == null ? "" : id.toString(), locale == null ? "" : locale.toString(),
                        lang == null ? "" : lang.toString()};
            } catch (Throwable ignored) {
                // try the next registration
            }
        }
        return null;
    }

    /**
     * True/false from Waze's voice repository (com.waze.sound.b.a -> selected voice -> type TTS or PROMPT);
     * null when it cannot be read (not created yet, other Waze version).
     */
    private static Boolean selectedVoiceIsPrompt() {
        try {
            Class<?> api = Class.forName("com.waze.sound.b.a");
            Object repository = WazeKoin.get(api);
            if (repository == null) return null;
            Object state = api.getMethod("c").invoke(repository);
            if (state == null) return null;
            Object voice = state.getClass().getMethod("a").invoke(state);
            if (voice == null) return null;
            Object type = voice.getClass().getMethod("d").invoke(voice);
            if (!(type instanceof Enum)) return null;
            return Boolean.valueOf("PROMPT".equals(((Enum<?>) type).name()));
        } catch (Throwable t) {
            return null;
        }
    }

    /** Waze's own voice catalog: voice id -> locale (waze/tts/voices_was_tts.csv in the app data directory). */
    private static Map<String, String> voiceCatalog() {
        try {
            Context app = app();
            if (app == null) return voiceLocales;
            File file = new File(app.getFilesDir().getParentFile(), "waze/tts/voices_was_tts.csv");
            long stamp = file.exists() ? file.lastModified() + file.length() : -2L;
            if (stamp == voiceFileStamp && voiceLocales != null) return voiceLocales;
            Map<String, String> parsed = new HashMap<String, String>();
            if (stamp != -2L) {
                String text = new String(readAll(new FileInputStream(file), 256 * 1024), "UTF-8");
                for (String line : text.split("\r?\n")) {
                    String[] row = I18nText.parseVoiceRow(line);
                    if (row != null) parsed.put(row[0], row[1]);
                }
            }
            voiceLocales = parsed;
            voiceFileStamp = stamp;
            return parsed;
        } catch (Throwable t) {
            Log.w(TAG, "voice catalog unreadable: " + t);
            return voiceLocales;
        }
    }

    private static String silent(String why, String id) {
        String key = why + "|" + id;
        if (!key.equals(lastSilent)) {
            lastSilent = key;
            Log.i(TAG, "TTS silent (" + why + "): " + id);
        }
        return null;
    }

    // ---- packs ------------------------------------------------------------------------------------------------

    private static String lookup(String tag, String id) {
        String pack = packTagFor(tag);
        if (pack == null) return null;
        return pack(pack).get(id);
    }

    /** The pack tag to use for a language tag (exact, then language-only), or null when none exists. */
    private static String packTagFor(String tag) {
        if (tag == null) return null;
        if (hasPack(tag)) return tag;
        String lang = I18nText.languageOf(tag);
        if (lang != null && !lang.equals(tag) && hasPack(lang)) return lang;
        return null;
    }

    private static String supportedOrEnglish(String tag) {
        String pack = packTagFor(tag);
        return pack != null ? pack : "en";
    }

    private static boolean hasPack(String tag) {
        return pack(tag) != NO_PACK;
    }

    private static Map<String, String> pack(String tag) {
        Map<String, String> loaded = packs.get(tag);
        if (loaded != null) return loaded;
        synchronized (packs) {
            loaded = packs.get(tag);
            if (loaded == null) {
                if (app() == null) return NO_PACK;   // too early: do not remember "no pack"
                loaded = load(tag);
                packs.put(tag, loaded);
            }
            return loaded;
        }
    }

    /** Bundled pack first, then the user's pack on top of it. */
    private static Map<String, String> load(String tag) {
        Map<String, String> merged = new HashMap<String, String>();
        boolean found = false;
        Context app = app();
        if (app == null) return NO_PACK;
        Map<String, String> base = "en".equals(tag) ? null : bundledEnglish(app);
        try {
            InputStream in = app.getAssets().open("i18n/" + tag + ".json");
            found |= readPack(readAll(in, MAX_PACK_BYTES), merged, tag, "bundled", base);
        } catch (java.io.FileNotFoundException ignored) {
            // no bundled pack for this tag
        } catch (Throwable t) {
            if (!(t instanceof java.io.IOException)) Log.w(TAG, "bundled pack " + tag + " failed: " + t);
        }
        try {
            File user = new File(new File(app.getFilesDir(), "i18n"), tag + ".json");
            if (user.isFile() && user.length() <= MAX_PACK_BYTES) {
                found |= readPack(readAll(new FileInputStream(user), MAX_PACK_BYTES), merged, tag, "user",
                        base != null ? base : bundledEnglish(app));
            }
        } catch (Throwable t) {
            Log.w(TAG, "user pack " + tag + " failed: " + t);
        }
        return found ? merged : NO_PACK;
    }

    /** The bundled English pack: the list of valid IDs and the placeholders each one must keep. */
    private static Map<String, String> bundledEnglish(Context app) {
        Map<String, String> english = bundledEn;
        if (english != null) return english;
        english = new HashMap<String, String>();
        try {
            readPack(readAll(app.getAssets().open("i18n/en.json"), MAX_PACK_BYTES), english, "en", "base", null);
        } catch (Throwable t) {
            Log.w(TAG, "English base pack failed: " + t);
        }
        bundledEn = english;
        return english;
    }

    private static volatile Map<String, String> bundledEn;

    /**
     * Adds the usable entries of a pack file to {@code into}. With a {@code base} (the English pack) an entry
     * must use a known ID and the same placeholders as the English text.
     */
    private static boolean readPack(byte[] bytes, Map<String, String> into, String tag, String origin,
            Map<String, String> base) {
        try {
            JSONObject root = new JSONObject(new String(bytes, "UTF-8"));
            JSONObject strings = root.getJSONObject("strings");
            int added = 0, rejected = 0;
            Iterator<String> keys = strings.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String value = strings.optString(key, null);
                if (value == null || value.length() == 0 || value.length() > 2000) { rejected++; continue; }
                if (base != null) {
                    String english = base.get(key);
                    if (english == null || !I18nText.samePlaceholders(english, value)) { rejected++; continue; }
                }
                into.put(key, value);
                added++;
            }
            Log.i(TAG, origin + " pack " + tag + ": " + added + " strings" + (rejected > 0 ? ", " + rejected + " rejected" : ""));
            return true;
        } catch (Throwable t) {
            Log.w(TAG, origin + " pack " + tag + " unreadable: " + t);
            return false;
        }
    }

    // ---- user packs -------------------------------------------------------------------------------------------

    /**
     * Installs a language file the user picked. Returns null on success or a short reason. The file is checked
     * (size, JSON, language tag, placeholders per entry) and stored as files/i18n/&lt;tag&gt;.json.
     */
    static String importPack(Context context, InputStream in) {
        try {
            byte[] bytes = readAll(in, MAX_PACK_BYTES);
            JSONObject root = new JSONObject(new String(bytes, "UTF-8"));
            String lang = root.optString("lang", "").trim();
            if (lang.length() == 0 || lang.length() > 12 || !lang.matches("[A-Za-z]{2,3}(-[A-Za-z0-9]{2,8})?")) {
                return "core.missing_or_invalid_lang_field";
            }
            JSONObject strings = root.getJSONObject("strings");
            Map<String, String> english = bundledEnglish(context.getApplicationContext());
            JSONObject clean = new JSONObject();
            Iterator<String> keys = strings.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String value = strings.optString(key, "");
                String base = english.get(key);
                if (base != null && value.length() > 0 && value.length() <= 2000
                        && I18nText.samePlaceholders(base, value)) {
                    clean.put(key, value);
                }
            }
            if (clean.length() == 0) return "core.no_valid_strings";
            String tag = lang.contains("-") ? I18nText.tagForVoiceLocale(lang) : I18nText.tagFor(lang, "");
            if (tag == null) return "core.this_language_cant_be_used";
            JSONObject out = new JSONObject();
            out.put("lang", tag);
            out.put("strings", clean);
            File dir = new File(context.getApplicationContext().getFilesDir(), "i18n");
            if (!dir.isDirectory() && !dir.mkdirs()) return "core.couldnt_create_the_folder";
            File target = new File(dir, tag + ".json");
            File temp = new File(dir, tag + ".json.tmp");
            FileOutputStream stream = new FileOutputStream(temp);
            try { stream.write(out.toString().getBytes("UTF-8")); } finally { stream.close(); }
            if (target.exists() && !target.delete()) { temp.delete(); return "core.couldnt_replace_the_old_file"; }
            if (!temp.renameTo(target)) { temp.delete(); return "core.couldnt_save_the_file"; }
            reset();
            return null;
        } catch (Throwable t) {
            Log.w(TAG, "language file rejected: " + t);
            return "core.invalid_file";
        }
    }

    /** Writes the English pack (every key with its English text) as a starting point for a new language file. */
    static boolean exportTemplate(Context context, java.io.OutputStream out) {
        try {
            byte[] bytes = readAll(context.getApplicationContext().getAssets().open("i18n/en.json"), MAX_PACK_BYTES);
            out.write(bytes);
            out.flush();
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "template export failed: " + t);
            return false;
        }
    }

    /** True when a pack exists for the tag (exact, or its language), i.e. the Mod can be shown/spoken in it. */
    static boolean hasTranslation(String tag) {
        return packTagFor(tag) != null;
    }

    /** Tag of the language Waze itself is displayed in (before any fallback), null while Waze is not ready. */
    static String wazeLanguageTag() {
        return wazeLocaleTag();
    }

    /** Forget cached packs and language decisions (after an import). */
    static void reset() {
        synchronized (packs) { packs.clear(); }
        uiAt = 0L;
        voiceAt = 0L;
    }

    // ---- plumbing ---------------------------------------------------------------------------------------------

    /** Tag of the language Waze is displayed in, null while Waze is not ready. */
    private static String wazeLocaleTag() {
        try {
            Object nm = Class.forName("com.waze.NativeManager").getMethod("getInstance").invoke(null);
            if (nm == null) return null;
            Object locale = nm.getClass().getMethod("getLocale").invoke(nm);
            if (!(locale instanceof java.util.Locale)) return null;
            java.util.Locale l = (java.util.Locale) locale;
            return I18nText.tagFor(l.getLanguage(), l.getCountry());
        } catch (Throwable t) {
            return null;
        }
    }

    private static Context app() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    private static byte[] readAll(InputStream in, int limit) throws java.io.IOException {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) > 0) {
                out.write(buffer, 0, n);
                if (out.size() > limit) throw new java.io.IOException("too large");
            }
            return out.toByteArray();
        } finally {
            try { in.close(); } catch (Throwable ignored) { }
        }
    }
}
