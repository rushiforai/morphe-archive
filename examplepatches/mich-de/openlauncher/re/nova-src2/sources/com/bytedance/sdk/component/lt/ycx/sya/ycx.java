package com.bytedance.sdk.component.lt.ycx.sya;

import android.text.TextUtils;
import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.component.lt.ycx.lud;
import com.bytedance.sdk.component.lt.ycx.ul;
import com.bytedance.sdk.component.lt.ycx.zb.dj;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.tiktok.util.TTConst;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private static final LinkedList<String> ycx = new LinkedList<>();

    /* renamed from: zb, reason: collision with root package name */
    private static final LinkedList<String> f23853zb = new LinkedList<>();
    private static final LinkedList<String> sya = new LinkedList<>();

    /* renamed from: dj, reason: collision with root package name */
    private static final LinkedList<String> f23849dj = new LinkedList<>();
    private static final Map<String, Integer> lud = new HashMap();

    /* renamed from: lt, reason: collision with root package name */
    private static HashMap<String, Integer> f23851lt = null;

    /* renamed from: ul, reason: collision with root package name */
    private static String f23852ul = "upload_init";
    private static int fby = 0;

    /* renamed from: jw, reason: collision with root package name */
    private static int f23850jw = 0;

    private static synchronized void dj(String str) {
        LinkedList<String> linkedList = f23849dj;
        if (linkedList.size() < 10) {
            linkedList.add(str);
        } else {
            linkedList.removeFirst();
            linkedList.add(str);
        }
    }

    private static String ea(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || !zb()) {
            return null;
        }
        JSONObject jSONObjectLt = ycxVar.lt();
        try {
            return new JSONObject(ycxVar.dj() == 1 ? jSONObjectLt.optString("event_extra") : jSONObjectLt.optString("ad_extra_data")).optString("sdk_session_id");
        } catch (JSONException e3) {
            e3.getMessage();
            return null;
        }
    }

    public static long fby(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || !zb()) {
            return 0L;
        }
        try {
            return new JSONObject(ycxVar.lt().optString("ad_extra_data")).optLong("sdk_event_index");
        } catch (Exception e3) {
            e3.getMessage();
            return 0L;
        }
    }

    public static void jc(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        try {
            if (zb()) {
                lud ludVarSyc = ul.lt().syc();
                if (!TextUtils.isEmpty(ycxVar.sya())) {
                    zb.ycx(dj.f23908dj.lv(), 1);
                }
                if (ludVarSyc == null || !ludVarSyc.zb()) {
                    return;
                }
                if (ycxVar.dj() == 1) {
                    zb(ycxVar);
                    sya(ycxVar);
                    ycxVar.sya();
                    ea(ycxVar);
                    return;
                }
                if (ycxVar.dj() == 0) {
                    if (ycxVar.zb() != 3) {
                        if (jw(ycxVar) != 0) {
                            ycx(ycxVar);
                        } else {
                            ycx(ycxVar);
                        }
                        fby(ycxVar);
                        ycxVar.sya();
                        ea(ycxVar);
                        return;
                    }
                    if (ycxVar.lt() != null) {
                        ycxVar.lt().optString(DatabaseConstants.EVENT_FIELD);
                        fby(ycxVar);
                        jw(ycxVar);
                        ycxVar.sya();
                        ea(ycxVar);
                    }
                }
            }
        } catch (Exception e3) {
            e3.getMessage();
        }
    }

    public static long jw(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || !zb()) {
            return 0L;
        }
        try {
            return new JSONObject(ycxVar.lt().optString("ad_extra_data")).optLong("sdk_event_valid_index");
        } catch (Exception e3) {
            e3.getMessage();
            return 0L;
        }
    }

    private static synchronized String lt() {
        StringBuilder sb2;
        try {
            sb2 = new StringBuilder();
            Iterator<String> it = f23849dj.iterator();
            while (it.hasNext()) {
                sb2.append(it.next());
                sb2.append(",");
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return sb2.toString();
    }

    public static String lud(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || sya()) {
            return null;
        }
        String strOptString = ycxVar.lt().optString("log_extra");
        if (!TextUtils.isEmpty(strOptString)) {
            try {
                return new JSONObject(strOptString).optString("req_id");
            } catch (JSONException unused) {
            }
        }
        return null;
    }

    private static synchronized String sya(String str) {
        StringBuilder sb2;
        try {
            LinkedList<String> linkedList = sya;
            if (linkedList.size() >= 10) {
                linkedList.removeFirst();
                linkedList.add(str);
            } else {
                linkedList.add(str);
            }
            sb2 = new StringBuilder();
            Iterator<String> it = linkedList.iterator();
            while (it.hasNext()) {
                sb2.append(it.next());
                sb2.append(",");
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return sb2.toString();
    }

    public static void ul(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) throws JSONException {
        try {
            if (ul.lt().syc().ul()) {
                dj.f23908dj.ycx(System.currentTimeMillis() - ycxVar.ul());
                ycxVar.zb(System.currentTimeMillis());
                if (ycxVar.dj() == 0 && ul.lt().syc() != null && ul.lt().syc().ycx()) {
                    String strYcx = ycx(ycxVar);
                    if (ycx(strYcx)) {
                        return;
                    }
                    JSONObject jSONObjectLt = ycxVar.lt();
                    String strOptString = ycxVar.lt().optString("ad_extra_data");
                    if (TextUtils.isEmpty(strOptString)) {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("save_success_labels", zb(strYcx + "_" + jw(ycxVar)));
                        jSONObjectLt.put("ad_extra_data", jSONObject.toString());
                        return;
                    }
                    JSONObject jSONObject2 = new JSONObject(strOptString);
                    if (TextUtils.isEmpty(jSONObject2.optString("save_success_labels"))) {
                        jSONObject2.put("save_success_labels", zb(strYcx + "_" + jw(ycxVar)));
                    }
                    jSONObjectLt.put("ad_extra_data", jSONObject2.toString());
                }
            }
        } catch (Exception unused) {
        }
    }

    public static void ycx() {
        if (f23851lt != null) {
            return;
        }
        String[] strArr = {"first_view", "open_splash", "ad_landing_webview_init", "show_failed_topview", "adstyle_template_show", "splash_init_monitor_first", "download_video_succeed", "shake_skip", "receive", "video_over_auto", "render_time", "splash_ad", "preload_start", "mute", "covered", "download_image_failed", "splash_init_monitor_all", "preload_success_time", "download_video_start_sdk", "download_video_count", "not_showing_reason", "download_image_succeed", "load_video_success", "launch_covered", "download_video_prepare", "download_video_start", "boarding", "ad_wap_stat", "splash_pick", "preload_fail", "should_show", "adstyle_template_fill", "unmute", "preload_success", "show_failed", "stop_showing_monitor", "download_video_no_download", "track_url", "download_creative_duration", "adstyle_template_render", "download_video_count_splash_sdk", "landing_preload_finish", "adstyle_template_load", "load_ad_duration", "client_false_show", "client_false", "download_video_failed", "data_invalid", "topview_boarding", "topview_start_download", "topview_show_confirmed", "splash_start_download", "topview_show_rejected", "splash_no_download", "redownload_video_count", "topview_other_show", "topview_no_download", "ad_selected", "invalid_model", "topview_deliver", "ad_no_selected", "topview_ad_download_retry_label", "request", "response", "parse_finished", "front_performance", "ad_resp", "ad_resp_nodata", "preload_finish", "transit_show", "splash_switch", "block_splash_F2", "render_picture_time", "network_type", "play_start_error", "load_video_error", "render_picture_timeout", "py_loading_success", "download_status", "first_screen_load_finish", "landing_preload_failed", "data_received", "preload_result", "show_result", "reponse", "valid_time", "brand_satefy_context", "topview_ad_link_fail_label", "end_feed_request", "start_feed_request", "set_feed_data", "delayinstall_conflict_with_back_dialog", "clean_fetch_apk_head_failed", "cleanspace_download_after_quite_clean", "fps_too_low", "open_policy", "landing_perf_stats", "preload_topview", "show_effect_start", "dislike_monitor", "hour_show", "hour_skip", "triggered", "click_sound_switch", "enter_loft", "download_resume", "install_view_result", "contiguous_ad_event", "contiguous_ad_remove_event", "report_monitor", "open_landing_blank", "dynamic_ad", "report_load_failed", "ad_download_failed", "download_video_start_first_sdk", "splash_receive", "video_play", "clean_fetch_apk_head_switch_close", "label_external_permission", "pause_reserve_wifi_switch_status", "landing_download_dialog_show", "download_connect", "download_uncompleted", "pause_reserve_wifi_dialog_show", "download_io", "pause_reserve_wifi_confirm", "skvc_load_time", "segment_io", "click_no", "pause_reserve_wifi_cancel_on_wifi", "udp_stop", "mma_url", "error_save_sp", "download_notification_try_show", "ttd_pref_monitor", "item_above_the_fold_stay_time", "ttdownloader_unity", "bdad_query_log", "bdad_load_finish", "bdad_load", "bdad_load_fail", "undefined", "valid_stock", "show_filter", "splash_pk_result", "endcard_page_info", "page_on_create", "statistics_feed_docker", "show_search_card_word", "ad_new_video_render_start_label", "ad_new_video_play_start_label", "ad_new_video_ad_patch_data_set_null_label", "ad_new_video_ad_patch_play_label", "ad_new_video_ad_patch_render_label", "debug_touch_start", "try_second_request", "egg_unzip_success", "tap_2", "anti_0_result", "anti_2_result", "egg_unzip_no_start", "preload_no_start", "bind_impression_212202", "guide_auth_dialog_cancel", "show_im_entry", "sub_reco_impression_v2", "sync_request_log_mask", "no_send_sync_request", "load_timeout", "send_sync_request", "sync_request_not_show", "show_subv_tt_video_food", "track", "custom_event", "rd_landing_page_stat", "update_local_data", "showlimit", "upload_result", "debug_othershow", "debug_otherclick", "ad_show_time", "push_launch", "union_send_duplicate", "mnpl_js_finish_load", "mnpl_resource_finish_load", "mnpl_material_render_timeout", "mnpl_render_timing", "mnpl_vedio_interactive_timegap", "click_non_rectify_area", "start_impression", "end_impression", "picture_render_time", "splash_stop_show", "skip_post", "skan_show_start", "skan_show_end", "load_video_start", "rifle_ad_monitor", "download_video_redownload", "splash_video_quality", "splash_video_end", "splash_video_pause", "splash_video_failed", "adtrace_start_clear", "adtrace_clear_past_data", "adtrace_end_clear", "adtrace_write_success", "adtrace_write_failed", "adtrace_read_result", "adtrace_read_success", "adtrace_read_failed", "pick_model", "cache_model", "adtrace_reparse_file", "deeplink_failed_all", "ad_live_degenerate", "ad_live_miss", "live_play_fail", "sko_show_success", "sko_show_fail", "commerce_apps_open", "commerce_apps_jump", "pic_card_show", "live_ad_card_render_finish", "adtrace_select", "received_card_status", "live_ad_page_load_success", "mp_download_result", "download_video_cancel", "jump_count", "adtrace_try_show", "show_cart_entrance", "live_ad_page_load_fail", "click_interacted", "pop_up", "pop_up_cancel", "stream_loadtime", "mnpl_guide_comp_render", "thirdquartile", "customer_feed_pause", "customer_play_start", "customer_feed_break", "click_area_log", "customer_feed_continue", "customer_feed_play", "mnpl_resource_start_preload", "mnpl_resource_finish_preload", "customer_feed_over", "get_preload_ad", "web_inspect_status", "web_report_status", "preload_begin", "preload_end", "open_begin", "open_end", "pangle_live_sdk_monitor", "success", "rifle_load_state", "rifle_uri_load_state", "component_init", "component_release", "ad_lynx_download_sendAdLog", "dynamic2_render", "lynx_card_show", "pop_up_download", "live_shelf_commodity_show", "unity_fe_click", "enter_ads_explain", "adx_ads_switch", "personal_ads_switch", "qc_product_picture_cancel", "qc_product_picture_save", "qc_product_picture_press", "qc_product_detail_show", "qc_price_instruction_click", "qc_edit_sku_num_click", "service_description_page_duration", "enter_business_qualification_page ", "service_description_page_show", "order_words_fe", "qc_payment_mode_show", "qc_click_ali_pay", "qc_district_addr_click", "qc_auto_information_add", "qc_dial_consult_cancel_btn_click", "qc_dial_consult_show", "qc_maomadeng_click", "qc_maomadeng_show", "slide_product_big_picture", "qc_service_description_close", "appstore_manager_request", "preload_video_result", "preload_video_start", "adtrace_bind", "topview_ad_link_match_event", "skip_leisure_interact_render", "click_start_download", "ad_lynx_landing_page_exception", "lynx_page_res_download_monitor_event", "live_fail", "live_over", "render_live_picture_success", "render_live_picture_fail", "live_play_success", "live_play_close", "item_play_pver", "ad_gap_info", "item_play_over", "has_period_first_chance", "enter_live_auto", "mnpl_material_video_scene_show", "ad_rerank", "in_web_click", "post_request_failed", "destroy", "bidding_load", "bidding_receive", "in_web_scroll", "tobsdk_livesdk_live_show", "xigua_ad_rerank", "applink_unity", "top_ad_show", "top_button_show", "skip_button_show", "skip_click", "shake_show", "skip_result", "show_personal_compliance_button_click", "personal_compliance_click", "ad_click_result", "ad_preload_video", "popup_show", "topview_feed_down", "qr_scan", "qr_show", "topview_popup_show", "topview_feed_over", "topview_feed_show", "feed_down", "engine_ad_send", "permission_click", "policy_click", "download_start_click", "mini_playable_style_report", "load_detect", "aweme_show_info", "click_convert_anchor_detail_page", "click_anchor_gift_button", "show_anchor_gift_page", "click_anchor_gift_card", "show_anchor_gift_card", "anchor_convert_button", "show_anchor_page", "search_result_click", "sdk_session_launch", "not_use_app_link_sdk", "click_ios_check", "auto_open", "bind_click_area", "page_load", "show_finish", "next_fresh", "play_ready", "splash_pk_time", "unshow", "feed_show_failed", "othershow_cancel", "lu_cache", "realtime_splash_result", "channel_override_result", "internal_jump_live_status", "mnpl_video_play_backward", "splash_enter_foreground", "splash_enter_background", "button_light", "long_press", "webview_material_missing_key_error", "live_life_project_click_card", "mnpl_click_event", "show_anchor_convert_button", "bdar_log_info", "bdar_ad_request", "bdar_lynx_template_load_time", "bdar_lynx_fallback", "bdar_fetch_template_data", "bdar_lynx_render_time", "bdar_video_play_effective", "bdar_video_first_frame", "bdar_lynx_jsb_error", "invalidate_back_url_monitor_event", "lynx_page_plugin_exception_event", "live_custom_interaction", "pinch", "if_splash_card", "splash_card_show", "card_show_fail", "splash_card_click", "splash_card_close", "wind_icon_click", "excluded", "show_error", "toutiao_ad_receive", "show_ad", "toutiao_ad_excluded", "close_card", "lynx_status", "qpon_join", "apk_download_user", "comment_key_word_show", "v3_show_ad", "show_wish_button", "enterSection", "single_comment_show", "enter_product_detail", "xigua_ad_request", "qpon_apply", "splash_total_duration", "splash_render_duration", "download_template_duration", "homepage_hot", "homepage_follow", "homepage_fresh", "video_play_success", "general_search", "video_render_cost", "single_ad_render_cost", "unexpected_accurate_pause", "mnpl_interact_skip", "web_report_request_url", "web_report_init_status", "first_request", "video_ended", "mnpl_script_error", "open_wechat_failed_shake", "open_wechat_shacke", "open_wechat_success_shake", "options_popup", "close_pers_ads_type", "check_closed_type", "ad_guide_panel", "learn_ads", "learn_adx_ads", "learn_pers_ads", "resume_closed_type", "twist", "open_wechat_shake"};
        f23851lt = new HashMap<>(446);
        for (int i5 = 0; i5 < 446; i5++) {
            f23851lt.put(strArr[i5], 1);
        }
    }

    private static synchronized String zb(String str) {
        StringBuilder sb2;
        try {
            LinkedList<String> linkedList = f23853zb;
            if (linkedList.size() >= 10) {
                linkedList.removeFirst();
                linkedList.add(str);
            } else {
                linkedList.add(str);
            }
            sb2 = new StringBuilder();
            Iterator<String> it = linkedList.iterator();
            while (it.hasNext()) {
                sb2.append(it.next());
                sb2.append(",");
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return sb2.toString();
    }

    public static void lt(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) throws JSONException {
        try {
            if (ycxVar.dj() == 0 && ul.lt().syc() != null && ul.lt().syc().ycx()) {
                JSONObject jSONObjectLt = ycxVar.lt();
                String strYcx = ycx(ycxVar);
                if (ycx(strYcx)) {
                    return;
                }
                lud(ycxVar);
                String strOptString = jSONObjectLt.optString("ad_extra_data");
                if (!TextUtils.isEmpty(strOptString)) {
                    JSONObject jSONObject = new JSONObject(strOptString);
                    if (TextUtils.isEmpty(jSONObject.optString("will_send_labels"))) {
                        jSONObject.put("will_send_labels", sya(strYcx + "_" + jw(ycxVar)));
                        jSONObject.put("send_success_valid_labels", lt());
                    }
                    jSONObjectLt.put("ad_extra_data", jSONObject.toString());
                    return;
                }
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("will_send_labels", sya(strYcx + "_" + jw(ycxVar)));
                jSONObject2.put("send_success_valid_labels", lt());
                jSONObjectLt.put("ad_extra_data", jSONObject2.toString());
            }
        } catch (Exception e3) {
            e3.getMessage();
        }
    }

    public static synchronized int dj(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar != null) {
            if (ycxVar.lt() != null) {
                if (!zb()) {
                    return 0;
                }
                try {
                    return new JSONObject(ycxVar.lt().optString("ad_extra_data")).optInt("sdk_event_self_count");
                } catch (Exception unused) {
                    return 0;
                }
            }
        }
        return 0;
    }

    public static String ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || sya()) {
            return null;
        }
        if (ycxVar.zb() == 3) {
            return ycxVar.lt().optString(DatabaseConstants.EVENT_FIELD);
        }
        return ycxVar.lt().optString("label");
    }

    public static boolean lud() {
        return zb() || dj();
    }

    public static int sya(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || !zb()) {
            return -1;
        }
        try {
            return new JSONObject(ycxVar.lt().optString("event_extra")).optInt("stats_index");
        } catch (JSONException unused) {
            return -1;
        }
    }

    public static String zb(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null || ycxVar.lt() == null || sya()) {
            return null;
        }
        return ycxVar.lt().optString(TTConst.TRACK_TYPE);
    }

    public static boolean ycx(String str) {
        HashMap<String, Integer> map = f23851lt;
        if (map == null || str == null) {
            return false;
        }
        return map.containsKey(str);
    }

    public static boolean zb() {
        lud ludVarSyc = ul.lt().syc();
        return ludVarSyc != null && ludVarSyc.lt() == 0;
    }

    public static void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, int i5) {
        try {
            if (ul.lt().syc().ul()) {
                for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : list) {
                    if (ycxVar != null && ycxVar.fby() != 0) {
                        long jCurrentTimeMillis = System.currentTimeMillis() - ycxVar.fby();
                        com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar2 = dj.f23908dj;
                        ycxVar2.rl().incrementAndGet();
                        ycxVar2.duz().getAndAdd(jCurrentTimeMillis);
                        ycxVar.sya(System.currentTimeMillis());
                    }
                    if (ycxVar != null) {
                        lt(ycxVar);
                    }
                }
                dj.f23908dj.bba().getAndAdd(list.size());
            }
        } catch (Exception unused) {
        }
    }

    public static boolean sya() {
        lud ludVarSyc = ul.lt().syc();
        return ludVarSyc != null && ludVarSyc.lt() == 2;
    }

    public static boolean dj() {
        lud ludVarSyc = ul.lt().syc();
        return ludVarSyc != null && ludVarSyc.lt() == 1;
    }

    public static void ycx(JSONObject jSONObject, com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx ycxVar) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc != null && ludVarSyc.zb() && lud()) {
            jSONObject.optString("label");
            ycxVar.lud();
        }
    }

    public static void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, int i5, String str) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || !ludVarSyc.zb() || list == null || sya()) {
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        boolean z11 = false;
        for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : list) {
            if (ycxVar.dj() == 0) {
                JSONObject jSONObjectLt = ycxVar.lt();
                String strYcx = ycx(ycxVar);
                if (ycxVar.zb() == 3) {
                    if (jSONObjectLt != null) {
                        strYcx = jSONObjectLt.optString(DatabaseConstants.EVENT_FIELD);
                    }
                    c0.C(sb2, " [v3:", strYcx, "] ");
                } else {
                    long jFby = fby(ycxVar);
                    long jJw = jw(ycxVar);
                    int iDj = dj(ycxVar);
                    sb2.append(" [");
                    sb2.append(jFby);
                    sb2.append("_");
                    sb2.append(strYcx);
                    if (jJw != 0) {
                        sb2.append("_");
                        sb2.append(jJw);
                    }
                    if (iDj == 0) {
                        sb2.append("] ");
                    } else {
                        sb2.append("_");
                        sb2.append(iDj);
                        sb2.append("] ");
                    }
                }
                z11 = true;
            } else if (ycxVar.dj() == 1) {
                String strZb = zb(ycxVar);
                int iSya = sya(ycxVar);
                sb2.append(" [");
                sb2.append(iSya);
                sb2.append("_");
                sb2.append(strZb);
                sb2.append("] ");
            }
        }
        if (z11) {
            ycx(i5);
            list.size();
        } else {
            ycx(i5);
            list.size();
        }
    }

    public static String ycx(int i5) {
        switch (i5) {
            case 1:
                return "flush once";
            case 2:
                return "flush memory db";
            case 3:
                return "flush memory";
            case 4:
                return "new event";
            case 5:
                return "server busy";
            case 6:
                return "empty message";
            case 7:
                return "net error";
            default:
                return CarrierConfigurator.APN_TYPE;
        }
    }

    private static void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, String str, lud ludVar) {
        String strYcx = ycx(ycxVar);
        if (ycx(strYcx)) {
            return;
        }
        String strLud = lud(ycxVar);
        if (ycxVar.dj() == 0 && ludVar.ycx()) {
            StringBuilder sbK = k2.k(strYcx, "_");
            sbK.append(jw(ycxVar));
            sbK.append("_");
            sbK.append(strLud);
            sbK.append("_");
            sbK.append(str);
            dj(sbK.toString());
        }
    }

    public static void ycx(boolean z11, int i5, com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        lud ludVarSyc = ul.lt().syc();
        if (sya() || ludVarSyc == null || !ludVarSyc.zb()) {
            return;
        }
        ycx(i5);
        TextUtils.isEmpty(zb(ycxVar));
        TextUtils.isEmpty(ycx(ycxVar));
    }

    public static void ycx(int i5, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, long j11) {
        if (ul.lt().syc().ul()) {
            long jCurrentTimeMillis = System.currentTimeMillis() - j11;
            if (i5 == 200) {
                com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar = dj.f23908dj;
                ycxVar.sg().getAndAdd(jCurrentTimeMillis);
                ycxVar.wr().incrementAndGet();
                ycxVar.iq().getAndAdd(list.size());
                ycxVar.nji().getAndAdd(list.size());
                return;
            }
            if (i5 == -1) {
                dj.f23908dj.dqs().getAndAdd(list.size());
            } else {
                dj.f23908dj.xym().getAndAdd(list.size());
            }
            com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar2 = dj.f23908dj;
            ycxVar2.bh().getAndAdd(jCurrentTimeMillis);
            ycxVar2.giw().incrementAndGet();
        }
    }

    public static void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, String str) {
        try {
            lud ludVarSyc = ul.lt().syc();
            if (ludVarSyc == null || !ludVarSyc.ul() || list == null) {
                return;
            }
            for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : list) {
                if (ycxVar != null) {
                    ycx(ycxVar, str, ludVarSyc);
                }
            }
        } catch (Exception e3) {
            e3.getMessage();
        }
    }
}
