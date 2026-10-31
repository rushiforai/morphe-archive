package com.bytedance.adsdk.zb.sya.sya;

import a2.c;
import com.bytedance.adsdk.zb.sya.ycx.ea;
import com.bytedance.adsdk.zb.sya.ycx.ok;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Locale;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    private final long f22973dj;

    /* renamed from: dv, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.lud.jc f22974dv;

    /* renamed from: dy, reason: collision with root package name */
    private final float f22975dy;

    /* renamed from: ea, reason: collision with root package name */
    private final int f22976ea;
    private final List<com.bytedance.adsdk.zb.sya.zb.fby> fby;
    private final List<com.bytedance.adsdk.zb.ul.ycx<Float>> htf;

    /* renamed from: jc, reason: collision with root package name */
    private final int f22977jc;

    /* renamed from: jw, reason: collision with root package name */
    private final ok f22978jw;

    /* renamed from: lt, reason: collision with root package name */
    private final long f22979lt;
    private final ycx lud;

    /* renamed from: ok, reason: collision with root package name */
    private final int f22980ok;
    private final ea pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final float f22981ry;
    private final String sya;
    private final float syc;
    private final zb thx;

    /* renamed from: tn, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.ycx f22982tn;

    /* renamed from: uh, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f22983uh;

    /* renamed from: ul, reason: collision with root package name */
    private final String f22984ul;
    private final com.bytedance.adsdk.zb.sya.ycx.jc wie;
    private final boolean wwx;
    private final float xkz;
    private final List<com.bytedance.adsdk.zb.sya.zb.sya> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ul f22985zb;

    public enum ycx {
        PRE_COMP,
        SOLID,
        IMAGE,
        NULL,
        SHAPE,
        TEXT,
        UNKNOWN
    }

    public enum zb {
        NONE,
        ADD,
        INVERT,
        LUMA,
        LUMA_INVERTED,
        UNKNOWN
    }

    public lud(List<com.bytedance.adsdk.zb.sya.zb.sya> list, com.bytedance.adsdk.zb.ul ulVar, String str, long j11, ycx ycxVar, long j12, String str2, List<com.bytedance.adsdk.zb.sya.zb.fby> list2, ok okVar, int i5, int i11, int i12, float f11, float f12, float f13, float f14, com.bytedance.adsdk.zb.sya.ycx.jc jcVar, ea eaVar, List<com.bytedance.adsdk.zb.ul.ycx<Float>> list3, zb zbVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2, boolean z11, com.bytedance.adsdk.zb.sya.zb.ycx ycxVar2, com.bytedance.adsdk.zb.lud.jc jcVar2) {
        this.ycx = list;
        this.f22985zb = ulVar;
        this.sya = str;
        this.f22973dj = j11;
        this.lud = ycxVar;
        this.f22979lt = j12;
        this.f22984ul = str2;
        this.fby = list2;
        this.f22978jw = okVar;
        this.f22977jc = i5;
        this.f22976ea = i11;
        this.f22980ok = i12;
        this.f22981ry = f11;
        this.xkz = f12;
        this.syc = f13;
        this.f22975dy = f14;
        this.wie = jcVar;
        this.pmi = eaVar;
        this.htf = list3;
        this.thx = zbVar;
        this.f22983uh = zbVar2;
        this.wwx = z11;
        this.f22982tn = ycxVar2;
        this.f22974dv = jcVar2;
    }

    public List<com.bytedance.adsdk.zb.ul.ycx<Float>> dj() {
        return this.htf;
    }

    public com.bytedance.adsdk.zb.lud.jc dv() {
        return this.f22974dv;
    }

    public int dy() {
        return this.f22980ok;
    }

    public ycx ea() {
        return this.lud;
    }

    public float fby() {
        return this.syc;
    }

    public ea htf() {
        return this.pmi;
    }

    public List<com.bytedance.adsdk.zb.sya.zb.fby> jc() {
        return this.fby;
    }

    public float jw() {
        return this.f22975dy;
    }

    public String lt() {
        return this.sya;
    }

    public long lud() {
        return this.f22973dj;
    }

    public zb ok() {
        return this.thx;
    }

    public int pmi() {
        return this.f22977jc;
    }

    public long ry() {
        return this.f22979lt;
    }

    public float sya() {
        return this.xkz / this.f22985zb.wie();
    }

    public ok syc() {
        return this.f22978jw;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb thx() {
        return this.f22983uh;
    }

    public com.bytedance.adsdk.zb.sya.zb.ycx tn() {
        return this.f22982tn;
    }

    public String toString() {
        return ycx(b.f42142b);
    }

    public com.bytedance.adsdk.zb.sya.ycx.jc uh() {
        return this.wie;
    }

    public String ul() {
        return this.f22984ul;
    }

    public int wie() {
        return this.f22976ea;
    }

    public boolean wwx() {
        return this.wwx;
    }

    public List<com.bytedance.adsdk.zb.sya.zb.sya> xkz() {
        return this.ycx;
    }

    public String ycx(String str) {
        StringBuilder sbQ = c.q(str);
        sbQ.append(lt());
        sbQ.append("\n");
        lud ludVarYcx = this.f22985zb.ycx(ry());
        if (ludVarYcx != null) {
            sbQ.append("\t\tParents: ");
            sbQ.append(ludVarYcx.lt());
            lud ludVarYcx2 = this.f22985zb.ycx(ludVarYcx.ry());
            while (ludVarYcx2 != null) {
                sbQ.append("->");
                sbQ.append(ludVarYcx2.lt());
                ludVarYcx2 = this.f22985zb.ycx(ludVarYcx2.ry());
            }
            sbQ.append(str);
            sbQ.append("\n");
        }
        if (!jc().isEmpty()) {
            sbQ.append(str);
            sbQ.append("\tMasks: ");
            sbQ.append(jc().size());
            sbQ.append("\n");
        }
        if (pmi() != 0 && wie() != 0) {
            sbQ.append(str);
            sbQ.append("\tBackground: ");
            sbQ.append(String.format(Locale.US, "%dx%d %X\n", Integer.valueOf(pmi()), Integer.valueOf(wie()), Integer.valueOf(dy())));
        }
        if (!this.ycx.isEmpty()) {
            sbQ.append(str);
            sbQ.append("\tShapes:\n");
            for (com.bytedance.adsdk.zb.sya.zb.sya syaVar : this.ycx) {
                sbQ.append(str);
                sbQ.append("\t\t");
                sbQ.append(syaVar);
                sbQ.append("\n");
            }
        }
        return sbQ.toString();
    }

    public float zb() {
        return this.f22981ry;
    }

    public com.bytedance.adsdk.zb.ul ycx() {
        return this.f22985zb;
    }
}
