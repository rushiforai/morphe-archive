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
        templates.put(R.string.gboard_patches_top_row_title, "自訂第一排按鍵");
        templates.put(R.string.gboard_patches_top_row_summary,
                "左右滑動第一排，打開可自訂文字與 JavaScript slot 的列。");
        templates.put(R.string.gboard_patches_top_row_header_summary,
                "設定由第一排左右滑動打開的自訂列。");
        templates.put(R.string.gboard_patches_top_row_error_title, "自訂第一排按鍵設定無法使用");
        templates.put(R.string.gboard_patches_top_row_error_summary,
                "自訂第一排按鍵設定畫面載入失敗。請重新開啟 Gboard 設定再試一次。");
        templates.put(R.string.gboard_patches_top_row_section_behavior, "行為");
        templates.put(R.string.gboard_patches_top_row_section_layouts, "支援的版面");
        templates.put(R.string.gboard_patches_top_row_section_javascript, "JavaScript");
        templates.put(R.string.gboard_patches_top_row_section_slots, "Slot");
        templates.put(R.string.gboard_patches_top_row_section_transfer, "匯入匯出");
        templates.put(R.string.gboard_patches_top_row_section_advanced, "進階");
        templates.put(R.string.gboard_patches_top_row_section_javascript_guide,
                "JavaScript 說明");
        templates.put(R.string.gboard_patches_top_row_enabled_title, "啟用");
        templates.put(R.string.gboard_patches_top_row_enabled_summary,
                "啟用由第一排左右滑動打開的自訂列。");
        templates.put(R.string.gboard_patches_top_row_layout_zhuyin_title, "注音");
        templates.put(R.string.gboard_patches_top_row_layout_zhuyin_summary,
                "在注音第一排啟用左右滑動。");
        templates.put(R.string.gboard_patches_top_row_layout_english_qwerty_title,
                "英文 QWERTY");
        templates.put(R.string.gboard_patches_top_row_layout_english_qwerty_summary,
                "在英文 q-p 第一排啟用左右滑動。");
        templates.put(R.string.gboard_patches_top_row_global_javascript_title,
                "全域 JavaScript");
        templates.put(R.string.gboard_patches_top_row_global_javascript_summary,
                "定義所有 JavaScript slot 都可共用的 helper function。");
        templates.put(R.string.gboard_patches_top_row_global_javascript_empty_summary,
                "目前沒有設定共用 helper。");
        templates.put(R.string.gboard_patches_top_row_global_javascript_configured_summary,
                "腳本：%1$s");
        templates.put(R.string.gboard_patches_top_row_global_javascript_hint,
                "function helper(input) {\n  return input;\n}");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_title,
                "JavaScript 執行限制");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_summary,
                "設定 JavaScript slot 使用的全域 response、timeout、memory 與 stack 限制。");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_value,
                "%1$s • %2$s • %3$s • %4$s");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_dialog_title,
                "JavaScript 執行限制");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_response_body_label,
                "Response body 上限（KiB）");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_response_body_hint, "1024");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_timeout_max_label,
                "最大 timeout（ms）");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_timeout_max_hint, "30000");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_memory_label,
                "Memory limit（MiB）");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_memory_hint, "8");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_stack_label,
                "Max stack（KiB）");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_stack_hint, "512");
        templates.put(R.string.gboard_patches_top_row_runtime_limits_dialog_error,
                "請輸入有效的 JavaScript 執行限制。");
        templates.put(R.string.gboard_patches_top_row_export_title, "匯出設定");
        templates.put(R.string.gboard_patches_top_row_export_summary,
                "把全域 JavaScript、執行限制與 10 個 slot 匯出成 JSON 檔。");
        templates.put(R.string.gboard_patches_top_row_import_title, "匯入設定");
        templates.put(R.string.gboard_patches_top_row_import_summary,
                "開啟 JSON 檔，取代全域 JavaScript、執行限制與 10 個 slot。");
        templates.put(R.string.gboard_patches_top_row_export_done, "已匯出設定");
        templates.put(R.string.gboard_patches_top_row_import_done, "已匯入設定");
        templates.put(R.string.gboard_patches_top_row_import_failed_title, "匯入失敗");
        templates.put(R.string.gboard_patches_top_row_import_failed_summary,
                "無法匯入選取的檔案。");
        templates.put(R.string.gboard_patches_top_row_import_invalid_summary,
                "選取的檔案格式無效。");
        templates.put(R.string.gboard_patches_top_row_reset_title, "重設 slot");
        templates.put(R.string.gboard_patches_top_row_reset_summary,
                "把 10 個 slot 還原成預設 emoji 列。");
        templates.put(R.string.gboard_patches_top_row_reset_confirm_title, "要重設所有 slot 嗎？");
        templates.put(R.string.gboard_patches_top_row_reset_confirm_message,
                "這會把 10 個顯示/輸入對應還原成預設 emoji 列。");
        templates.put(R.string.gboard_patches_top_row_slot_title, "Slot %1$d");
        templates.put(R.string.gboard_patches_top_row_slot_summary_plain,
                "顯示：%1$s\n輸入：%2$s");
        templates.put(R.string.gboard_patches_top_row_slot_summary_javascript,
                "顯示：%1$s\nJavaScript\nTimeout：%2$d ms\n腳本：%3$s");
        templates.put(R.string.gboard_patches_top_row_editor_display_label, "顯示文字");
        templates.put(R.string.gboard_patches_top_row_editor_display_hint, "顯示文字");
        templates.put(R.string.gboard_patches_top_row_editor_commit_label, "輸入文字");
        templates.put(R.string.gboard_patches_top_row_editor_commit_hint, "輸入文字");
        templates.put(R.string.gboard_patches_top_row_editor_use_javascript, "使用 JavaScript");
        templates.put(R.string.gboard_patches_top_row_editor_script_label, "JavaScript");
        templates.put(R.string.gboard_patches_top_row_editor_script_hint, "JavaScript");
        templates.put(R.string.gboard_patches_top_row_editor_timeout_label, "Timeout（ms）");
        templates.put(R.string.gboard_patches_top_row_editor_timeout_hint, "Timeout（ms）");
        templates.put(R.string.gboard_patches_top_row_editor_test_input_hint,
                "測試輸入（請框選文字作為 input）");
        templates.put(R.string.gboard_patches_top_row_editor_test_button, "測試");
        templates.put(R.string.gboard_patches_top_row_editor_test_running, "執行中...");
        templates.put(R.string.gboard_patches_top_row_editor_display_blank_error,
                "顯示文字不能空白");
        templates.put(R.string.gboard_patches_top_row_editor_locked_state, "已鎖定");
        templates.put(R.string.gboard_patches_top_row_editor_unlocked_state, "已解鎖");
        templates.put(R.string.gboard_patches_top_row_clear_button, "清除");
        templates.put(R.string.gboard_patches_top_row_reset_button, "重設");
        templates.put(R.string.gboard_patches_top_row_test_result_timed_out, "執行逾時");
        templates.put(R.string.gboard_patches_top_row_test_result_failed, "失敗：%1$s");
        templates.put(R.string.gboard_patches_top_row_test_result_failed_generic,
                "QuickJS 測試失敗");
        templates.put(R.string.gboard_patches_top_row_test_result_output, "輸出：%1$s");
        templates.put(R.string.gboard_patches_top_row_test_result_finished_no_output,
                "完成：沒有輸出");
        templates.put(R.string.gboard_patches_top_row_js_guide_execution_title, "執行模型");
        templates.put(R.string.gboard_patches_top_row_js_guide_execution_summary,
                "可用 input 讀取目前選字；return 字串就會送出；每次點按都會建立新的 QuickJS runtime。");
        templates.put(R.string.gboard_patches_top_row_js_guide_execution_dialog_message,
                "可用 input 讀取目前選取中的文字；如果沒有選字，input 就是空字串。\n\n"
                        + "return 字串時，會把它送到 editor；回傳 null、undefined，或根本沒有 return，都會完成但不送出。\n\n"
                        + "每次按鍵都會先跑 Global JavaScript，再在同一次 execution 內跑 slot body。\n\n"
                        + "slot body 和 Global JavaScript 共用同一次執行，但每次點按都會建立新的 QuickJS runtime / context，不會保留上一輪留下的狀態。\n\n"
                        + "如果 Global JavaScript 需要處理 input，請在那裡定義 helper，並從 slot body 把 input 傳進去。\n\n"
                        + "這個環境只支援同步執行；沒有 DOM、Node.js API、fetch，也沒有 async request pipeline。");
        templates.put(R.string.gboard_patches_top_row_js_guide_return_title, "回傳與 commit");
        templates.put(R.string.gboard_patches_top_row_js_guide_return_summary,
                "只有非 null 的回傳值才會 commit，而且執行期間若 InputConnection 改變，就會跳過 commit。");
        templates.put(R.string.gboard_patches_top_row_js_guide_return_dialog_message,
                "回傳規則：\n"
                        + "- 回傳非 null 且非 undefined 的值時，會先轉成字串再 commit\n"
                        + "- 回傳 null、回傳 undefined，或根本沒有 return，都會成功結束但不 commit\n\n"
                        + "即使腳本成功跑完，也只有在結束時的 InputConnection 還是啟動時那個同一個 object 時才會 commit。若焦點切換或 editor 改變，就會 fail closed。");
        templates.put(R.string.gboard_patches_top_row_js_guide_http_title, "Host APIs");
        templates.put(R.string.gboard_patches_top_row_js_guide_http_summary,
                "除了標準 QuickJS 功能外，這個 patch 另外提供 input、httpRequest(options)、httpGet(url) 與 httpPost(url, body)。");
        templates.put(R.string.gboard_patches_top_row_js_guide_http_dialog_message,
                "除了標準 QuickJS 功能外，這個 patch 額外提供下面這些 API：\n"
                        + "- input\n"
                        + "- httpRequest(options)\n"
                        + "- httpGet(url)\n"
                        + "- httpPost(url, body)\n\n"
                        + "httpRequest 只接受 GET、POST、PUT、PATCH、DELETE，URL 只允許 http:// 與 https://。headers 必須是 plain object，body 會以 UTF-8 傳送。\n\n"
                        + "非 2xx status、無效 method、無效 URL scheme、timeout、無效 headers、transport error，以及超過 response body limit 的回應，都會直接 throw script error。");
        templates.put(R.string.gboard_patches_top_row_js_guide_limits_title,
                "限制與 fail-closed");
        templates.put(R.string.gboard_patches_top_row_js_guide_limits_summary,
                "slot 會受全域 timeout、response、memory、stack 限制，syntax 與 runtime error 只會讓該次執行失敗。");
        templates.put(R.string.gboard_patches_top_row_js_guide_limits_dialog_message,
                "執行限制：\n"
                        + "- slot 的 timeoutMs 輸入值只能在 0..全域 timeoutMaxMs 內；sanitize 後的執行期最小值仍是 1 ms\n"
                        + "- response body limit、memory limit、max stack 都來自 JavaScript Runtime Limits\n\n"
                        + "預設值：\n"
                        + "- timeoutMaxMs：30000 ms\n"
                        + "- response body：1 MiB\n"
                        + "- memory：8 MiB\n"
                        + "- max stack：512 KiB\n\n"
                        + "syntax error、runtime error、timeout、HTTP 失敗、response 過大，以及 commit 前 InputConnection 改變，都只會讓當次執行 fail closed，不會把整個自訂第一排按鍵功能停掉。");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_title, "範例");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_summary,
                "可直接複製常用腳本，從基本 return 範例到 IP、OpenAI、timestamp、英國時間與單位換算都有。");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_dialog_title,
                "JavaScript 範例");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_copy_button,
                "複製到剪貼簿");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_expand_button, "展開");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_collapse_button, "收合");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_copied_format,
                "已複製範例：%1$s");
        templates.put(R.string.gboard_patches_top_row_js_guide_examples_clipboard_unavailable,
                "系統剪貼簿無法使用");
        templates.put(R.string.gboard_patches_top_row_js_example_hello_world_title,
                "Hello World");
        templates.put(R.string.gboard_patches_top_row_js_example_hello_world_summary,
                "回傳固定字串到編輯器。");
        templates.put(R.string.gboard_patches_top_row_js_example_return_input_title,
                "回傳 input");
        templates.put(R.string.gboard_patches_top_row_js_example_return_input_summary,
                "把目前 input 原樣送出。");
        templates.put(R.string.gboard_patches_top_row_js_example_ip_title, "取得目前 IP");
        templates.put(R.string.gboard_patches_top_row_js_example_ip_summary,
                "用簡單的 GET 請求讀取目前的 public IP。");
        templates.put(R.string.gboard_patches_top_row_js_example_openai_title,
                "使用 HTTP 打 OpenAI");
        templates.put(R.string.gboard_patches_top_row_js_example_openai_summary,
                "用 httpRequest 呼叫 OpenAI Responses API 與 gpt-5.5。");
        templates.put(R.string.gboard_patches_top_row_js_example_timestamp_title,
                "取得目前 timestamp");
        templates.put(R.string.gboard_patches_top_row_js_example_timestamp_summary,
                "回傳目前 Unix timestamp（毫秒）。");
        templates.put(R.string.gboard_patches_top_row_js_example_uk_time_title,
                "取得英國時間");
        templates.put(R.string.gboard_patches_top_row_js_example_uk_time_summary,
                "抓取目前 London time，並格式化成可直接送出的時間字串。");
        templates.put(R.string.gboard_patches_top_row_js_example_unit_convert_title,
                "單位自動換算");
        templates.put(R.string.gboard_patches_top_row_js_example_unit_convert_summary,
                "把 10lbs、40kg、100F 或 40C 這類輸入做雙向換算。");
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
