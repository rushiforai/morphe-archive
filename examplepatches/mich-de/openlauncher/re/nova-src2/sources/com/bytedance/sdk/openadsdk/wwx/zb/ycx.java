package com.bytedance.sdk.openadsdk.wwx.zb;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private List<C0114ycx> sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<C0114ycx> f27405zb;

    /* renamed from: com.bytedance.sdk.openadsdk.wwx.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0114ycx {
        private int sya;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f27406zb;

        public boolean equals(Object obj) {
            String str;
            if (!(obj instanceof C0114ycx)) {
                return super.equals(obj);
            }
            String str2 = this.ycx;
            if (str2 != null) {
                C0114ycx c0114ycx = (C0114ycx) obj;
                if (str2.equals(c0114ycx.ycx) && (str = this.f27406zb) != null && str.equals(c0114ycx.f27406zb)) {
                    return true;
                }
            }
            return false;
        }

        public static C0114ycx ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return null;
            }
            C0114ycx c0114ycx = new C0114ycx();
            c0114ycx.ycx = jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            c0114ycx.f27406zb = jSONObject.optString("md5");
            c0114ycx.sya = jSONObject.optInt(TTConst.TRACK_TYPE);
            return c0114ycx;
        }

        public String ycx() {
            return this.ycx;
        }
    }

    public List<C0114ycx> sya() {
        return this.sya;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(List<C0114ycx> list) {
        this.sya = list;
    }

    public void ycx(List<C0114ycx> list) {
        this.f27405zb = list;
    }

    public List<C0114ycx> zb() {
        return this.f27405zb;
    }

    public static ycx zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            ycx ycxVar = new ycx();
            ycxVar.ycx(jSONObject.optString("version"));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("resources");
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    C0114ycx c0114ycxYcx = C0114ycx.ycx(jSONArrayOptJSONArray.optJSONObject(i5));
                    if (c0114ycxYcx != null) {
                        if (c0114ycxYcx.sya != 1) {
                            if (c0114ycxYcx.sya == 2 && arrayList2.size() < 10) {
                                arrayList2.add(c0114ycxYcx);
                            }
                        } else {
                            arrayList.add(c0114ycxYcx);
                        }
                    }
                }
            }
            ycxVar.ycx(arrayList);
            ycxVar.zb(arrayList2);
            return ycxVar;
        } catch (JSONException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFmw4VG", "a+IsjAK+ZcKyT8RwgxWlJA==", "S+8/hgau", 74);
            return null;
        }
    }

    public String ycx() {
        return this.ycx;
    }
}
