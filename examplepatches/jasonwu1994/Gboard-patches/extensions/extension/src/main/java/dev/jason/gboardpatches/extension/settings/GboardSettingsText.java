package dev.jason.gboardpatches.extension.settings;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.R;

public final class GboardSettingsText {
    private static final String LANGUAGE_ENGLISH = "en";
    private static final String LANGUAGE_TRADITIONAL_CHINESE = "zh-Hant";
    private static final Map<Integer, String> STABLE_TRADITIONAL_CHINESE_TEMPLATES =
            createStableTraditionalChineseTemplates();
    private static final Set<Integer> STABLE_SETTINGS_RESOURCE_IDS =
            new HashSet<Integer>(STABLE_TRADITIONAL_CHINESE_TEMPLATES.keySet());

    private GboardSettingsText() {
    }

    public static String get(Context context, int resId) {
        String stableText = resolveStableText(context, resId, null);
        if (stableText != null) {
            return stableText;
        }
        return requireContext(context).getString(resId);
    }

    public static String format(Context context, int resId, Object... args) {
        String stableText = resolveStableText(context, resId, null, args);
        if (stableText != null) {
            return stableText;
        }
        return requireContext(context).getString(resId, args);
    }

    public static String quantity(Context context, int resId, int quantity) {
        String stableQuantity = resolveStableQuantity(context, resId, quantity);
        if (stableQuantity != null) {
            return stableQuantity;
        }
        return requireContext(context).getResources().getQuantityString(resId, quantity, quantity);
    }

    public static String get(Context context, int resId, String fallback) {
        String stableText = resolveStableText(context, resId, fallback);
        if (stableText != null) {
            return stableText;
        }
        if (context != null) {
            try {
                return context.getString(resId);
            } catch (Throwable ignored) {
                // Fall back to the stable English copy below.
            }
        }
        return fallback;
    }

    public static String get(Context context, int resId, String fallbackFormat, Object... args) {
        String stableText = resolveStableText(context, resId, fallbackFormat, args);
        if (stableText != null) {
            return stableText;
        }
        if (context != null) {
            try {
                return context.getString(resId, args);
            } catch (Throwable ignored) {
                // Fall back to the stable English copy below.
            }
        }
        return String.format(Locale.US, fallbackFormat, args);
    }

    public static String quantity(Context context, int resId, int quantity,
            String fallbackSingular, String fallbackPlural) {
        String stableQuantity = resolveStableQuantity(context, resId, quantity);
        if (stableQuantity != null) {
            return stableQuantity;
        }
        if (context != null) {
            try {
                return context.getResources().getQuantityString(resId, quantity, quantity);
            } catch (Throwable ignored) {
                // Fall back to the stable English copy below.
            }
        }
        return String.format(
                Locale.US,
                quantity == 1 ? fallbackSingular : fallbackPlural,
                quantity);
    }

    static String resolveStableTextForTesting(int resId, String languageTag, String fallback,
            Object... args) {
        return resolveStableText(resId, normalizeLanguageTag(languageTag), fallback, args);
    }

    private static String resolveStableText(Context context, int resId, String fallback,
            Object... args) {
        return resolveStableText(resId, resolveLanguageTag(context), fallback, args);
    }

    private static String resolveStableText(int resId, String languageTag, String fallback,
            Object... args) {
        String template = stableTemplate(resId, languageTag);
        if (template != null) {
            return formatTemplate(languageTag, template, args);
        }
        if (isStableSettingsResource(resId) && fallback != null) {
            return formatTemplate(languageTag, fallback, args);
        }
        return null;
    }

    private static String resolveStableQuantity(Context context, int resId, int quantity) {
        return resolveStableQuantity(resId, resolveLanguageTag(context), quantity);
    }

    private static String resolveStableQuantity(int resId, String languageTag, int quantity) {
        if (LANGUAGE_TRADITIONAL_CHINESE.equals(languageTag)
                && resId == R.plurals.gboard_patches_minutes) {
            return String.format(Locale.TRADITIONAL_CHINESE, "%d 分鐘", quantity);
        }
        return null;
    }

    private static String formatTemplate(String languageTag, String template, Object... args) {
        if (template == null) {
            return null;
        }
        if (args == null || args.length == 0) {
            return template;
        }
        Locale formatLocale = LANGUAGE_TRADITIONAL_CHINESE.equals(languageTag)
                ? Locale.TRADITIONAL_CHINESE
                : Locale.US;
        return String.format(formatLocale, template, args);
    }

