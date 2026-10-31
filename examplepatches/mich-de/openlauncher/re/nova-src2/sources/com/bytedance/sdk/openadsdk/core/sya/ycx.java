package com.bytedance.sdk.openadsdk.core.sya;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.component.reward.sya.fby;
import com.bytedance.sdk.openadsdk.core.jc.jw;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.sya.zb;
import com.bytedance.sdk.openadsdk.core.yzp;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.wie;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends zb {
    private boolean ifb;
    private boolean kgy;
    private WeakReference<InterfaceC0083ycx> rmy;
    private boolean sya;
    private boolean ycx;
    private int yzp;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f26162zb;

    /* renamed from: com.bytedance.sdk.openadsdk.core.sya.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0083ycx {
        long getVideoProgress();
    }

    public ycx(Context context, tn tnVar, String str, int i5) {
        super(context, tnVar, str, i5);
        this.ycx = true;
        this.f26162zb = false;
        this.sya = false;
        this.kgy = false;
        this.ifb = true;
    }

    private boolean dj(View view) {
        if (view == null) {
            return false;
        }
        if ((view instanceof com.bytedance.sdk.openadsdk.core.syc.zb.lt) || view.getId() == wie.skm || view.getId() == wie.dc || view.getId() == wie.sz || view.getId() == wie.f27244yi || view.getId() == wie.xym || view.getId() == 520093726 || view.getId() == wie.bah) {
            return true;
        }
        if (view instanceof ViewGroup) {
            int i5 = 0;
            while (true) {
                ViewGroup viewGroup = (ViewGroup) view;
                if (i5 >= viewGroup.getChildCount()) {
                    break;
                }
                if (dj(viewGroup.getChildAt(i5))) {
                    return true;
                }
                i5++;
            }
        }
        return false;
    }

    private boolean fby() {
        return this instanceof jw;
    }

    private boolean jw() {
        tn tnVar = ((zb) this).f26168lt;
        if (tnVar == null || fby()) {
            return false;
        }
        if (tnVar.pk() != 5 && tnVar.pk() != 15) {
            return false;
        }
        if (this.yzp == 0) {
            this.yzp = tnVar.an();
        }
        zb();
        ycx();
        sya();
        if (this.yzp == 5 && ul() && ycx() && !zb() && !sya()) {
            return false;
        }
        int i5 = this.yzp;
        return i5 == 1 || i5 == 2 || i5 == 5;
    }

    private boolean ul() {
        tn tnVar = ((zb) this).f26168lt;
        return tn.lud(tnVar) && tnVar.xf() == 1;
    }

    public void lud(boolean z11) {
        this.kgy = z11;
    }

    public boolean sya() {
        return false;
    }

    public void ycx(boolean z11) {
        this.ycx = z11;
    }

    public boolean zb() {
        return false;
    }

    public void sya(boolean z11) {
        this.f26162zb = z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:127:0x022b  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x032e  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0113  */
    /* JADX WARN: Type inference failed for: r0v31, types: [android.content.Context] */
    /* JADX WARN: Type inference failed for: r0v49, types: [android.content.Context] */
    @Override // com.bytedance.sdk.openadsdk.core.sya.zb, com.bytedance.sdk.openadsdk.core.sya.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        JSONObject jSONObject;
        boolean z12;
        int i5;
        JSONObject jSONObject2;
        View view2;
        boolean z13;
        Object tag;
        Activity activityYcx;
        boolean z14;
        dy dyVar;
        if (!ycx(view, 2, f11, f12, f13, f14, sparseArray, z11)) {
            tn tnVar = ((zb) this).f26168lt;
            tnVar.syc(true);
            tnVar.goq();
            if (!tnVar.thx()) {
                tnVar.dj(true);
            }
            if (tn.lud(tnVar)) {
                if (!fby.ycx(tnVar) || (dyVar = ((zb) this).lud) == null) {
                    com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, ((zb) this).f26172ul, tnVar.eu());
                } else if (this.ifb) {
                    com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, ((zb) this).f26172ul, dyVar.wie);
                }
            }
            if (this.f26170ry != null) {
                if (this.f26164dy == null) {
                    this.f26164dy = new HashMap();
                }
                this.f26164dy.put("duration", Long.valueOf(this.f26170ry.lt()));
            }
            int iDu = tnVar.du();
            tnVar.mp(0);
            com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar = this.syc;
            if (syaVar != null) {
                syaVar.ycx(iDu > 0 ? iDu : 0);
            }
            Map<String, Object> map = this.f26164dy;
            if (map != null) {
                map.remove("dsp_click_type");
                this.f26164dy.remove("click_probability_jump");
                this.f26164dy.remove("auto_click");
            }
            boolean zWnd = tnVar.wnd();
            if (iDu > 0) {
                if (this.f26164dy == null) {
                    this.f26164dy = new HashMap();
                }
                if (zWnd && iDu < 11) {
                    this.f26164dy.put("dsp_click_type", Integer.valueOf(iDu));
                }
                if (iDu >= 11 && tnVar.mm() == 0) {
                    this.f26164dy.put("click_probability_jump", Integer.valueOf(com.bytedance.sdk.openadsdk.core.model.jw.ycx(iDu)));
                }
            }
            com.bytedance.sdk.openadsdk.core.model.dj djVarQye = tnVar.qye();
            if (zWnd || djVarQye != null) {
                WeakReference<InterfaceC0083ycx> weakReference = this.rmy;
                long videoProgress = (weakReference == null || weakReference.get() == null) ? 0L : this.rmy.get().getVideoProgress();
                if (!zWnd && djVarQye != null && (djVarYcx = djVarQye.ycx()) != null) {
                    djVarYcx.ul(videoProgress);
                }
                if (zWnd) {
                    if (view != null) {
                        Object tag2 = view.getTag(570425345);
                        String str = tag2 instanceof String ? (String) tag2 : "VAST_ACTION_BUTTON";
                        com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVarRg = tnVar.rg();
                        if (ycxVarRg != null) {
                            ycxVarRg.lud(str);
                            if (!TextUtils.isEmpty(str)) {
                                ycx(str);
                            }
                            if ("VAST_ICON".equals(str)) {
                                com.bytedance.sdk.openadsdk.core.xkz.zb zbVarZb = ycxVarRg.zb();
                                if (zbVarZb != null) {
                                    zbVarZb.ycx(videoProgress);
                                }
                            } else if ("VAST_END_CARD".equals(str)) {
                                com.bytedance.sdk.openadsdk.core.xkz.sya syaVarSya = ycxVarRg.sya();
                                if (syaVarSya != null) {
                                    syaVarSya.ycx(videoProgress);
                                }
                            } else {
                                com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx2 = ycxVarRg.ycx();
                                if (djVarYcx2 != null) {
                                    djVarYcx2.ul(videoProgress);
                                }
                            }
                        }
                    }
                }
            }
            if (jw() && dj(view) && !this.sya) {
                super.ycx(view, f11, f12, f13, f14, sparseArray, z11);
                return;
            }
            if (((zb) this).f26163dj == null) {
                ((zb) this).f26163dj = pmi.ycx();
            }
            if (((zb) this).f26163dj != null && ycx(view, z11)) {
                JSONObject jSONObjectYcx = thx.ycx(view);
                dy dyVar2 = ((zb) this).lud;
                if (dyVar2 != null) {
                    int i11 = dyVar2.fby;
                    JSONObject jSONObject3 = dyVar2.f25620jw;
                    JSONObject jSONObject4 = dyVar2.f25623ry;
                    i5 = i11;
                    z12 = dyVar2.xkz;
                    jSONObject = jSONObject3;
                    jSONObject2 = jSONObject4;
                } else {
                    jSONObject = jSONObjectYcx;
                    z12 = false;
                    i5 = -1;
                    jSONObject2 = null;
                }
                long j11 = this.f26152dv;
                long j12 = this.oty;
                WeakReference<View> weakReference2 = this.f26167jw;
                ok okVarYcx = ycx(f11, f12, f13, f14, sparseArray, j11, j12, weakReference2 == null ? dj() : weakReference2.get(), lud(), dc.jw(((zb) this).f26163dj), dc.ea(((zb) this).f26163dj), dc.jc(((zb) this).f26163dj), i5, jSONObject, jSONObject2);
                this.f26166jc = okVarYcx;
                if (z12) {
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, okVarYcx, ((zb) this).f26172ul, true, this.f26164dy, z11 ? 1 : 2);
                    return;
                }
                int iLiq = tnVar.liq();
                if (iLiq == 2 || iLiq == 3) {
                    view2 = view;
                    if (iLiq == 3) {
                        String strKh = tnVar.kh();
                        if (TextUtils.isEmpty(strKh) || !strKh.contains("play.google.com/store")) {
                            if (this.f26169ok != null || this.f26162zb) {
                                z13 = false;
                                com.bytedance.sdk.openadsdk.dj.sya.ycx("click_button", tnVar, this.f26166jc, ((zb) this).f26172ul, true, this.f26164dy, z11 ? 1 : 2);
                            } else {
                                z13 = false;
                            }
                            if (view2 != null) {
                                try {
                                    tag = view2.getTag(520093762);
                                } catch (Exception e3) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7ymZCq99wo5PxQ==", "eOIklgife8KBXt5LiT2pO0/rI5AR", "VOAOmQq/Yg==", 297);
                                }
                            } else {
                                tag = null;
                            }
                            if ((view2 != null && (view2.getId() == 520093726 || (view2 instanceof com.bytedance.sdk.openadsdk.core.syc.zb.lt))) || Boolean.TRUE.equals(tag)) {
                                yzp.ycx(true);
                            }
                            activityYcx = view2 != null ? com.bytedance.sdk.component.utils.zb.ycx(view2) : null;
                            Activity activity = activityYcx == null ? ((zb) this).f26163dj : activityYcx;
                            if (htf.sya(tnVar) && this.kgy) {
                                z14 = z13;
                            } else {
                                boolean zYcx = yzp.ycx(activity, tnVar, this.fby, this.f26169ok, this.wie, ((zb) this).f26172ul, this.syc, true, iDu);
                                tnVar.lt(SystemClock.elapsedRealtime());
                                yzp.ycx(z13);
                                z14 = zYcx;
                            }
                            if (this.ycx) {
                                com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, ((zb) this).f26172ul, z14, this.f26164dy, z11 ? 1 : 2);
                            }
                        } else if (com.bytedance.sdk.openadsdk.thx.ycx.ycx.zb.ycx(((zb) this).f26163dj, strKh, strKh.substring(strKh.indexOf("?id=") + 4), ((zb) this).f26172ul, tnVar)) {
                            if (this.ycx) {
                                com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, ((zb) this).f26172ul, true, this.f26164dy, z11 ? 1 : 2);
                            }
                        }
                    }
                } else if (iLiq != 4) {
                    if (iLiq == 5) {
                        String strZb = zb(((zb) this).f26172ul);
                        if (!TextUtils.isEmpty(strZb)) {
                            com.bytedance.sdk.openadsdk.dj.sya.ycx("click_call", tnVar, this.f26166jc, strZb, true, this.f26164dy, z11 ? 1 : 2);
                        }
                        com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, ((zb) this).f26172ul, oby.zb(view.getContext(), tnVar.pyn()), this.f26164dy, z11 ? 1 : 2);
                        view2 = view;
                    } else if (iLiq != 8) {
                        view2 = view;
                        iLiq = -1;
                    }
                } else if (!av.zb(tnVar) || (this.f26169ok == null && this.wie == null)) {
                    view2 = view;
                    com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar2 = this.syc;
                    if (syaVar2 != null) {
                        syaVar2.ycx(tnVar);
                        Map<String, Object> map2 = this.f26164dy;
                        if (tnVar.thx() && !tnVar.htf()) {
                            map2.put("auto_click", Boolean.TRUE);
                            tnVar.lud(false);
                        }
                        if (this.ycx) {
                            com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, ((zb) this).f26172ul, true, map2, z11 ? 1 : 2);
                        }
                    }
                } else {
                    view2 = view;
                    activityYcx = view2 != null ? com.bytedance.sdk.component.utils.zb.ycx(view2) : null;
                    boolean zYcx2 = yzp.ycx(activityYcx == null ? ((zb) this).f26163dj : activityYcx, tnVar, this.fby, this.f26169ok, this.wie, ((zb) this).f26172ul, this.syc, true, iDu);
                    if (this.ycx) {
                        com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar, this.f26166jc, ((zb) this).f26172ul, zYcx2, this.f26164dy, z11 ? 1 : 2);
                    }
                }
                zb.ycx ycxVar = this.f26165ea;
                if (ycxVar != null) {
                    ycxVar.ycx(view2, iLiq);
                }
            }
        }
    }

    public void zb(boolean z11) {
        this.ifb = z11;
    }

    private String zb(String str) {
        str.getClass();
        switch (str) {
            case "banner_ad":
                return "banner_call";
            case "open_ad":
                return "open_ad";
            case "embeded_ad":
                return "feed_call";
            case "interaction":
                return "interaction_call";
            case "slide_banner_ad":
                return "banner_call";
            default:
                return b.f42142b;
        }
    }

    public void dj(boolean z11) {
        this.sya = z11;
    }

    public boolean ycx() {
        tn tnVar = ((zb) this).f26168lt;
        if (tnVar == null) {
            return true;
        }
        int iZb = pmi.dj().zb(tnVar.ksy());
        int iSya = com.bytedance.sdk.component.utils.pmi.sya(pmi.ycx());
        if (iZb == 1) {
            return oby.dj(iSya);
        }
        if (iZb == 2) {
            return oby.lud(iSya) || oby.dj(iSya) || oby.lt(iSya);
        }
        if (iZb != 3) {
            return iZb != 5 || oby.dj(iSya) || oby.lt(iSya);
        }
        return false;
    }

    public void ycx(InterfaceC0083ycx interfaceC0083ycx) {
        this.rmy = new WeakReference<>(interfaceC0083ycx);
    }

    public void ycx(View view) {
        ycx(view, this.htf, this.thx, this.wwx, this.f26155tn, this.f26157xz, this.rmf);
    }
}
