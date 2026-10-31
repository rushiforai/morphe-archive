package com.tiktok.appevents.edp;

import android.text.TextUtils;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.JSON;
import com.tiktok.util.TTUtil;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class EDPConfig {
    public static volatile boolean enable_app_launch_track = false;
    public static volatile boolean enable_click_track = false;
    public static volatile boolean enable_page_show_track = false;
    public static volatile boolean enable_pay_show_track = false;
    public static volatile boolean enable_sdk = false;
    public static volatile boolean enable_webview_request_track = false;
    public static volatile int page_detail_upload_deep_count = 12;
    public static volatile double report_frequency_control = 1.0d;
    public static volatile double time_diff_frequency_control;
    public static volatile Set<String> button_black_list = new HashSet();
    public static final String DEFAULT_SENSIG_FILTERING_REGEX_LIST = "([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\\.[a-zA-Z0-9._-]+)|(\\+?0?86-?)?1[3-9]\\d{9}|(\\+\\d{1,2}\\s?)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}";
    public static volatile String sensig_filtering_regex_list = DEFAULT_SENSIG_FILTERING_REGEX_LIST;
    public static volatile int sensig_filtering_regex_version = 0;

    public interface ConfigConst {
        public static final String BUTTON_BLACK_LIST = "button_black_list";
        public static final String EDP_NATIVE_SDK_CONFIG = "enhanced_data_postback_native_config";
        public static final String EDP_UNITY_SDK_CONFIG = "enhanced_data_postback_unity_config";
        public static final String ENABLE_APP_LAUNCH_TRACK = "enable_app_launch_track";
        public static final String ENABLE_CLICK_TRACK = "enable_click_track";
        public static final String ENABLE_PAGE_SHOW_TRACK = "enable_page_show_track";
        public static final String ENABLE_PAY_SHOW_TRACK = "enable_pay_show_track";
        public static final String ENABLE_SDK = "enable_sdk";
        public static final String ENABLE_WEBVIEW_REQUEST_TRACK = "enable_webview_request_track";
        public static final String PAGE_DETAIL_UPLOAD_DEEP_COUNT = "page_detail_upload_deep_count";
        public static final String REPORT_FREQUENCY_CONTROL = "report_frequency_control";
        public static final String SENSIG_FILTERING_REGEX_LIST = "sensig_filtering_regex_list";
        public static final String SENSIG_FILTERING_REGEX_VERSION = "sensig_filtering_regex_version";
        public static final String TIME_DIFF_FREQUENCY_CONTROL = "time_diff_frequency_control";
    }

    public static void optConfig(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            enable_sdk = JSON.getBoolean(jSONObject, ConfigConst.ENABLE_SDK, false);
            boolean z11 = true;
            enable_app_launch_track = enable_sdk && JSON.getBoolean(jSONObject, ConfigConst.ENABLE_APP_LAUNCH_TRACK, false);
            enable_page_show_track = enable_sdk && JSON.getBoolean(jSONObject, ConfigConst.ENABLE_PAGE_SHOW_TRACK, false);
            enable_click_track = enable_sdk && JSON.getBoolean(jSONObject, ConfigConst.ENABLE_CLICK_TRACK, false);
            enable_webview_request_track = enable_sdk && JSON.getBoolean(jSONObject, ConfigConst.ENABLE_WEBVIEW_REQUEST_TRACK, false);
            if (!enable_sdk || !JSON.getBoolean(jSONObject, ConfigConst.ENABLE_PAY_SHOW_TRACK, false)) {
                z11 = false;
            }
            enable_pay_show_track = z11;
            page_detail_upload_deep_count = JSON.getInt(jSONObject, ConfigConst.PAGE_DETAIL_UPLOAD_DEEP_COUNT, 0);
            time_diff_frequency_control = JSON.getDouble(jSONObject, ConfigConst.TIME_DIFF_FREQUENCY_CONTROL, 0.0d);
            report_frequency_control = JSON.getDouble(jSONObject, ConfigConst.REPORT_FREQUENCY_CONTROL, 0.0d);
            JSONArray jsonArray = JSON.getJsonArray(jSONObject, ConfigConst.BUTTON_BLACK_LIST);
            button_black_list.clear();
            if (jsonArray != null) {
                int length = jsonArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    try {
                        String string = jsonArray.getString(i5);
                        if (!TextUtils.isEmpty(string)) {
                            button_black_list.add(string);
                        }
                    } catch (Throwable unused) {
                    }
                }
            }
            JSONArray jsonArray2 = JSON.getJsonArray(jSONObject, ConfigConst.SENSIG_FILTERING_REGEX_LIST);
            if (jsonArray2 != null) {
                String string2 = jsonArray2.getString(0);
                if (TextUtils.isEmpty(string2)) {
                    return;
                }
                sensig_filtering_regex_list = string2;
                sensig_filtering_regex_version = JSON.getInt(jSONObject, ConfigConst.SENSIG_FILTERING_REGEX_VERSION);
                TTUtil.setSensigInfo(TikTokBusinessSdk.getApplicationContext(), new Sensig(sensig_filtering_regex_version, sensig_filtering_regex_list));
            }
        } catch (Throwable unused2) {
        }
    }
}
