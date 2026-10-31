package com.bytedance.sdk.openadsdk.core.sya;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.yzp;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.wie;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import ob.e;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends sya {
    private static int rmy = Integer.MIN_VALUE;

    /* renamed from: dj, reason: collision with root package name */
    protected Context f26163dj;

    /* renamed from: dy, reason: collision with root package name */
    protected Map<String, Object> f26164dy;

    /* renamed from: ea, reason: collision with root package name */
    protected ycx f26165ea;
    protected final int fby;

    /* renamed from: jc, reason: collision with root package name */
    protected ok f26166jc;

    /* renamed from: jw, reason: collision with root package name */
    protected WeakReference<View> f26167jw;

    /* renamed from: lt, reason: collision with root package name */
    protected final tn f26168lt;
    public dy lud;

    /* renamed from: ok, reason: collision with root package name */
    protected PAGNativeAd f26169ok;
    protected com.bytedance.sdk.openadsdk.core.jc.zb pmi;

    /* renamed from: ry, reason: collision with root package name */
    protected e f26170ry;
    private boolean sya;
    protected com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syc;

    /* renamed from: uh, reason: collision with root package name */
    protected int f26171uh;

    /* renamed from: ul, reason: collision with root package name */
    protected final String f26172ul;
    protected com.bytedance.sdk.openadsdk.core.dj.ycx wie;
    protected boolean xkz;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private WeakReference<Activity> f26173zb;

    public interface ycx {
        void ycx(View view, int i5);
    }

    public zb(Context context, tn tnVar, String str, int i5) {
        this.xkz = false;
        this.f26171uh = 0;
        this.sya = false;
        this.f26163dj = context;
        this.f26168lt = tnVar;
        this.f26172ul = str;
        this.fby = i5;
    }

    public View dj() {
        WeakReference<Activity> weakReference = this.f26173zb;
        if (weakReference == null || weakReference.get() == null) {
            return null;
        }
        return this.f26173zb.get().findViewById(16908290);
    }

    public void lt(boolean z11) {
        this.xkz = z11;
    }

    public String lud() {
        return this.ycx;
    }

    public void sya(int i5) {
        this.f26153hf = i5;
    }

    public boolean ycx(ok okVar, Map<String, Object> map) {
        return false;
    }

    public void zb(View view) {
        if (view == null) {
            return;
        }
        this.f26167jw = new WeakReference<>(view);
    }

    public static boolean sya(View view) {
        return 520093705 == view.getId() || 520093707 == view.getId() || 520093703 == view.getId() || ycx(view.getContext()) == view.getId() || wie.f27229sp == view.getId() || wie.uci == view.getId();
    }

    public void ycx(com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar) {
        this.syc = syaVar;
    }

    public void zb(int i5) {
        this.tru = i5;
    }

    public void dj(int i5) {
        this.f26171uh = i5;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.jc.zb zbVar) {
        this.pmi = zbVar;
    }

    public void ycx(PAGNativeAd pAGNativeAd) {
        this.f26169ok = pAGNativeAd;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.dj.ycx ycxVar) {
        this.wie = ycxVar;
    }

    public void ycx(e eVar) {
        this.f26170ry = eVar;
    }

    public void ycx(ycx ycxVar) {
        this.f26165ea = ycxVar;
    }

    public void ycx(Activity activity) {
        if (activity == null) {
            return;
        }
        this.f26173zb = new WeakReference<>(activity);
    }

    public zb(Context context, tn tnVar, String str, int i5, boolean z11) {
        this(context, tnVar, str, i5);
        this.sya = z11;
    }

    public void ycx(Map<String, Object> map) {
        Map<String, Object> map2 = this.f26164dy;
        if (map2 != null) {
            map2.putAll(map);
            map.putAll(this.f26164dy);
        }
        this.f26164dy = map;
    }

    public void ycx(int i5) {
        this.bhi = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [android.content.Context] */
    @Override // com.bytedance.sdk.openadsdk.core.sya.sya
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        int i5;
        boolean z12;
        JSONObject jSONObject;
        JSONObject jSONObject2;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        if (this.f26163dj == null) {
            this.f26163dj = pmi.ycx();
        }
        if ((this.sya || !ycx(view, 1, f11, f12, f13, f14, sparseArray, z11)) && this.f26163dj != null) {
            dy dyVar = this.lud;
            if (dyVar != null) {
                int i11 = dyVar.fby;
                JSONObject jSONObject3 = dyVar.f25620jw;
                JSONObject jSONObject4 = dyVar.f25623ry;
                z12 = dyVar.xkz;
                i5 = i11;
                jSONObject = jSONObject3;
                jSONObject2 = jSONObject4;
            } else {
                i5 = -1;
                z12 = false;
                jSONObject = null;
                jSONObject2 = null;
            }
            long j11 = this.f26152dv;
            long j12 = this.oty;
            WeakReference<View> weakReference = this.f26167jw;
            boolean z13 = z12;
            ok okVarYcx = ycx(f11, f12, f13, f14, sparseArray, j11, j12, weakReference == null ? null : weakReference.get(), lud(), dc.jw(this.f26163dj), dc.ea(this.f26163dj), dc.jc(this.f26163dj), i5, jSONObject, jSONObject2);
            this.f26166jc = okVarYcx;
            if (ycx(okVarYcx, this.f26164dy)) {
                return;
            }
            if (this.f26170ry != null) {
                if (this.f26164dy == null) {
                    this.f26164dy = new HashMap();
                }
                this.f26164dy.put("duration", Long.valueOf(this.f26170ry.lt()));
            }
            tn tnVar = this.f26168lt;
            if (!this.sya && !z13) {
                ycx ycxVar = this.f26165ea;
                if (ycxVar != null) {
                    ycxVar.ycx(view, -1);
                }
                if (ycx(view, z11)) {
                    boolean zZb = av.zb(tnVar);
                    String strYcx = zZb ? this.f26172ul : oby.ycx(this.fby);
                    if (view != null) {
                        try {
                            if (Boolean.TRUE.equals(view.getTag(520093762))) {
                                yzp.ycx(true);
                            }
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7ymZCq99wo5PxQ==", "eOIklgiQYNSUT9lYng==", "VOAOmQq/Yg==", 248);
                        }
                    }
                    Activity activityYcx = view != null ? com.bytedance.sdk.component.utils.zb.ycx(view) : null;
                    boolean zYcx = yzp.ycx(activityYcx == null ? this.f26163dj : activityYcx, tnVar, this.fby, this.f26169ok, this.wie, strYcx, this.syc, zZb, 0);
                    yzp.ycx(false);
                    if (zYcx || tnVar == null || tnVar.sjd() == null || tnVar.sjd().sya() != 2) {
                        if (tnVar != null && !zYcx && TextUtils.isEmpty(tnVar.kh()) && com.bytedance.sdk.openadsdk.dj.zb.ycx(this.f26172ul)) {
                            com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f26163dj, this.f26172ul).ycx(tnVar);
                        }
                        com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, this.f26172ul, zYcx, this.f26164dy, z11 ? 1 : 2);
                        return;
                    }
                    return;
                }
                return;
            }
            com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, this.f26172ul, true, this.f26164dy, z11 ? 1 : 2);
            com.bytedance.sdk.openadsdk.core.model.dj djVarQye = tnVar.qye();
            if (djVarQye == null || tnVar.wnd() || (djVarYcx = djVarQye.ycx()) == null) {
                return;
            }
            e eVar = this.f26170ry;
            djVarYcx.ul(eVar != null ? eVar.lt() : 0L);
        }
    }

    public boolean ycx(View view, boolean z11) {
        return ycx(view, this.f26168lt, z11);
    }

    public static boolean ycx(View view, tn tnVar, boolean z11) {
        if (view != null && tnVar != null) {
            try {
                int i5 = com.bytedance.sdk.component.adexpress.dynamic.ycx.htf;
                String strValueOf = String.valueOf(view.getTag(i5));
                if (view.getTag(i5) != null && !TextUtils.isEmpty(strValueOf)) {
                    if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(strValueOf)) {
                        return z11;
                    }
                    return true;
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7ymZCq99wo5PxQ==", "eOIklgiQYNSUT9lYng==", "WO8jtg+1asw=", 297);
            }
            if (sya(view)) {
                return tnVar.giw() != 1 || z11;
            }
            if (tnVar.wr() == 1 && !z11) {
                return false;
            }
        }
        return true;
    }

    public ok ycx(float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, long j11, long j12, View view, String str, float f15, int i5, float f16, int i11, JSONObject jSONObject, JSONObject jSONObject2) {
        return new ok.ycx().lt(f11).lud(f12).dj(f13).sya(f14).zb(j11).ycx(j12).ycx(dc.ycx(view)).zb(dc.sya(view)).dj(this.f26153hf).lud(this.tru).lt(this.bhi).ycx(sparseArray).zb(jc.zb().ycx() ? 1 : 2).ycx(str).ycx(f15).sya(i5).zb(f16).ycx(i11).ycx(jSONObject).zb(jSONObject2).ycx();
    }

    public boolean ycx(View view, int i5, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        if (this.pmi == null) {
            return false;
        }
        this.pmi.ycx(view, i5, new dy.ycx().dj(f11).sya(f12).zb(f13).ycx(f14).zb(this.f26152dv).ycx(this.oty).ycx(sparseArray).ycx(z11).ycx());
        return true;
    }

    private static int ycx(Context context) {
        if (rmy == Integer.MIN_VALUE) {
            rmy = wwx.lud(context, "btn_native_creative");
        }
        return rmy;
    }

    public void ycx(String str) {
        this.ycx = str;
    }
}
