package com.bytedance.sdk.openadsdk.core;

import com.amplitude.core.events.Identify;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import org.brotli.dec.BrotliError;

/* loaded from: classes2.dex */
public class jw {
    public static String ycx(int i5) {
        try {
            if (i5 == -16) {
                return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_ad_able_false_msg");
            }
            if (i5 == -15) {
                return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_lack_android_manifest_configuration");
            }
            if (i5 == 117) {
                return "dynamic1 render time_out";
            }
            if (i5 == 118) {
                return "dynamic1 render error";
            }
            if (i5 == 127) {
                return "dynamic2 render time_out";
            }
            if (i5 == 128) {
                return "dynamic2 render error";
            }
            if (i5 == 137) {
                return "ugen render time_out";
            }
            if (i5 == 138) {
                return "ugen render error";
            }
            if (i5 == 201) {
                return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_load_creative_icon_response_error");
            }
            if (i5 == 202) {
                return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_load_creative_icon_error");
            }
            switch (i5) {
                case -100:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_init_setting_config_not_complete");
                case 113:
                    return "dynamic1 parse error";
                case INVALID_RI_ENDPOINT_VALUE:
                    return "dynamic2 parse error";
                case OMSDK_JS_WRITE_FAILED_VALUE:
                    return "ugen parse error";
                case AD_SERVER_ERROR_VALUE:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_no_ad");
                case 40000:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_content_type");
                case 40001:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_request_pb_error");
                case 40002:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_app_empty");
                case 40003:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_wap_empty");
                case 40004:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_adslot_empty");
                case 40005:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_adslot_size_empty");
                case 40006:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_adslot_id_error");
                case 40007:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_code_adcount_error");
                case 40008:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_image_size");
                case 40009:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_media_id");
                case 40010:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_media_type");
                case 40011:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_ad_type");
                case 40012:
                case 40017:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_access_method_pass");
                case 40013:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_splash_ad_type");
                case 40014:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_redirect");
                case 40015:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_request_invalid");
                case 40016:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_slot_id_app_id_differ");
                case 40018:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_package_name");
                case 40019:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_adtype_differ");
                case 40020:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_new_register_limit");
                case 40021:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_apk_sign_check_error");
                case 40022:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_origin_ad_error");
                case 40023:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_union_os_error");
                case 40024:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_union_sdk_too_old");
                case 40026:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_device_ip");
                case 40028:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_update_version");
                case 40034:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_bidding_type");
                case 40042:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_interstitial_version");
                case 40060:
                    return "Appid is not registered on pangle media platform";
                case 50001:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_sys_error");
                case 60001:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_ror_code_show_event_error");
                case 60002:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_code_click_event_error");
                case 60007:
                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_verify_reward");
                default:
                    switch (i5) {
                        case BrotliError.BROTLI_ERROR_NEGATIVE_DISTANCE /* -12 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_splash_not_have_cache_error");
                        case BrotliError.BROTLI_ERROR_INVALID_WINDOW_BITS /* -11 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_splash_cache_expired_error");
                        case BrotliError.BROTLI_ERROR_INVALID_METABLOCK_LENGTH /* -10 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_splash_cache_parse_error");
                        case BrotliError.BROTLI_ERROR_INVALID_BACKWARD_REFERENCE /* -9 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_request_body_error");
                        case BrotliError.BROTLI_ERROR_EXUBERANT_NIBBLE /* -8 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_frequent_call_erroe");
                        case BrotliError.BROTLI_ERROR_DUPLICATE_SIMPLE_HUFFMAN_SYMBOL /* -7 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_splash_ad_load_image_error");
                        case BrotliError.BROTLI_ERROR_CORRUPTED_RESERVED_BIT /* -6 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_insert_ad_load_image_error");
                        case BrotliError.BROTLI_ERROR_CORRUPTED_PADDING_BITS /* -5 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_banner_ad_load_image_error");
                        case BrotliError.BROTLI_ERROR_CORRUPTED_HUFFMAN_CODE_HISTOGRAM /* -4 */:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_ad_data_error");
                        case -3:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_no_ad_parse");
                        case -2:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_net_error");
                        case -1:
                            return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_parse_fail");
                        default:
                            switch (i5) {
                                case 101:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_render_parse_error");
                                case 102:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_main_template_invalid");
                                case 103:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_diff_template_invalid");
                                case 104:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_fail_meta_invalid");
                                case 105:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_fail_template_parse_error");
                                case 106:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_fail_unknown");
                                case 107:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_render_fail_timeout");
                                case 108:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_reder_ad_load_timeout");
                                case 109:
                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_template_load_fail");
                                default:
                                    switch (i5) {
                                        case AD_LOAD_TOO_FREQUENTLY_VALUE:
                                            return "load time out";
                                        case 10003:
                                            return "resource error";
                                        case 10004:
                                            return "Not allowed PAConsent value, please set 0 or 1";
                                        case 10005:
                                            return "Token enable is invalid";
                                        case 10006:
                                            return "Adx id not allow request,Please check adx id";
                                        case 10007:
                                            return "Pangle SDK does not provide advertising services for child users-(" + System.currentTimeMillis() + Identify.UNSET_VALUE + com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ry() + ")";
                                        case 10008:
                                            return "The user compliance status verification is incomplete or has failed-(" + com.bytedance.sdk.openadsdk.core.ea.zb.ycx().fby() + ")";
                                        case 10009:
                                            return "Pangle SDK has disable,Please do not use PAGSdk.setSdkDisable";
                                        default:
                                            switch (i5) {
                                                case 40052:
                                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_empty_content");
                                                case 40053:
                                                    return "The material meta data was incorrect.";
                                                default:
                                                    return com.bytedance.sdk.component.utils.wwx.ycx(pmi.ycx(), "tt_error_unknow");
                                            }
                                    }
                            }
                    }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fvw/mhGfZsOF", "Vus+hgK7bA==", Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY_VALUE);
            return b.f42142b;
        }
    }
}
