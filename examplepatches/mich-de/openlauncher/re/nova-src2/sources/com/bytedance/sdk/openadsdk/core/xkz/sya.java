package com.bytedance.sdk.openadsdk.core.xkz;

import b.c0;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.xkz.sya.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    protected ycx.zb f26435dj;
    protected String fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f26437jc;

    /* renamed from: lt, reason: collision with root package name */
    protected List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26439lt;
    protected String lud;

    /* renamed from: ok, reason: collision with root package name */
    private tn f26440ok;
    protected ycx.EnumC0091ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    protected List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26441ul;
    protected int ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected int f26442zb;

    /* renamed from: ea, reason: collision with root package name */
    private final AtomicBoolean f26436ea = new AtomicBoolean(false);

    /* renamed from: jw, reason: collision with root package name */
    protected String f26438jw = "endcard_click";

    /* renamed from: com.bytedance.sdk.openadsdk.core.xkz.sya$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[ycx.zb.values().length];
            ycx = iArr;
            try {
                iArr[ycx.zb.STATIC_RESOURCE.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "be8+gTG5esiVWNRYyEA=", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[ycx.zb.HTML_RESOURCE.ordinal()] = 2;
            } catch (NoSuchFieldError e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "be8+gTG5esiVWNRYyEA=", "B+0hnA21fZk=", -1);
            }
            try {
                ycx[ycx.zb.IFRAME_RESOURCE.ordinal()] = 3;
            } catch (NoSuchFieldError e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "be8+gTG5esiVWNRYyEA=", "B+0hnA21fZk=", -1);
            }
        }
    }

    public sya(int i5, int i11, ycx.EnumC0091ycx enumC0091ycx, ycx.zb zbVar, String str, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list2, String str2) {
        this.f26439lt = new ArrayList();
        this.f26441ul = new ArrayList();
        this.ycx = i5;
        this.f26442zb = i11;
        this.sya = enumC0091ycx;
        this.f26435dj = zbVar;
        this.lud = str;
        this.f26439lt = list;
        this.f26441ul = list2;
        this.fby = str2;
    }

    public String dj() {
        if (this.f26435dj == ycx.zb.STATIC_RESOURCE && this.sya == ycx.EnumC0091ycx.IMAGE) {
            return this.lud;
        }
        return null;
    }

    public String lud() {
        return this.lud;
    }

    public String sya() {
        int i5 = AnonymousClass1.ycx[this.f26435dj.ordinal()];
        if (i5 == 1) {
            ycx.EnumC0091ycx enumC0091ycx = this.sya;
            if (enumC0091ycx == ycx.EnumC0091ycx.IMAGE) {
                return c0.q(new StringBuilder("<html><head></head><body style=\"margin:0;padding:0\"><img src=\""), this.lud, "\" width=\"100%\" style=\"max-width:100%;max-height:100%;\" /></body></html>");
            }
            if (enumC0091ycx == ycx.EnumC0091ycx.JAVASCRIPT) {
                return c0.q(new StringBuilder("<script src=\""), this.lud, "\"></script>");
            }
            return null;
        }
        if (i5 == 2) {
            return this.lud;
        }
        if (i5 != 3) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder("<iframe frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" style=\"border: 0px; margin: 0px;\" width=\"");
        sb2.append(this.ycx);
        sb2.append("\" height=\"");
        sb2.append(this.f26442zb);
        sb2.append("\" src=\"");
        return c0.q(sb2, this.lud, "\"></iframe>");
    }

    public int ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f26442zb;
    }

    public void ycx(long j11) {
        com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(null, this.f26439lt, null, j11, this.f26437jc, new sya.zb(this.f26438jw, this.f26440ok), null);
    }

    public void zb(long j11) {
        if (this.f26436ea.compareAndSet(false, true)) {
            com.bytedance.sdk.openadsdk.core.xkz.zb.sya.zb((tn) null, this.f26441ul, (com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx) null, j11, this.f26437jc, (String) null);
        }
    }

    public static float ycx(int i5, int i11, int i12, int i13, ycx.zb zbVar, ycx.EnumC0091ycx enumC0091ycx) {
        if (i11 == 0 || i13 == 0) {
            return 0.0f;
        }
        float f11 = i5;
        float f12 = i12;
        return ycx(zbVar, enumC0091ycx) / ((Math.abs((f11 - f12) / f11) + Math.abs((f11 / i11) - (f12 / i13))) + 1.0f);
    }

    public static sya zb(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        int iOptInt = jSONObject.optInt("width");
        int iOptInt2 = jSONObject.optInt("height");
        String strOptString = jSONObject.optString("creativeType", ycx.EnumC0091ycx.NONE.toString());
        String strOptString2 = jSONObject.optString("resourceType", ycx.zb.HTML_RESOURCE.toString());
        String strOptString3 = jSONObject.optString("contentUrl");
        String strOptString4 = jSONObject.optString("clickThroughUri");
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("clickTrackers");
        JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray("creativeViewTrackers");
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            arrayList.add(new sya.ycx(jSONArrayOptJSONArray.optString(i5)).ycx());
        }
        ArrayList arrayList2 = new ArrayList();
        for (int i11 = 0; i11 < jSONArrayOptJSONArray2.length(); i11++) {
            arrayList2.add(new sya.ycx(jSONArrayOptJSONArray2.optString(i11)).ycx());
        }
        return new sya(iOptInt, iOptInt2, ycx.EnumC0091ycx.valueOf(strOptString), ycx.zb.valueOf(strOptString2), strOptString3, arrayList, arrayList2, strOptString4);
    }

    private static float ycx(ycx.zb zbVar, ycx.EnumC0091ycx enumC0091ycx) {
        int i5 = AnonymousClass1.ycx[zbVar.ordinal()];
        if (i5 != 1) {
            if (i5 != 2) {
                return i5 != 3 ? 0.0f : 1.0f;
            }
            return 1.2f;
        }
        if (ycx.EnumC0091ycx.JAVASCRIPT.equals(enumC0091ycx)) {
            return 1.0f;
        }
        return ycx.EnumC0091ycx.IMAGE.equals(enumC0091ycx) ? 0.8f : 0.0f;
    }

    public void ycx(String str) {
        this.f26437jc = str;
    }

    public void ycx(tn tnVar) {
        this.f26440ok = tnVar;
    }
}
