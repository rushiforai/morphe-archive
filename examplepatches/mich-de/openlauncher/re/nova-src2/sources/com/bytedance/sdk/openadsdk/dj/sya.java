package com.bytedance.sdk.openadsdk.dj;

import android.app.Application;
import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bykv.vk.openvk.preload.falconx.loader.ILoader;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.bhi;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.model.xz;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;
import com.bytedance.sdk.openadsdk.dj.ycx;
import com.bytedance.sdk.openadsdk.dj.zb;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.dwi;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.pgl.ssdk.ces.out.DungeonFlag;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    public static void dj(final tn tnVar, final String str, final int i5) {
        ycx(System.currentTimeMillis(), tnVar, str, "material_status", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.13
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("trigger_type", i5);
                    jSONObject.put("image_mode", tnVar.pk());
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegs=", "XOs5pQK7Q9SPRPNcmBA=", 816);
                    return jSONObject;
                }
            }
        });
    }

    public static void lt(tn tnVar, String str, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, "click_playable_button", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.47
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jSONObject;
            }
        });
    }

    public static void lud(tn tnVar, final com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar, final String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "web_behavior_click", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.30
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("arbi_current_url", ycxVar.sya());
                    jSONObject.put("current_url_index", ycxVar.dj());
                    jSONObject.put("arbi_start_x", ycxVar.lud());
                    jSONObject.put("arbi_start_y", ycxVar.lt());
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_CLICK_DURATION, ycxVar.ul());
                    jSONObject.put("is_trigger_jump", ycxVar.fby());
                    jSONObject.put("click_type", String.valueOf(ycxVar.uh()));
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew0=", "XOs5tAeZcdOSS/NcmBA=", 1397);
                    th2.getMessage();
                }
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                try {
                    com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar2 = ycxVar;
                    if (ycxVar2 == null || ycxVar2.ycx() == -1) {
                        return null;
                    }
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("hit_type", ycxVar.ycx());
                    jSONObject.put("hit_extra", ycxVar.zb());
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew0=", "XOs5pQK7Q9SPRPNcmBA=", 1413);
                    return null;
                }
            }
        });
    }

    public static void sya(tn tnVar, String str, final long j11) {
        ycx(System.currentTimeMillis(), tnVar, str, "load_feeling_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.6
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQ8=", "XOs5sBuoQ9SPRA==", 671);
                    th2.getMessage();
                }
                jSONObject.toString();
                return jSONObject;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static JSONObject zb(tn tnVar, JSONObject jSONObject) {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        if (av.zb(tnVar) && tnVar.qq()) {
            try {
                jSONObject.put("is_new_playable", 1);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "XOs5pQK7Q9SPRPNcmBCCMWjmIoI=", 489);
                th2.getMessage();
            }
        }
        ycx(jSONObject);
        zb(jSONObject);
        return jSONObject;
    }

    public static void dj(tn tnVar, final com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar, final String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "web_behavior_scroll", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.29
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("arbi_current_url", ycxVar.sya());
                    jSONObject.put("current_url_index", ycxVar.dj());
                    jSONObject.put("trigger_scroll_x", ycxVar.jw());
                    jSONObject.put("trigger_scroll_y", ycxVar.jc());
                    jSONObject.put("arbi_offset_y", ycxVar.ea());
                    jSONObject.put("scroll_type", ycxVar.ok());
                    jSONObject.put("scroll_duration", ycxVar.ry());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew4=", "XOs5tAeZcdOSS/NcmBA=", 1373);
                    th2.getMessage();
                }
                return jSONObject;
            }
        });
    }

    public static void lud(tn tnVar, String str, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, "click_next_ad_button", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.46
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jSONObject;
            }
        });
    }

    public static void sya(tn tnVar, String str, int i5) {
        ycx(tnVar, str, i5, (String) null);
    }

    public static void ycx() throws ClassNotFoundException {
        try {
            Class.forName(sya.class.getName());
        } catch (ClassNotFoundException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "Wv00mwCQZsaEadtcnwI=", 93);
        }
    }

    public static class ycx {
        public static void ycx(String str, final JSONObject jSONObject, tn tnVar) {
            String strYcx = oby.ycx(tnVar);
            if (strYcx == null) {
                return;
            }
            sya.ycx(System.currentTimeMillis(), tnVar, strYcx.concat("_landingpage"), str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.ycx.1
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    return jSONObject;
                }
            });
        }

        public static void ycx(final int i5, final int i11, tn tnVar) {
            String strYcx = oby.ycx(tnVar);
            if (strYcx == null) {
                return;
            }
            sya.ycx(System.currentTimeMillis(), tnVar, strYcx.concat("_landingpage"), "local_res_hit_rate", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.ycx.2
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("all_times", i11);
                        jSONObject.put("hit_times", i5);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkD17tJppH7g==", "XOs5tAeZcdOSS/NcmBA=", 1886);
                        return jSONObject;
                    }
                }
            });
        }

        public static void ycx(final long j11, final tn tnVar, String str, final ILoader iLoader, final String str2) {
            if (str == null) {
                return;
            }
            sya.ycx(System.currentTimeMillis(), tnVar, str, "landingpage_init", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.ycx.3
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        int iYcx = com.bytedance.sdk.openadsdk.ul.zb.ycx().ycx(iLoader, str2);
                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.kh());
                        jSONObject.put("channel_name", tnVar.dw());
                        jSONObject.put("interceptor_status", (TextUtils.isEmpty(tnVar.dw()) || iYcx <= 0) ? 0 : 1);
                        JSONObject jSONObject2 = new JSONObject();
                        jSONObject2.put("resource_count", iYcx);
                        jSONObject.put("resource_info", jSONObject2);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkD17tJppH7w==", "XOs5tAeZcdOSS/NcmBA=", 1922);
                        return jSONObject;
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject ycx() {
                    try {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put(tn.f25751zb, tnVar.yw() ? 1 : 0);
                        if (!tnVar.pj()) {
                            return jSONObject;
                        }
                        jSONObject.put("is_pre_render", 1);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkD17tJppH7w==", "XOs5pQK7Q9SPRPNcmBA=", 1937);
                        return null;
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject zb() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("duration", j11);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkD17tJppH7w==", "XOs5sBuoQ9SPRA==", 1904);
                        return jSONObject;
                    }
                }
            });
        }

        public static void ycx(final int i5, final int i11, final int i12, final int i13, final tn tnVar, String str, final int i14) {
            if (str == null || TextUtils.isEmpty(tnVar.dw())) {
                return;
            }
            sya.ycx(System.currentTimeMillis(), tnVar, str, "landing_page_resource_detail", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.ycx.4
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("next_url", tnVar.kh());
                        jSONObject.put("channel_name", tnVar.dw());
                        jSONObject.put("preload_status", i5 <= 0 ? 0 : 2);
                        jSONObject.put("first_page", i14);
                        jSONObject.put("preload_h5_type", tnVar.oby());
                        JSONObject jSONObject2 = new JSONObject();
                        jSONObject2.put("channel_response", i5);
                        jSONObject2.put("failResourceCount", i11);
                        jSONObject2.put("successCount", i12);
                        jSONObject2.put("failCount", i13);
                        jSONObject.put("resource_info", jSONObject2);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkD17tJppH6A==", "XOs5tAeZcdOSS/NcmBA=", 1967);
                        return jSONObject;
                    }
                }
            });
        }
    }

    public static void dj(tn tnVar, String str, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, "show_next_ad_hint", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.45
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jSONObject;
            }
        });
    }

    public static void sya(final tn tnVar, String str) {
        if (tnVar == null || !tn.sya(tnVar) || tnVar.yzp() == null) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_show", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.25
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                    jSONObject.putOpt("id", tnVar.yzp().ycx());
                    jSONObject.putOpt("md5", tnVar.yzp().zb());
                    if (tnVar.ci() == null) {
                        return jSONObject;
                    }
                    jSONObject.putOpt("render_type", Integer.valueOf(tnVar.ci().f22194l));
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkewo=", "XOs5tAeZcdOSS/NcmBA=", 1297);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, final int i5) {
        ycx(System.currentTimeMillis(), tnVar, str, "open_url_h5", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.putOpt("render_type", "h5");
                    jSONObject.putOpt("render_type_2", 0);
                    jSONObject.putOpt("preload_status", Integer.valueOf(i5));
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQ==", "XOs5tAeZcdOSS/NcmBA=", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
                    return jSONObject;
                }
            }
        });
    }

    public static void sya(tn tnVar, final com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar, final String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "web_behavior_stay", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.28
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("arbi_current_url", ycxVar.sya());
                    jSONObject.put("current_url_index", ycxVar.dj());
                    jSONObject.put("arbi_stay_duration", ycxVar.xkz());
                    jSONObject.put("browsing_percentage", ycxVar.syc());
                    jSONObject.put("out_focus_scene", ycxVar.dy());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew8=", "XOs5tAeZcdOSS/NcmBA=", 1351);
                    th2.getMessage();
                }
                return jSONObject;
            }
        });
    }

    public static void ycx(final tn tnVar, String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_load_start", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.12
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    if (tn.sya(tnVar)) {
                        if (tnVar.yzp() != null) {
                            jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                            jSONObject.putOpt("id", tnVar.yzp().ycx());
                            jSONObject.putOpt("md5", tnVar.yzp().zb());
                        }
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 7);
                            return jSONObject;
                        }
                    } else {
                        jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.dy());
                        jSONObject.putOpt("style_id", tnVar.kgy());
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 0);
                        }
                    }
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeg==", "XOs5tAeZcdOSS/NcmBA=", 148);
                    e3.getMessage();
                    return jSONObject;
                }
            }
        });
    }

    public static void sya(tn tnVar, String str, String str2, final JSONObject jSONObject) {
        if (tnVar == null || jSONObject == null) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.35
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }
        });
    }

    public static void ycx(final tn tnVar, String str, final long j11) {
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_load_finish", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.23
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    if (tn.sya(tnVar)) {
                        if (tnVar.yzp() != null) {
                            jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                            jSONObject.putOpt("id", tnVar.yzp().ycx());
                            jSONObject.putOpt("md5", tnVar.yzp().zb());
                        }
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 7);
                            return jSONObject;
                        }
                    } else {
                        jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.ci().f22190h);
                        jSONObject.putOpt("style_id", tnVar.kgy());
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 0);
                        }
                    }
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew==", "XOs5tAeZcdOSS/NcmBA=", 179);
                    e3.getMessage();
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkew==", "XOs5sBuoQ9SPRA==", 190);
                    return jSONObject;
                }
            }
        });
    }

    public static void sya(tn tnVar, String str, JSONObject jSONObject) {
        if (tnVar == null) {
            return;
        }
        ycx(tnVar, str, -1L, jSONObject, (JSONObject) null);
    }

    public static void ycx(final tn tnVar, String str, final long j11, final int i5, final String str2, final String str3) {
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_load_fail", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.33
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    if (tn.sya(tnVar)) {
                        if (tnVar.yzp() != null) {
                            jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                            jSONObject.putOpt("id", tnVar.yzp().ycx());
                            jSONObject.putOpt("md5", tnVar.yzp().zb());
                        }
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 7);
                        }
                    } else {
                        jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.ci().f22190h);
                        jSONObject.putOpt("style_id", tnVar.kgy());
                        if (!TextUtils.isEmpty(str3)) {
                            jSONObject.putOpt("error_url", str3);
                        }
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 0);
                        }
                    }
                    jSONObject.put("error_code", i5);
                    jSONObject.put("error_msg", str2);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA==", "XOs5tAeZcdOSS/NcmBA=", Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE);
                    e3.getMessage();
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA==", "XOs5sBuoQ9SPRA==", 236);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(final tn tnVar, String str, final long j11, final int i5, final int i11) {
        ycx(System.currentTimeMillis(), tnVar, str, "load", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.44
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.putOpt("render_type", "h5");
                    jSONObject.putOpt("render_type_2", 0);
                    jSONObject.putOpt("interaction_method", Integer.valueOf(tnVar.dqs()));
                    jSONObject.put("first_page", i11);
                    jSONObject.put("preload_h5_type", tnVar.oby());
                    int i12 = i5;
                    if (i12 < 0) {
                        return jSONObject;
                    }
                    jSONObject.putOpt("preload_status", Integer.valueOf(i12));
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfQ==", "XOs5tAeZcdOSS/NcmBA=", 279);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", Math.min(j11, TTAdConstant.AD_MAX_EVENT_TIME));
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfQ==", "XOs5sBuoQ9SPRA==", 261);
                    return jSONObject;
                }
            }
        });
    }

    private static void zb(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            JSONObject jSONObjectYcx = fby.ycx();
            if (jSONObjectYcx != null) {
                Iterator<String> itKeys = jSONObjectYcx.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    jSONObject.put(next, jSONObjectYcx.get(next));
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "WuoptBOsWtOBWMN0ghev", 520);
        }
    }

    public static void ycx(String str, tn tnVar, String str2, final Map<String, Object> map) {
        ycx(System.currentTimeMillis(), tnVar, str2, str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.48
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                try {
                    if (map == null) {
                        return null;
                    }
                    JSONObject jSONObject = new JSONObject();
                    for (Map.Entry entry : map.entrySet()) {
                        jSONObject.put((String) entry.getKey(), entry.getValue());
                    }
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfg==", "XOs5tAeZcdOSS/NcmBA=", 299);
                    return null;
                }
            }
        });
    }

    @DungeonFlag
    public static void ycx(tn tnVar, String str, JSONObject jSONObject, JSONObject jSONObject2) {
        ycx(tnVar, "show", str, jSONObject, jSONObject2);
    }

    @DungeonFlag
    private static void ycx(final tn tnVar, final String str, final String str2, final JSONObject jSONObject, final JSONObject jSONObject2) {
        if (tnVar == null || TextUtils.isEmpty(str)) {
            return;
        }
        if (tnVar.yi() && "show".equals(str)) {
            return;
        }
        if ("show".equals(str)) {
            tnVar.jc(true);
        }
        final long jCurrentTimeMillis = System.currentTimeMillis();
        ycx(new com.bytedance.sdk.component.fby.zb.sya("onShow") { // from class: com.bytedance.sdk.openadsdk.dj.sya.49
            /* JADX WARN: Removed duplicated region for block: B:7:0x0029  */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public void run() {
                final String strYcx;
                if (com.bytedance.sdk.openadsdk.core.pmi.dj().pmi()) {
                    int iKsy = tnVar.ksy();
                    Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
                    strYcx = contextYcx instanceof Application ? com.bytedance.sdk.openadsdk.core.ok.ycx.ycx.ycx((Application) contextYcx).ycx(str2, DeviceUtils.ycx(), iKsy) : "none";
                }
                sya.ycx(jCurrentTimeMillis, tnVar, str2, str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.49.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject sya() {
                        try {
                            AnonymousClass49 anonymousClass49 = AnonymousClass49.this;
                            JSONObject jSONObject3 = jSONObject;
                            if (jSONObject3 != null) {
                                jSONObject3.put("interaction_method", tnVar.dqs());
                                AnonymousClass49 anonymousClass492 = AnonymousClass49.this;
                                jSONObject.put("real_interaction_method", tnVar.iq());
                                jSONObject.put("video_skip_result", com.bytedance.sdk.openadsdk.core.pmi.dj().xkz(String.valueOf(tnVar.ksy())));
                                jSONObject.put("au_show", strYcx);
                                return jSONObject;
                            }
                            JSONObject jSONObject4 = new JSONObject();
                            jSONObject4.put("interaction_method", tnVar.dqs());
                            jSONObject4.put("real_interaction_method", tnVar.iq());
                            jSONObject4.put("video_skip_result", com.bytedance.sdk.openadsdk.core.pmi.dj().xkz(String.valueOf(tnVar.ksy())));
                            jSONObject4.put("au_show", strYcx);
                            return jSONObject4;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcB+/", "XOs5tAeZcdOSS/NcmBA=", 434);
                            return null;
                        }
                    }

                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject ycx() {
                        AnonymousClass49 anonymousClass49 = AnonymousClass49.this;
                        JSONObject jSONObject3 = jSONObject2;
                        return jSONObject3 == null ? sya.zb(tnVar, new JSONObject()) : sya.zb(tnVar, jSONObject3);
                    }

                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject zb() throws JSONException {
                        JSONObject jSONObject3;
                        Exception e3;
                        Object obj;
                        try {
                            bhi.zb(tnVar);
                            jSONObject3 = new JSONObject();
                        } catch (Exception e11) {
                            jSONObject3 = null;
                            e3 = e11;
                        }
                        try {
                            jSONObject3.putOpt("log_extra", tnVar.pks());
                            float fFloatValue = Double.valueOf((System.currentTimeMillis() / 1000) - tnVar.fdq()).floatValue();
                            if (fFloatValue <= 0.0f) {
                                fFloatValue = 0.0f;
                            }
                            jSONObject3.putOpt("show_time", Float.valueOf(fFloatValue));
                            long jElapsedRealtime = SystemClock.elapsedRealtime() - tnVar.jw();
                            if (jElapsedRealtime > 0) {
                                jSONObject3.put("duration", jElapsedRealtime);
                            }
                            jSONObject3.putOpt("ua_policy", Integer.valueOf(tnVar.row()));
                            String strNzi = tnVar.nzi();
                            if (!TextUtils.isEmpty(strNzi) && !TextUtils.isEmpty(strNzi)) {
                                try {
                                    jSONObject3.put("ttdsp_price", Math.round(Float.parseFloat(strNzi) * 100000.0f));
                                } catch (Throwable th2) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcB+/", "XOs5sBuoQ9SPRA==", 387);
                                    jSONObject3.put("ttdsp_price", 0);
                                    th2.getMessage();
                                }
                            }
                            if (tnVar.ab() != null) {
                                try {
                                    Object obj2 = tnVar.ab().get(TTAdConstant.SDK_BIDDING_TYPE);
                                    if (obj2 != null && Integer.parseInt(obj2.toString()) == 2 && (obj = tnVar.ab().get("price")) != null) {
                                        jSONObject3.put("ttdsp_price", Math.round(Double.parseDouble(obj.toString()) * 100000.0d));
                                    }
                                } catch (Throwable th3) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcB+/", "XOs5sBuoQ9SPRA==", TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE);
                                }
                            }
                        } catch (Exception e12) {
                            e3 = e12;
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcB+/", "XOs5sBuoQ9SPRA==", TTAdConstant.IMAGE_LIST_CODE);
                            return jSONObject3;
                        }
                        return jSONObject3;
                    }
                });
                if ("show".equals(str)) {
                    if (!tnVar.eel()) {
                        if (tnVar.uhs()) {
                            com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(tnVar.skm(), new sya.zb("show_urls", tnVar));
                        } else {
                            sya.ycx(tnVar);
                        }
                    }
                    JSONObject jSONObject3 = jSONObject;
                    if (jSONObject3 != null) {
                        int iOptInt = jSONObject3.optInt("dynamic_show_type");
                        if (tnVar.sz() == 1 && (iOptInt == 7 || iOptInt == 10)) {
                            com.bytedance.sdk.component.utils.jw.ycx().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.sya.49.2
                                @Override // java.lang.Runnable
                                public void run() throws JSONException {
                                    JSONObject jSONObject4 = new JSONObject();
                                    try {
                                        jSONObject4.put("auto_click", true);
                                        AnonymousClass49 anonymousClass49 = AnonymousClass49.this;
                                        sya.zb(tnVar, str2, TTEDPEventConstants.EDP_EVENT_NAME_CLICK, jSONObject4);
                                    } catch (Exception e3) {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcB+8", "Sfsj", 469);
                                    }
                                }
                            }, com.bytedance.sdk.openadsdk.core.settings.ea.zb().py());
                        }
                    }
                    com.bytedance.sdk.openadsdk.core.ok.sya.ycx(tnVar, strYcx);
                }
            }
        });
    }

    public static void zb(tn tnVar, String str, final long j11) {
        if (tnVar != null && j11 > 0 && j11 < 200000) {
            ycx(System.currentTimeMillis(), tnVar, str, "video_click_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.3
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("video_click_duration_time", j11);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQo=", "XOs5tAeZcdOSS/NcmBA=", 607);
                        return jSONObject;
                    }
                }
            });
        }
    }

    public static void zb(tn tnVar, String str, final int i5) {
        ycx(System.currentTimeMillis(), tnVar, str, "check_meta", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.7
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("error_code", i5);
                    jSONObject.put("check_url", com.bytedance.sdk.openadsdk.core.settings.ea.zb().wwx());
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQ4=", "XOs5tAeZcdOSS/NcmBA=", 689);
                    return jSONObject;
                }
            }
        });
    }

    private static void ycx(JSONObject jSONObject) {
        try {
            jSONObject.put("screen_scale", dc.ul(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
            jSONObject.put("density_dpi_sys", dc.ok(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "WuoppgCubMKOedRcgBQ=", PglCryptUtils.INPUT_INVALID);
        }
    }

    public static void zb(final tn tnVar, String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "picture_click", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.14
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("ad_slot_type", tnVar.an());
                    jSONObject.put("interaction_method", tnVar.dqs());
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkego=", "XOs5tAeZcdOSS/NcmBA=", 833);
                    return jSONObject;
                }
            }
        });
    }

    public static void zb(tn tnVar, String str, String str2, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.18
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }
        });
    }

    public static void zb(final long j11, final tn tnVar, String str, final String str2) {
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_feeling_duraion", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.24
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    if (tn.sya(tnVar)) {
                        if (tnVar.yzp() != null) {
                            jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                            jSONObject.putOpt("id", tnVar.yzp().ycx());
                            jSONObject.putOpt("md5", tnVar.yzp().zb());
                        }
                        jSONObject.putOpt("from", str2);
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 7);
                            return jSONObject;
                        }
                    } else {
                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.ci().f22190h);
                        jSONObject.put("style_id", tnVar.kgy());
                        if (tnVar.ci() != null) {
                            jSONObject.putOpt("render_type", 0);
                        }
                    }
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkews=", "XOs5tAeZcdOSS/NcmBA=", 1267);
                    e3.getMessage();
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkews=", "XOs5sBuoQ9SPRA==", 1240);
                    e3.getMessage();
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar) {
        if (TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()))) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx(tnVar.skm(), true), 1, tnVar.m147if());
    }

    public static void zb(tn tnVar, final com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar, final String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "web_behavior_load", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.27
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("arbi_current_url", ycxVar.sya());
                    jSONObject.put("current_url_index", ycxVar.dj());
                    jSONObject.put("arbi_load_duration", ycxVar.pmi());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkewg=", "XOs5tAeZcdOSS/NcmBA=", 1331);
                    th2.getMessage();
                }
                return jSONObject;
            }
        });
    }

    public static void zb(tn tnVar, String str, String str2, final JSONObject jSONObject, final long j11) {
        if (tnVar == null || jSONObject == null) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.34
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("duration", j11);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAs=", "XOs5sBuoQ9SPRA==", 1516);
                    return jSONObject2;
                }
            }
        });
    }

    public static void zb(tn tnVar, String str, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.f26766lt, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.37
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jSONObject;
            }
        });
    }

    public static void zb(tn tnVar, String str, JSONObject jSONObject, JSONObject jSONObject2) {
        ycx(tnVar, "activity_recreate", str, jSONObject, jSONObject2);
    }

    @DungeonFlag
    public static void ycx(final String str, final tn tnVar, final String str2, final ul ulVar) {
        if (tnVar == null || ulVar == null || !ulVar.ycx()) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str2, "ad_show_time", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.50
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                try {
                    ul ulVar2 = ulVar;
                    if (ulVar2 == null || ulVar2.zb() == null) {
                        return null;
                    }
                    JSONObject jSONObjectZb = ulVar.zb();
                    if (!str2.equals("open_ad")) {
                        return jSONObjectZb;
                    }
                    jSONObjectZb.put("is_icon_only", tnVar.aeu() ? 1 : 0);
                    return jSONObjectZb;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcQ==", "XOs5tAeZcdOSS/NcmBA=", 561);
                    return null;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", str);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkcQ==", "XOs5sBuoQ9SPRA==", 545);
                    return jSONObject;
                }
            }
        });
    }

    public static void zb(tn tnVar, String str, int i5, JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            jSONObject.put(TTConst.TRACK_TYPE, i5);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "SOsjkSezfsmMRdZZrQGwCV/aP5QAtw==", 1996);
        }
        zb(tnVar, str, "download_app_ad_track", jSONObject);
    }

    public static void ycx(final tn tnVar, final String str, final dwi dwiVar) {
        if (tnVar == null) {
            return;
        }
        final long jDj = dwiVar.dj();
        ycx(System.currentTimeMillis(), tnVar, str, "stay_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.2
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("click_stay_time", jDj);
                    jSONObject.put("click_time", dwiVar.ycx);
                    if (!str.equals("open_ad")) {
                        return jSONObject;
                    }
                    jSONObject.put("is_icon_only", tnVar.aeu() ? 1 : 0);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQs=", "XOs5tAeZcdOSS/NcmBA=", 585);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, final String str, final int i5, final String str2, final long j11, final boolean z11, final int i11, final long j12) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.f26765dj, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.4
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("invisible_scene", i5);
                    jSONObject.put("arbi_current_url", str2);
                    jSONObject.put("loading_visible_time", j11);
                    jSONObject.put("arbi_trigger_start", z11);
                    jSONObject.put("arbi_convert_count", i11);
                    jSONObject.put("loading_start_timestamp", j12);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQk=", "XOs5tAeZcdOSS/NcmBA=", 627);
                }
                return jSONObject;
            }
        });
    }

    public static void ycx(tn tnVar, String str, final long j11, final boolean z11) {
        ycx(System.currentTimeMillis(), tnVar, str, "lp_loading", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.5
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("if_lp_loading_success", z11 ? 1 : 2);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQg=", "XOs5tAeZcdOSS/NcmBA=", 644);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQg=", "XOs5sBuoQ9SPRA==", 655);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, final int i5, final String str2) {
        if (i5 == 200) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, "check_meta_more", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.8
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("error_code", i5);
                    jSONObject.put("check_url", com.bytedance.sdk.openadsdk.core.settings.ea.zb().wwx());
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQ0=", "XOs5tAeZcdOSS/NcmBA=", 729);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                try {
                    if (str2 != null) {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("extra", str2);
                        return jSONObject;
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQ0=", "XOs5pQK7Q9SPRPNcmBA=", 717);
                }
                return super.ycx();
            }
        });
    }

    public static void ycx(tn tnVar, String str, final int i5, final String str2, final int i11) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.ycx, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.9
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, i5);
                    jSONObject.put("arbi_current_url", str2);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQw=", "XOs5tAeZcdOSS/NcmBA=", 757);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("new_index", i11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQw=", "XOs5pQK7Q9SPRPNcmBA=", 746);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, final String str, final int i5, final String str2, final float f11) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.f26768zb, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.10
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, i5);
                    jSONObject.put("arbi_current_url", str2);
                    jSONObject.put("arbi_load_duration", f11);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQM=", "XOs5tAeZcdOSS/NcmBA=", 775);
                }
                return jSONObject;
            }
        });
    }

    public static void ycx(tn tnVar, final String str, final int i5, final String str2, final String str3, final int i11) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.sya, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.11
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, i5);
                    jSONObject.put("arbi_current_url", str2);
                    jSONObject.put("load_url", str3);
                    jSONObject.put("url_flag", i11);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeQI=", "XOs5tAeZcdOSS/NcmBA=", 795);
                }
                return jSONObject;
            }
        });
    }

    @DungeonFlag
    public static void ycx(final String str, final tn tnVar, final com.bytedance.sdk.openadsdk.core.model.ok okVar, final String str2, final boolean z11, final Map<String, Object> map, final int i5) {
        final long jCurrentTimeMillis = System.currentTimeMillis();
        ycx(new com.bytedance.sdk.component.fby.zb.sya("onClick") { // from class: com.bytedance.sdk.openadsdk.dj.sya.15
            @Override // java.lang.Runnable
            public void run() {
                tn tnVar2 = tnVar;
                if (tnVar2 == null) {
                    return;
                }
                sya.ycx(jCurrentTimeMillis, tnVar2, str2, str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.15.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject zb() throws JSONException {
                        JSONObject jSONObject = new JSONObject();
                        try {
                            com.bytedance.sdk.openadsdk.core.model.ok okVar2 = okVar;
                            if (okVar2 != null) {
                                JSONObject jSONObjectYcx = okVar2.ycx();
                                jSONObjectYcx.put("is_valid", z11);
                                int i11 = i5;
                                if (i11 > 0 && i11 <= 2) {
                                    jSONObjectYcx.put("user_behavior_type", i11);
                                }
                                Map map2 = map;
                                if (map2 != null) {
                                    if (map2.containsKey("duration")) {
                                        jSONObject.put("duration", map.get("duration"));
                                    }
                                    for (Map.Entry entry : map.entrySet()) {
                                        if (!"duration".equals(entry.getKey())) {
                                            jSONObjectYcx.put((String) entry.getKey(), entry.getValue());
                                        }
                                    }
                                }
                                jSONObjectYcx.put("interaction_method", tnVar.dqs());
                                String strOptString = jSONObjectYcx.optString("pag_json_data");
                                JSONObject jSONObject2 = new JSONObject();
                                if (!TextUtils.isEmpty(strOptString)) {
                                    try {
                                        jSONObject2 = new JSONObject(strOptString);
                                    } catch (Exception e3) {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegmqfA==", "XOs5sBuoQ9SPRA==", 896);
                                    }
                                }
                                try {
                                    if (tnVar.pj()) {
                                        jSONObject2.put("is_pre_render", 1);
                                        jSONObjectYcx.put("pag_json_data", jSONObject2.toString());
                                    }
                                } catch (Exception e11) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegmqfA==", "XOs5sBuoQ9SPRA==", 905);
                                }
                                if (str2.equals("open_ad")) {
                                    jSONObjectYcx.put("is_icon_only", tnVar.aeu() ? 1 : 0);
                                }
                                jSONObject.put("ad_extra_data", jSONObjectYcx.toString());
                            }
                            jSONObject.putOpt("log_extra", tnVar.pks());
                            float fFloatValue = Double.valueOf((System.currentTimeMillis() / 1000) - tnVar.fdq()).floatValue();
                            if (fFloatValue <= 0.0f) {
                                fFloatValue = 0.0f;
                            }
                            jSONObject.putOpt("show_time", Float.valueOf(fFloatValue));
                            jSONObject.putOpt("ua_policy", Integer.valueOf(tnVar.row()));
                        } catch (Exception e12) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegmqfA==", "XOs5sBuoQ9SPRA==", 917);
                        }
                        return jSONObject;
                    }
                });
                if (!TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx())) && TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str)) {
                    com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx(tnVar.hfd(), true), 2, tnVar.m147if());
                }
                if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str)) {
                    bhi.sya(tnVar);
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, String str2, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.16
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                if (jSONObject == null) {
                    return null;
                }
                JSONObject jSONObject2 = new JSONObject();
                try {
                    if (!jSONObject.has("duration")) {
                        return jSONObject2;
                    }
                    jSONObject2.put("duration", jSONObject.get("duration"));
                    return jSONObject2;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegg=", "XOs5sBuoQ9SPRA==", 952);
                    e3.getMessage();
                    return jSONObject2;
                }
            }
        });
        if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str2)) {
            bhi.sya(tnVar);
            if (TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()))) {
                return;
            }
            com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx(tnVar.hfd(), true), 2, tnVar.m147if());
        }
    }

    public static void ycx(tn tnVar, String str, final String str2, final long j11, final int i5, JSONObject jSONObject, final ul ulVar) {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        final JSONObject jSONObject2 = jSONObject;
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.17
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                try {
                    if ("feed_break".equals(str2) || "feed_over".equals(str2)) {
                        ul ulVar2 = ulVar;
                        if (ulVar2 != null) {
                            ulVar2.ycx(jSONObject2);
                        }
                    }
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeg8=", "XOs5tAeZcdOSS/NcmBA=", 1007);
                    return null;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject3 = new JSONObject();
                try {
                    jSONObject3.put("duration", j11);
                    jSONObject3.put("percent", i5);
                    return jSONObject3;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeg8=", "XOs5sBuoQ9SPRA==", 994);
                    return jSONObject3;
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, String str2, final JSONObject jSONObject, final long j11) {
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.19
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("duration", j11);
                    return jSONObject2;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeg0=", "XOs5sBuoQ9SPRA==", 1031);
                    return jSONObject2;
                }
            }
        });
    }

    public static void ycx(final tn tnVar, String str, String str2, final Map<String, Object> map) {
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.20
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    Map map2 = map;
                    if (map2 != null) {
                        for (Map.Entry entry : map2.entrySet()) {
                            jSONObject.put((String) entry.getKey(), entry.getValue());
                        }
                    }
                    jSONObject.put("dp_creative_type", tnVar.mm());
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegw=", "XOs5tAeZcdOSS/NcmBA=", 1080);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    Map map2 = map;
                    if (map2 != null) {
                        Object obj = map2.get("duration");
                        if (obj instanceof Long) {
                            jSONObject.put("duration", obj);
                            return jSONObject;
                        }
                    }
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegw=", "XOs5sBuoQ9SPRA==", 1063);
                    return jSONObject;
                }
            }
        });
    }

    @DungeonFlag
    public static void ycx(long j11, tn tnVar, String str, String str2) {
        ycx(j11, tnVar, str, str2, (com.bytedance.sdk.openadsdk.dy.zb.zb) null);
    }

    @DungeonFlag
    public static void ycx(final long j11, final tn tnVar, final String str, final String str2, final com.bytedance.sdk.openadsdk.dy.zb.zb zbVar) {
        if (tnVar == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || ycx(tnVar.mp(), str2)) {
            return;
        }
        ycx(new com.bytedance.sdk.component.fby.zb.sya(str2) { // from class: com.bytedance.sdk.openadsdk.dj.sya.21
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                JSONObject jSONObject;
                try {
                    com.bytedance.sdk.openadsdk.dy.zb.zb zbVar2 = zbVar;
                    if (zbVar2 != null) {
                        jSONObject = zbVar2.zb();
                        if (jSONObject == null) {
                            try {
                                jSONObject = new JSONObject();
                            } catch (Exception e3) {
                                e = e3;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegM=", "Sfsj", 1184);
                                new ycx.C0097ycx(j11, tnVar).zb(str).sya(str2).lud(tnVar.m147if()).fby(tnVar.zr()).ycx(tnVar.ko()).ycx(tnVar.qgr()).ycx(jSONObject).ul(tnVar.ac()).ycx((com.bytedance.sdk.openadsdk.dj.zb.ycx) null);
                            }
                        }
                    } else {
                        jSONObject = new JSONObject();
                    }
                    com.bytedance.sdk.openadsdk.dy.zb.zb zbVar3 = zbVar;
                    if (zbVar3 != null) {
                        JSONObject jSONObjectYcx = zbVar3.ycx();
                        JSONObject jSONObjectSya = zbVar.sya();
                        if (jSONObjectYcx != null) {
                            if (jSONObjectSya == null) {
                                jSONObjectSya = new JSONObject();
                            }
                            tn tnVar2 = tnVar;
                            if (tnVar2 != null) {
                                jSONObjectYcx.put("render_sequence", tnVar2.tx());
                            }
                            if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                                jSONObjectYcx.putOpt("_l_s_t", Integer.valueOf(com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx()));
                            }
                            jSONObjectSya.put("pag_json_data", jSONObjectYcx.toString());
                            jSONObject.put("ad_extra_data", jSONObjectSya.toString());
                        } else if (jSONObjectSya != null) {
                            JSONObject jSONObject2 = new JSONObject();
                            tn tnVar3 = tnVar;
                            if (tnVar3 != null) {
                                jSONObject2.put("render_sequence", tnVar3.tx());
                            }
                            if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                                jSONObject2.putOpt("_l_s_t", Integer.valueOf(com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx()));
                            }
                            jSONObjectSya.put("pag_json_data", jSONObject2.toString());
                            jSONObject.put("ad_extra_data", jSONObjectSya.toString());
                        } else {
                            String strOptString = jSONObject.optString("ad_extra_data");
                            JSONObject jSONObject3 = TextUtils.isEmpty(strOptString) ? new JSONObject() : new JSONObject(strOptString);
                            String strOptString2 = jSONObject3.optString("pag_json_data");
                            JSONObject jSONObject4 = TextUtils.isEmpty(strOptString2) ? new JSONObject() : new JSONObject(strOptString2);
                            tn tnVar4 = tnVar;
                            if (tnVar4 != null) {
                                jSONObject4.put("render_sequence", tnVar4.tx());
                            }
                            if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                                jSONObject4.putOpt("_l_s_t", Integer.valueOf(com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx()));
                            }
                            jSONObject3.putOpt("pag_json_data", jSONObject4.toString());
                            jSONObject.putOpt("ad_extra_data", jSONObject3.toString());
                        }
                    }
                    jSONObject.putOpt("log_extra", tnVar.pks());
                    jSONObject.putOpt("ua_policy", Integer.valueOf(tnVar.row()));
                } catch (Exception e11) {
                    e = e11;
                    jSONObject = null;
                }
                new ycx.C0097ycx(j11, tnVar).zb(str).sya(str2).lud(tnVar.m147if()).fby(tnVar.zr()).ycx(tnVar.ko()).ycx(tnVar.qgr()).ycx(jSONObject).ul(tnVar.ac()).ycx((com.bytedance.sdk.openadsdk.dj.zb.ycx) null);
            }
        });
    }

    public static void ycx(tn tnVar, String str, final String str2, final int i5) {
        ycx(System.currentTimeMillis(), tnVar, str, "playable_track", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.22
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("playable_event", str2);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegI=", "XOs5tAeZcdOSS/NcmBA=", 1211);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("is_new_playable", 1);
                    jSONObject.put("is_pre_render", i5);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkegI=", "XOs5pQK7Q9SPRPNcmBA=", 1222);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, final com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar, final String str) {
        ycx(System.currentTimeMillis(), tnVar, str, "web_behavior_keyword", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.26
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("arbi_current_url", ycxVar.sya());
                    jSONObject.put("keyword", ycxVar.wie());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkewk=", "XOs5tAeZcdOSS/NcmBA=", 1313);
                    th2.getMessage();
                }
                return jSONObject;
            }
        });
    }

    public static void ycx(final long j11, final tn tnVar, String str) {
        if (tnVar == null || !tn.sya(tnVar) || tnVar.yzp() == null) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, "endcard_close", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.31
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.yzp().sya());
                    jSONObject.putOpt("id", tnVar.yzp().ycx());
                    jSONObject.putOpt("md5", tnVar.yzp().zb());
                    if (tnVar.ci() == null) {
                        return jSONObject;
                    }
                    jSONObject.putOpt("render_type", Integer.valueOf(tnVar.ci().f22194l));
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeww=", "XOs5tAeZcdOSS/NcmBA=", 1454);
                    e3.getMessage();
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkeww=", "XOs5sBuoQ9SPRA==", 1438);
                    e3.getMessage();
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, String str2, final long j11, final JSONObject jSONObject) {
        if (tnVar == null || jSONObject == null) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, str2, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.32
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("duration", j11);
                    return jSONObject2;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkewI=", "XOs5sBuoQ9SPRA==", 1492);
                    e3.getMessage();
                    return jSONObject2;
                }
            }
        });
    }

    public static void ycx(tn tnVar, String str, final JSONObject jSONObject) {
        ycx(System.currentTimeMillis(), tnVar, str, zb.lud, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.36
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jSONObject;
            }
        });
    }

    public static void ycx(String str, long j11) {
        com.bytedance.sdk.openadsdk.core.jw.sya.ycx(str, j11);
    }

    @DungeonFlag
    public static void ycx(final tn tnVar, final String str, final String str2, final String str3, final long j11, final long j12, final JSONObject jSONObject, final boolean z11) {
        if (tnVar == null || ycx(tnVar.mp(), str3)) {
            return;
        }
        final long jCurrentTimeMillis = System.currentTimeMillis();
        ycx(new com.bytedance.sdk.component.fby.zb.sya("sendJsAdEvent") { // from class: com.bytedance.sdk.openadsdk.dj.sya.38
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                JSONArray jSONArrayOptJSONArray;
                String strKo = tnVar.ko();
                if (jSONObject != null) {
                    JSONObject jSONObject2 = new JSONObject();
                    try {
                        String strOptString = jSONObject.optString("ad_extra_data");
                        if (!TextUtils.isEmpty(strOptString)) {
                            jSONObject2 = new JSONObject(strOptString);
                        }
                        if (!TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str3)) {
                            jSONObject2.put("device", DeviceUtils.ul(com.bytedance.sdk.openadsdk.core.pmi.ycx()).toString());
                        }
                        if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str3)) {
                            if (z11) {
                                jSONObject2.put("click_scence", 1);
                            } else if (av.zb(tnVar)) {
                                jSONObject2.put("click_scence", 3);
                            }
                        }
                        if (tnVar.qq()) {
                            try {
                                JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("pag_json_data");
                                if (jSONObjectOptJSONObject == null) {
                                    jSONObjectOptJSONObject = new JSONObject();
                                }
                                jSONObjectOptJSONObject.put("is_new_playable", 1);
                                if (tnVar.fh()) {
                                    jSONObjectOptJSONObject.put("is_pre_render", 1);
                                }
                                jSONObject2.put("pag_json_data", jSONObjectOptJSONObject.toString());
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA8=", "Sfsj", 1606);
                            }
                        }
                        JSONObject jSONObjectOptJSONObject2 = jSONObject2.optJSONObject("pag_json_data");
                        if (jSONObjectOptJSONObject2 == null) {
                            jSONObjectOptJSONObject2 = new JSONObject();
                        }
                        jSONObjectOptJSONObject2.put("render_sequence", tnVar.tx());
                        if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                            jSONObjectOptJSONObject2.putOpt("_l_s_t", Integer.valueOf(com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx()));
                        }
                        jSONObject2.put("pag_json_data", jSONObjectOptJSONObject2.toString());
                        jSONObject.put("ad_extra_data", jSONObject2.toString());
                        jSONObject.put("tag", str2);
                        int iOptInt = jSONObject2.optInt("agg_request_type", -1);
                        if (z11 && iOptInt == 2) {
                            strKo = jSONObject2.optString("app_log_url");
                        }
                        int i5 = 0;
                        if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str3)) {
                            bhi.sya(tnVar);
                            float fFloatValue = Double.valueOf((System.currentTimeMillis() / 1000) - tn.zb(jSONObject.optString("log_extra"))).floatValue();
                            JSONObject jSONObject3 = jSONObject;
                            if (fFloatValue <= 0.0f) {
                                fFloatValue = 0.0f;
                            }
                            jSONObject3.putOpt("show_time", Float.valueOf(fFloatValue));
                            if (!TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()))) {
                                if (z11 && iOptInt == 2) {
                                    JSONArray jSONArrayOptJSONArray2 = jSONObject2.optJSONArray("click_tracking_url");
                                    if (jSONArrayOptJSONArray2 != null) {
                                        ArrayList arrayList = new ArrayList();
                                        while (i5 < jSONArrayOptJSONArray2.length()) {
                                            arrayList.add(jSONArrayOptJSONArray2.optString(i5));
                                            i5++;
                                        }
                                        com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx((List<String>) arrayList, true), 2, String.valueOf(j11));
                                    }
                                } else {
                                    tn tnVar2 = tnVar;
                                    if (tnVar2 != null) {
                                        com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx(tnVar2.hfd(), true), 2, tnVar.m147if());
                                    }
                                }
                            }
                        } else if ("show".equals(str3) && !TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx())) && z11 && iOptInt == 2 && (jSONArrayOptJSONArray = jSONObject2.optJSONArray("show_tracking_url")) != null) {
                            ArrayList arrayList2 = new ArrayList();
                            while (i5 < jSONArrayOptJSONArray.length()) {
                                arrayList2.add(jSONArrayOptJSONArray.optString(i5));
                                i5++;
                            }
                            com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx((List<String>) arrayList2, true), 1, String.valueOf(j11));
                        }
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA8=", "Sfsj", 1669);
                    }
                }
                new ycx.C0097ycx(jCurrentTimeMillis, tnVar).dj(str).zb(str2).sya(str3).lud(String.valueOf(j11)).lt(String.valueOf(j12)).ycx(strKo).ycx(tnVar.qgr()).ycx(jSONObject).fby(tnVar.zr()).ul(tnVar.ac()).ycx((com.bytedance.sdk.openadsdk.dj.zb.ycx) null);
            }
        });
    }

    public static void ycx(final tn tnVar, String str, final long j11, final JSONObject jSONObject, final JSONObject jSONObject2) {
        ycx(System.currentTimeMillis(), tnVar, "open_ad", str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.39
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                try {
                    JSONObject jSONObject3 = jSONObject;
                    return jSONObject3 != null ? jSONObject3 : new JSONObject();
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA4=", "XOs5tAeZcdOSS/NcmBA=", 1729);
                    return null;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() throws JSONException {
                JSONObject jSONObject3 = jSONObject2;
                if (jSONObject3 == null) {
                    jSONObject3 = new JSONObject();
                }
                try {
                    tn tnVar2 = tnVar;
                    if (tnVar2 != null) {
                        int iJc = tnVar2.jc();
                        jSONObject3.putOpt("start_type", Integer.valueOf(iJc == 1 ? 1 : 2));
                        jSONObject3.putOpt("load_index", Integer.valueOf(iJc));
                        if (iJc == 1) {
                            jSONObject3.putOpt("init_to_ad_load_time", Long.valueOf(SystemClock.elapsedRealtime() - com.bytedance.sdk.openadsdk.core.syc.sya));
                        }
                    }
                    jSONObject3.putOpt("start_type_backup", Integer.valueOf(com.bytedance.sdk.openadsdk.component.ul.ycx.dj()));
                    jSONObject3.putOpt("app_running_time", Long.valueOf(com.bytedance.sdk.openadsdk.component.ul.ycx.zb()));
                    return jSONObject3;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA4=", "XOs5pQK7Q9SPRPNcmBA=", 1748);
                    e3.getMessage();
                    return jSONObject3;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject3 = new JSONObject();
                try {
                    long j12 = j11;
                    if (j12 == -1) {
                        return jSONObject3;
                    }
                    jSONObject3.put("duration", j12);
                    return jSONObject3;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfA4=", "XOs5sBuoQ9SPRA==", 1715);
                    e3.getMessage();
                    return jSONObject3;
                }
            }
        });
    }

    public static void ycx(final com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (syaVar == null) {
            return;
        }
        if (yzp.lt()) {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.sya.40
                @Override // java.lang.Runnable
                public void run() {
                    yzp.zb(syaVar, 10);
                }
            });
        } else if (!yzp.ul()) {
            yzp.zb(syaVar, 10);
        } else {
            syaVar.run();
        }
    }

    public static void ycx(final com.bytedance.sdk.openadsdk.dy.ycx.zb zbVar) {
        if (zbVar == null || zbVar.zb() == null) {
            return;
        }
        final tn tnVarZb = zbVar.zb();
        final int iLiq = tnVarZb.liq();
        if (iLiq == 2 || iLiq == 8 || (oby.dj(tnVarZb) && zb.ycx.f26769dj.equals(zbVar.ycx()))) {
            ycx(System.currentTimeMillis(), tnVarZb, zbVar.sya(), "open_browser", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.41
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONArray jSONArrayOptJSONArray;
                    JSONObject jSONObject = new JSONObject();
                    try {
                        int iDj = zbVar.dj();
                        jSONObject.put("count", oby.jc(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
                        jSONObject.put("interceptor", iDj);
                        jSONObject.put("success", zbVar.lud());
                        jSONObject.put("link", zbVar.ycx());
                        jSONObject.put("interaction_type", iLiq);
                        jSONObject.put("real_interaction_type", zbVar.ul());
                        if (zbVar.dj() == 9) {
                            jSONObject.put("is_act_signals_api_available", zbVar.fby());
                            jSONObject.put("is_act_signals_callback", zbVar.jw());
                        }
                        if (!TextUtils.isEmpty(zbVar.lt())) {
                            jSONObject.put("exception_msg", zbVar.lt());
                        }
                        if (iDj == 2 || iDj == 5) {
                            String strYbg = tnVarZb.ybg();
                            if (!TextUtils.isEmpty(strYbg) && (jSONArrayOptJSONArray = new JSONObject(strYbg).optJSONArray("creatives")) != null && jSONArrayOptJSONArray.length() > 0) {
                                jSONObject.put("meta", jSONArrayOptJSONArray.optJSONObject(tnVarZb.sya()));
                            }
                        }
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAw=", "XOs5tAeZcdOSS/NcmBA=", 1820);
                        th2.getMessage();
                        return jSONObject;
                    }
                }
            });
        }
    }

    public static void ycx(JSONObject jSONObject, int i5, int i11) throws JSONException {
        try {
            jSONObject.put("skip_show_time", i5);
            jSONObject.put("skip_time", i11);
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("skip_after_time", i11 - (i5 * 1000));
            jSONObject.put("pag_json_data", jSONObject2.toString());
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "XechmTC3YNelXNJTmCGhOlrjPg==", 1849);
        }
    }

    public static void ycx(tn tnVar, String str, int i5, JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            jSONObject.put(TTConst.TRACK_TYPE, i5);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "SOsjkSysbMmhTvtcghWMIVXlPg==", 1982);
        }
        zb(tnVar, str, "open_ad_land_page_links", jSONObject);
    }

    public static void ycx(tn tnVar, String str, final boolean z11, final boolean z12, final boolean z13, final boolean z14, final int i5, final Map<String, Object> map) {
        ycx(System.currentTimeMillis(), tnVar, str, "start_show_plb", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.42
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("isSkip", z11);
                    jSONObject.put("force", z12);
                    jSONObject.put("isFromLandingPage", z13);
                    jSONObject.put("finishing", z14);
                    jSONObject.put("from", i5);
                    Map map2 = map;
                    if (map2 != null) {
                        for (Map.Entry entry : map2.entrySet()) {
                            jSONObject.put((String) entry.getKey(), entry.getValue());
                        }
                    }
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAM=", "XOs5tAeZcdOSS/NcmBA=", 2020);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(final tn tnVar, final boolean z11, String str, final String str2, final long j11, final String str3, final String str4, final int i5, final String str5) {
        if (TextUtils.isEmpty(str4)) {
            return;
        }
        ycx(System.currentTimeMillis(), tnVar, str, "load_ugen_template", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.sya.43
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                tn.ycx ycxVarJp;
                xz xzVarNc;
                JSONObject jSONObject = new JSONObject();
                try {
                    String str6 = str4;
                    int iHashCode = str6.hashCode();
                    if (iHashCode != -1606803861) {
                        if (iHashCode != 3107) {
                            if (iHashCode == 2989536 && str6.equals("adv3") && (xzVarNc = tnVar.nc()) != null) {
                                jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, xzVarNc.sya());
                                jSONObject.putOpt("id", xzVarNc.ycx());
                                jSONObject.putOpt("md5", xzVarNc.zb());
                            }
                        } else if (str6.equals("ad") && (ycxVarJp = tnVar.jp()) != null) {
                            jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVarJp.ry());
                            jSONObject.putOpt("id", ycxVarJp.dj());
                            jSONObject.putOpt("md5", ycxVarJp.xkz());
                        }
                    } else if (str6.equals("endcard")) {
                        if (z11) {
                            com.bytedance.sdk.openadsdk.core.ry.fby.ycx ycxVarDwi = tnVar.dwi();
                            if (ycxVarDwi != null) {
                                jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVarDwi.sya());
                                jSONObject.putOpt("id", ycxVarDwi.ycx());
                                jSONObject.putOpt("md5", ycxVarDwi.zb());
                            }
                        } else {
                            com.bytedance.sdk.openadsdk.core.ry.fby.ycx ycxVarYzp = tnVar.yzp();
                            if (ycxVarYzp != null) {
                                jSONObject.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVarYzp.sya());
                                jSONObject.putOpt("id", ycxVarYzp.ycx());
                                jSONObject.putOpt("md5", ycxVarYzp.zb());
                            }
                        }
                    }
                    jSONObject.put("ugen_status", str2);
                    jSONObject.put("from", str3);
                    jSONObject.put("ugen_scene", str4);
                    if ("fail".equals(str2)) {
                        jSONObject.put("error_code", i5);
                        jSONObject.put("error_msg", str5);
                        return jSONObject;
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAI=", "XOs5tAeZcdOSS/NcmBA=", 2090);
                    try {
                        jSONObject.put("error_code", Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE);
                        jSONObject.put("error_msg", "send template error " + th2.getMessage());
                    } catch (Throwable th3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAI=", "XOs5tAeZcdOSS/NcmBA=", 2099);
                    }
                }
                return jSONObject;
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQPkfAI=", "XOs5sBuoQ9SPRA==", 2037);
                    return jSONObject;
                }
            }
        });
    }

    private static boolean ycx(int i5, String str) {
        int iZb;
        try {
            Set<String> setVyl = com.bytedance.sdk.openadsdk.core.settings.ea.zb().vyl();
            if ((i5 == 1 && setVyl != null && setVyl.contains(str)) || (iZb = com.bytedance.sdk.openadsdk.core.settings.ea.zb().zb(str)) == 0) {
                return true;
            }
            if (iZb != 100) {
                if (((int) ((Math.random() * 100.0d) + 1.0d)) > iZb) {
                    return true;
                }
            }
            return false;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "WeIilgiObNePWMN/lSOhPF4=", 2125);
            th2.getMessage();
            return false;
        }
    }

    public static JSONObject ycx(int i5) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("ad_show_order", i5);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfeqBRNZaiQM=", "WPwolBe5SMOzQthKowOkLUnEPpoNmGjTgQ==", 2136);
            return null;
        }
    }
}
