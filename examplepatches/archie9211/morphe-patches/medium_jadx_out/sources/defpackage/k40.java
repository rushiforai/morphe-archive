package defpackage;

import android.app.Dialog;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.Window;
import androidx.cardview.widget.CardView;
import androidx.navigation.fragment.NavHostFragment;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import com.medium.reader.R;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class k40 {
    public static final n92[] a = new n92[0];
    public static final mz1 b = new mz1(new e02(7), false, 1317579821);
    public static final mz1 c = new mz1(new yz1(27), false, -1923011521);
    public static final mz1 d = new mz1(new yz1(28), false, -165384383);
    public static final mz1 e = new mz1(new a02(17), false, 947200453);
    public static final mz1 f = new mz1(new a02(18), false, -321469626);
    public static final mz1 g = new mz1(new j02(27), false, -539096886);
    public static final mz1 h = new mz1(new u02(15), false, -909436038);
    public static final mz1 i = new mz1(new u02(16), false, 1784664007);
    public static final mt6[] j = new mt6[0];
    public static final StackTraceElement[] k = new StackTraceElement[0];
    public static final d1g l = new d1g(16, "NO_VALUE", false);
    public static final tjd m = new tjd(7);
    public static final no3 n = new no3(27);
    public static final /* synthetic */ int o = 0;
    public static final /* synthetic */ int p = 0;

    public static final void A(String str, String str2, String str3, int i2, r28 r28Var, x45 x45Var, x12 x12Var, int i3) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1841279664);
        int i4 = i3 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(str3) ? 256 : 128) | 24576 | (p65Var2.h(x45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var2.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(flb.a0(o28Var, j2, nr5Var), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            zq0 zq0Var = z46.n;
            qmb qmbVar = qmb.a;
            r28 r28VarA = qmbVar.a(0.65f, qmbVar.b(o28Var, zq0Var), true);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarA);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            sn3 sn3Var2 = jt7.c;
            flb.D(str, jfc.d(o28Var, 1.0f), mkd.a(((bu7) p65Var2.j(sn3Var2)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), null, 2, false, 1, 0, null, new oh0(en7.B(9), ((bu7) p65Var2.j(sn3Var2)).m.a.b, en7.A(0.25d)), p65Var2, (i4 & 14) | 1597488, 424);
            hp7.t(p65Var2, jfc.l(o28Var, 4.0f));
            jjd.b(str3, jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).o, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, ((i4 >> 6) & 14) | 48, 0, 131068);
            p65Var2.p(true);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(str2);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            akc akcVar = (akc) p65Var2.j(z22.r);
            lr4 lr4Var = (lr4) p65Var2.j(z22.i);
            String str4 = (String) l78Var.getValue();
            sk6 sk6Var = sk6.f;
            sk6 sk6VarA = sk6.a(0, i2, 7, 115);
            boolean zH = p65Var2.h(lr4Var) | ((i4 & 458752) == 131072) | p65Var2.f(akcVar);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                objM2 = new iu(x45Var, lr4Var, akcVar, l78Var);
                p65Var2.j0(objM2);
            }
            pk6 pk6Var = new pk6((x45) objM2, null, null, 62);
            r28 r28VarA2 = qmbVar.a(0.35f, w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), true);
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new ws(l78Var, 8);
                p65Var2.j0(objM3);
            }
            d46.n(str4, (x45) objM3, r28VarA2, false, true, null, 1, sk6VarA, pk6Var, null, null, null, null, null, null, null, 6, p65Var2, 12779568, 0, 130136);
            p65Var = p65Var2;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(str, str2, str3, i2, r28Var2, x45Var, i3);
        }
    }

    public static boolean A0(xwd xwdVar) {
        xwdVar.getClass();
        if (xwdVar instanceof xwd) {
            return xwdVar.c();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(xwdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, xwdVar.getClass(), sb));
        return false;
    }

    public static final void B(dsd dsdVar, bsd bsdVar, Object obj, Object obj2, tj4 tj4Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(867041821);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dsdVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(bsdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= (i2 & 512) == 0 ? p65Var.f(obj) : p65Var.h(obj) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= (i2 & 4096) == 0 ? p65Var.f(obj2) : p65Var.h(obj2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= (32768 & i2) == 0 ? p65Var.f(tj4Var) : p65Var.h(tj4Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (!p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.S();
        } else if (dsdVar.g()) {
            bsdVar.g(obj, obj2, tj4Var);
        } else {
            bsdVar.h(obj2, tj4Var);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(dsdVar, bsdVar, obj, obj2, tj4Var, i2, 18);
        }
    }

    public static void B0(hkb hkbVar) {
        hkbVar.getClass();
        if (hkbVar instanceof hec) {
            return;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
    }

    public static final void C(lm4 lm4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(531423644);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(lm4Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u("");
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            long j2 = ((zo7) p65Var.j(kt7.b)).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(flb.a0(o28Var, j2, nr5Var), 1.0f), 48.0f, 0.0f, 2), 24.0f, 16.0f, 24.0f, 16.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String str = (String) l78Var.getValue();
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 0.0f, 0.0f, 8.0f, 0.0f, 11).b(new qse(z46.n)), true);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ws(l78Var, 9);
                p65Var.j0(objM2);
            }
            d46.n(str, (x45) objM2, r28VarU, false, true, null, 1, null, null, "Variant name", null, "Enter the variant name", null, null, null, null, 0, p65Var, 12779568, 390, 256856);
            p65Var = p65Var;
            c(g56.c.a(new vj3(Float.NaN)), pxf.E(-1409903424, new hm4(lm4Var, 0, l78Var), p65Var), p65Var, 56);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(lm4Var, r28Var2, i2, 13);
        }
    }

    public static void C0(hkb hkbVar) {
        if (hkbVar instanceof hec) {
            return;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
    }

    public static final void D(rm4 rm4Var, r28 r28Var, lm4 lm4Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(106680238);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(rm4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.f(lm4Var) ? 256 : 128;
        }
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var2.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(flb.a0(o28Var, j2, nr5Var), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String str = rm4Var.a;
            sn3 sn3Var2 = jt7.c;
            mkd mkdVarA = mkd.a(((bu7) p65Var2.j(sn3Var2)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            r28 r28VarG = w2g.G(o28Var, 0.0f, 0.0f, 8.0f, 0.0f, 11);
            zq0 zq0Var = z46.n;
            r28 r28VarB = r28VarG.b(new qse(zq0Var));
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            jjd.b(str, r28VarB.b(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true)), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var2, 0, 24960, 110588);
            p65Var = p65Var2;
            if (rm4Var.b) {
                p65Var.Y(-320397174);
                jjd.b("(Autogenerated)", new qse(zq0Var), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).o, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 6, 24576, 114684);
                p65Var = p65Var;
                p65Var.p(false);
            } else {
                p65Var.Y(-320074278);
                c(g56.c.a(new vj3(Float.NaN)), pxf.E(-1166524442, new hm4(lm4Var, 2, rm4Var), p65Var), p65Var, 56);
                p65Var.p(false);
            }
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 18, r28Var2, (Object) rm4Var, (Object) lm4Var);
        }
    }

    public static hec D0(zm4 zm4Var) {
        if (zm4Var instanceof zm4) {
            return zm4Var.b;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(zm4Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, zm4Var.getClass(), sb));
        return null;
    }

    public static boolean E(awd awdVar, awd awdVar2) {
        awdVar.getClass();
        awdVar2.getClass();
        if (!(awdVar instanceof zvd)) {
            StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
            sb.append(awdVar);
            sb.append(", ");
            ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
            return false;
        }
        if (awdVar2 instanceof zvd) {
            return awdVar.equals(awdVar2);
        }
        StringBuilder sb2 = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb2.append(awdVar2);
        sb2.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar2.getClass(), sb2));
        return false;
    }

    public static o3e E0(p61 p61Var) {
        if (p61Var instanceof ve8) {
            return ((ve8) p61Var).d;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(p61Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, p61Var.getClass(), sb));
        return null;
    }

    public static int F(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return ((mn6) qn6Var).h0().size();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return 0;
    }

    public static o3e F0(qn6 qn6Var) {
        if (qn6Var instanceof o3e) {
            return gq7.I((o3e) qn6Var);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static tvd G(hkb hkbVar) {
        hkbVar.getClass();
        if (hkbVar instanceof hec) {
            return (tvd) hkbVar;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static int G0(awd awdVar) {
        if (awdVar instanceof zvd) {
            return ((zvd) awdVar).getParameters().size();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return 0;
    }

    public static p61 H(bo1 bo1Var, jec jecVar) {
        if (jecVar instanceof hec) {
            if (jecVar instanceof lec) {
                return bo1Var.U(((lec) jecVar).b);
            }
            if (jecVar instanceof ve8) {
                return (ve8) jecVar;
            }
            return null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(jecVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, jecVar.getClass(), sb));
        return null;
    }

    public static Collection H0(bo1 bo1Var, hkb hkbVar) {
        zvd zvdVarL = bo1Var.L(hkbVar);
        if (zvdVarL instanceof x46) {
            return ((x46) zvdVarL).a;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static v33 I(hkb hkbVar) {
        hkbVar.getClass();
        if (hkbVar instanceof hec) {
            if (hkbVar instanceof v33) {
                return (v33) hkbVar;
            }
            return null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static xwd I0(m61 m61Var) {
        if (m61Var instanceof we8) {
            return ((we8) m61Var).a;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(m61Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, m61Var.getClass(), sb));
        return null;
    }

    public static zm4 J(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            o3e o3eVarM0 = ((mn6) qn6Var).m0();
            if (o3eVarM0 instanceof zm4) {
                return (zm4) o3eVarM0;
            }
            return null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static final synchronized f89 J0() {
        f89 f89Var;
        ClassNotFoundException e2;
        IOException e3;
        String str;
        Context contextA = f94.a();
        f89 f89Var2 = null;
        try {
            try {
                FileInputStream fileInputStreamOpenFileInput = contextA.openFileInput("AppEventsLogger.persistedevents");
                fileInputStreamOpenFileInput.getClass();
                j40 j40Var = new j40(new BufferedInputStream(fileInputStreamOpenFileInput));
                try {
                    Object object = j40Var.readObject();
                    object.getClass();
                    f89Var = (f89) object;
                    try {
                        j40Var.close();
                        try {
                            contextA.getFileStreamPath("AppEventsLogger.persistedevents").delete();
                        } catch (Exception e4) {
                            e = e4;
                            str = "k40";
                            Log.w(str, "Got unexpected exception when removing events file: ", e);
                        }
                    } catch (FileNotFoundException unused) {
                        f89Var2 = f89Var;
                        f89Var = f89Var2;
                    } catch (IOException e5) {
                        e3 = e5;
                        Log.w("k40", "Got unexpected exception while reading events: ", e3);
                        try {
                            contextA.getFileStreamPath("AppEventsLogger.persistedevents").delete();
                        } catch (Exception e6) {
                            e = e6;
                            str = "k40";
                            Log.w(str, "Got unexpected exception when removing events file: ", e);
                        }
                    } catch (ClassNotFoundException e7) {
                        e2 = e7;
                        Log.w("k40", "Got unexpected exception while reading events: ", e2);
                        try {
                            contextA.getFileStreamPath("AppEventsLogger.persistedevents").delete();
                        } catch (Exception e8) {
                            e = e8;
                            str = "k40";
                            Log.w(str, "Got unexpected exception when removing events file: ", e);
                        }
                    }
                } finally {
                }
            } finally {
                try {
                    contextA.getFileStreamPath("AppEventsLogger.persistedevents").delete();
                } catch (Exception e9) {
                    Log.w("k40", "Got unexpected exception when removing events file: ", e9);
                }
            }
        } catch (FileNotFoundException unused2) {
        } catch (IOException e10) {
            f89Var = null;
            e3 = e10;
        } catch (ClassNotFoundException e11) {
            f89Var = null;
            e2 = e11;
        }
        if (f89Var == null) {
            f89Var = new f89();
        }
        return f89Var;
    }

    public static final vtc K(kw2 kw2Var) {
        kw2Var.getClass();
        vtc vtcVar = kw2Var instanceof vtc ? (vtc) kw2Var : null;
        if (vtcVar != null) {
            return vtcVar;
        }
        ygf.f(ka1.p(n1b.a, kw2Var.getClass(), new StringBuilder("This serializer can be used only with Json format.Expected Decoder to be JsonDecoder, got ")));
        return null;
    }

    public static final dsd K0(b2 b2Var, String str, x12 x12Var, int i2) {
        int i3 = (i2 & 14) ^ 6;
        int i4 = 1;
        boolean z = false;
        boolean z2 = (i3 > 4 && ((p65) x12Var).f(b2Var)) || (i2 & 6) == 4;
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        Object obj = w12.a;
        n92 n92Var = null;
        if (z2 || objM == obj) {
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                Object dsdVar = new dsd(b2Var, null, str);
                vn7.T(oicVarA, oicVarG, x45VarE);
                p65Var.j0(dsdVar);
                objM = dsdVar;
            } catch (Throwable th) {
                vn7.T(oicVarA, oicVarG, x45VarE);
                throw th;
            }
        }
        dsd dsdVar2 = (dsd) objM;
        if (b2Var instanceof hwb) {
            p65Var.Y(-1357590553);
            Object objM2 = p65Var.M();
            if (objM2 == obj) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            Object obj2 = (sb2) objM2;
            boolean zH = p65Var.h(obj2) | ((i3 > 4 && p65Var.f(b2Var)) || (i2 & 6) == 4);
            Object objM3 = p65Var.M();
            if (zH || objM3 == obj) {
                objM3 = new vrd(b2Var, obj2, z, 3);
                p65Var.j0(objM3);
            }
            kyd.h(obj2, (x45) objM3, p65Var);
            hwb hwbVar = (hwb) b2Var;
            Object value = hwbVar.d.getValue();
            Object value2 = hwbVar.c.getValue();
            boolean z3 = (i3 > 4 && p65Var.f(b2Var)) || (i2 & 6) == 4;
            Object objM4 = p65Var.M();
            if (z3 || objM4 == obj) {
                objM4 = new j5d(b2Var, n92Var, 5);
                p65Var.j0(objM4);
            }
            kyd.l(value, value2, (b55) objM4, p65Var);
            p65Var.p(false);
        } else {
            p65Var.Y(-1356604288);
            dsdVar2.a(b2Var.q0(), p65Var, 0);
            p65Var.p(false);
        }
        boolean zF = p65Var.f(dsdVar2);
        Object objM5 = p65Var.M();
        if (zF || objM5 == obj) {
            objM5 = new fsd(dsdVar2, i4);
            p65Var.j0(objM5);
        }
        kyd.h(dsdVar2, (x45) objM5, p65Var);
        return dsdVar2;
    }

    public static final void L(xtc xtcVar) {
        xtcVar.getClass();
        if ((xtcVar instanceof xtc ? xtcVar : null) != null) {
            return;
        }
        ygf.f(ka1.p(n1b.a, xtcVar.getClass(), new StringBuilder("This serializer can be used only with Json format.Expected Encoder to be JsonEncoder, got ")));
    }

    public static mn6 L0(ixd ixdVar, qn6 qn6Var) {
        ixdVar.getClass();
        qn6Var.getClass();
        if (qn6Var instanceof o3e) {
            return ixdVar.f((mn6) qn6Var, pqe.INVARIANT);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static hec M(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            o3e o3eVarM0 = ((mn6) qn6Var).m0();
            if (o3eVarM0 instanceof hec) {
                return (hec) o3eVarM0;
            }
            return null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static final void M0(f89 f89Var) {
        Context contextA = f94.a();
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(new BufferedOutputStream(contextA.openFileOutput("AppEventsLogger.persistedevents", 0)));
            try {
                objectOutputStream.writeObject(f89Var);
                objectOutputStream.close();
            } finally {
            }
        } catch (IOException e2) {
            Log.w("k40", "Got unexpected exception while persisting events: ", e2);
            try {
                contextA.getFileStreamPath("AppEventsLogger.persistedevents").delete();
            } catch (Exception unused) {
            }
        }
    }

    public static onc N(qn6 qn6Var) {
        if (qn6Var instanceof mn6) {
            return new onc((mn6) qn6Var);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static final void N0(Object[] objArr, long j2, Object obj) {
        objArr[((int) j2) & (objArr.length - 1)] = obj;
    }

    public static q90 O() throws InterruptedException {
        ad adVar = q90.h;
        q90 q90Var = ((q90[]) adVar.c)[1];
        if (q90Var == null) {
            long jNanoTime = System.nanoTime();
            q90.k.await(q90.l, TimeUnit.MILLISECONDS);
            if (((q90[]) adVar.c)[1] != null || System.nanoTime() - jNanoTime < q90.m) {
                return null;
            }
            return q90.i;
        }
        long jNanoTime2 = q90Var.g - System.nanoTime();
        if (jNanoTime2 > 0) {
            q90.k.await(jNanoTime2, TimeUnit.NANOSECONDS);
            return null;
        }
        adVar.v(q90Var);
        q90Var.e = 2;
        return q90Var;
    }

    public static void O0(lig ligVar, float f2) {
        float f3;
        float f4;
        xlb xlbVar = (xlb) ligVar.b;
        CardView cardView = (CardView) ligVar.c;
        boolean useCompatPadding = cardView.getUseCompatPadding();
        boolean preventCornerOverlap = cardView.getPreventCornerOverlap();
        if (f2 != xlbVar.e || xlbVar.f != useCompatPadding || xlbVar.g != preventCornerOverlap) {
            xlbVar.e = f2;
            xlbVar.f = useCompatPadding;
            xlbVar.g = preventCornerOverlap;
            xlbVar.b(null);
            xlbVar.invalidateSelf();
        }
        if (!cardView.getUseCompatPadding()) {
            ligVar.n0(0, 0, 0, 0);
            return;
        }
        xlb xlbVar2 = (xlb) ligVar.b;
        float f5 = xlbVar2.e;
        float f6 = xlbVar2.a;
        if (cardView.getPreventCornerOverlap()) {
            f3 = (float) (((1.0d - ylb.a) * ((double) f6)) + ((double) f5));
        } else {
            int i2 = ylb.b;
            f3 = f5;
        }
        int iCeil = (int) Math.ceil(f3);
        if (cardView.getPreventCornerOverlap()) {
            f4 = (float) (((1.0d - ylb.a) * ((double) f6)) + ((double) (f5 * 1.5f)));
        } else {
            f4 = f5 * 1.5f;
        }
        int iCeil2 = (int) Math.ceil(f4);
        ligVar.n0(iCeil, iCeil2, iCeil, iCeil2);
    }

    public static hec P(hkb hkbVar, i61 i61Var) {
        List listH0;
        ArrayList arrayList;
        rn6 rn6Var;
        i61 i61Var2;
        i61Var.getClass();
        n93 n93Var = null;
        if (!(hkbVar instanceof hec)) {
            StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
            sb.append(hkbVar);
            sb.append(", ");
            ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
            return null;
        }
        hec hecVar = (hec) hkbVar;
        if (hecVar.h0().size() == hecVar.j0().getParameters().size() && ((listH0 = hecVar.h0()) == null || !listH0.isEmpty())) {
            Iterator it2 = listH0.iterator();
            while (it2.hasNext()) {
                if (((xwd) it2.next()).a() != pqe.INVARIANT) {
                    List parameters = hecVar.j0().getParameters();
                    parameters.getClass();
                    ArrayList<f09> arrayListT1 = bu1.t1(parameters, listH0);
                    arrayList = new ArrayList(cu1.k0(arrayListT1, 10));
                    for (f09 f09Var : arrayListT1) {
                        xwd oncVar = (xwd) f09Var.a;
                        swd swdVar = (swd) f09Var.b;
                        if (oncVar.a() == pqe.INVARIANT) {
                            i61Var2 = i61Var;
                        } else {
                            o3e o3eVarM0 = (oncVar.c() || oncVar.a() != pqe.IN_VARIANCE) ? null : oncVar.b().m0();
                            swdVar.getClass();
                            i61Var2 = i61Var;
                            oncVar = new onc(new ve8(i61Var2, new we8(oncVar, n93Var, swdVar, 6), o3eVarM0, (uvd) null, false, 56));
                        }
                        arrayList.add(oncVar);
                        i61Var = i61Var2;
                    }
                    ixd ixdVar = new ixd(bwd.b.n(hecVar.j0(), arrayList));
                    int size = listH0.size();
                    for (int i2 = 0; i2 < size; i2++) {
                        xwd xwdVar = (xwd) listH0.get(i2);
                        xwd xwdVar2 = (xwd) arrayList.get(i2);
                        if (xwdVar.a() != pqe.INVARIANT) {
                            List upperBounds = ((swd) hecVar.j0().getParameters().get(i2)).getUpperBounds();
                            upperBounds.getClass();
                            ArrayList arrayList2 = new ArrayList();
                            Iterator it3 = upperBounds.iterator();
                            while (true) {
                                boolean zHasNext = it3.hasNext();
                                rn6Var = rn6.a;
                                if (!zHasNext) {
                                    break;
                                }
                                arrayList2.add(rn6Var.a(ixdVar.f((mn6) it3.next(), pqe.INVARIANT).m0()));
                            }
                            if (!xwdVar.c() && xwdVar.a() == pqe.OUT_VARIANCE) {
                                arrayList2.add(rn6Var.a(xwdVar.b().m0()));
                            }
                            mn6 mn6VarB = xwdVar2.b();
                            mn6VarB.getClass();
                            we8 we8Var = ((ve8) mn6VarB).c;
                            we8Var.getClass();
                            we8Var.b = new n93(2, arrayList2);
                        }
                    }
                }
            }
            arrayList = null;
        } else {
            arrayList = null;
        }
        if (arrayList != null) {
            return pwd.Y(hecVar.i0(), hecVar.j0(), arrayList, hecVar.k0());
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static ao1 P0(bo1 bo1Var, hkb hkbVar) {
        if (hkbVar instanceof hec) {
            mn6 mn6Var = (mn6) hkbVar;
            return new ao1(bo1Var, new ixd(bwd.b.n(mn6Var.j0(), mn6Var.h0())));
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static i61 Q(p61 p61Var) {
        if (p61Var instanceof ve8) {
            return ((ve8) p61Var).b;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(p61Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, p61Var.getClass(), sb));
        return null;
    }

    public static Collection Q0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            Collection collectionB = ((zvd) awdVar).b();
            collectionB.getClass();
            return collectionB;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return null;
    }

    public static final pc1 R(bo4 bo4Var, bo4 bo4Var2, bo4 bo4Var3, bo4 bo4Var4, bo4 bo4Var5, f55 f55Var) {
        return new pc1(new bo4[]{bo4Var, bo4Var2, bo4Var3, bo4Var4, bo4Var5}, 13, f55Var);
    }

    public static we8 R0(p61 p61Var) {
        if (p61Var instanceof ve8) {
            return ((ve8) p61Var).c;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(p61Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, p61Var.getClass(), sb));
        return null;
    }

    public static final pc1 S(bo4 bo4Var, bo4 bo4Var2, bo4 bo4Var3, bo4 bo4Var4, e55 e55Var) {
        return new pc1(new bo4[]{bo4Var, bo4Var2, bo4Var3, bo4Var4}, 12, e55Var);
    }

    public static zvd S0(hkb hkbVar) {
        hkbVar.getClass();
        if (hkbVar instanceof hec) {
            return ((hec) hkbVar).j0();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static final pc1 T(bo4 bo4Var, bo4 bo4Var2, bo4 bo4Var3, d55 d55Var) {
        return new pc1(new bo4[]{bo4Var, bo4Var2, bo4Var3}, 11, d55Var);
    }

    public static final dsd T0(Object obj, String str, x12 x12Var, int i2, int i3) {
        if ((i3 & 2) != 0) {
            str = null;
        }
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new dsd(new m78(obj), null, str);
            p65Var.j0(objM);
        }
        dsd dsdVar = (dsd) objM;
        dsdVar.a(obj, p65Var, (i2 & 8) | 48 | (i2 & 14));
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = new fsd(dsdVar, 0);
            p65Var.j0(objM2);
        }
        kyd.h(dsdVar, (x45) objM2, p65Var);
        return dsdVar;
    }

    public static final xrd U(dsd dsdVar, hud hudVar, String str, x12 x12Var, int i2, int i3) {
        wrd wrdVar;
        int i4 = 2;
        if ((i3 & 2) != 0) {
            str = "DeferredAnimation";
        }
        boolean zF = ((p65) x12Var).f(dsdVar);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            objM = new xrd(dsdVar, hudVar, str);
            p65Var.j0(objM);
        }
        xrd xrdVar = (xrd) objM;
        boolean zF2 = p65Var.f(dsdVar) | p65Var.h(xrdVar);
        Object objM2 = p65Var.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = new vrd(dsdVar, xrdVar, false, i4);
            p65Var.j0(objM2);
        }
        kyd.h(xrdVar, (x45) objM2, p65Var);
        if (dsdVar.g() && (wrdVar = (wrd) xrdVar.b.getValue()) != null) {
            dsd dsdVar2 = xrdVar.c;
            wrdVar.a.g(wrdVar.c.invoke(dsdVar2.f().a()), wrdVar.c.invoke(dsdVar2.f().c()), (tj4) wrdVar.b.invoke(dsdVar2.f()));
        }
        return xrdVar;
    }

    public static hec U0(zm4 zm4Var) {
        if (zm4Var instanceof zm4) {
            return zm4Var.c;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(zm4Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, zm4Var.getClass(), sb));
        return null;
    }

    public static o3e V(bo1 bo1Var, hkb hkbVar, hkb hkbVar2) {
        hkbVar.getClass();
        hkbVar2.getClass();
        if (!(hkbVar instanceof hec)) {
            StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
            sb.append(bo1Var);
            sb.append(", ");
            ywb.g(ka1.p(n1b.a, bo1Var.getClass(), sb));
            return null;
        }
        if (hkbVar2 instanceof hec) {
            return pwd.K((hec) hkbVar, (hec) hkbVar2);
        }
        StringBuilder sb2 = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb2.append(bo1Var);
        sb2.append(", ");
        ywb.g(ka1.p(n1b.a, bo1Var.getClass(), sb2));
        return null;
    }

    public static qn6 V0(bo1 bo1Var, qn6 qn6Var) {
        if (qn6Var instanceof hkb) {
            return bo1Var.e0((hkb) qn6Var);
        }
        if (qn6Var instanceof zm4) {
            zm4 zm4Var = (zm4) qn6Var;
            return bo1Var.I0(bo1Var.e0(bo1Var.K(zm4Var)), bo1Var.e0(bo1Var.F(zm4Var)));
        }
        ygf.f("sealed");
        return null;
    }

    public static final bsd W(dsd dsdVar, Object obj, Object obj2, tj4 tj4Var, hud hudVar, x12 x12Var, int i2) {
        boolean zF = ((p65) x12Var).f(dsdVar);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                dx dxVar = (dx) hudVar.a.invoke(obj2);
                dxVar.d();
                bsd bsdVar = new bsd(dsdVar, obj, dxVar, hudVar);
                vn7.T(oicVarA, oicVarG, x45VarE);
                p65Var.j0(bsdVar);
                objM = bsdVar;
            } catch (Throwable th) {
                vn7.T(oicVarA, oicVarG, x45VarE);
                throw th;
            }
        }
        bsd bsdVar2 = (bsd) objM;
        B(dsdVar, bsdVar2, obj, obj2, tj4Var, p65Var, 0);
        boolean zF2 = p65Var.f(dsdVar) | p65Var.f(bsdVar2);
        Object objM2 = p65Var.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = new vrd(dsdVar, bsdVar2, false, 4);
            p65Var.j0(objM2);
        }
        kyd.h(bsdVar2, (x45) objM2, p65Var);
        return bsdVar2;
    }

    public static hec W0(hkb hkbVar, boolean z) {
        hkbVar.getClass();
        if (hkbVar instanceof hec) {
            return ((hec) hkbVar).n0(z);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(hkbVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
        return null;
    }

    public static final db8 X(j15 j15Var) {
        Dialog dialog;
        Window window;
        j15Var.getClass();
        for (j15 j15Var2 = j15Var; j15Var2 != null; j15Var2 = j15Var2.v) {
            if (j15Var2 instanceof NavHostFragment) {
                return ((NavHostFragment) j15Var2).Y();
            }
            j15 j15Var3 = j15Var2.m().y;
            if (j15Var3 instanceof NavHostFragment) {
                return ((NavHostFragment) j15Var3).Y();
            }
        }
        View view = j15Var.G;
        if (view != null) {
            return kp7.l(view);
        }
        fb3 fb3Var = j15Var instanceof fb3 ? (fb3) j15Var : null;
        View decorView = (fb3Var == null || (dialog = fb3Var.x0) == null || (window = dialog.getWindow()) == null) ? null : window.getDecorView();
        if (decorView != null) {
            return kp7.l(decorView);
        }
        ygf.f(km4.x("Fragment ", j15Var, " does not have a NavController set"));
        return null;
    }

    public static final bo4 Y(n6c n6cVar, ib2 ib2Var, int i2, nz0 nz0Var) {
        return ((i2 == 0 || i2 == -3) && nz0Var == nz0.SUSPEND) ? n6cVar : new ek1(i2, nz0Var, ib2Var, n6cVar);
    }

    public static xwd Z(qn6 qn6Var, int i2) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return (xwd) ((mn6) qn6Var).h0().get(i2);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static /* synthetic */ void a(int i2) {
        Object[] objArr = new Object[3];
        if (i2 == 1 || i2 == 2) {
            objArr[0] = "companionObject";
        } else if (i2 != 3) {
            objArr[0] = "propertyDescriptor";
        } else {
            objArr[0] = "memberDescriptor";
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/DescriptorsJvmAbiUtil";
        if (i2 == 1) {
            objArr[2] = "isClassCompanionObjectWithBackingFieldsInOuter";
        } else if (i2 == 2) {
            objArr[2] = "isMappedIntrinsicCompanionObject";
        } else if (i2 != 3) {
            objArr[2] = "isPropertyWithBackingFieldInOuterClass";
        } else {
            objArr[2] = "hasJvmFieldAnnotation";
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    public static List a0(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return ((mn6) qn6Var).h0();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return null;
    }

    public static final cu0 b(float f2, long j2) {
        return new cu0(f2, new dkc(j2));
    }

    public static final Object b0(rx5 rx5Var, q84 q84Var) {
        Object obj = rx5Var.t.a.get(q84Var);
        if (obj != null) {
            return obj;
        }
        Object obj2 = rx5Var.v.n.a.get(q84Var);
        return obj2 == null ? q84Var.a : obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(defpackage.o10 r11, defpackage.b55 r12, defpackage.x12 r13, int r14) {
        /*
            Method dump skipped, instruction units count: 210
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.c(o10, b55, x12, int):void");
    }

    public static final Object c0(ew8 ew8Var, q84 q84Var) {
        Object obj = ew8Var.j.a.get(q84Var);
        return obj == null ? q84Var.a : obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.o10[] r8, defpackage.b55 r9, defpackage.x12 r10, int r11) {
        /*
            p65 r10 = (defpackage.p65) r10
            r0 = 415205898(0x18bf8a0a, float:4.9511727E-24)
            r10.a0(r0)
            t46 r0 = r10.x
            i89 r1 = r10.l()
            r2 = 201(0xc9, float:2.82E-43)
            xt8 r3 = defpackage.b22.b
            r10.V(r2, r3)
            boolean r2 = r10.S
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L29
            i89 r2 = defpackage.i89.d
            i89 r2 = defpackage.m40.Y(r8, r1, r2)
            i89 r1 = r10.i0(r1, r2)
            r10.J = r3
        L27:
            r2 = r4
            goto L74
        L29:
            egc r2 = r10.G
            int r5 = r2.g
            java.lang.Object r2 = r2.h(r5, r4)
            r2.getClass()
            i89 r2 = (defpackage.i89) r2
            egc r5 = r10.G
            int r6 = r5.g
            java.lang.Object r5 = r5.h(r6, r3)
            r5.getClass()
            i89 r5 = (defpackage.i89) r5
            i89 r6 = defpackage.m40.Y(r8, r1, r5)
            boolean r7 = r10.B()
            if (r7 == 0) goto L65
            boolean r7 = r10.y
            if (r7 != 0) goto L65
            boolean r5 = r5.equals(r6)
            if (r5 != 0) goto L58
            goto L65
        L58:
            int r1 = r10.l
            egc r5 = r10.G
            int r5 = r5.s()
            int r5 = r5 + r1
            r10.l = r5
            r1 = r2
            goto L27
        L65:
            i89 r1 = r10.i0(r1, r6)
            boolean r5 = r10.y
            if (r5 != 0) goto L73
            boolean r2 = defpackage.g76.L(r1, r2)
            if (r2 != 0) goto L27
        L73:
            r2 = r3
        L74:
            if (r2 == 0) goto L7d
            boolean r5 = r10.S
            if (r5 != 0) goto L7d
            r10.K(r1)
        L7d:
            boolean r5 = r10.w
            r0.c(r5)
            r10.w = r2
            r10.K = r1
            r2 = 202(0xca, float:2.83E-43)
            xt8 r5 = defpackage.b22.c
            r10.T(r5, r2, r1, r4)
            int r1 = r11 >> 3
            r1 = r1 & 14
            java.lang.Integer r1 = java.lang.Integer.valueOf(r1)
            r9.invoke(r10, r1)
            r10.p(r4)
            r10.p(r4)
            int r0 = r0.b()
            if (r0 == 0) goto La5
            goto La6
        La5:
            r3 = r4
        La6:
            r10.w = r3
            r0 = 0
            r10.K = r0
            mwa r10 = r10.s()
            if (r10 == 0) goto Lb9
            s r0 = new s
            r1 = 7
            r0.<init>(r8, r9, r11, r1)
            r10.d = r0
        Lb9:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.d(o10[], b55, x12, int):void");
    }

    public static swd d0(awd awdVar, int i2) {
        if (awdVar instanceof zvd) {
            Object obj = ((zvd) awdVar).getParameters().get(i2);
            obj.getClass();
            return (swd) obj;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return null;
    }

    public static final void e(dsd dsdVar, r28 r28Var, tj4 tj4Var, x45 x45Var, mz1 mz1Var, x12 x12Var, int i2) {
        tj4 tj4Var2;
        x45 x45Var2;
        dsd dsdVar2 = dsdVar;
        b2 b2Var = dsdVar2.a;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1877370462);
        int i3 = (i2 & 6) == 0 ? (p65Var.f(dsdVar2) ? 4 : 2) | i2 : i2;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            tj4Var2 = tj4Var;
            i3 |= p65Var.h(tj4Var2) ? 256 : 128;
        } else {
            tj4Var2 = tj4Var;
        }
        int i4 = i3 | 3072;
        if ((i2 & 24576) == 0) {
            i4 |= p65Var.h(mz1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = fn.z;
                p65Var.j0(objM);
            }
            x45 x45Var3 = (x45) objM;
            Object objM2 = p65Var.M();
            Object obj = objM2;
            if (objM2 == uobVar) {
                ejc ejcVar = new ejc();
                ejcVar.add(b2Var.o0());
                p65Var.j0(ejcVar);
                obj = ejcVar;
            }
            ejc ejcVar2 = (ejc) obj;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                long[] jArr = hqb.a;
                objM3 = new f78();
                p65Var.j0(objM3);
            }
            f78 f78Var = (f78) objM3;
            k49 k49Var = dsdVar2.d;
            if (g76.L(b2Var.o0(), k49Var.getValue())) {
                p65Var.Y(321145192);
                if (ejcVar2.size() == 1 && g76.L(ejcVar2.get(0), k49Var.getValue())) {
                    p65Var.Y(321469824);
                    p65Var.p(false);
                } else {
                    p65Var.Y(321279546);
                    boolean z = (i4 & 14) == 4;
                    Object objM4 = p65Var.M();
                    if (z || objM4 == uobVar) {
                        objM4 = new ce(13, dsdVar2);
                        p65Var.j0(objM4);
                    }
                    bu1.S0(ejcVar2, (x45) objM4);
                    f78Var.a();
                    p65Var.p(false);
                }
                p65Var.p(false);
            } else {
                p65Var.Y(321475776);
                p65Var.p(false);
            }
            if (f78Var.b(k49Var.getValue())) {
                p65Var.Y(322279296);
                p65Var.p(false);
            } else {
                p65Var.Y(321536443);
                ListIterator listIterator = ejcVar2.listIterator();
                int i5 = 0;
                while (true) {
                    wn5 wn5Var = (wn5) listIterator;
                    if (!wn5Var.hasNext()) {
                        i5 = -1;
                        break;
                    } else if (g76.L(x45Var3.invoke(wn5Var.next()), x45Var3.invoke(k49Var.getValue()))) {
                        break;
                    } else {
                        i5++;
                    }
                }
                if (i5 == -1) {
                    ejcVar2.add(k49Var.getValue());
                } else {
                    ejcVar2.set(i5, k49Var.getValue());
                }
                f78Var.a();
                int size = ejcVar2.size();
                int i6 = 0;
                while (i6 < size) {
                    Object obj2 = ejcVar2.get(i6);
                    f78Var.m(obj2, pxf.E(-934471669, new kj2(dsdVar2, tj4Var2, obj2, mz1Var, 0), p65Var));
                    i6++;
                    dsdVar2 = dsdVar;
                    tj4Var2 = tj4Var;
                }
                p65Var.p(false);
            }
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.v(p65Var, Integer.valueOf(i7), q12.g);
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1312707512);
            int size2 = ejcVar2.size();
            for (int i8 = 0; i8 < size2; i8++) {
                Object obj3 = ejcVar2.get(i8);
                p65Var.W(1171574969, x45Var3.invoke(obj3));
                b55 b55Var = (b55) f78Var.g(obj3);
                if (b55Var == null) {
                    p65Var.Y(1959122128);
                } else {
                    p65Var.Y(1171576145);
                    b55Var.invoke(p65Var, 0);
                }
                p65Var.p(false);
                p65Var.p(false);
            }
            p65Var.p(false);
            p65Var.p(true);
            x45Var2 = x45Var3;
        } else {
            p65Var.S();
            x45Var2 = x45Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lj2(dsdVar, r28Var, tj4Var, x45Var2, mz1Var, i2);
        }
    }

    public static List e0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            List parameters = ((zvd) awdVar).getParameters();
            parameters.getClass();
            return parameters;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:43:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(java.lang.Boolean r14, defpackage.r28 r15, defpackage.tj4 r16, java.lang.String r17, defpackage.mz1 r18, defpackage.x12 r19, int r20, int r21) {
        /*
            r6 = r20
            r12 = r19
            p65 r12 = (defpackage.p65) r12
            r0 = -513216493(0xffffffffe168f013, float:-2.6855899E20)
            r12.a0(r0)
            boolean r0 = r12.f(r14)
            if (r0 == 0) goto L14
            r0 = 4
            goto L15
        L14:
            r0 = 2
        L15:
            r0 = r0 | r6
            r1 = r0 | 48
            r2 = r21 & 4
            if (r2 == 0) goto L22
            r0 = r0 | 432(0x1b0, float:6.05E-43)
            r1 = r0
            r0 = r16
            goto L30
        L22:
            r0 = r16
            boolean r3 = r12.h(r0)
            if (r3 == 0) goto L2d
            r3 = 256(0x100, float:3.59E-43)
            goto L2f
        L2d:
            r3 = 128(0x80, float:1.8E-43)
        L2f:
            r1 = r1 | r3
        L30:
            r3 = r21 & 8
            if (r3 == 0) goto L39
            r1 = r1 | 3072(0xc00, float:4.305E-42)
        L36:
            r4 = r17
            goto L4b
        L39:
            r4 = r6 & 3072(0xc00, float:4.305E-42)
            if (r4 != 0) goto L36
            r4 = r17
            boolean r5 = r12.f(r4)
            if (r5 == 0) goto L48
            r5 = 2048(0x800, float:2.87E-42)
            goto L4a
        L48:
            r5 = 1024(0x400, float:1.435E-42)
        L4a:
            r1 = r1 | r5
        L4b:
            r5 = r1 & 9363(0x2493, float:1.312E-41)
            r7 = 9362(0x2492, float:1.3119E-41)
            r8 = 0
            if (r5 == r7) goto L54
            r5 = 1
            goto L55
        L54:
            r5 = r8
        L55:
            r7 = r1 & 1
            boolean r5 = r12.P(r7, r5)
            if (r5 == 0) goto L8a
            if (r2 == 0) goto L67
            r15 = 7
            r0 = 0
            cud r15 = defpackage.f76.Q(r8, r8, r0, r15)
            r9 = r15
            goto L68
        L67:
            r9 = r0
        L68:
            if (r3 == 0) goto L6d
            java.lang.String r15 = "Crossfade"
            goto L6e
        L6d:
            r15 = r4
        L6e:
            r0 = r1 & 14
            int r2 = r1 >> 6
            r2 = r2 & 112(0x70, float:1.57E-43)
            r0 = r0 | r2
            dsd r7 = T0(r14, r15, r12, r0, r8)
            r0 = 58352(0xe3f0, float:8.1769E-41)
            r13 = r1 & r0
            o28 r8 = defpackage.o28.b
            r10 = 0
            r11 = r18
            e(r7, r8, r9, r10, r11, r12, r13)
            r4 = r15
            r2 = r8
            r3 = r9
            goto L8f
        L8a:
            r12.S()
            r2 = r15
            r3 = r0
        L8f:
            mwa r15 = r12.s()
            if (r15 == 0) goto La1
            ij2 r0 = new ij2
            r1 = r14
            r5 = r18
            r7 = r21
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            r15.d = r0
        La1:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.f(java.lang.Boolean, r28, tj4, java.lang.String, mz1, x12, int, int):void");
    }

    public static o3e f0(bo1 bo1Var, xwd xwdVar) {
        xwdVar.getClass();
        if (bo1Var.q0(xwdVar)) {
            return null;
        }
        if (xwdVar instanceof xwd) {
            return xwdVar.b().m0();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(xwdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, xwdVar.getClass(), sb));
        return null;
    }

    public static final q73 g(Context context) {
        float f2 = context.getResources().getConfiguration().fontScale;
        float f3 = context.getResources().getDisplayMetrics().density;
        wz4 wz4VarA = xz4.a(f2);
        if (wz4VarA == null) {
            wz4VarA = new nz6(f2);
        }
        return new q73(f3, f2, wz4VarA);
    }

    public static swd g0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            co1 co1VarA = ((zvd) awdVar).a();
            if (co1VarA instanceof swd) {
                return (swd) co1VarA;
            }
            return null;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return null;
    }

    public static final void h(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1740705373);
        if (p65Var.P(i2 & 1, i2 != 0)) {
            tp7.c(0.0f, 0, 5, ((zo7) p65Var.j(kt7.b)).x, p65Var, null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p44(i2, 5);
        }
    }

    public static pxd h0(xwd xwdVar) {
        xwdVar.getClass();
        if (xwdVar instanceof xwd) {
            pqe pqeVarA = xwdVar.a();
            pqeVarA.getClass();
            return mk7.n(pqeVarA);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(xwdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, xwdVar.getClass(), sb));
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v17 */
    public static final void i(lp3 lp3Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        cu0 cu0VarB;
        ?? r2;
        o28 o28Var;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(778537096);
        int i3 = i2 | (p65Var.f(lp3Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            if (lp3Var.a()) {
                p65Var.Y(575390575);
                cu0VarB = b(4.0f, rz5.A(p65Var).A);
                p65Var.p(false);
            } else {
                p65Var.Y(575470958);
                cu0VarB = b(1.0f, rz5.A(p65Var).x);
                p65Var.p(false);
            }
            cu0 cu0Var = cu0VarB;
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            if (lp3Var instanceof jp3) {
                p65Var.Y(-1899816159);
                s42.u(((jp3) lp3Var).b, null, cu0Var, null, p65Var, 0, 10);
                p65Var.p(false);
                r2 = 0;
                o28Var = o28Var2;
            } else {
                if (!(lp3Var instanceof kp3)) {
                    throw ho2.L(p65Var, -1899817216, false);
                }
                p65Var.Y(-1899810561);
                r28 r28VarE = jfc.e(jfc.d(o28Var2, 1.0f), 120.0f);
                sn3 sn3Var = z4c.a;
                r28 r28VarC = w2g.C(bo.C(r40.y(r28VarE, ((w4c) p65Var.j(sn3Var)).c), cu0Var.a, cu0Var.b, ((w4c) p65Var.j(sn3Var)).c), 20.0f);
                zk7 zk7VarC2 = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarC);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                r2 = 0;
                o28Var = o28Var2;
                xz5.o(null, ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, rz5.A(p65Var).d, 0L, 0, p65Var, 0, 117);
                p65Var.p(true);
                p65Var.p(false);
            }
            if (lp3Var.a()) {
                p65Var.Y(1236052921);
                qv5.b(vn7.J(R.drawable.ic_close_16, r2, p65Var), vo7.R(p65Var, R.string.common_close), hlg.r(w2g.C(flb.a0(iy0.a.a(o28Var, z46.f), rz5.A(p65Var).e, rv8.r), 6.0f), false, null, null, m45Var, 15), uu1.d, p65Var, 3080, 0);
            } else {
                p65Var.Y(1233592916);
            }
            p65Var.p(r2);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 28, lp3Var, m45Var, r28Var2);
        }
    }

    public static boolean i0(mn6 mn6Var, y05 y05Var) {
        return mn6Var.getAnnotations().g(y05Var);
    }

    public static final void j(tm4 tm4Var, lm4 lm4Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1552383545);
        int i3 = (p65Var.f(tm4Var) ? 4 : 2) | i2 | (p65Var.f(lm4Var) ? 32 : 16);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (tm4Var instanceof mm4) {
            p65Var.Y(1486941615);
            k(r28Var, p65Var, 6);
            p65Var.p(false);
        } else {
            if (!(tm4Var instanceof sm4)) {
                throw ho2.L(p65Var, 1486939748, false);
            }
            p65Var.Y(1486943865);
            m((sm4) tm4Var, lm4Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 15, tm4Var, lm4Var, r28Var);
        }
    }

    public static boolean j0(swd swdVar, awd awdVar) {
        if (awdVar == null ? true : awdVar instanceof zvd) {
            return ok7.E(swdVar, (zvd) awdVar, null);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(swdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, swdVar.getClass(), sb));
        return false;
    }

    public static final void k(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        nr5 nr5Var = rv8.r;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1290223714);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-458873888);
            int i6 = 0;
            while (i6 < i4) {
                float f2 = 24.0f;
                dy0.a(flb.a0(jfc.e(jfc.p(w2g.F(r28Var, 24.0f, 24.0f, 24.0f, 16.0f), 160.0f), 20.0f), ((zo7) p65Var.j(kt7.b)).b, nr5Var), p65Var, 0);
                h(p65Var, 0);
                p65Var.Y(-458863978);
                int i7 = 0;
                while (i7 < i4) {
                    r28 r28VarD = jfc.d(r28Var, 1.0f);
                    sn3 sn3Var = kt7.b;
                    r28 r28VarF = w2g.F(flb.a0(r28VarD, ((zo7) p65Var.j(sn3Var)).a, nr5Var), f2, 14.0f, f2, 14.0f);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j3 = p65Var.T;
                    int i8 = (int) (j3 ^ (j3 >>> c2));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarF);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL2);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR2);
                    dy0.a(flb.a0(jfc.e(jfc.p(o28.b, gq7.c(i7).c(48, 240)), 20.0f), ((zo7) p65Var.j(sn3Var)).b, nr5Var), p65Var, 0);
                    p65Var.p(true);
                    h(p65Var, 0);
                    i7++;
                    i4 = 4;
                    c2 = ' ';
                    f2 = 24.0f;
                }
                p65Var.p(false);
                i6++;
                i4 = 4;
                c2 = ' ';
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 5);
        }
    }

    public static boolean k0(hkb hkbVar, hkb hkbVar2) {
        hkbVar.getClass();
        hkbVar2.getClass();
        if (!(hkbVar instanceof hec)) {
            StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
            sb.append(hkbVar);
            sb.append(", ");
            ywb.g(ka1.p(n1b.a, hkbVar.getClass(), sb));
            return false;
        }
        if (hkbVar2 instanceof hec) {
            return ((hec) hkbVar).h0() == ((hec) hkbVar2).h0();
        }
        StringBuilder sb2 = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb2.append(hkbVar2);
        sb2.append(", ");
        ywb.g(ka1.p(n1b.a, hkbVar2.getClass(), sb2));
        return false;
    }

    public static final void l(sm4 sm4Var, lm4 lm4Var, x12 x12Var, int i2) {
        int i3;
        lm4 lm4Var2;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1825533277);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(sm4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lm4Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            y(390, p65Var, null, "Local Flags", "Local Flags are specifically tailored local flags designed to enable or disable a feature exclusively within the local environment (excluding WebViews) by overriding server flags (≠Variants).\nIt's important to note that these overrides do not impact server flags.\nTo both activate a flag on server and locally, you must add a condition (EMAIL_MATCH, USER_ID, …) to a Variant deploy-config on the server.");
            p65Var.Y(-1990800829);
            Iterator it2 = sm4Var.a.iterator();
            while (true) {
                boolean zHasNext = it2.hasNext();
                uob uobVar = w12.a;
                if (zHasNext) {
                    qm4 qm4Var = (qm4) it2.next();
                    if (qm4Var instanceof nm4) {
                        p65Var.Y(548553058);
                        nm4 nm4Var = (nm4) qm4Var;
                        String str = nm4Var.a;
                        boolean z = nm4Var.b;
                        String str2 = nm4Var.c;
                        boolean zF = p65Var.f(qm4Var) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                        Object objM = p65Var.M();
                        if (zF || objM == uobVar) {
                            objM = new si3(lm4Var, 7, nm4Var);
                            p65Var.j0(objM);
                        }
                        z(str, z, str2, null, (x45) objM, p65Var, 0);
                        p65Var.p(false);
                    } else if (qm4Var instanceof om4) {
                        p65Var.Y(548567120);
                        om4 om4Var = (om4) qm4Var;
                        String str3 = om4Var.a;
                        String strValueOf = String.valueOf(om4Var.b);
                        String str4 = om4Var.c;
                        boolean zF2 = p65Var.f(qm4Var) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                        Object objM2 = p65Var.M();
                        if (zF2 || objM2 == uobVar) {
                            objM2 = new si3(lm4Var, 8, om4Var);
                            p65Var.j0(objM2);
                        }
                        p65 p65Var2 = p65Var;
                        A(str3, strValueOf, str4, 3, null, (x45) objM2, p65Var2, 3072);
                        p65Var = p65Var2;
                        p65Var.p(false);
                    } else {
                        if (!(qm4Var instanceof pm4)) {
                            throw ho2.L(p65Var, 548551674, false);
                        }
                        p65Var.Y(548585578);
                        pm4 pm4Var = (pm4) qm4Var;
                        String str5 = pm4Var.a;
                        String str6 = pm4Var.b;
                        String str7 = pm4Var.c;
                        boolean zF3 = p65Var.f(qm4Var) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                        Object objM3 = p65Var.M();
                        if (zF3 || objM3 == uobVar) {
                            objM3 = new si3(lm4Var, 9, pm4Var);
                            p65Var.j0(objM3);
                        }
                        p65 p65Var3 = p65Var;
                        A(str5, str6, str7, 1, null, (x45) objM3, p65Var3, 3072);
                        p65Var = p65Var3;
                        p65Var.p(false);
                    }
                    h(p65Var, 0);
                } else {
                    p65Var.p(false);
                    boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                    Object objM4 = p65Var.M();
                    if (z2 || objM4 == uobVar) {
                        i4 = 0;
                        objM4 = new gi4(0, lm4Var, lm4.class, "onResetLocalFlagsClicked", "onResetLocalFlagsClicked()V", 0, 3);
                        lm4Var2 = lm4Var;
                        p65Var.j0(objM4);
                    } else {
                        lm4Var2 = lm4Var;
                        i4 = 0;
                    }
                    s("Reset Local Flags", null, ((zo7) p65Var.j(kt7.b)).u, (m45) ((qh6) objM4), p65Var, 6);
                    h(p65Var, i4);
                }
            }
        } else {
            lm4Var2 = lm4Var;
            i4 = 0;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jm4(sm4Var, lm4Var2, i2, i4);
        }
    }

    public static void l0(q90 q90Var) {
        if (q90.i == null) {
            q90.i = new q90();
            p90 p90Var = new p90("Okio Watchdog");
            p90Var.setDaemon(true);
            p90Var.start();
        }
        long jNanoTime = System.nanoTime();
        long j2 = q90Var.c;
        boolean z = q90Var.a;
        if (j2 != 0 && z) {
            q90Var.g = Math.min(j2, q90Var.c() - jNanoTime) + jNanoTime;
        } else if (j2 != 0) {
            q90Var.g = jNanoTime + j2;
        } else {
            if (!z) {
                ywb.d();
                return;
            }
            q90Var.g = q90Var.c();
        }
        ad adVar = q90.h;
        int i2 = adVar.b + 1;
        adVar.b = i2;
        q90[] q90VarArr = (q90[]) adVar.c;
        if (i2 == q90VarArr.length) {
            q90[] q90VarArr2 = new q90[i2 * 2];
            k80.j0(0, 0, 14, q90VarArr, q90VarArr2);
            adVar.c = q90VarArr2;
        }
        adVar.l(i2, q90Var);
        if (q90Var.f == 1) {
            q90.k.signal();
        }
    }

    public static final void m(sm4 sm4Var, lm4 lm4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-56081533);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(sm4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lm4Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i5 = i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            l(sm4Var, lm4Var, p65Var, i5);
            q(sm4Var, lm4Var, p65Var, i5);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 17, sm4Var, lm4Var, r28Var);
        }
    }

    public static boolean m0(awd awdVar) {
        if (awdVar instanceof zvd) {
            return vm6.H((zvd) awdVar, lnc.a);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.tm4 r20, defpackage.lm4 r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.n(tm4, lm4, r28, x12, int, int):void");
    }

    public static boolean n0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            return ((zvd) awdVar).a() instanceof y28;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    public static final void o(lig ligVar, String str, r28 r28Var, xm4 xm4Var, x12 x12Var, int i2) {
        xm4 xm4Var2;
        int i3;
        xm4 xm4Var3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-999765775);
        int i4 = i2 | (p65Var.f(ligVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new mb(str, 21);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    xm4 xm4Var4 = (xm4) to7.z(n1b.a.b(xm4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-7169);
                    xm4Var3 = xm4Var4;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                xm4Var3 = xm4Var;
            }
            p65Var.q();
            n((tm4) guc.z(xm4Var3.k, p65Var, 0).getValue(), new lm4(xm4Var3, ligVar), r28Var, p65Var, i3 & 896, 0);
            xm4Var2 = xm4Var3;
        } else {
            p65Var.S();
            xm4Var2 = xm4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(ligVar, str, r28Var, xm4Var2, i2, 6);
        }
    }

    public static boolean o0(awd awdVar) {
        if (awdVar instanceof zvd) {
            co1 co1VarA = ((zvd) awdVar).a();
            y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
            return (y28Var == null || y28Var.o() != c28.FINAL || y28Var.b0() == qn1.ENUM_CLASS || y28Var.b0() == qn1.ENUM_ENTRY || y28Var.b0() == qn1.ANNOTATION_CLASS) ? false : true;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    public static final void p(lm4 lm4Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2106588638);
        int i4 = (p65Var2.f(lm4Var) ? 4 : 2) | i2 | 48;
        if (p65Var2.P(i4 & 1, (i4 & 19) != 18)) {
            boolean z = (i4 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new gi4(0, lm4Var, lm4.class, "onBackPressed", "onBackPressed()V", 0, 4);
                p65Var2.j0(objM);
            }
            long j2 = ((zo7) p65Var2.j(kt7.b)).c;
            m45 m45Var = (m45) ((qh6) objM);
            mz1 mz1VarE = pxf.E(289655049, new so1(12, lm4Var), p65Var2);
            p65Var = p65Var2;
            r28Var2 = o28.b;
            i3 = 1;
            qk7.g(r28Var2, "Flags", m45Var, mz1VarE, null, null, 0L, j2, null, p65Var, 3126, 368);
        } else {
            p65Var = p65Var2;
            i3 = 1;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(lm4Var, r28Var2, i2, i3);
        }
    }

    public static boolean p0(awd awdVar) {
        if (awdVar instanceof zvd) {
            return ((zvd) awdVar).c();
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    public static final void q(sm4 sm4Var, lm4 lm4Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        List list = sm4Var.b;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(466505749);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(sm4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(lm4Var) ? 32 : 16;
        }
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            y(390, p65Var2, null, "Local Variants", "Local Variants are used by WebView in order to enable or disable a feature exclusively within the local environment by overriding server Variants\nIt's important to note that these overrides do not impact server Variants.\nTo both activate a Variant on server and locally, you must add a condition (EMAIL_MATCH, USER_ID, …) to a Variant deploy-config on the server.\nAutogenerated Local Variants are based on Local Flags");
            p65Var2.Y(1635446785);
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                D((rm4) it2.next(), null, lm4Var, p65Var2, (i3 << 3) & 896);
                h(p65Var2, 0);
            }
            p65Var2.p(false);
            C(lm4Var, null, p65Var2, (i3 >> 3) & 14);
            h(p65Var2, 0);
            if (list.isEmpty()) {
                p65Var = p65Var2;
                p65Var.Y(-850399827);
                p65Var.p(false);
                h(p65Var, 0);
            } else {
                Iterator it3 = list.iterator();
                while (it3.hasNext()) {
                    if (!((rm4) it3.next()).b) {
                        p65Var2.Y(-840460266);
                        boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                        Object objM = p65Var2.M();
                        if (z || objM == w12.a) {
                            gi4 gi4Var = new gi4(0, lm4Var, lm4.class, "onResetLocalVariantsClicked", "onResetLocalVariantsClicked()V", 0, 6);
                            p65Var2.j0(gi4Var);
                            objM = gi4Var;
                        }
                        p65Var = p65Var2;
                        s("Reset Local Variants", null, ((zo7) p65Var2.j(kt7.b)).u, (m45) ((qh6) objM), p65Var, 6);
                        p65Var.p(false);
                        h(p65Var, 0);
                    }
                }
                p65Var = p65Var2;
                p65Var.Y(-850399827);
                p65Var.p(false);
                h(p65Var, 0);
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jm4(sm4Var, lm4Var, i2, i4);
        }
    }

    public static boolean q0(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return kyd.a0((mn6) qn6Var);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return false;
    }

    public static final void r(final String str, final String str2, final long j2, final long j3, r28 r28Var, final Highlight highlight, boolean z, int i2, final x45 x45Var, x12 x12Var, final int i3) {
        final r28 r28Var2;
        final boolean z2;
        final int i4;
        l78 l78Var;
        l78 l78Var2;
        m62 m62Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-39188317);
        int i5 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.e(j2) ? 256 : 128) | (p65Var.e(j3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576 | (p65Var.f(highlight) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 14155776 | (p65Var.h(x45Var) ? 67108864 : 33554432);
        if (p65Var.P(i5 & 1, (38347923 & i5) != 38347922)) {
            o28 o28Var = o28.b;
            r28 r28VarB = bo.B(jfc.r(jfc.d(o28Var, 1.0f), 3), 1.0f, ((zo7) p65Var.j(kt7.b)).z, bmb.a(4.0f));
            boolean z3 = ((i5 & 458752) == 131072) | ((234881024 & i5) == 67108864);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                objM = new yz5(x45Var, highlight, 1);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.C(hlg.r(r28VarB, true, null, null, (m45) objM, 14), 16.0f), "in_response_to_post");
            p65Var.Y(-1003410150);
            p65Var.Y(212064437);
            p65Var.p(false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var3 = (l78) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var4 = (l78) objM6;
            boolean zD = p65Var.d(257) | p65Var.h(hl7Var);
            Object objM7 = p65Var.M();
            if (zD || objM7 == uobVar) {
                objM7 = new fr0(l78Var4, hl7Var, m62Var2, l78Var3, 10);
                l78Var = l78Var3;
                l78Var2 = l78Var4;
                m62Var = m62Var2;
                p65Var.j0(objM7);
            } else {
                l78Var2 = l78Var4;
                m62Var = m62Var2;
                l78Var = l78Var3;
            }
            zk7 zk7Var = (zk7) objM7;
            Object objM8 = p65Var.M();
            int i6 = 10;
            if (objM8 == uobVar) {
                objM8 = new gr0(l78Var, m62Var, i6);
                p65Var.j0(objM8);
            }
            m45 m45Var = (m45) objM8;
            boolean zH = p65Var.h(hl7Var);
            Object objM9 = p65Var.M();
            if (zH || objM9 == uobVar) {
                objM9 = new hr0(hl7Var, i6);
                p65Var.j0(objM9);
            }
            hlg.j(wxb.a(r28VarN, false, (x45) objM9), pxf.E(1200550679, new g06(l78Var2, z52Var, m45Var, highlight, str, str2, j2, j3), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            i4 = 100;
            r28Var2 = o28Var;
            z2 = true;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            z2 = z;
            i4 = i2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(str, str2, j2, j3, r28Var2, highlight, z2, i4, x45Var, i3) { // from class: f06
                public final /* synthetic */ String a;
                public final /* synthetic */ String b;
                public final /* synthetic */ long c;
                public final /* synthetic */ long d;
                public final /* synthetic */ r28 e;
                public final /* synthetic */ Highlight f;
                public final /* synthetic */ boolean g;
                public final /* synthetic */ int h;
                public final /* synthetic */ x45 i;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    k40.r(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static boolean r0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            co1 co1VarA = ((zvd) awdVar).a();
            y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
            return (y28Var != null ? y28Var.p0() : null) instanceof f26;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    public static final void s(String str, r28 r28Var, long j2, m45 m45Var, x12 x12Var, int i2) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1598195540);
        int i3 = i2 | 48 | (p65Var.e(j2) ? 256 : 128) | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarF = w2g.F(jfc.f(jfc.d(hlg.r(flb.a0(r28Var3, ((zo7) p65Var.j(kt7.b)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 48.0f, 0.0f, 2), 24.0f, 14.0f, 24.0f, 14.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(str, iy0.a.a(o28Var, z46.g), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 6, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jj3(str, r28Var2, j2, m45Var, i2);
        }
    }

    public static boolean s0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            return awdVar instanceof x46;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:124:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:129:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x00f4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(defpackage.r28 r28, defpackage.kv6 r29, defpackage.hy8 r30, defpackage.j70 r31, defpackage.wd r32, defpackage.dn4 r33, boolean r34, defpackage.fx8 r35, defpackage.x45 r36, defpackage.x12 r37, int r38, int r39) {
        /*
            Method dump skipped, instruction units count: 479
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.t(r28, kv6, hy8, j70, wd, dn4, boolean, fx8, x45, x12, int, int):void");
    }

    public static boolean t0(awd awdVar) {
        if (awdVar instanceof zvd) {
            return awdVar instanceof u66;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x019a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void u(defpackage.r28 r28, defpackage.kv6 r29, defpackage.hy8 r30, defpackage.g70 r31, defpackage.zq0 r32, defpackage.dn4 r33, boolean r34, defpackage.fx8 r35, defpackage.x45 r36, defpackage.x12 r37, int r38, int r39) {
        /*
            Method dump skipped, instruction units count: 421
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k40.u(r28, kv6, hy8, g70, zq0, dn4, boolean, fx8, x45, x12, int, int):void");
    }

    public static boolean u0(qn6 qn6Var) {
        qn6Var.getClass();
        return (qn6Var instanceof hec) && ((hec) qn6Var).k0();
    }

    public static final void v(rg1 rg1Var, ye1 ye1Var, qi1 qi1Var, tg1 tg1Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        ye1Var.getClass();
        qi1Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(827374546);
        int i3 = i2 | (p65Var.f(rg1Var) ? 4 : 2) | (p65Var.f(ye1Var) ? 32 : 16) | (p65Var.h(qi1Var) ? 256 : 128) | (p65Var.h(tg1Var) ? 2048 : 1024) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(rg1Var);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            rg1 rg1Var2 = (rg1) l78Var.getValue();
            oe1 oe1Var = oe1.S;
            int i4 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3456;
            o28 o28Var = o28.b;
            n01.f(rg1Var2, ye1Var, o28Var, oe1Var, p65Var, i4, 0);
            String str = ((rg1) l78Var.getValue()).a;
            boolean z = ((i3 & 896) == 256 || p65Var.h(qi1Var)) | ((i3 & 7168) == 2048 || p65Var.h(tg1Var));
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                mo5 mo5Var = new mo5(qi1Var, l78Var, tg1Var, null, 7);
                p65Var.j0(mo5Var);
                objM2 = mo5Var;
            }
            kyd.k(p65Var, (b55) objM2, str);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(rg1Var, ye1Var, qi1Var, tg1Var, r28Var2, i2, 27);
        }
    }

    public static boolean v0(awd awdVar) {
        awdVar.getClass();
        if (awdVar instanceof zvd) {
            return vm6.H((zvd) awdVar, lnc.b);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(awdVar);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, awdVar.getClass(), sb));
        return false;
    }

    public static final r6c w(int i2, int i3, nz0 nz0Var) {
        if (i2 < 0) {
            ywb.g(b09.w(i2, "replay cannot be negative, but was "));
            return null;
        }
        if (i3 < 0) {
            ywb.g(b09.w(i3, "extraBufferCapacity cannot be negative, but was "));
            return null;
        }
        if (i2 <= 0 && i3 <= 0 && nz0Var != nz0.SUSPEND) {
            lg8.t("replay or extraBufferCapacity must be positive with non-default onBufferOverflow strategy ", nz0Var);
            return null;
        }
        int i4 = i3 + i2;
        if (i4 < 0) {
            i4 = Integer.MAX_VALUE;
        }
        return new r6c(i2, i4, nz0Var);
    }

    public static /* synthetic */ r6c x(int i2, int i3, nz0 nz0Var) {
        int i4 = (i3 & 1) != 0 ? 0 : 1;
        if ((i3 & 2) != 0) {
            i2 = 0;
        }
        if ((i3 & 4) != 0) {
            nz0Var = nz0.SUSPEND;
        }
        return w(i4, i2, nz0Var);
    }

    public static final void y(int i2, x12 x12Var, r28 r28Var, String str, String str2) {
        p65 p65Var;
        String str3;
        r28 r28Var2;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-948815986);
        int i3 = i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var2, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            jjd.b(str, w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 24.0f, 24.0f, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 54, 0, 131068);
            if (str2 != null) {
                p65Var2.Y(788479586);
                mkd mkdVarA = mkd.a(((bu7) p65Var2.j(sn3Var)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                r28Var2 = o28Var;
                str3 = str2;
                jjd.b(str3, w2g.G(jfc.d(r28Var2, 1.0f), 24.0f, 0.0f, 24.0f, 16.0f, 2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 54, 0, 131068);
                p65Var = p65Var2;
                z = false;
            } else {
                p65Var = p65Var2;
                r28Var2 = o28Var;
                z = false;
                str3 = str2;
                p65Var.Y(777885150);
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            str3 = str2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new im4(str, r28Var2, str3, i2);
        }
    }

    public static boolean y0(p61 p61Var) {
        if (p61Var instanceof ve8) {
            return ((ve8) p61Var).g;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(p61Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, p61Var.getClass(), sb));
        return false;
    }

    public static final void z(String str, boolean z, String str2, r28 r28Var, x45 x45Var, x12 x12Var, int i2) {
        r28 r28Var2;
        o28 o28Var;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1968238919);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.f(str2) ? 256 : 128) | 3072 | (p65Var.h(x45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var2 = o28.b;
            r28 r28VarF = w2g.F(jfc.f(jfc.d(flb.a0(o28Var2, j2, nr5Var), 1.0f), 48.0f, 0.0f, 2), 24.0f, 8.0f, 24.0f, 8.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarG = w2g.G(ev6.i(new qse(z46.n), new sq6(1.0f, true)), 0.0f, 0.0f, 8.0f, 0.0f, 11);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            sn3 sn3Var2 = jt7.c;
            flb.D(str, jfc.d(o28Var2, 1.0f), mkd.a(((bu7) p65Var.j(sn3Var2)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), null, 2, false, 1, 0, null, new oh0(en7.B(9), ((bu7) p65Var.j(sn3Var2)).m.a.b, en7.A(0.25d)), p65Var, (i3 & 14) | 1597488, 424);
            if (str2 != null) {
                km4.F(4.0f, -2109051824, p65Var, p65Var, o28Var2);
                o28Var = o28Var2;
                jjd.b(str2, jfc.d(o28Var2, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).o, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i3 >> 6) & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z2 = false;
            } else {
                o28Var = o28Var2;
                z2 = false;
                p65Var.Y(-2121825777);
            }
            p65Var.p(z2);
            p65Var.p(true);
            hk7.b(z, x45Var, null, false, null, null, p65Var, ((i3 >> 3) & 14) | ((i3 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 60);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new je0(str, z, str2, r28Var2, x45Var, i2);
        }
    }

    public static boolean z0(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return qn6Var instanceof wsa;
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean x0(jec jecVar) {
        if (jecVar instanceof mn6) {
            return vm6.F((mn6) jecVar);
        }
        StringBuilder sb = new StringBuilder("ClassicTypeSystemContext couldn't handle: ");
        sb.append(jecVar);
        sb.append(KLTXZbnQvj.HoeaUClJZ);
        ywb.g(ka1.p(n1b.a, jecVar.getClass(), sb));
        return false;
    }

    public static boolean w0(qn6 qn6Var) {
        qn6Var.getClass();
        if (qn6Var instanceof mn6) {
            return nxd.e((mn6) qn6Var);
        }
        StringBuilder sb = new StringBuilder(mBTDfueQiGWRV.gVLPlZlixR);
        sb.append(qn6Var);
        sb.append(", ");
        ywb.g(ka1.p(n1b.a, qn6Var.getClass(), sb));
        return false;
    }
}
