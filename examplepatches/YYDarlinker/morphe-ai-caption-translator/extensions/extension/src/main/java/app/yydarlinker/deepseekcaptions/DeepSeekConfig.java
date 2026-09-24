package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.SharedPreferences;

/** Persistent settings for the DeepSeek caption translator. */
final class DeepSeekConfig {
    private static final String PREFS = "deepseek_caption_translator";
    private static final String ENABLED = "enabled";
    private static final String CONTEXTUAL_UNIT_CORE = "contextual_unit_core";
    private static final String DISPLAY_TEXT_DEBUG = "display_text_debug";
    private static final String BASE_URL = "base_url";
    private static final String MODEL = "model";
    private static final String PROMPT = "prompt";
    private static final String CAPTION_TEXT_SIZE = "caption_text_size";
    private static final String BACKGROUND_OPACITY = "background_opacity";
    private static final String POSITION_PORTRAIT_Y = "position_portrait_y";
    private static final String POSITION_LANDSCAPE_Y = "position_landscape_y";

    static final String DEFAULT_BASE_URL = "https://api.deepseek.com";
    static final String DEFAULT_MODEL = "deepseek-v4-flash";
    private static final String LEGACY_CHINESE_PROMPT =
            "忠实、自然、简洁地翻译成简体中文；优先符合中文表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。";
    static final String DEFAULT_PROMPT =
            "忠实、自然、简洁；优先符合目标语言的母语表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。";
    static final int DEFAULT_CAPTION_TEXT_SIZE = 16;
    static final int MIN_CAPTION_TEXT_SIZE = 12;
    static final int MAX_CAPTION_TEXT_SIZE = 22;
    static final int DEFAULT_BACKGROUND_OPACITY = 70;
    static final boolean DEFAULT_CONTEXTUAL_UNIT_CORE = true;
    static final boolean DEFAULT_DISPLAY_TEXT_DEBUG = false;

    private DeepSeekConfig() {}

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // Preserve the existing entry on upgrade; visibility is independent of the caption engine.
    static boolean shortsFlyoutMenuEnabled(Context context) { return prefs(context).getBoolean("shorts_flyout_menu",true); }
    static void saveShortsFlyoutMenuEnabled(Context context, boolean visible) { prefs(context).edit().putBoolean("shorts_flyout_menu",visible).apply(); }
    static boolean flyoutMenuEnabled(Context context) { return prefs(context).getBoolean("flyout_menu",true); }
    static void saveFlyoutMenuEnabled(Context context, boolean visible) { prefs(context).edit().putBoolean("flyout_menu",visible).apply(); }
    static boolean enabled(Context context) { return prefs(context).getBoolean(ENABLED,false); }
    static Snapshot displayStyle(Context context) {
        SharedPreferences p=prefs(context);
        return new Snapshot(p.getBoolean(ENABLED,false),"","","",
            clampTextSize(p.getInt(CAPTION_TEXT_SIZE,DEFAULT_CAPTION_TEXT_SIZE)),
            clampOpacity(p.getInt(BACKGROUND_OPACITY,DEFAULT_BACKGROUND_OPACITY)),"");
    }
    static Snapshot load(Context context) {
        synchronized(ApiProfiles.LOCK) {
        SharedPreferences p = ApiProfiles.values(context);
        SharedPreferences global = prefs(context);
        String prompt = p.getString(PROMPT, "");
        // Absence is a dynamic default, not a Chinese string frozen into each profile.
        if (prompt == null || prompt.trim().isEmpty() || LEGACY_CHINESE_PROMPT.equals(prompt)
                || DEFAULT_PROMPT.equals(prompt)) prompt = defaultPrompt(context);
        return new Snapshot(
                global.getBoolean(ENABLED, false),
                safe(p.getString(BASE_URL, DEFAULT_BASE_URL), DEFAULT_BASE_URL),
                p.getString(MODEL, DEFAULT_MODEL),
                prompt,
                clampTextSize(global.getInt(CAPTION_TEXT_SIZE, DEFAULT_CAPTION_TEXT_SIZE)),
                clampOpacity(global.getInt(BACKGROUND_OPACITY, DEFAULT_BACKGROUND_OPACITY)),
                SecureApiKey.load(context)
        );
        }
    }

