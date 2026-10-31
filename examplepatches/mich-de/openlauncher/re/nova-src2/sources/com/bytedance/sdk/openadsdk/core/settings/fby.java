package com.bytedance.sdk.openadsdk.core.settings;

import android.text.TextUtils;
import android.widget.Toast;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.jc;
import com.bytedance.sdk.openadsdk.core.settings.lud;
import com.bytedance.sdk.openadsdk.core.xz;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSConfig;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby extends jc {

    /* renamed from: dj, reason: collision with root package name */
    static final ArrayList<String> f26110dj = new ArrayList<>(Arrays.asList("ja", "en", "ko", "zh", "th", "vi", "id", "ru", "ar", "fr", "de", "it", "es", "hi", "pt", "zh-Hant", "ms", "pl", "tr"));
    private Set<String> lud;
    public boolean sya;

    public fby(jc.ycx ycxVar) {
        super(ycxVar);
        this.lud = Collections.synchronizedSet(new HashSet());
    }

    @Override // com.bytedance.sdk.openadsdk.core.settings.jc
    public String ycx() {
        try {
            if (pmi.ycx() == null || thx.ycx(pmi.ycx())) {
                return "tt_sdk_settings_sr.prop";
            }
            return "tt_sdk_settings_sr_" + thx.sya(pmi.ycx()) + ".prop";
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSkT9FcmR20Gl7+IoYKqGbVmQ==", "XOs5uQy/aMumQ9tYohCtLQ==", 55);
            return "tt_sdk_settings_sr";
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.settings.lud
    public void ycx(JSONObject jSONObject) throws Throwable {
        int iOptInt;
        lud.ycx ycxVarZb = zb();
        JSONObject jSONObjectLt = ea.zb().lt();
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("digest");
        this.sya = (jSONObjectOptJSONObject == null || jSONObjectLt == null || !jSONObjectOptJSONObject.toString().equals(jSONObjectLt.toString())) ? false : true;
        if (jSONObjectOptJSONObject != null) {
            ycxVarZb.ycx("digest", jSONObjectOptJSONObject.toString());
        } else {
            ycxVarZb.ycx("digest");
        }
        ycxVarZb.ycx("data_time", jSONObject.optLong("data_time"));
        if (jSONObject.has("req_inter_min")) {
            long jOptLong = jSONObject.optLong("req_inter_min", 10L) * 60000;
            if (jOptLong < 0 || jOptLong > 86400000) {
                jOptLong = TTAdConstant.AD_MAX_EVENT_TIME;
            }
            ycxVarZb.ycx("req_inter_min", jOptLong);
        }
        if (jSONObject.has("lp_new_style")) {
            ycxVarZb.ycx("landingpage_new_style", jSONObject.optInt("lp_new_style", LayoutNode.NotPlacedPlaceOrder));
        }
        if (jSONObject.has("blank_detect_rate")) {
            int iOptInt2 = jSONObject.optInt("blank_detect_rate", 30);
            if (iOptInt2 < 0 || iOptInt2 > 100) {
                iOptInt2 = 30;
            }
            ycxVarZb.ycx("blank_detect_rate", iOptInt2);
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("feq_policy");
        if (jSONObjectOptJSONObject2 != null) {
            if (jSONObjectOptJSONObject2.has("duration")) {
                ycxVarZb.ycx("duration", jSONObjectOptJSONObject2.optLong("duration") * 1000);
            }
            if (jSONObjectOptJSONObject2.has(InneractiveMediationNameConsts.MAX)) {
                ycxVarZb.ycx(InneractiveMediationNameConsts.MAX, jSONObjectOptJSONObject2.optInt(InneractiveMediationNameConsts.MAX));
            }
        }
        if (jSONObject.has("vbtt")) {
            ycxVarZb.ycx("vbtt", jSONObject.optInt("vbtt", 5));
        }
        JSONObject jSONObjectOptJSONObject3 = jSONObject.optJSONObject("abtest");
        if (jSONObjectOptJSONObject3 != null) {
            if (jSONObjectOptJSONObject3.has("version")) {
                ycxVarZb.ycx("ab_test_version", jSONObjectOptJSONObject3.optString("version"));
            }
            if (jSONObjectOptJSONObject3.has("param")) {
                ycxVarZb.ycx("ab_test_param", jSONObjectOptJSONObject3.optString("param"));
            }
        } else {
            ea.zb().fby();
        }
        JSONObject jSONObjectOptJSONObject4 = jSONObject.optJSONObject("log_rate_conf");
        if (jSONObjectOptJSONObject4 != null && jSONObjectOptJSONObject4.has("global_rate")) {
            ycxVarZb.ycx("global_rate", (float) jSONObjectOptJSONObject4.optDouble("global_rate", 1.0d));
        }
        if (jSONObject.has("pyload_h5")) {
            ycxVarZb.ycx("pyload_h5", jSONObject.optString("pyload_h5"));
        }
        if (jSONObject.has("pure_pyload_h5")) {
            ycxVarZb.ycx("playableLoadH5Url", jSONObject.optString("pure_pyload_h5"));
        }
        if (jSONObject.has("ads_url")) {
            ycxVarZb.ycx("ads_url", jSONObject.optString("ads_url"));
        }
        if (jSONObject.has("settings_url")) {
            ycxVarZb.ycx("settings_url", jSONObject.optString("settings_url"));
        }
        if (jSONObject.has("app_log_url")) {
            ycxVarZb.ycx("app_log_url", jSONObject.optString("app_log_url"));
        }
        if (jSONObject.has("privacy_url")) {
            ycxVarZb.ycx("policy_url", jSONObject.optString("privacy_url"));
        }
        if (jSONObject.has("consent_url")) {
            ycxVarZb.ycx("consent_url", jSONObject.optString("consent_url"));
        }
        if (jSONObject.has("ivrv_downward")) {
            ycxVarZb.ycx("ivrv_downward", jSONObject.optInt("ivrv_downward", 0));
        }
        if (jSONObject.has("dc")) {
            ycxVarZb.ycx("dc", jSONObject.optString("dc"));
        }
        ea.zb().ycx(jSONObject, ycxVarZb);
        if (jSONObject.has("insert_js_config")) {
            ycxVarZb.ycx("insert_js_config", jSONObject.optString("insert_js_config", b.f42142b));
        }
        if (jSONObject.has("max_tpl_cnts")) {
            ycxVarZb.ycx("max_tpl_cnts", jSONObject.optInt("max_tpl_cnts", 100));
        }
        if (jSONObject.has("target_region")) {
            ycxVarZb.ycx("target_region", jSONObject.optString("target_region", b.f42142b));
        }
        JSONObject jSONObjectOptJSONObject5 = jSONObject.optJSONObject("app_common_config");
        if (jSONObjectOptJSONObject5 != null) {
            if (jSONObjectOptJSONObject5.has("force_language")) {
                String strOptString = jSONObjectOptJSONObject5.optString("force_language");
                if (!TextUtils.isEmpty(strOptString) && f26110dj.contains(strOptString)) {
                    ycxVarZb.ycx("force_language", strOptString);
                }
            }
            if (jSONObjectOptJSONObject5.has("fetch_tpl_timeout_ctrl")) {
                ycxVarZb.ycx("fetch_tpl_timeout_ctrl", jSONObjectOptJSONObject5.optInt("fetch_tpl_timeout_ctrl", 3000));
            }
            if (jSONObjectOptJSONObject5.has("fetch_tpl_second")) {
                ycxVarZb.ycx("fetch_tpl_second", jSONObjectOptJSONObject5.optInt("fetch_tpl_second", 0));
            }
            if (jSONObjectOptJSONObject5.has("support_gzip")) {
                ycxVarZb.ycx("support_gzip", jSONObjectOptJSONObject5.optBoolean("support_gzip", false));
            }
            if (jSONObjectOptJSONObject5.has("aes_key")) {
                ycxVarZb.ycx("aes_key", jSONObjectOptJSONObject5.optString("aes_key"));
            }
            if (jSONObjectOptJSONObject5.has("support_rtl")) {
                ycxVarZb.ycx("support_rtl", jSONObjectOptJSONObject5.optBoolean("support_rtl", false));
            }
            if (jSONObjectOptJSONObject5.has("ad_revenue_enable")) {
                ycxVarZb.ycx("ad_revenue_enable", jSONObjectOptJSONObject5.optBoolean("ad_revenue_enable", true));
            }
            if (jSONObjectOptJSONObject5.has("gecko_hosts")) {
                try {
                    this.lud.clear();
                    JSONArray jSONArrayOptJSONArray = jSONObjectOptJSONObject5.optJSONArray("gecko_hosts");
                    if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() != 0) {
                        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                            this.lud.add(jSONArrayOptJSONArray.getString(i5));
                        }
                    }
                    this.lud = ycx(this.lud);
                    ycxVarZb.ycx("gecko_hosts", jSONArrayOptJSONArray.toString());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSkT9FcmR20Gl7+IoYKqGbVmQ==", "SO87kDC5e9GFWPNcmBA=", 247);
                    htf.sya("GeckoLog: settings json error ".concat(String.valueOf(th2)), new Object[0]);
                }
            }
        }
        if (jSONObject.has("read_video_from_cache")) {
            ycxVarZb.ycx("read_video_from_cache", jSONObject.optInt("read_video_from_cache", 1));
        }
        sya.ycx(jSONObject.optJSONArray("ad_slot_conf_list"));
        JSONObject jSONObjectOptJSONObject6 = jSONObject.optJSONObject("privacy");
        if (jSONObjectOptJSONObject6 != null) {
            if (jSONObjectOptJSONObject6.has("ad_enable")) {
                ycxVarZb.ycx("privacy_ad_enable", jSONObjectOptJSONObject6.optInt("ad_enable", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject6.has("personalized_ad")) {
                ycxVarZb.ycx("privacy_personalized_ad", jSONObjectOptJSONObject6.optInt("personalized_ad", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject6.has("sladar_enable")) {
                ycxVarZb.ycx("privacy_sladar_enable", jSONObjectOptJSONObject6.optInt("sladar_enable", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject6.has("app_log_enable")) {
                ycxVarZb.ycx("privacy_app_log_enable", jSONObjectOptJSONObject6.optInt("app_log_enable", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject6.has("debug_unlock")) {
                ycxVarZb.ycx("privacy_debug_unlock", jSONObjectOptJSONObject6.optInt("debug_unlock", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject6.has(PglSSConfig.CUSTOMINFO_KEY_ALLOWED_FIELDS)) {
                String strOptString2 = jSONObjectOptJSONObject6.optString(PglSSConfig.CUSTOMINFO_KEY_ALLOWED_FIELDS, b.f42142b);
                if (!TextUtils.isEmpty(strOptString2)) {
                    ycxVarZb.ycx("privacy_fields_allowed", strOptString2);
                } else {
                    ycxVarZb.ycx("privacy_fields_allowed");
                }
            }
            if (jSONObjectOptJSONObject6.has("app_reg")) {
                int iOptInt3 = jSONObjectOptJSONObject6.optInt("app_reg", -1);
                if (iOptInt3 == 0 && xz.ycx().dj() == 1 && com.bytedance.sdk.openadsdk.dv.lud.ycx("app_register_alert_enable", false)) {
                    yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.settings.fby.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(pmi.ycx(), "Appid is not registered on pangle media platform", 1).show();
                        }
                    });
                }
                ycxVarZb.ycx("privacy_app_reg", iOptInt3 == 1);
                com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ycx(iOptInt3);
            }
        }
        if (jSONObject.has("video_cache_config")) {
            ycxVarZb.ycx("video_cache_config", jSONObject.optString("video_cache_config"));
        }
        if (jSONObject.has("loaded_recall_time")) {
            int iOptInt4 = jSONObject.optInt("loaded_recall_time", 0);
            if (iOptInt4 != 0 && iOptInt4 != 1) {
                iOptInt4 = 0;
            }
            ycxVarZb.ycx("loadedCallbackOpportunity", iOptInt4);
        }
        if (jSONObject.has("splash_video_load_strategy")) {
            int iOptInt5 = jSONObject.optInt("splash_video_load_strategy", 0);
            if (iOptInt5 < 0 || iOptInt5 > 3) {
                iOptInt5 = 0;
            }
            ycxVarZb.ycx("splash_video_load_strategy", iOptInt5);
        }
        if (jSONObject.has("user_compliance_status")) {
            com.bytedance.sdk.openadsdk.core.ea.zb.ycx().zb(jSONObject.optInt("user_compliance_status", -1));
        }
        if (jSONObject.has("user_compliance_status_reason")) {
            com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ycx(jSONObject.optString("user_compliance_status_reason", b.f42142b));
        }
        if (jSONObject.has("allow_req_time")) {
            com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ycx(jSONObject.optLong("allow_req_time", com.bytedance.sdk.openadsdk.core.ea.zb.ycx.longValue()));
        }
        if (jSONObject.has("allow_blind_mode_request_ad")) {
            ycxVarZb.ycx("allow_blind_mode_request_ad", jSONObject.optBoolean("allow_blind_mode_request_ad", false));
        }
        JSONObject jSONObjectOptJSONObject7 = jSONObject.optJSONObject("bus_con");
        if (jSONObjectOptJSONObject7 != null) {
            if (jSONObjectOptJSONObject7.has("bus_con_sec_type")) {
                ycxVarZb.ycx("bus_con_sec_type", jSONObjectOptJSONObject7.optInt("bus_con_sec_type", LayoutNode.NotPlacedPlaceOrder));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_adshow_check_enable")) {
                ycxVarZb.ycx("bus_con_adshow_check_enable", jSONObjectOptJSONObject7.optBoolean("bus_con_adshow_check_enable", true));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_token_thread_count")) {
                ycxVarZb.ycx("bus_con_token_thread_count", jSONObjectOptJSONObject7.optInt("bus_con_token_thread_count", 4));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_video_keep_screen_on")) {
                ycxVarZb.ycx("bus_con_video_keep_screen_on", jSONObjectOptJSONObject7.optInt("bus_con_video_keep_screen_on", 1));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_auto_click_delay")) {
                ycxVarZb.ycx("bus_con_auto_click_delay", jSONObjectOptJSONObject7.optInt("bus_con_auto_click_delay", 3000));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_express_host")) {
                ycxVarZb.ycx("bus_con_express_host", jSONObjectOptJSONObject7.optString("bus_con_express_host", "https://lf-static.tiktokpangle-cdn-us.com/obj/ad-pattern-tx/"));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_check_clz")) {
                ycxVarZb.ycx("bus_con_check_clz", jSONObjectOptJSONObject7.optString("bus_con_check_clz", b.f42142b));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_url_check")) {
                ycxVarZb.ycx("bus_con_url_check", jSONObjectOptJSONObject7.optInt("bus_con_url_check", 1));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_behavior_count")) {
                ycxVarZb.ycx("bus_con_behavior_count", jSONObjectOptJSONObject7.optInt("bus_con_behavior_count", 300));
            }
            String str = ea.ycx;
            if (jSONObjectOptJSONObject7.has(str)) {
                ycxVarZb.ycx(str, jSONObjectOptJSONObject7.optBoolean(str, false));
            }
            String str2 = ea.f26101zb;
            if (jSONObjectOptJSONObject7.has(str2)) {
                ycxVarZb.ycx(str2, jSONObjectOptJSONObject7.optInt(str2, 10000));
            }
            String str3 = ea.sya;
            if (jSONObjectOptJSONObject7.has(str3)) {
                ycxVarZb.ycx(str3, (float) jSONObjectOptJSONObject7.optDouble(str3, 1.0d));
            }
            if (jSONObjectOptJSONObject7.has("bus_con_slide_num")) {
                int iOptInt6 = jSONObjectOptJSONObject7.optInt("bus_con_slide_num", 2);
                if (iOptInt6 <= 0) {
                    iOptInt6 = 2;
                }
                ycxVarZb.ycx("bus_con_slide_num", iOptInt6);
            }
        }
        if (jSONObject.has("perf_con")) {
            try {
                JSONObject jSONObjectOptJSONObject8 = jSONObject.optJSONObject("perf_con");
                if (jSONObjectOptJSONObject8 != null) {
                    if (jSONObjectOptJSONObject8.has("perf_con_applog_send")) {
                        String strOptString3 = jSONObjectOptJSONObject8.optString("perf_con_applog_send");
                        if (!TextUtils.isEmpty(strOptString3)) {
                            ycxVarZb.ycx("perf_con_applog_send", strOptString3);
                        }
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_apm_native")) {
                        ycxVarZb.ycx("perf_con_apm_native", jSONObjectOptJSONObject8.optInt("perf_con_apm_native"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_webview_preload_cache")) {
                        ycxVarZb.ycx("perf_con_webview_preload_cache", jSONObjectOptJSONObject8.optInt("perf_con_webview_preload_cache"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_webview_preload_cache_v3")) {
                        ycxVarZb.ycx("perf_con_webview_preload_cache_v3", jSONObjectOptJSONObject8.optInt("perf_con_webview_preload_cache_v3"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_webview_cache_count")) {
                        ycxVarZb.ycx("perf_con_webview_cache_count", jSONObjectOptJSONObject8.optInt("perf_con_webview_cache_count", 0));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_webview_cache_count_v3")) {
                        ycxVarZb.ycx("perf_con_webview_cache_count_v3", jSONObjectOptJSONObject8.optInt("perf_con_webview_cache_count_v3", 0));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_thread_stack_size") && (iOptInt = jSONObjectOptJSONObject8.optInt("perf_con_thread_stack_size")) >= -524288 && iOptInt <= 0) {
                        ycxVarZb.ycx("perf_con_thread_stack_size", iOptInt);
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_thread_pool_config")) {
                        String strOptString4 = jSONObjectOptJSONObject8.optString("perf_con_thread_pool_config");
                        if (!TextUtils.isEmpty(strOptString4)) {
                            ycxVarZb.ycx("perf_con_thread_pool_config", strOptString4);
                        }
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_is_new_net_thread")) {
                        ycxVarZb.ycx("perf_con_is_new_net_thread", jSONObjectOptJSONObject8.optInt("perf_con_is_new_net_thread", 0));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_adlog_expire_time")) {
                        ycxVarZb.ycx("perf_con_adlog_expire_time", jSONObjectOptJSONObject8.optLong("perf_con_adlog_expire_time"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_adlog_turn_off_retry_ad")) {
                        ycxVarZb.ycx("perf_con_adlog_turn_off_retry_ad", jSONObjectOptJSONObject8.optLong("perf_con_adlog_turn_off_retry_ad"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_adlog_turn_off_retry_stats")) {
                        ycxVarZb.ycx("perf_con_adlog_turn_off_retry_stats", jSONObjectOptJSONObject8.optLong("perf_con_adlog_turn_off_retry_stats"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_applog_rate")) {
                        ycxVarZb.ycx("perf_con_applog_rate", jSONObjectOptJSONObject8.optString("perf_con_applog_rate"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_track_url_strategy")) {
                        ycxVarZb.ycx("perf_con_track_url_strategy", jSONObjectOptJSONObject8.optString("perf_con_track_url_strategy"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_drawable_code")) {
                        ycxVarZb.ycx("perf_con_drawable_code", jSONObjectOptJSONObject8.optInt("perf_con_drawable_code", 0));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_close_button_delay_check_time")) {
                        ycxVarZb.ycx("perf_con_close_button_delay_check_time", jSONObjectOptJSONObject8.optInt("perf_con_close_button_delay_check_time", -1));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_drop2rt_skip_label_list")) {
                        ycxVarZb.ycx("perf_con_drop2rt_skip_label_list", jSONObjectOptJSONObject8.optString("perf_con_drop2rt_skip_label_list"));
                    }
                    if (jSONObjectOptJSONObject8.has("perf_con_sync_gaid")) {
                        ycxVarZb.ycx("perf_con_sync_gaid", jSONObjectOptJSONObject8.optInt("perf_con_sync_gaid"));
                    }
                }
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSkT9FcmR20Gl7+IoYKqGbVmQ==", "SO87kDC5e9GFWPNcmBA=", 538);
                htf.sya("SettingsDefaultRepository", th3.getMessage());
            }
        }
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("app_common_config", jSONObjectOptJSONObject5);
            jSONObject2.put("perf_con", jSONObject.optJSONObject("perf_con"));
            jSONObject2.put("bus_con", jSONObject.optJSONObject("bus_con"));
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSkT9FcmR20Gl7+IoYKqGbVmQ==", "SO87kDC5e9GFWPNcmBA=", 548);
            htf.sya("SettingsDefaultRepository", "coreSettingJson", e3.getMessage());
        }
        ycxVarZb.ycx("core_settings", jSONObject2.toString());
        if (jSONObject.has("dual_event_url")) {
            ycxVarZb.ycx("dual_event_url", jSONObject.optString("dual_event_url"));
        }
        if (jSONObject.has("token_enable")) {
            ycxVarZb.ycx("token_enable", jSONObject.optInt("token_enable"));
        }
        if (jSONObject.has("token_adx_ids")) {
            String strOptString5 = jSONObject.optString("token_adx_ids", b.f42142b);
            if (!TextUtils.isEmpty(strOptString5)) {
                ycxVarZb.ycx("token_adx_ids", strOptString5);
            } else {
                ycxVarZb.ycx("token_adx_ids");
            }
        }
        if (jSONObject.has("ads_url_backup")) {
            String strOptString6 = jSONObject.optString("ads_url_backup", b.f42142b);
            if (!TextUtils.isEmpty(strOptString6)) {
                ycxVarZb.ycx("ads_url_backup", strOptString6);
            } else {
                ycxVarZb.ycx("ads_url_backup");
            }
        }
        if (jSONObject.has("dual_event_url_backup")) {
            String strOptString7 = jSONObject.optString("dual_event_url_backup", b.f42142b);
            if (!TextUtils.isEmpty(strOptString7)) {
                ycxVarZb.ycx("dual_event_url_backup", strOptString7);
            } else {
                ycxVarZb.ycx("dual_event_url_backup");
            }
        }
        ycxVarZb.ycx();
        ea.zb().ifb();
        lud();
    }

    public static Set<String> ycx(Set<String> set) {
        try {
            if (set == null) {
                return new HashSet();
            }
            HashSet hashSet = new HashSet();
            for (String str : set) {
                if (!TextUtils.isEmpty(str)) {
                    hashSet.add(str);
                }
            }
            return hashSet;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSkT9FcmR20Gl7+IoYKqGbVmQ==", "WOIolA2ZZNeUU/RVhR2k", 609);
            return new HashSet();
        }
    }
}
