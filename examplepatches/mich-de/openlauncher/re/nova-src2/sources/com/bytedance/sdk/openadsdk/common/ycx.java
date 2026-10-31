package com.bytedance.sdk.openadsdk.common;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.bhi;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.dj.lud.zb.syc;
import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: com.bytedance.sdk.openadsdk.common.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0054ycx {
        void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, View view);
    }

    public interface zb {
        void ycx();

        void ycx(boolean z11, int i5);
    }

    private static com.bytedance.sdk.openadsdk.component.reward.top.zb sya(final xkz xkzVar) {
        final com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarYcx = xkzVar.ycx();
        final String strZb = xkzVar.zb();
        final zb zbVarDj = xkzVar.dj();
        final dy dyVarLt = xkzVar.lt();
        final boolean zLud = xkzVar.lud();
        return new com.bytedance.sdk.openadsdk.component.reward.top.zb() { // from class: com.bytedance.sdk.openadsdk.common.ycx.3
            @Override // com.bytedance.sdk.openadsdk.component.reward.top.zb
            public void dj(View view) {
                if (xkzVar.ycx() == null || xkzVar.ul() == null) {
                    return;
                }
                xkzVar.ul().ycx(xkzVar.ycx(), view);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.top.zb
            public void sya(View view) {
                com.bytedance.sdk.openadsdk.component.reward.view.ea eaVar;
                View viewJc;
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = zbVarYcx;
                if (zbVar == null || (eaVar = zbVar.kgy) == null || (viewJc = eaVar.jc()) == null) {
                    return;
                }
                viewJc.performClick();
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.top.zb
            public void ycx(View view) {
                if (ycx.zb(dyVarLt, zbVarYcx, false, strZb)) {
                    return;
                }
                if (zLud && ycx.zb(zbVarYcx, strZb, zbVarDj)) {
                    return;
                }
                ycx.ycx(zbVarYcx);
                ycx.ycx(zbVarYcx, zbVarDj);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.top.zb
            public void zb(View view) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.dj djVar;
                com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar;
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = zbVarYcx;
                if (zbVar2 == null || (djVar = zbVar2.bhi) == null || (zbVar = zbVar2.f25195ur) == null) {
                    return;
                }
                djVar.ycx(zbVar);
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.top.zb
            public void ycx(View view, String str) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = zbVarYcx;
                if (zbVar == null) {
                    return;
                }
                ycx.ycx(zbVar, zbVar.f25195ur, str);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, View view, String str, xkz xkzVar) {
        if (zbVar == null || view == null || xkzVar == null || ycx(zbVar, view)) {
            return;
        }
        zbVar.rmf.thx();
        zbVar.aeu.ea();
        zbVar.f25177hf.lt();
        dy dyVarLt = xkzVar.lt();
        if (dyVarLt == null || !av.dj(zbVar.f25203zb)) {
            xkzVar.sya().run();
            return;
        }
        boolean zZb = zb(dyVarLt, zbVar, true, str);
        if (!(zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.lud) || zZb) {
            return;
        }
        xkzVar.sya().run();
    }

    public static void ycx(final xkz xkzVar) {
        com.bytedance.sdk.openadsdk.component.reward.view.ea eaVar;
        final com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarYcx = xkzVar.ycx();
        if (zbVarYcx == null || (eaVar = zbVarYcx.kgy) == null) {
            return;
        }
        final View viewJc = eaVar.jc();
        View viewEa = zbVarYcx.kgy.ea();
        final String strZb = xkzVar.zb();
        View.OnClickListener onClickListener = new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.ycx.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ycx.zb(zbVarYcx, viewJc, strZb, xkzVar);
            }
        };
        View.OnClickListener onClickListener2 = new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.ycx.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ycx.zb(zbVarYcx, viewJc, strZb, xkzVar);
                com.bytedance.sdk.openadsdk.component.dj.zb.ycx("force_button_tracker", TTEDPEventConstants.EDP_EVENT_NAME_CLICK, zbVarYcx.f25203zb);
            }
        };
        if (viewJc != null) {
            viewJc.setOnClickListener(onClickListener);
            viewJc.setTag(viewJc.getId(), onClickListener);
        }
        if (viewEa != null) {
            viewEa.setOnClickListener(onClickListener2);
            viewEa.setTag(viewEa.getId(), onClickListener2);
        }
    }

    private static void sya(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        tn tnVar;
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        if (zbVar == null || (tnVar = zbVar.f25203zb) == null || (djVarQye = tnVar.qye()) == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx = djVarQye.ycx();
        long jRy = zbVar.thx.ry();
        if (zbVar.f25202yi) {
            djVarYcx.fby(jRy);
        } else {
            djVarYcx.jw(jRy);
        }
    }

    public static void zb(xkz xkzVar) {
        ycx(xkzVar);
        xkzVar.ycx().f25201xz.ycx(sya(xkzVar));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean zb(dy dyVar, com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, boolean z11, String str) {
        if (dyVar == null) {
            return false;
        }
        if (!dyVar.ycx(av.sya(zbVar.f25203zb), z11, null) && (zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.lud)) {
            return ((com.bytedance.sdk.openadsdk.activity.single.lud) zbVar.f25196uu).fby();
        }
        return true;
    }

    private static boolean ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, View view) {
        if (!zbVar.rmf.htf() || (!zbVar.f25188sg && !zbVar.f25180jw.get())) {
            return false;
        }
        boolean zRy = zbVar.aeu.ry();
        zbVar.rmf.lt(zRy);
        zbVar.kgy.ul(8);
        if (view instanceof com.bytedance.sdk.openadsdk.core.lt.dj) {
            ((com.bytedance.sdk.openadsdk.core.lt.dj) view).setImageResource(com.bytedance.sdk.component.utils.wwx.dj(zbVar.oby, "tt_close_btn"));
        }
        zbVar.nji.sendEmptyMessageDelayed(600, 5000L);
        return !tn.sya(zbVar.f25203zb) || zRy;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, String str, zb zbVar2) {
        if (zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.lud) {
            zbVar2.ycx();
            return true;
        }
        boolean zFby = av.fby(zbVar.f25203zb);
        boolean zLt = av.lt(zbVar.f25203zb);
        boolean zLud = av.lud(zbVar.f25203zb);
        if (!zLt && (!zLud || !zbVar.f25189tn.dj(com.bytedance.sdk.openadsdk.component.reward.ycx.jw.f25088zb))) {
            if (com.bytedance.sdk.openadsdk.core.model.htf.ycx(zbVar.f25203zb) && !zbVar.f25187ry.get()) {
                zbVar2.ycx();
                return true;
            }
            zbVar.f25201xz.dj(false);
            return false;
        }
        if (zFby) {
            zbVar.f25189tn.jw();
        } else {
            View viewJc = zbVar.kgy.jc();
            if (viewJc != null) {
                viewJc.performClick();
            } else {
                zbVar2.ycx();
            }
        }
        return true;
    }

    public static void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        if (zbVar == null) {
            return;
        }
        syc.ycx ycxVar = new syc.ycx();
        ycxVar.zb(zbVar.thx.ry());
        ycxVar.dj(zbVar.thx.hf());
        ycxVar.sya(zbVar.thx.wie());
        ycxVar.sya(3);
        ycxVar.dj(zbVar.thx.oty());
        ycxVar.ycx(zbVar.thx.zb());
        com.bytedance.sdk.openadsdk.dj.lud.ycx.ycx.ycx(zbVar.thx.fby(), ycxVar, zbVar.thx.lud());
        bhi.sya(zbVar.f25181lt);
        zbVar.thx.ycx("skip", false);
    }

    public static void zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        if (zbVar == null) {
            return;
        }
        tn tnVar = zbVar.f25203zb;
        if (tnVar != null && (djVarQye = tnVar.qye()) != null && (djVarYcx = djVarQye.ycx()) != null) {
            long jRy = zbVar.thx.ry();
            djVarYcx.lt(jRy);
            djVarYcx.lud(jRy);
        }
        com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(zbVar.f25203zb, 5);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, zb zbVar2) {
        if (zbVar.sya) {
            if (com.bytedance.sdk.openadsdk.core.model.htf.sya(zbVar.f25203zb)) {
                com.bytedance.sdk.openadsdk.component.reward.view.sya syaVarYcx = zbVar.f25174dv.ycx();
                if (syaVarYcx == null || syaVarYcx.f25014dj != 0) {
                    zbVar2.ycx(true, 4);
                }
            } else {
                zbVar2.ycx(true, 4);
                if (com.bytedance.sdk.openadsdk.core.model.htf.ycx(zbVar.f25203zb) && !zbVar.f25187ry.get()) {
                }
            }
        } else {
            zbVar2.ycx();
        }
        zb(zbVar);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar2, String str) {
        com.bytedance.sdk.openadsdk.component.reward.view.jw jwVar;
        if (zbVar == null || zbVar.f25195ur == null) {
            return;
        }
        zbVar.f25202yi = !zbVar.f25202yi;
        boolean z11 = zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.lud;
        if (zbVar.f25188sg && !z11 && (jwVar = zbVar.f25174dv) != null && jwVar.ycx() != null) {
            zbVar.f25174dv.ycx().setSoundMute(zbVar.f25202yi);
        }
        zbVar.thx.ycx(zbVar.f25202yi, str);
        zbVar.rmf.lud(zbVar.f25202yi);
        zbVar.f25189tn.zb(zbVar.f25202yi);
        if (z11) {
            return;
        }
        sya(zbVar);
    }
}
