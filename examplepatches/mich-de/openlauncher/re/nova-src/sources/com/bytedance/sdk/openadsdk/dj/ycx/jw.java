package com.bytedance.sdk.openadsdk.dj.ycx;

import android.text.TextUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw implements com.bytedance.sdk.openadsdk.dy.zb {
    private final com.bytedance.sdk.component.lt.ycx.lt.dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f26720zb;

    public jw(boolean z11, com.bytedance.sdk.component.lt.ycx.lt.dj djVar) {
        this.ycx = djVar;
        this.f26720zb = z11;
    }

    @Override // com.bytedance.sdk.openadsdk.dy.zb
    public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
        if (this.ycx == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("success", this.f26720zb);
        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, this.ycx.zb());
        int iDj = this.ycx.dj();
        if (iDj <= 0) {
            iDj = 0;
        }
        jSONObject.put("retry_times", iDj);
        jSONObject.put("ad_id", this.ycx.lt());
        jSONObject.put("track_type", this.ycx.lud());
        jSONObject.put("upload_scene", this.f26720zb ? this.ycx.jc() ? 3 : this.ycx.dj() <= 0 ? 1 : 2 : 4);
        String strUl = this.ycx.ul();
        if (!TextUtils.isEmpty(strUl)) {
            JSONArray jSONArray = new JSONArray();
            for (String str : strUl.split(",")) {
                jSONArray.put(str);
            }
            jSONObject.put("error_code", jSONArray);
        }
        String strJw = this.ycx.jw();
        if (!TextUtils.isEmpty(strJw)) {
            JSONArray jSONArray2 = new JSONArray();
            for (String str2 : strJw.split(",")) {
                jSONArray2.put(str2);
            }
            jSONObject.put("error_msg", jSONArray2);
        }
        jSONObject.put("use_new_upload", this.ycx.ok());
        return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("track_link_result").zb(jSONObject.toString());
    }
}