    private static String resolveLanguageTag(Context context) {
        Locale locale = extractLocale(context);
        return isTraditionalChinese(locale)
                ? LANGUAGE_TRADITIONAL_CHINESE
                : LANGUAGE_ENGLISH;
    }

    private static Locale extractLocale(Context context) {
        if (context == null) {
            return Locale.getDefault();
        }
        Configuration configuration;
        try {
            if (context.getResources() == null) {
                return Locale.getDefault();
            }
            configuration = context.getResources().getConfiguration();
        } catch (Throwable ignored) {
            return Locale.getDefault();
        }
        if (configuration == null) {
            return Locale.getDefault();
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N
                && configuration.getLocales() != null
                && !configuration.getLocales().isEmpty()) {
            Locale locale = configuration.getLocales().get(0);
            return locale != null ? locale : Locale.getDefault();
        }
        Locale locale = configuration.locale;
        return locale != null ? locale : Locale.getDefault();
    }

    private static String normalizeLanguageTag(String languageTag) {
        if (LANGUAGE_TRADITIONAL_CHINESE.equals(languageTag)) {
            return LANGUAGE_TRADITIONAL_CHINESE;
        }
        if (languageTag != null && !languageTag.isBlank()) {
            Locale locale = Locale.forLanguageTag(languageTag);
            if (isTraditionalChinese(locale)) {
                return LANGUAGE_TRADITIONAL_CHINESE;
            }
        }
        return LANGUAGE_ENGLISH;
    }

    private static boolean isTraditionalChinese(Locale locale) {
        if (locale == null || !"zh".equalsIgnoreCase(locale.getLanguage())) {
            return false;
        }
        String script = locale.getScript();
        if ("Hant".equalsIgnoreCase(script)) {
            return true;
        }
        String country = locale.getCountry();
        return "TW".equalsIgnoreCase(country)
                || "HK".equalsIgnoreCase(country)
                || "MO".equalsIgnoreCase(country);
    }

    private static String stableTemplate(int resId, String languageTag) {
        if (!LANGUAGE_TRADITIONAL_CHINESE.equals(languageTag)) {
            return null;
        }
        return STABLE_TRADITIONAL_CHINESE_TEMPLATES.get(resId);
    }

    private static boolean isStableSettingsResource(int resId) {
        return STABLE_SETTINGS_RESOURCE_IDS.contains(resId);
    }