    static void saveEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(ENABLED, enabled).apply();
    }

    static boolean contextualUnitCoreEnabled(Context context) {
        return true; // This release has exactly one production core.
    }

    static void saveContextualUnitCoreEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(CONTEXTUAL_UNIT_CORE, enabled).apply();
    }

    static boolean displayTextDebugEnabled(Context context) {
        return prefs(context).getBoolean(DISPLAY_TEXT_DEBUG, DEFAULT_DISPLAY_TEXT_DEBUG);
    }

    static void saveDisplayTextDebugEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(DISPLAY_TEXT_DEBUG, enabled).apply();
        if(!enabled)CaptionQualityTrace.clear(context);
    }

    static void saveBaseUrl(Context context, String value) {
        String clean = value == null ? "" : value.trim();
        if (!(clean.startsWith("https://") || clean.startsWith("http://"))) {
            throw new IllegalArgumentException("API 地址必须以 https:// 或 http:// 开头");
        }
        synchronized(ApiProfiles.LOCK){String endpoint=ProviderEndpoint.validate(clean);SecureApiKey.bindLegacyOrigin(context);ApiProfiles.values(context).edit().putString(BASE_URL, endpoint).apply();}
    }

    static void saveModel(Context context, String value) {
        String clean = value == null ? "" : value.trim();
        if (clean.isEmpty()) throw new IllegalArgumentException("模型不能为空");
        synchronized(ApiProfiles.LOCK){ApiProfiles.values(context).edit().putString(MODEL, clean).apply();}
    }

    static String defaultPrompt(Context context) {
        return CaptionStrings.settings(context, "default_prompt");
    }

    static void savePrompt(Context context, String value) {
        String clean = value == null ? "" : value.trim();
        synchronized (ApiProfiles.LOCK) {
            SharedPreferences.Editor edit = ApiProfiles.values(context).edit();
            if (clean.isEmpty() || clean.equals(defaultPrompt(context)) || clean.equals(DEFAULT_PROMPT)
                    || clean.equals(LEGACY_CHINESE_PROMPT)) edit.remove(PROMPT);
            else edit.putString(PROMPT, clean);
            edit.apply();
        }
    }

    static void saveCaptionTextSize(Context context, int value) {
        prefs(context).edit().putInt(CAPTION_TEXT_SIZE, clampTextSize(value)).apply();
    }

    static void saveBackgroundOpacity(Context context, int value) {
        prefs(context).edit().putInt(BACKGROUND_OPACITY, clampOpacity(value)).apply();
    }

    static String defaultTargetLanguage(Context context) {
        return CaptionChoice.isOn() && CaptionChoice.translates() ? CaptionChoice.language() : "";
    }

    static boolean isReady(Context context) {
        Snapshot snapshot = load(context);
        return snapshot.ready();
    }

    static String statusSummary(Context context) {
        Snapshot snapshot = load(context);
        if (!snapshot.enabled) return "未启用 · 点击配置翻译 API";
        if (snapshot.apiKey.isEmpty()) return "已启用，但尚未填写 API Key";
        return "已启用 · " + snapshot.model + " · 多语言动态 AI 字幕";
    }

    private static String safe(String value, String fallback) {
        return value == null || value.trim().isEmpty() ? fallback : value.trim();
    }

    private static int clampTextSize(int value) {
        return Math.max(MIN_CAPTION_TEXT_SIZE, Math.min(MAX_CAPTION_TEXT_SIZE, value));
    }

    private static int clampOpacity(int value) {
        return Math.max(0, Math.min(100, value));
    }

    static float captionPositionY(Context context, boolean landscape) {
        String key = landscape ? POSITION_LANDSCAPE_Y : POSITION_PORTRAIT_Y;
        return clampPosition(prefs(context).getFloat(key, landscape ? 0.80f : 0.82f));
    }

    static boolean hasCaptionPosition(Context context, boolean landscape) {
        SharedPreferences p = prefs(context);
        String yKey = landscape ? POSITION_LANDSCAPE_Y : POSITION_PORTRAIT_Y;
        return p.contains(yKey);
    }

    static void saveCaptionPosition(Context context, boolean landscape, float y) {
        String yKey = landscape ? POSITION_LANDSCAPE_Y : POSITION_PORTRAIT_Y;
        prefs(context).edit()
                .putFloat(yKey, clampPosition(y))
                .apply();
    }

    static float shortsPosition(Context context){return clampPosition(prefs(context).getFloat("shorts_y",.72f));}
    static boolean hasShortsPosition(Context context){return prefs(context).contains("shorts_y");}
    static void saveShortsPosition(Context context,float value){prefs(context).edit().putFloat("shorts_y",clampPosition(value)).apply();}
    static void resetCaptionPositions(Context context) {
        prefs(context).edit()
                .remove("shorts_y")
                .remove(POSITION_PORTRAIT_Y)
                .remove(POSITION_LANDSCAPE_Y)
                .apply();
    }

    private static float clampPosition(float value) {
        if (Float.isNaN(value) || Float.isInfinite(value)) return 0.5f;
        return Math.max(0.04f, Math.min(0.96f, value));
    }

    static final class Snapshot {
        final boolean enabled;
        final String baseUrl;
        final String model;
        final String prompt;
        final int captionTextSize;
        final int backgroundOpacity;
        final String apiKey;

        Snapshot(
                boolean enabled,
                String baseUrl,
                String model,
                String prompt,
                int captionTextSize,
                int backgroundOpacity,
                String apiKey
        ) {
            this.enabled = enabled;
            this.baseUrl = baseUrl;
            this.model = model;
            this.prompt = prompt;
            this.captionTextSize = captionTextSize;
            this.backgroundOpacity = backgroundOpacity;
            this.apiKey = apiKey == null ? "" : apiKey;
        }

        boolean ready() {
            return enabled && !apiKey.isEmpty() && model!=null && !model.trim().isEmpty();
        }

        String fingerprint() {
            return baseUrl + '\n' + model + '\n' + prompt;
        }
    }
}
