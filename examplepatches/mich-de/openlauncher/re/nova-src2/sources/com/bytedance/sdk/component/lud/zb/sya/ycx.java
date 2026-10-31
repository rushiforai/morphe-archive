package com.bytedance.sdk.component.lud.zb.sya;

import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.component.lud.uh;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx<T> {
    private sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private uh f24025zb;

    public ycx(sya syaVar, uh uhVar) {
        this.ycx = syaVar;
        this.f24025zb = uhVar;
    }

    public void ycx(ea<T> eaVar) {
        try {
            uh uhVar = this.f24025zb;
            if (uhVar != null) {
                uhVar.ycx("success", this.ycx);
            }
            String strUh = this.ycx.uh();
            Map<String, List<sya>> mapJw = this.ycx.dy().jw();
            List<sya> list = mapJw.get(strUh);
            if (list == null) {
                dy dyVarLt = this.ycx.lt();
                if (dyVarLt != null) {
                    dyVarLt.toString();
                    this.ycx.fby();
                    dyVarLt.ycx(eaVar);
                }
            } else {
                synchronized (list) {
                    try {
                        list.size();
                        for (sya syaVar : list) {
                            dy dyVarLt2 = syaVar.lt();
                            if (dyVarLt2 != null) {
                                dyVarLt2.toString();
                                syaVar.fby();
                                dyVarLt2.ycx(eaVar);
                            }
                        }
                        list.clear();
                        mapJw.remove(strUh);
                    } finally {
                    }
                }
            }
            uh uhVar2 = this.f24025zb;
            if (uhVar2 != null) {
                uhVar2.zb("success", this.ycx);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pVw==", "a88KpwavfMuUadZRgBOhK1A=", "VOAegAC/bNST", 57);
        }
    }

    public void ycx(int i5, String str, Throwable th2) {
        try {
            uh uhVar = this.f24025zb;
            if (uhVar != null) {
                uhVar.ycx("failed", this.ycx);
            }
            String strUh = this.ycx.uh();
            Map<String, List<sya>> mapJw = this.ycx.dy().jw();
            List<sya> list = mapJw.get(strUh);
            if (list == null) {
                dy dyVarLt = this.ycx.lt();
                if (dyVarLt != null) {
                    dyVarLt.ycx(i5, str, th2);
                }
            } else {
                synchronized (list) {
                    try {
                        Iterator<sya> it = list.iterator();
                        while (it.hasNext()) {
                            dy dyVarLt2 = it.next().lt();
                            if (dyVarLt2 != null) {
                                dyVarLt2.toString();
                                dyVarLt2.ycx(i5, str, th2);
                            }
                        }
                        list.clear();
                        mapJw.remove(strUh);
                    } finally {
                    }
                }
            }
            uh uhVar2 = this.f24025zb;
            if (uhVar2 != null) {
                uhVar2.zb("failed", this.ycx);
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pVw==", "a88KpwavfMuUadZRgBOhK1A=", "VOALlAqwbMM=", 94);
        }
    }
}