    private static Map<Integer, String> createStableTraditionalChineseTemplates() {
        Map<Integer, String> templates = new HashMap<Integer, String>();
        templates.put(R.string.gboard_patches_activity_title, "Patches");
        templates.put(R.string.gboard_patches_navigation_back, "返回");
        templates.put(R.string.gboard_patches_header_badge, "Gboard");
        templates.put(R.string.gboard_patches_header_title, "Patch 設定");
        templates.put(R.string.gboard_patches_header_summary, "");
        templates.put(R.string.gboard_patches_preview_label, "預覽");
        templates.put(R.string.gboard_patches_current_value_label, "目前");
        templates.put(R.string.gboard_patches_confirm_action, "確認");
        templates.put(R.string.gboard_patches_dialog_cancel, "取消");
        templates.put(R.string.gboard_patches_dialog_save, "儲存");
        templates.put(R.string.gboard_patches_dialog_close, "關閉");
        templates.put(R.string.gboard_patches_dialog_error_positive, "請輸入正整數。");
        templates.put(R.string.gboard_patches_dialog_error_save_failed, "儲存設定失敗。");
        templates.put(R.string.gboard_patches_section_preferences, "偏好");
        templates.put(R.string.gboard_patches_section_features, "功能");
        templates.put(R.string.gboard_patches_section_about, "關於");
        templates.put(R.string.gboard_patches_about_author_title, "作者");
        templates.put(R.string.gboard_patches_about_patch_version_title, "Patch 版本");
        templates.put(R.string.gboard_patches_error_header_title, "功能無法使用");
        templates.put(R.string.gboard_patches_error_header_summary, "這個設定頁載入失敗，已安全停用。");
        templates.put(R.string.gboard_patches_error_row_title, "無法載入功能");
        templates.put(R.string.gboard_patches_error_row_summary,
                "宿主 App 仍維持運作。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_fatal_fallback_title, "Patches 暫時無法使用");
        templates.put(R.string.gboard_patches_fatal_fallback_summary,
                "這個畫面發生內部錯誤，已安全停用。Gboard 仍維持運作。請重新開啟設定再試一次。");
        templates.put(R.string.gboard_patches_preview_load_failed, "載入預覽媒體失敗。");
        templates.put(R.string.gboard_patches_navigate_up, "返回上一層");
        templates.put(R.string.gboard_patches_language_title, "語言");
        templates.put(R.string.gboard_patches_language_summary, "");
        templates.put(R.string.gboard_patches_language_system_label, "跟隨系統");
        templates.put(R.string.gboard_patches_language_english_label, "English");
        templates.put(R.string.gboard_patches_language_traditional_chinese_label, "繁體中文");
        templates.put(R.string.gboard_patches_language_system_value, "跟隨系統（%1$s）");
        templates.put(R.string.gboard_patches_group_keyboard_title, "鍵盤");
        templates.put(R.string.gboard_patches_group_keyboard_summary, "鍵盤相關的 patch 設定。");
        templates.put(R.string.gboard_patches_group_keyboard_header_summary, "");
        templates.put(R.string.gboard_patches_group_keyboard_empty_title, "沒有可用的鍵盤設定");
        templates.put(R.string.gboard_patches_group_keyboard_empty_summary,
                "這個 build 沒有包含任何鍵盤設定功能。");
        templates.put(R.string.gboard_patches_latin_globe_title, "英文地球鍵忽略時間");
        templates.put(R.string.gboard_patches_latin_globe_summary,
                "在英文鍵盤中，輸入字母後無法馬上按地球鍵切換鍵盤。官方預設的忽略時間是 500ms。");
        templates.put(R.string.gboard_patches_latin_globe_header_summary,
                "在英文鍵盤中，輸入字母後無法馬上按地球鍵切換鍵盤。官方預設的忽略時間是 %1$dms。");
        templates.put(R.string.gboard_patches_latin_globe_error_title, "英文地球鍵忽略時間無法使用");
        templates.put(R.string.gboard_patches_latin_globe_error_summary,
                "英文地球鍵設定畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_latin_globe_enabled_title, "啟用");
        templates.put(R.string.gboard_patches_latin_globe_enabled_summary,
                "啟用這個執行期覆寫，讓英文鍵盤套用地球鍵忽略時間。");
        templates.put(R.string.gboard_patches_latin_globe_interval_title, "忽略時間");
        templates.put(R.string.gboard_patches_latin_globe_interval_summary,
                "範圍：0-1000ms。官方預設：500ms。");
        templates.put(R.string.gboard_patches_latin_globe_dialog_title, "英文地球鍵忽略時間");
        templates.put(R.string.gboard_patches_latin_globe_dialog_hint, "0-1000 ms");
        templates.put(R.string.gboard_patches_latin_globe_dialog_error, "請輸入 0 到 1000 之間的值。");
        templates.put(R.string.gboard_patches_latin_globe_section_behavior, "行為");
        templates.put(R.string.gboard_patches_latin_globe_interval_value, "%1$d ms");
        templates.put(R.string.gboard_patches_latin_globe_interval_value_default, "%1$d ms（預設）");
        templates.put(R.string.gboard_patches_latin_globe_preview_message, "");
        templates.put(R.string.gboard_patches_latin_globe_preview_default, "原廠預設（500 ms）");
        templates.put(R.string.gboard_patches_latin_globe_preview_patched, "Patch 範例（0 ms）");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_title, "英文鍵盤上滑大小寫");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_summary,
                "控制英文鍵盤字母鍵上滑切換大小寫。");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_error_title,
                "英文鍵盤上滑大小寫無法使用");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_error_summary,
                "英文鍵盤上滑大小寫設定畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_enabled_title,
                "啟用英文鍵盤上滑大小寫");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_enabled_summary,
                "小寫字母上滑會輸出大寫，大寫字母上滑會輸出小寫。");
        templates.put(R.string.gboard_patches_english_uppercase_toggle_section_behavior,
                "行為");
        templates.put(R.string.gboard_patches_ai_writing_tools_title, "AI 撰寫工具");
        templates.put(R.string.gboard_patches_ai_writing_tools_summary,
                "控制是否強制顯示官方 AI 撰寫工具開關。");
        templates.put(R.string.gboard_patches_ai_writing_tools_header_summary, "");
        templates.put(R.string.gboard_patches_ai_writing_tools_error_title,
                "AI 撰寫工具無法使用");
        templates.put(R.string.gboard_patches_ai_writing_tools_error_summary,
                "AI 撰寫工具設定畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_ai_writing_tools_enabled_title, "啟用 AI 撰寫工具");
        templates.put(R.string.gboard_patches_ai_writing_tools_enabled_summary,
                "強制顯示「修正和建議」->「撰寫工具」中的官方 4 個開關；手機沒有 AI Core 時，需要開啟「使用 Google 伺服器」才會生效。");
        templates.put(R.string.gboard_patches_ai_writing_tools_all_keyboards_title,
                "支援所有鍵盤");
        templates.put(R.string.gboard_patches_ai_writing_tools_all_keyboards_summary,
                "開啟後，會強制把撰寫工具在所有鍵盤生效。需要強制停止並重新啟動 Gboard 才會生效。");
        templates.put(R.string.gboard_patches_ai_writing_tools_section_behavior, "行為");
        templates.put(R.string.gboard_patches_symbol_footer_title, "表情符號、貼圖與 GIF 分頁順序");
        templates.put(R.string.gboard_patches_symbol_footer_summary,
                "重新排序 Gboard「表情符號、貼圖與 GIF」面板底部的分頁。");
        templates.put(R.string.gboard_patches_symbol_footer_header_summary,
                "控制 Gboard「表情符號、貼圖與 GIF」面板底部的分頁順序。");
        templates.put(R.string.gboard_patches_symbol_footer_error_title,
                "表情符號、貼圖與 GIF 分頁順序無法使用");
        templates.put(R.string.gboard_patches_symbol_footer_error_summary,
                "底部分頁順序畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_symbol_footer_current_title, "目前順序");
        templates.put(R.string.gboard_patches_symbol_footer_reorder_title, "重新排序分頁");
        templates.put(R.string.gboard_patches_symbol_footer_reorder_summary,
                "拖曳把手來移動分頁。");
        templates.put(R.string.gboard_patches_symbol_footer_reset_title, "重設為預設順序");
        templates.put(R.string.gboard_patches_symbol_footer_reset_summary, "");
        templates.put(R.string.gboard_patches_symbol_footer_empty_summary,
                "這個 build 沒有可用的分頁。");
        templates.put(R.string.gboard_patches_symbol_footer_section_current, "目前設定");
        templates.put(R.string.gboard_patches_symbol_footer_section_behavior, "行為");
        templates.put(R.string.gboard_patches_symbol_footer_section_advanced, "進階");
        templates.put(R.string.gboard_patches_symbol_footer_reset_confirm_title, "重設分頁順序");
        templates.put(R.string.gboard_patches_symbol_footer_reset_confirm_message,
                "要還原表情符號、貼圖與 GIF 的預設分頁順序嗎？");
        templates.put(R.string.gboard_patches_symbol_tab_emoji, "Emoji");
        templates.put(R.string.gboard_patches_symbol_tab_custom_symbols, "自訂符號");
        templates.put(R.string.gboard_patches_symbol_tab_emoticon, "顏文字");
        templates.put(R.string.gboard_patches_symbol_tab_gif, "GIF");
        templates.put(R.string.gboard_patches_symbol_tab_sticker, "貼圖");
        templates.put(R.string.gboard_patches_clipboard_title, "剪貼簿");
        templates.put(R.string.gboard_patches_clipboard_summary,
                "調整剪貼簿保留時間、項目數量上限、預覽行數、metadata 標籤、排序索引、欄數，以及由手機提供的網頁剪貼簿。");
        templates.put(R.string.gboard_patches_clipboard_error_title, "剪貼簿設定無法使用");
        templates.put(R.string.gboard_patches_clipboard_error_summary,
                "剪貼簿設定畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_clipboard_section_general, "一般");
        templates.put(R.string.gboard_patches_clipboard_section_metadata, "Metadata");
        templates.put(R.string.gboard_patches_clipboard_section_layout, "版面");
        templates.put(R.string.gboard_patches_clipboard_section_retention, "保留");
        templates.put(R.string.gboard_patches_clipboard_section_extensions, "延伸");
        templates.put(R.string.gboard_patches_pref_show_expiry_countdown, "顯示到期倒數");
        templates.put(R.string.gboard_patches_pref_show_expiry_countdown_summary,
                "在每個剪貼簿項目上方顯示剩餘保留時間。");
        templates.put(R.string.gboard_patches_pref_show_creation_time, "顯示建立時間");
        templates.put(R.string.gboard_patches_pref_show_creation_time_summary,
                "以目前裝置時區顯示每個剪貼簿項目的建立時間。");
        templates.put(R.string.gboard_patches_pref_show_order_index, "顯示排序索引");
        templates.put(R.string.gboard_patches_pref_show_order_index_summary,
                "在每個剪貼簿項目上方顯示 [1]、[2] 等索引。");
        templates.put(R.string.gboard_patches_pref_order_index_direction, "排序索引方向");
        templates.put(R.string.gboard_patches_pref_order_index_direction_summary,
                "控制 [1] 代表最新還是最舊的剪貼簿項目。");
        templates.put(R.string.gboard_patches_order_index_newest_first_default, "最新優先（預設）");
        templates.put(R.string.gboard_patches_order_index_oldest_first, "最舊優先");
        templates.put(R.string.gboard_patches_preview_countdown_caption, "倒數範例");
        templates.put(R.string.gboard_patches_preview_creation_time_caption, "建立時間範例");
        templates.put(R.string.gboard_patches_preview_order_index_caption, "排序索引範例");
        templates.put(R.string.gboard_patches_pref_clipboard_columns, "剪貼簿欄數");
        templates.put(R.string.gboard_patches_pref_clipboard_columns_summary,
                "控制剪貼簿網格使用幾欄。");
        templates.put(R.string.gboard_patches_pref_content_max_lines, "剪貼簿預覽行數");
        templates.put(R.string.gboard_patches_pref_content_max_lines_summary,
                "控制每個剪貼簿項目在截斷前最多顯示幾行預覽。");
        templates.put(R.string.gboard_patches_clipboard_columns_one, "1");
        templates.put(R.string.gboard_patches_clipboard_columns_two_default, "2（預設）");
        templates.put(R.string.gboard_patches_clipboard_columns_three, "3");
        templates.put(R.string.gboard_patches_content_max_lines_option_five_default, "5（預設）");
        templates.put(R.string.gboard_patches_content_max_lines_option_ten, "10");
        templates.put(R.string.gboard_patches_option_custom, "自訂");
        templates.put(R.string.gboard_patches_custom_content_max_lines_dialog_title, "自訂預覽行數");
        templates.put(R.string.gboard_patches_custom_content_max_lines_dialog_hint, "行數");
        templates.put(R.string.gboard_patches_preview_column_count_one_caption, "1 欄");
        templates.put(R.string.gboard_patches_preview_column_count_three_caption, "3 欄");
        templates.put(R.string.gboard_patches_preview_lines_default_caption, "預設（5 行）");
        templates.put(R.string.gboard_patches_preview_lines_extended_caption, "延伸（8 行）");
        templates.put(R.string.gboard_patches_pref_ttl, "保留 TTL");
        templates.put(R.string.gboard_patches_pref_ttl_summary, "控制未釘選剪貼簿項目的保留時間。");
        templates.put(R.string.gboard_patches_pref_max_count, "最大數量");
        templates.put(R.string.gboard_patches_pref_max_count_summary,
                "限制同時可見的未釘選剪貼簿項目數量。");
        templates.put(R.string.gboard_patches_option_infinite, "無限");
        templates.put(R.string.gboard_patches_ttl_option_one_minute, "1 分鐘");
        templates.put(R.string.gboard_patches_ttl_option_one_hour_default, "1 小時（預設）");
        templates.put(R.string.gboard_patches_max_count_option_ten, "10");
        templates.put(R.string.gboard_patches_max_count_option_hundred_default, "100（預設）");
        templates.put(R.string.gboard_patches_custom_ttl_dialog_title, "自訂保留 TTL");
        templates.put(R.string.gboard_patches_custom_ttl_dialog_hint, "分鐘");
        templates.put(R.string.gboard_patches_custom_max_count_dialog_title, "自訂最大數量");
        templates.put(R.string.gboard_patches_custom_max_count_dialog_hint, "數量");
        templates.put(R.string.gboard_patches_custom_count_value, "自訂（%1$d）");
        templates.put(R.string.gboard_patches_custom_minutes_value, "自訂（%1$d %2$s）");
        templates.put(R.string.gboard_patches_web_clipboard_title, "網頁剪貼簿");
        templates.put(R.string.gboard_patches_web_clipboard_summary,
                "由這支手機提供、免安裝的網頁剪貼簿分享功能。在同一個區網中於多個裝置開啟同一個頁面，即可讓手機與瀏覽器保持同步。建議：開啟快速設定磁貼。");
        templates.put(R.string.gboard_patches_web_clipboard_entry_summary,
                "啟用時會在這支手機的 %1$s 提供服務。");
        templates.put(R.string.gboard_patches_web_clipboard_clients_feature_summary,
                "檢視已連線的網頁剪貼簿用戶端並中斷瀏覽器工作階段。");
        templates.put(R.string.gboard_patches_web_clipboard_section_security, "安全性");
        templates.put(R.string.gboard_patches_web_clipboard_section_network, "網路");
        templates.put(R.string.gboard_patches_web_clipboard_section_connected_clients,
                "已連線的用戶端");
        templates.put(R.string.gboard_patches_web_clipboard_enable_title, "啟用網頁剪貼簿");
        templates.put(R.string.gboard_patches_web_clipboard_port_title, "Web 伺服器連接埠");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_title, "需要配對碼");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_code_title, "配對碼");
        templates.put(R.string.gboard_patches_web_clipboard_urls_title, "目前網址");
        templates.put(R.string.gboard_patches_web_clipboard_clients_title, "已連線的用戶端");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_error, "請輸入 4 位數配對碼。");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_summary,
                "預設為開啟。桌面瀏覽器在同步前必須輸入簡單的 4 位數配對碼，除非你關閉這個選項。");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_code_summary_on,
                "桌面使用者必須輸入這組 4 位數配對碼，或開啟包含 ?code=%1$s 的網址。");
        templates.put(R.string.gboard_patches_web_clipboard_pairing_code_summary_off,
                "配對功能目前關閉；只有在重新啟用後才會使用這組配對碼。");
        templates.put(R.string.gboard_patches_web_clipboard_port_summary,
                "選擇由手機提供的 Web UI 所使用的連接埠。");
        templates.put(R.string.gboard_patches_web_clipboard_regenerate_code_title, "重新產生配對碼");
        templates.put(R.string.gboard_patches_web_clipboard_regenerate_code_summary,
                "建立新的 4 位數配對碼，並在入口正在執行時重新啟動服務。");
        templates.put(R.string.gboard_patches_web_clipboard_no_clients, "目前沒有瀏覽器用戶端連線。");
        templates.put(R.string.gboard_patches_web_clipboard_clients_summary, "點一下可檢視並中斷瀏覽器用戶端。");
        templates.put(R.string.gboard_patches_web_clipboard_connected_summary,
                "目前連線到網頁剪貼簿入口網站的瀏覽器用戶端。");
        templates.put(R.string.gboard_patches_web_clipboard_kick_title, "中斷 %1$s");
        templates.put(R.string.gboard_patches_web_clipboard_kick_confirm_title, "中斷已連線的用戶端");
        templates.put(R.string.gboard_patches_web_clipboard_kick_confirm_message,
                "要將 %1$s 從網頁剪貼簿中斷嗎？");
        templates.put(R.string.gboard_patches_web_clipboard_client_title, "%1$s %2$s");
        templates.put(R.string.gboard_patches_web_clipboard_client_detail, "IP：%1$s\n用戶端代理：%2$s");
        templates.put(R.string.gboard_patches_web_clipboard_client_browser_fallback, "瀏覽器");
        templates.put(R.string.gboard_patches_web_clipboard_client_agent_fallback, "未知代理");
        templates.put(R.string.gboard_patches_web_clipboard_port_hint_default, "%1$d");
        templates.put(R.string.gboard_patches_web_clipboard_qs_recommendation, "建議：開啟快速設定磁貼。");
        templates.put(R.string.gboard_patches_settings_homepage_title, "設定樣式");
        templates.put(R.string.gboard_patches_settings_homepage_summary,
                "選擇 Gboard 設定使用新樣式或舊樣式。");
        templates.put(R.string.gboard_patches_settings_homepage_header_summary,
                "控制 Gboard 設定使用新的或舊的設定體驗。變更後請重新開啟 Gboard 設定。");
        templates.put(R.string.gboard_patches_settings_homepage_error_title, "設定首頁無法使用");
        templates.put(R.string.gboard_patches_settings_homepage_error_summary,
                "首頁切換器載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_settings_homepage_safeguard_title, "相容性保護");
        templates.put(R.string.gboard_patches_settings_homepage_recovery_title, "當機保護");
        templates.put(R.string.gboard_patches_settings_homepage_trial_title, "試用視窗");
        templates.put(R.string.gboard_patches_settings_homepage_mode_title, "設定樣式");
        templates.put(R.string.gboard_patches_settings_homepage_current_title, "目前啟用的樣式");
        templates.put(R.string.gboard_patches_settings_homepage_label_auto, "自動");
        templates.put(R.string.gboard_patches_settings_homepage_label_new, "新");
        templates.put(R.string.gboard_patches_settings_homepage_label_legacy, "舊");
        templates.put(R.string.gboard_patches_settings_homepage_section_style, "樣式");
        templates.put(R.string.gboard_patches_settings_homepage_section_current_state, "目前狀態");
        templates.put(R.string.gboard_patches_settings_homepage_preview_new, "新樣式");
        templates.put(R.string.gboard_patches_settings_homepage_preview_legacy, "舊樣式");
        templates.put(R.string.gboard_patches_settings_homepage_safeguard_summary,
                "這個 Android 版本沒有提供預期的 expressive runtime。仍可選擇新樣式，但會受當機復原保護。");
        templates.put(R.string.gboard_patches_settings_homepage_trial_armed_summary,
                "請在 %1$d 秒內開啟 Gboard 設定。如果在這段時間內沒有成功啟動，會自動回退到舊樣式。");
        templates.put(R.string.gboard_patches_settings_homepage_recovery_summary,
                "上一次的新設定樣式啟動沒有正常完成。舊樣式會維持啟用，讓你能安全地重新開啟設定並重試。");
        templates.put(R.string.gboard_patches_settings_homepage_trial_expired_summary,
                "新樣式的啟動視窗已過期，Gboard 尚未成功開啟設定頁。舊樣式會維持啟用，直到你再次選擇新樣式。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_new_recovered, "新（已復原）");
        templates.put(R.string.gboard_patches_settings_homepage_mode_new_expired, "新（已過期）");
        templates.put(R.string.gboard_patches_settings_homepage_mode_new_armed, "新（已準備）");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_new_recovered,
                "前一次的新樣式啟動發生當機。舊樣式會維持啟用，直到你切換模式，或再次選擇新樣式重試。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_new_expired,
                "新樣式的啟動視窗已過期。請再次選擇新樣式，並在 10 秒內開啟 Gboard 設定重試。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_new_armed,
                "請在 10 秒內開啟 Gboard 設定。如果啟動當機或沒有成功開始，會自動回退到舊樣式。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_new_guarded,
                "在這個 Android 版本上仍可使用新樣式，但如果設定啟動失敗，會自動回退保護。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_new,
                "永遠使用新設定樣式。變更後請重新開啟 Gboard 設定。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_legacy,
                "永遠使用舊設定樣式。變更後請重新開啟 Gboard 設定。");
        templates.put(R.string.gboard_patches_settings_homepage_mode_summary_auto,
                "跟隨 Gboard 的自動選擇。切換模式後請重新開啟 Gboard 設定。");
        templates.put(R.string.gboard_patches_settings_homepage_current_summary_guarded,
                "目前實際啟用的是舊設定樣式，因為安全保護暫時阻擋了新樣式。");
        templates.put(R.string.gboard_patches_settings_homepage_current_summary_queued,
                "新設定樣式已排入下一次 Gboard 設定啟動。");
        templates.put(R.string.gboard_patches_settings_homepage_current_summary_protected,
                "在這個 Android 版本上已選擇新設定樣式，並啟用當機復原保護。");
        templates.put(R.string.gboard_patches_settings_homepage_current_summary_default,
                "目前啟用的是 %1$s 設定樣式。");
        return templates;
    }

    private static Context requireContext(Context context) {
        if (context == null) {
            throw new IllegalStateException("Context required for Gboard settings text lookup.");
        }
        return context;
    }
}
