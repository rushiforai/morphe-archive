package com.bytedance.sdk.component.adexpress.dynamic.lud;

import a2.c;
import android.text.TextUtils;
import com.bytedance.sdk.component.adexpress.dynamic.lud.zb;
import com.bytedance.sdk.component.adexpress.zb.ry;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    private ycx f23440dj;
    private com.bytedance.sdk.component.adexpress.dynamic.dj.fby sya;
    public com.bytedance.sdk.component.adexpress.dynamic.dj.zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected zb f23441zb;

    public static class ycx {
        float sya;
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        float f23442zb;
    }

    public lud(double d5, int i5, double d11, String str, ry ryVar) {
        this.f23441zb = new zb(d5, i5, d11, str, ryVar);
    }

    public void ycx(ycx ycxVar) {
        this.f23440dj = ycxVar;
    }

    public void ycx() {
        this.f23441zb.ycx();
    }

    public void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        if (fbyVar != null) {
            this.sya = fbyVar;
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2 = this.sya;
        float fFby = fbyVar2.fby();
        float fJw = fbyVar2.jw();
        float f13 = TextUtils.equals(fbyVar2.jc().lud().tru(), "fixed") ? fJw : 65536.0f;
        this.f23441zb.ycx();
        this.f23441zb.sya(fbyVar2, fFby, f13);
        zb.sya syaVarYcx = this.f23441zb.ycx(fbyVar2);
        com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.zb();
        zbVar.ycx = f11;
        zbVar.f23390zb = f12;
        if (syaVarYcx != null) {
            fFby = syaVarYcx.ycx;
        }
        zbVar.sya = fFby;
        if (syaVarYcx != null) {
            fJw = syaVarYcx.f23449zb;
        }
        zbVar.f23385dj = fJw;
        zbVar.lud = "root";
        zbVar.f23387jw = 1280.0f;
        zbVar.f23388lt = fbyVar2;
        fbyVar2.sya(f11);
        zbVar.f23388lt.dj(zbVar.f23390zb);
        zbVar.f23388lt.lud(zbVar.sya);
        zbVar.f23388lt.lt(zbVar.f23385dj);
        com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVarYcx = ycx(zbVar, 0.0f);
        this.ycx = zbVarYcx;
        ycx(zbVarYcx);
    }

    public void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar) {
        if (zbVar == null) {
            return;
        }
        zbVar.f23388lt.jc().zb();
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.zb>> list = zbVar.f23389ul;
        if (list == null || list.size() <= 0) {
            return;
        }
        for (List<com.bytedance.sdk.component.adexpress.dynamic.dj.zb> list2 : list) {
            if (list2 != null && list2.size() > 0) {
                Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.zb> it = list2.iterator();
                while (it.hasNext()) {
                    ycx(it.next());
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:144:0x0340  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.sdk.component.adexpress.dynamic.dj.zb ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar, float f11) {
        float fYcx;
        float fYcx2;
        int i5;
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> list;
        float fYcx3;
        float fYcx4;
        float f12;
        String str;
        com.bytedance.sdk.component.adexpress.dynamic.dj.jw jwVarYcx;
        float f13;
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = zbVar.f23388lt;
        if (fbyVar != null) {
            fbyVar.thx();
            List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie = fbyVar.wie();
            if (listWie != null && listWie.size() > 0) {
                com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
                float fWie = ltVarLud.wie();
                float fDy = ltVarLud.dy();
                float fXkz = ltVarLud.xkz();
                float fSyc = ltVarLud.syc();
                float fOk = ltVarLud.ok();
                String strNji = ltVarLud.nji();
                String strDc = ltVarLud.dc();
                float f14 = zbVar.ycx + fSyc;
                float f15 = zbVar.f23390zb + fWie;
                float f16 = (zbVar.sya - fSyc) - fDy;
                float f17 = 2.0f;
                float f18 = fOk * 2.0f;
                float f19 = f16 - f18;
                float f21 = ((zbVar.f23385dj - fWie) - fXkz) - f18;
                com.bytedance.sdk.component.adexpress.dynamic.dj.jw jwVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.jw(f14, f15);
                if (zbVar.f23389ul == null) {
                    zbVar.f23389ul = new ArrayList();
                }
                Iterator<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> it = listWie.iterator();
                float f22 = 0.0f;
                while (it.hasNext()) {
                    float f23 = f17;
                    zb.sya syaVarYcx = this.f23441zb.ycx(it.next());
                    if (syaVarYcx != null) {
                        f22 += syaVarYcx.f23449zb;
                    }
                    f17 = f23;
                }
                float f24 = f17;
                String str2 = "space-between";
                String str3 = "space-around";
                int i11 = 1;
                if (f22 < f21) {
                    if (TextUtils.equals(strDc, "center")) {
                        fYcx2 = (f21 - f22) / f24;
                    } else if (TextUtils.equals(strDc, "flex-end")) {
                        fYcx2 = f21 - f22;
                    } else if (TextUtils.equals(strDc, "space-around")) {
                        fYcx2 = jc.ycx((f21 - f22) / (listWie.size() + 1));
                        fYcx = fYcx2;
                        jwVar.f23317zb += fYcx2;
                        float f25 = f11;
                        i5 = 0;
                        while (i5 < listWie.size()) {
                        }
                    } else {
                        if (TextUtils.equals(strDc, "space-between") && listWie.size() > 1) {
                            fYcx = jc.ycx((f21 - f22) / (listWie.size() - 1));
                        }
                        fYcx2 = 0.0f;
                        jwVar.f23317zb += fYcx2;
                        float f252 = f11;
                        i5 = 0;
                        while (i5 < listWie.size()) {
                        }
                    }
                    fYcx = 0.0f;
                    jwVar.f23317zb += fYcx2;
                    float f2522 = f11;
                    i5 = 0;
                    while (i5 < listWie.size()) {
                    }
                } else {
                    fYcx = 0.0f;
                    fYcx2 = 0.0f;
                    jwVar.f23317zb += fYcx2;
                    float f25222 = f11;
                    i5 = 0;
                    while (i5 < listWie.size()) {
                        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list2 = listWie.get(i5);
                        i5++;
                        int i12 = i11;
                        if (i5 >= zbVar.f23389ul.size()) {
                            list = listWie;
                            int i13 = 0;
                            for (int size = (i5 - zbVar.f23389ul.size()) + 1; i13 < size; size = size) {
                                zbVar.f23389ul.add(new ArrayList());
                                i13++;
                            }
                        } else {
                            list = listWie;
                        }
                        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it2 = list2.iterator();
                        float f26 = 0.0f;
                        while (true) {
                            Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it3 = it2;
                            if (!it2.hasNext()) {
                                break;
                            }
                            com.bytedance.sdk.component.adexpress.dynamic.dj.fby next = it3.next();
                            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud2 = next.jc().lud();
                            float f27 = f26;
                            String strBhi = ltVarLud2.bhi();
                            float f28 = fYcx;
                            int iUi = ltVarLud2.ui();
                            float f29 = f25222;
                            if (TextUtils.equals(strBhi, "flex") || iUi == i12 || iUi == 2) {
                                it2 = it3;
                                f25222 = f29;
                                f26 = f27;
                            } else {
                                zb.sya syaVarYcx2 = this.f23441zb.ycx(next);
                                f26 = syaVarYcx2 != null ? f27 + syaVarYcx2.ycx : f27;
                                it2 = it3;
                                f25222 = f29;
                            }
                            fYcx = f28;
                            i12 = 1;
                        }
                        float f31 = fYcx;
                        float f32 = f25222;
                        float fMax = Math.max(f19 - f26, 0.0f);
                        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it4 = list2.iterator();
                        float f33 = 0.0f;
                        while (it4.hasNext()) {
                            com.bytedance.sdk.component.adexpress.dynamic.dj.fby next2 = it4.next();
                            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud3 = next2.jc().lud();
                            Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it5 = it4;
                            float f34 = f33;
                            if (ltVarLud3.ui() == 1 || ltVarLud3.ui() == 2) {
                                it4 = it5;
                                f33 = f34;
                            } else {
                                zb.sya syaVarYcx3 = this.f23441zb.ycx(next2);
                                f33 = syaVarYcx3 != null ? f34 + syaVarYcx3.ycx : f34;
                                it4 = it5;
                            }
                        }
                        float f35 = f33;
                        if (f35 >= f19) {
                            fYcx3 = 0.0f;
                            fYcx4 = 0.0f;
                        } else {
                            if (TextUtils.equals(strNji, "center")) {
                                fYcx3 = (f19 - f35) / f24;
                            } else if (TextUtils.equals(strNji, "flex-end")) {
                                fYcx3 = f19 - f35;
                            } else if (TextUtils.equals(strNji, str3)) {
                                fYcx3 = jc.ycx((f19 - f35) / (list2.size() + 1));
                                fYcx4 = fYcx3;
                            } else {
                                if (TextUtils.equals(strNji, str2) && list2.size() > 1) {
                                    fYcx4 = jc.ycx((f19 - f35) / (list2.size() - 1.0f));
                                    fYcx3 = 0.0f;
                                }
                                fYcx3 = 0.0f;
                            }
                            fYcx4 = 0.0f;
                        }
                        jwVar.ycx += fYcx3;
                        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it6 = list2.iterator();
                        float fMax2 = 0.0f;
                        while (it6.hasNext()) {
                            Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it7 = it6;
                            com.bytedance.sdk.component.adexpress.dynamic.dj.fby next3 = it6.next();
                            float f36 = fYcx4;
                            float f37 = this.f23441zb.ycx(next3) != null ? this.f23441zb.ycx(next3).f23449zb : 0.0f;
                            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud4 = next3.jc().lud();
                            fMax2 = Math.max(fMax2, (ltVarLud4.ui() == 1 || ltVarLud4.ui() == 2) ? 0.0f : f37);
                            it6 = it7;
                            fYcx4 = f36;
                        }
                        float f38 = fYcx4;
                        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it8 = list2.iterator();
                        while (it8.hasNext()) {
                            com.bytedance.sdk.component.adexpress.dynamic.dj.fby next4 = it8.next();
                            Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it9 = it8;
                            zb.sya syaVarYcx4 = this.f23441zb.ycx(next4);
                            String str4 = str2;
                            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud5 = next4.jc().lud();
                            String str5 = strNji;
                            float fXym = ltVarLud5.xym();
                            float fBba = ltVarLud5.bba();
                            float fRl = ltVarLud5.rl();
                            float fZr = ltVarLud5.zr();
                            float f39 = syaVarYcx4 == null ? 0.0f : syaVarYcx4.ycx;
                            float f40 = syaVarYcx4 == null ? 0.0f : syaVarYcx4.f23449zb;
                            float f41 = f39;
                            float f42 = TextUtils.equals(fbyVar.sya(), "root") ? i5 : f32;
                            float f43 = fMax2;
                            com.bytedance.sdk.component.adexpress.dynamic.dj.jw jwVarYcx2 = ltVarLud5.ui() == 1 ? ycx(zbVar, ltVarLud5, (f41 - fBba) - fZr, (f40 - fXym) - fRl) : jwVar;
                            if (ltVarLud5.ui() == 2) {
                                f12 = f19;
                                str = str3;
                                jwVarYcx = ycx(ltVarLud5, this.f23441zb.ycx(this.sya), new zb.sya((f41 - fBba) - fZr, (f40 - fXym) - fRl));
                            } else {
                                f12 = f19;
                                str = str3;
                                jwVarYcx = jwVarYcx2;
                            }
                            String strWk = ltVarLud.wk();
                            if (f43 <= f40 || TextUtils.equals(strWk, "flex-start")) {
                                f13 = 0.0f;
                            } else {
                                strWk.getClass();
                                if (strWk.equals("center")) {
                                    f13 = (f43 - f40) / f24;
                                } else if (strWk.equals("flex-end")) {
                                    f13 = f43 - f40;
                                }
                            }
                            com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar2 = new com.bytedance.sdk.component.adexpress.dynamic.dj.zb();
                            zbVar2.ycx = jwVarYcx.ycx + fZr;
                            zbVar2.f23390zb = jwVarYcx.f23317zb + fXym + f13;
                            zbVar2.sya = (f41 - fBba) - fZr;
                            zbVar2.f23385dj = (f40 - fXym) - fRl;
                            zbVar2.lud = zbVar.lud + "." + next4.sya();
                            zbVar2.fby = zbVar;
                            zbVar2.f23388lt = next4;
                            zbVar2.f23387jw = fMax;
                            zbVar2.f23386jc = list2;
                            next4.sya(zbVar2.ycx);
                            zbVar2.f23388lt.dj(zbVar2.f23390zb);
                            zbVar2.f23388lt.lud(zbVar2.sya);
                            zbVar2.f23388lt.lt(zbVar2.f23385dj);
                            zbVar.f23389ul.get(i5).add(ycx(zbVar2, f42));
                            if (ltVarLud5.ui() != 1 && ltVarLud5.ui() != 2) {
                                jwVar.ycx = f41 + f38 + jwVar.ycx;
                            }
                            f32 = f42;
                            strNji = str5;
                            str2 = str4;
                            fMax2 = f43;
                            f19 = f12;
                            str3 = str;
                            it8 = it9;
                        }
                        jwVar.ycx = f14;
                        jwVar.f23317zb = fMax2 + f31 + jwVar.f23317zb;
                        i11 = 1;
                        listWie = list;
                        f25222 = f32;
                        fYcx = f31;
                    }
                }
            }
        }
        return zbVar;
    }

    private com.bytedance.sdk.component.adexpress.dynamic.dj.jw ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVar, zb.sya syaVar, zb.sya syaVar2) {
        float fXf = ltVar.xf();
        float fUfy = ltVar.ufy();
        float fTx = ltVar.tx();
        float fNzi = ltVar.nzi();
        boolean zIq = ltVar.iq();
        boolean zDqs = ltVar.dqs();
        boolean zUr = ltVar.ur();
        boolean zWr = ltVar.wr();
        if (!zIq) {
            if (zDqs) {
                float f11 = this.f23440dj.ycx;
                fXf = ((f11 != 0.0f ? Math.min(f11, syaVar.ycx) : syaVar.ycx) - fTx) - syaVar2.ycx;
            } else {
                fXf = 0.0f;
            }
        }
        if (!zUr) {
            if (zWr) {
                float f12 = this.f23440dj.f23442zb;
                if (f12 == 0.0f) {
                    f12 = syaVar.f23449zb;
                }
                fUfy = (f12 - fNzi) - syaVar2.f23449zb;
            } else {
                fUfy = 0.0f;
            }
        }
        return new com.bytedance.sdk.component.adexpress.dynamic.dj.jw(fXf, fUfy);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x009b A[PHI: r4
      0x009b: PHI (r4v3 float) = (r4v0 float), (r4v5 float) binds: [B:31:0x00a4, B:27:0x0092] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.jw ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar, com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVar, float f11, float f12) {
        float fZ;
        float f13;
        float f14;
        float f15 = zbVar.ycx;
        float fZ2 = zbVar.f23390zb;
        float fXf = ltVar.xf();
        float fUfy = ltVar.ufy();
        float fTx = ltVar.tx();
        float fNzi = ltVar.nzi();
        boolean zIq = ltVar.iq();
        boolean zDqs = ltVar.dqs();
        boolean zUr = ltVar.ur();
        boolean zWr = ltVar.wr();
        String strHpv = ltVar.hpv();
        float f16 = zbVar.sya;
        float f17 = zbVar.f23385dj;
        if (TextUtils.equals(strHpv, "0")) {
            if (zIq) {
                fZ = zbVar.ycx + fXf;
            } else {
                fZ = zDqs ? ((zbVar.ycx + f16) - fTx) - f11 : f15;
            }
            if (zUr) {
                f14 = zbVar.f23390zb;
                fZ2 = f14 + fUfy;
            } else if (zWr) {
                f13 = zbVar.f23390zb;
                fZ2 = ((f13 + f17) - fNzi) - f12;
            }
        } else if (TextUtils.equals(strHpv, "1")) {
            fZ = c.z(f16, f11, 2.0f, zbVar.ycx);
            if (zUr) {
                f14 = zbVar.f23390zb;
                fZ2 = f14 + fUfy;
            } else if (zWr) {
                f13 = zbVar.f23390zb;
                fZ2 = ((f13 + f17) - fNzi) - f12;
            }
        } else if (TextUtils.equals(strHpv, "2")) {
            fZ2 = c.z(f17, f12, 2.0f, zbVar.f23390zb);
            if (zIq) {
                fZ = zbVar.ycx + fXf;
            } else {
                fZ = zDqs ? ((zbVar.ycx + f16) - fTx) - f11 : f15;
            }
        } else if (TextUtils.equals(strHpv, "3")) {
            float fZ3 = c.z(f16, f11, 2.0f, zbVar.ycx);
            fZ2 = c.z(f17, f12, 2.0f, zbVar.f23390zb);
            fZ = fZ3;
        }
        return new com.bytedance.sdk.component.adexpress.dynamic.dj.jw(fZ, fZ2);
    }
}
