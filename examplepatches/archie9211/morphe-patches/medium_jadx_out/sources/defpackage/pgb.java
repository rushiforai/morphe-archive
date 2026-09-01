package defpackage;

import android.content.res.Resources;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.reader.R;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class pgb {
    public static final void a(whb whbVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1938933298);
        int i2 = (p65Var.f(whbVar) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            jjd.b(vo7.R(p65Var, whbVar.c ? R.string.responses_post_hidden : R.string.responses_catalog_hidden), w2g.G(jfc.d(o28Var, 1.0f), 56.0f, 16.0f, 56.0f, 0.0f, 8), ((zo7) p65Var.j(kt7.b)).o, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 130040);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(whbVar, r28Var, i, 21);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v5 */
    /* JADX WARN: Type inference failed for: r11v6, types: [int] */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r4v24, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v31, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v35 */
    /* JADX WARN: Type inference failed for: r9v1, types: [p65, x12] */
    public static final void b(r28 r28Var, x12 x12Var, int i) {
        ?? r4;
        yq0 yq0Var = z46.p;
        rz5 rz5Var = qb8.c;
        ?? r9 = (p65) x12Var;
        r9.a0(243734870);
        if (r9.P(i & 1, (i & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) r9.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = r9.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = r9.l();
            r28 r28VarR = gx1.R(r9, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            r9.c0();
            if (r9.S) {
                r9.k(ot2Var);
            } else {
                r9.m0();
            }
            cu cuVar = q12.f;
            tp7.B(r9, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(r9, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(r9, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(r9, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(r9, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = r9.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = r9.l();
            r28 r28VarR2 = gx1.R(r9, r28VarD);
            r9.c0();
            if (r9.S) {
                r9.k(ot2Var);
            } else {
                r9.m0();
            }
            tp7.B(r9, cuVar, zk7VarC2);
            tp7.B(r9, cuVar2, i89VarL2);
            ka1.z(i3, r9, cuVar3, r9, fnVar);
            tp7.B(r9, cuVar4, r28VarR2);
            r28 r28VarV = m40.V(o28Var, r9, 6);
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, r9, 0);
            long j3 = r9.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = r9.l();
            r28 r28VarR3 = gx1.R(r9, r28VarV);
            r9.c0();
            if (r9.S) {
                r9.k(ot2Var);
            } else {
                r9.m0();
            }
            tp7.B(r9, cuVar, wv1VarA);
            tp7.B(r9, cuVar2, i89VarL3);
            ka1.z(i4, r9, cuVar3, r9, fnVar);
            tp7.B(r9, cuVar4, r28VarR3);
            ?? r11 = 0;
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.D(o28Var, 24.0f, 8.0f), 1.0f), 44.0f), ((zo7) r9.j(kt7.b)).o, bmb.a(100.0f)), r9, 0);
            r9.Y(513461980);
            int i5 = 0;
            while (i5 < 8) {
                wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, r9, r11);
                long j4 = r9.T;
                int i6 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = r9.l();
                r28 r28VarR4 = gx1.R(r9, o28Var);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                r9.c0();
                if (r9.S) {
                    r9.k(ot2Var2);
                } else {
                    r9.m0();
                }
                tp7.B(r9, q12.f, wv1VarA2);
                tp7.B(r9, q12.e, i89VarL4);
                tp7.B(r9, q12.g, Integer.valueOf(i6));
                tp7.y(r9, q12.h);
                tp7.B(r9, q12.d, r28VarR4);
                if (i5 > 0) {
                    r9.Y(805396829);
                    tp7.c(0.0f, 6, 6, 0L, r9, w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2));
                    r4 = 0;
                } else {
                    r4 = 0;
                    r9.Y(769917577);
                }
                r9.p(r4);
                gp7.d(r4, 1, r9, null);
                r9.p(true);
                i5++;
                r11 = r4;
            }
            ho2.N(r9, r11, true, true, true);
        } else {
            r9.S();
        }
        mwa mwaVarS = r9.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 23);
        }
    }

    public static final void c(yhb yhbVar, lgb lgbVar, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        int i2;
        ar0 ar0Var;
        cu cuVar;
        fn fnVar;
        o28 o28Var;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(545660005);
        int i3 = i | (p65Var.f(yhbVar) ? 4 : 2) | (p65Var.f(lgbVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar2 = q12.f;
            tp7.B(p65Var, cuVar2, zk7VarC);
            cu cuVar3 = q12.e;
            tp7.B(p65Var, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar4 = q12.g;
            tp7.B(p65Var, cuVar4, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar5 = q12.d;
            tp7.B(p65Var, cuVar5, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var3 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var3, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, zk7VarC2);
            tp7.B(p65Var, cuVar3, i89VarL2);
            ka1.z(i5, p65Var, cuVar4, p65Var, fnVar2);
            tp7.B(p65Var, cuVar5, r28VarR2);
            rh4 rh4Var = jfc.c;
            zk7 zk7VarC3 = dy0.c(ar0Var3, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, zk7VarC3);
            tp7.B(p65Var, cuVar3, i89VarL3);
            ka1.z(i6, p65Var, cuVar4, p65Var, fnVar2);
            tp7.B(p65Var, cuVar5, r28VarR3);
            if (yhbVar.d) {
                p65Var.Y(-1726947829);
                o28Var = o28Var2;
                int i7 = ((i3 << 3) & 896) | 3072;
                fnVar = fnVar2;
                cuVar = cuVar3;
                i2 = 3;
                ar0Var = ar0Var2;
                e(yhbVar.g, yhbVar.h, lgbVar, jfc.d(o28Var, 1.0f), p65Var, i7, 0);
                z = false;
            } else {
                i2 = 3;
                ar0Var = ar0Var2;
                cuVar = cuVar3;
                fnVar = fnVar2;
                o28Var = o28Var2;
                z = false;
                p65Var.Y(-1763041904);
            }
            p65Var.p(z);
            r28 r28VarE = w2g.E(iy0.a.a(jfc.t(o28Var, null, i2), ar0Var), 56.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(new h70(16.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, wv1VarA);
            tp7.B(p65Var, cuVar, i89VarL4);
            ka1.z(i8, p65Var, cuVar4, p65Var, fnVar);
            tp7.B(p65Var, cuVar5, r28VarR4);
            String strR = vo7.R(p65Var, R.string.responses_no_responses_title);
            sn3 sn3Var = kt7.b;
            long j5 = ((zo7) p65Var.j(sn3Var)).n;
            sn3 sn3Var2 = jt7.c;
            o28 o28Var3 = o28Var;
            jjd.b(strR, jfc.d(o28Var, 1.0f), j5, 0L, 0L, null, new jgd(i2), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).e, p65Var, 48, 0, 130040);
            jjd.b(vo7.R(p65Var, yhbVar.g ? R.string.responses_post_no_responses_content : R.string.responses_catalog_no_responses_content), jfc.d(o28Var3, 1.0f), ((zo7) p65Var.j(sn3Var)).o, 0L, 0L, null, new jgd(i2), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var, 48, 0, 130040);
            p65Var = p65Var;
            ho2.N(p65Var, true, true, true, true);
            obj = o28Var3;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 11, yhbVar, lgbVar, obj);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01fa  */
    /* JADX WARN: Removed duplicated region for block: B:72:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(boolean r32, java.lang.String r33, defpackage.lgb r34, defpackage.r28 r35, defpackage.x12 r36, int r37, int r38) {
        /*
            Method dump skipped, instruction units count: 518
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pgb.e(boolean, java.lang.String, lgb, r28, x12, int, int):void");
    }

    public static final void f(uid uidVar, aib aibVar, kv6 kv6Var, nhc nhcVar, lgb lgbVar, ngb ngbVar, r28 r28Var, x12 x12Var, int i) {
        nhc nhcVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(790054501);
        int i2 = i | (p65Var.f(uidVar) ? 4 : 2) | (p65Var.f(aibVar) ? 32 : 16) | (p65Var.f(kv6Var) ? 256 : 128) | (p65Var.f(lgbVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(ngbVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288);
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            mz1 mz1VarE = pxf.E(-1298620311, new q6b(aibVar, lgbVar, zu.a(nk7.o0(kv6Var), null, "Top bar elevation", p65Var, 384, 10), 9), p65Var);
            nhcVar2 = nhcVar;
            mz1 mz1VarE2 = pxf.E(-1052812437, new w87(nhcVar2, 24), p65Var);
            y0e y0eVarV = hk7.v(p65Var);
            WeakHashMap weakHashMap = f5f.w;
            pr7.b(r28Var, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, new y0e(y0eVarV, tr7.o(p65Var).c), pxf.E(675367348, new g91(aibVar, lgbVar, ngbVar, kv6Var, uidVar), p65Var), p65Var, ((i2 >> 18) & 14) | 805309488, 244);
        } else {
            nhcVar2 = nhcVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(uidVar, aibVar, kv6Var, nhcVar2, lgbVar, ngbVar, r28Var, i, 10);
        }
    }

    public static final void g(String str, ResponsesReference responsesReference, xfb xfbVar, r28 r28Var, nib nibVar, x12 x12Var, int i) {
        nib nibVar2;
        nib nibVar3;
        r28 r28Var2;
        final nib nibVar4;
        nib nibVar5;
        final int i2;
        nib nibVar6;
        str.getClass();
        responsesReference.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1043435882);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(responsesReference) ? 32 : 16) | (p65Var.f(xfbVar) ? 256 : 128) | 11264;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new pda(str, 10, responsesReference);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    nibVar3 = (nib) to7.z(n1b.a.b(nib.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var2 = o28.b;
                }
            } else {
                p65Var.S();
                r28Var2 = r28Var;
                nibVar3 = nibVar;
            }
            p65Var.q();
            Resources resources = (Resources) p65Var.j(eo.c);
            int i5 = (int) (-((m73) p65Var.j(z22.h)).Z(28.0f));
            l78 l78VarZ = guc.z(nibVar3.Q, p65Var, 0);
            l78 l78VarZ2 = guc.z(nibVar3.O, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            kv6 kv6VarA = pv6.a(p65Var);
            nib nibVar7 = nibVar3;
            r28Var = r28Var2;
            final int i6 = 0;
            f(nibVar7.f(), (aib) l78VarZ2.getValue(), kv6VarA, nhcVar, new lgb(l78VarZ2, xfbVar, nibVar3), new ngb(l78VarZ2, xfbVar, nibVar3), r28Var2.b(jfc.c), p65Var, 3072);
            boolean zH = p65Var.h(nibVar7);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                objM3 = new igb(nibVar7, null, 0);
                p65Var.j0(objM3);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(nibVar7) | p65Var.h(resources) | p65Var.f(kv6VarA);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new rna(nibVar7, nhcVar, resources, kv6VarA, null, 11);
                nibVar4 = nibVar7;
                p65Var.j0(objM4);
            } else {
                nibVar4 = nibVar7;
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = bjc.b(new z7b(l78VarZ2, 13));
                p65Var.j0(objM5);
            }
            upc upcVar = (upc) objM5;
            String str2 = (String) upcVar.getValue();
            boolean zF = p65Var.f(l78VarZ2) | p65Var.f(kv6VarA) | p65Var.d(i5);
            Object objM6 = p65Var.M();
            if (zF || objM6 == uobVar) {
                objM6 = new o9(kv6VarA, i5, upcVar, l78VarZ2, null, 6);
                p65Var.j0(objM6);
            }
            kyd.k(p65Var, (b55) objM6, str2);
            boolean zF2 = p65Var.f(kv6VarA) | p65Var.h(nibVar4);
            Object objM7 = p65Var.M();
            if (zF2 || objM7 == uobVar) {
                objM7 = new nx9(kv6VarA, nibVar4, null, 24);
                p65Var.j0(objM7);
            }
            kyd.k(p65Var, (b55) objM7, kv6VarA);
            wua wuaVarA = bo.A(((ky6) ((iy6) p65Var.j(y57.a)).getLifecycle()).j);
            l78 l78VarL = no7.l(wuaVarA, wuaVarA.getValue(), p65Var, 0, 0);
            vx6 vx6Var = (vx6) l78VarL.getValue();
            boolean zF3 = p65Var.f(l78VarL) | p65Var.h(nibVar4);
            Object objM8 = p65Var.M();
            if (zF3 || objM8 == uobVar) {
                objM8 = new n79(nibVar4, l78VarL, null, 14);
                p65Var.j0(objM8);
            }
            kyd.k(p65Var, (b55) objM8, vx6Var);
            ahb ahbVar = (ahb) l78VarZ.getValue();
            if (ahbVar instanceof zgb) {
                p65Var.Y(1991996264);
                boolean zH3 = p65Var.h(nibVar4);
                Object objM9 = p65Var.M();
                if (zH3 || objM9 == uobVar) {
                    objM9 = new bgb(nibVar4, 7);
                    p65Var.j0(objM9);
                }
                m45 m45Var = (m45) objM9;
                final int i7 = 3;
                mz1 mz1VarE = pxf.E(-390647098, new b55() { // from class: cgb
                    @Override // defpackage.b55
                    public final Object invoke(Object obj, Object obj2) {
                        int i8 = i7;
                        c1e c1eVar2 = c1e.a;
                        uob uobVar2 = w12.a;
                        nib nibVar8 = nibVar4;
                        switch (i8) {
                            case 0:
                                x12 x12Var2 = (x12) obj;
                                int iIntValue = ((Integer) obj2).intValue();
                                p65 p65Var2 = (p65) x12Var2;
                                if (!p65Var2.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                                    p65Var2.S();
                                } else {
                                    boolean zH4 = p65Var2.h(nibVar8);
                                    Object objM10 = p65Var2.M();
                                    if (zH4 || objM10 == uobVar2) {
                                        objM10 = new bgb(nibVar8, 3);
                                        p65Var2.j0(objM10);
                                    }
                                    f76.w((m45) objM10, null, false, null, null, null, yi2.q, p65Var2, 805306368, 510);
                                }
                                break;
                            case 1:
                                x12 x12Var3 = (x12) obj;
                                int iIntValue2 = ((Integer) obj2).intValue();
                                p65 p65Var3 = (p65) x12Var3;
                                if (!p65Var3.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                                    p65Var3.S();
                                } else {
                                    boolean zH5 = p65Var3.h(nibVar8);
                                    Object objM11 = p65Var3.M();
                                    if (zH5 || objM11 == uobVar2) {
                                        objM11 = new bgb(nibVar8, 5);
                                        p65Var3.j0(objM11);
                                    }
                                    f76.w((m45) objM11, null, false, null, null, null, yi2.t, p65Var3, 805306368, 510);
                                }
                                break;
                            case 2:
                                x12 x12Var4 = (x12) obj;
                                int iIntValue3 = ((Integer) obj2).intValue();
                                p65 p65Var4 = (p65) x12Var4;
                                if (!p65Var4.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                                    p65Var4.S();
                                } else {
                                    boolean zH6 = p65Var4.h(nibVar8);
                                    Object objM12 = p65Var4.M();
                                    if (zH6 || objM12 == uobVar2) {
                                        objM12 = new bgb(nibVar8, 2);
                                        p65Var4.j0(objM12);
                                    }
                                    f76.w((m45) objM12, null, false, null, null, null, yi2.u, p65Var4, 805306368, 510);
                                }
                                break;
                            case 3:
                                x12 x12Var5 = (x12) obj;
                                int iIntValue4 = ((Integer) obj2).intValue();
                                p65 p65Var5 = (p65) x12Var5;
                                if (!p65Var5.P(1 & iIntValue4, (iIntValue4 & 3) != 2)) {
                                    p65Var5.S();
                                } else {
                                    boolean zH7 = p65Var5.h(nibVar8);
                                    Object objM13 = p65Var5.M();
                                    if (zH7 || objM13 == uobVar2) {
                                        objM13 = new bgb(nibVar8, 6);
                                        p65Var5.j0(objM13);
                                    }
                                    f76.w((m45) objM13, null, false, null, null, null, yi2.m, p65Var5, 805306368, 510);
                                }
                                break;
                            default:
                                x12 x12Var6 = (x12) obj;
                                int iIntValue5 = ((Integer) obj2).intValue();
                                p65 p65Var6 = (p65) x12Var6;
                                if (!p65Var6.P(1 & iIntValue5, (iIntValue5 & 3) != 2)) {
                                    p65Var6.S();
                                } else {
                                    boolean zH8 = p65Var6.h(nibVar8);
                                    Object objM14 = p65Var6.M();
                                    if (zH8 || objM14 == uobVar2) {
                                        objM14 = new bgb(nibVar8, 4);
                                        p65Var6.j0(objM14);
                                    }
                                    f76.w((m45) objM14, null, false, null, null, null, yi2.n, p65Var6, 805306368, 510);
                                }
                                break;
                        }
                        return c1eVar2;
                    }
                }, p65Var);
                final int i8 = 4;
                mz1 mz1VarE2 = pxf.E(1133115524, new b55() { // from class: cgb
                    @Override // defpackage.b55
                    public final Object invoke(Object obj, Object obj2) {
                        int i82 = i8;
                        c1e c1eVar2 = c1e.a;
                        uob uobVar2 = w12.a;
                        nib nibVar8 = nibVar4;
                        switch (i82) {
                            case 0:
                                x12 x12Var2 = (x12) obj;
                                int iIntValue = ((Integer) obj2).intValue();
                                p65 p65Var2 = (p65) x12Var2;
                                if (!p65Var2.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                                    p65Var2.S();
                                } else {
                                    boolean zH4 = p65Var2.h(nibVar8);
                                    Object objM10 = p65Var2.M();
                                    if (zH4 || objM10 == uobVar2) {
                                        objM10 = new bgb(nibVar8, 3);
                                        p65Var2.j0(objM10);
                                    }
                                    f76.w((m45) objM10, null, false, null, null, null, yi2.q, p65Var2, 805306368, 510);
                                }
                                break;
                            case 1:
                                x12 x12Var3 = (x12) obj;
                                int iIntValue2 = ((Integer) obj2).intValue();
                                p65 p65Var3 = (p65) x12Var3;
                                if (!p65Var3.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                                    p65Var3.S();
                                } else {
                                    boolean zH5 = p65Var3.h(nibVar8);
                                    Object objM11 = p65Var3.M();
                                    if (zH5 || objM11 == uobVar2) {
                                        objM11 = new bgb(nibVar8, 5);
                                        p65Var3.j0(objM11);
                                    }
                                    f76.w((m45) objM11, null, false, null, null, null, yi2.t, p65Var3, 805306368, 510);
                                }
                                break;
                            case 2:
                                x12 x12Var4 = (x12) obj;
                                int iIntValue3 = ((Integer) obj2).intValue();
                                p65 p65Var4 = (p65) x12Var4;
                                if (!p65Var4.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                                    p65Var4.S();
                                } else {
                                    boolean zH6 = p65Var4.h(nibVar8);
                                    Object objM12 = p65Var4.M();
                                    if (zH6 || objM12 == uobVar2) {
                                        objM12 = new bgb(nibVar8, 2);
                                        p65Var4.j0(objM12);
                                    }
                                    f76.w((m45) objM12, null, false, null, null, null, yi2.u, p65Var4, 805306368, 510);
                                }
                                break;
                            case 3:
                                x12 x12Var5 = (x12) obj;
                                int iIntValue4 = ((Integer) obj2).intValue();
                                p65 p65Var5 = (p65) x12Var5;
                                if (!p65Var5.P(1 & iIntValue4, (iIntValue4 & 3) != 2)) {
                                    p65Var5.S();
                                } else {
                                    boolean zH7 = p65Var5.h(nibVar8);
                                    Object objM13 = p65Var5.M();
                                    if (zH7 || objM13 == uobVar2) {
                                        objM13 = new bgb(nibVar8, 6);
                                        p65Var5.j0(objM13);
                                    }
                                    f76.w((m45) objM13, null, false, null, null, null, yi2.m, p65Var5, 805306368, 510);
                                }
                                break;
                            default:
                                x12 x12Var6 = (x12) obj;
                                int iIntValue5 = ((Integer) obj2).intValue();
                                p65 p65Var6 = (p65) x12Var6;
                                if (!p65Var6.P(1 & iIntValue5, (iIntValue5 & 3) != 2)) {
                                    p65Var6.S();
                                } else {
                                    boolean zH8 = p65Var6.h(nibVar8);
                                    Object objM14 = p65Var6.M();
                                    if (zH8 || objM14 == uobVar2) {
                                        objM14 = new bgb(nibVar8, 4);
                                        p65Var6.j0(objM14);
                                    }
                                    f76.w((m45) objM14, null, false, null, null, null, yi2.n, p65Var6, 805306368, 510);
                                }
                                break;
                        }
                        return c1eVar2;
                    }
                }, p65Var);
                mz1 mz1Var = yi2.o;
                mz1 mz1VarE3 = pxf.E(-876207839, new h9b(5, (zgb) ahbVar), p65Var);
                nibVar6 = nibVar4;
                hlg.a(m45Var, mz1VarE, null, mz1VarE2, null, mz1Var, mz1VarE3, null, 0L, 0L, 0L, 0L, null, p65Var, 1772592, 0, 16276);
                p65Var = p65Var;
                p65Var.p(false);
            } else {
                final nib nibVar8 = nibVar4;
                if (ahbVar instanceof xgb) {
                    p65Var.Y(1992983552);
                    boolean zH4 = p65Var.h(nibVar8);
                    Object objM10 = p65Var.M();
                    if (zH4 || objM10 == uobVar) {
                        objM10 = new bgb(nibVar8, 0);
                        p65Var.j0(objM10);
                    }
                    nibVar6 = nibVar8;
                    hlg.a((m45) objM10, pxf.E(1782454063, new pma(nibVar8, 20, (xgb) ahbVar), p65Var), null, pxf.E(1534485869, new b55() { // from class: cgb
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i82 = i6;
                            c1e c1eVar2 = c1e.a;
                            uob uobVar2 = w12.a;
                            nib nibVar82 = nibVar8;
                            switch (i82) {
                                case 0:
                                    x12 x12Var2 = (x12) obj;
                                    int iIntValue = ((Integer) obj2).intValue();
                                    p65 p65Var2 = (p65) x12Var2;
                                    if (!p65Var2.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                                        p65Var2.S();
                                    } else {
                                        boolean zH42 = p65Var2.h(nibVar82);
                                        Object objM102 = p65Var2.M();
                                        if (zH42 || objM102 == uobVar2) {
                                            objM102 = new bgb(nibVar82, 3);
                                            p65Var2.j0(objM102);
                                        }
                                        f76.w((m45) objM102, null, false, null, null, null, yi2.q, p65Var2, 805306368, 510);
                                    }
                                    break;
                                case 1:
                                    x12 x12Var3 = (x12) obj;
                                    int iIntValue2 = ((Integer) obj2).intValue();
                                    p65 p65Var3 = (p65) x12Var3;
                                    if (!p65Var3.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                                        p65Var3.S();
                                    } else {
                                        boolean zH5 = p65Var3.h(nibVar82);
                                        Object objM11 = p65Var3.M();
                                        if (zH5 || objM11 == uobVar2) {
                                            objM11 = new bgb(nibVar82, 5);
                                            p65Var3.j0(objM11);
                                        }
                                        f76.w((m45) objM11, null, false, null, null, null, yi2.t, p65Var3, 805306368, 510);
                                    }
                                    break;
                                case 2:
                                    x12 x12Var4 = (x12) obj;
                                    int iIntValue3 = ((Integer) obj2).intValue();
                                    p65 p65Var4 = (p65) x12Var4;
                                    if (!p65Var4.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                                        p65Var4.S();
                                    } else {
                                        boolean zH6 = p65Var4.h(nibVar82);
                                        Object objM12 = p65Var4.M();
                                        if (zH6 || objM12 == uobVar2) {
                                            objM12 = new bgb(nibVar82, 2);
                                            p65Var4.j0(objM12);
                                        }
                                        f76.w((m45) objM12, null, false, null, null, null, yi2.u, p65Var4, 805306368, 510);
                                    }
                                    break;
                                case 3:
                                    x12 x12Var5 = (x12) obj;
                                    int iIntValue4 = ((Integer) obj2).intValue();
                                    p65 p65Var5 = (p65) x12Var5;
                                    if (!p65Var5.P(1 & iIntValue4, (iIntValue4 & 3) != 2)) {
                                        p65Var5.S();
                                    } else {
                                        boolean zH7 = p65Var5.h(nibVar82);
                                        Object objM13 = p65Var5.M();
                                        if (zH7 || objM13 == uobVar2) {
                                            objM13 = new bgb(nibVar82, 6);
                                            p65Var5.j0(objM13);
                                        }
                                        f76.w((m45) objM13, null, false, null, null, null, yi2.m, p65Var5, 805306368, 510);
                                    }
                                    break;
                                default:
                                    x12 x12Var6 = (x12) obj;
                                    int iIntValue5 = ((Integer) obj2).intValue();
                                    p65 p65Var6 = (p65) x12Var6;
                                    if (!p65Var6.P(1 & iIntValue5, (iIntValue5 & 3) != 2)) {
                                        p65Var6.S();
                                    } else {
                                        boolean zH8 = p65Var6.h(nibVar82);
                                        Object objM14 = p65Var6.M();
                                        if (zH8 || objM14 == uobVar2) {
                                            objM14 = new bgb(nibVar82, 4);
                                            p65Var6.j0(objM14);
                                        }
                                        f76.w((m45) objM14, null, false, null, null, null, yi2.n, p65Var6, 805306368, 510);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, p65Var), null, yi2.r, yi2.s, null, 0L, 0L, 0L, 0L, null, p65Var, 1772592, 0, 16276);
                    p65Var = p65Var;
                    p65Var.p(false);
                } else {
                    if (ahbVar instanceof ygb) {
                        p65Var.Y(1993886179);
                        boolean zH5 = p65Var.h(nibVar8);
                        Object objM11 = p65Var.M();
                        if (zH5 || objM11 == uobVar) {
                            i2 = 1;
                            objM11 = new bgb(nibVar8, 1);
                            p65Var.j0(objM11);
                        } else {
                            i2 = 1;
                        }
                        final int i9 = 2;
                        nibVar5 = nibVar8;
                        hlg.a((m45) objM11, pxf.E(1389455118, new b55() { // from class: cgb
                            @Override // defpackage.b55
                            public final Object invoke(Object obj, Object obj2) {
                                int i82 = i2;
                                c1e c1eVar2 = c1e.a;
                                uob uobVar2 = w12.a;
                                nib nibVar82 = nibVar8;
                                switch (i82) {
                                    case 0:
                                        x12 x12Var2 = (x12) obj;
                                        int iIntValue = ((Integer) obj2).intValue();
                                        p65 p65Var2 = (p65) x12Var2;
                                        if (!p65Var2.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                                            p65Var2.S();
                                        } else {
                                            boolean zH42 = p65Var2.h(nibVar82);
                                            Object objM102 = p65Var2.M();
                                            if (zH42 || objM102 == uobVar2) {
                                                objM102 = new bgb(nibVar82, 3);
                                                p65Var2.j0(objM102);
                                            }
                                            f76.w((m45) objM102, null, false, null, null, null, yi2.q, p65Var2, 805306368, 510);
                                        }
                                        break;
                                    case 1:
                                        x12 x12Var3 = (x12) obj;
                                        int iIntValue2 = ((Integer) obj2).intValue();
                                        p65 p65Var3 = (p65) x12Var3;
                                        if (!p65Var3.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                                            p65Var3.S();
                                        } else {
                                            boolean zH52 = p65Var3.h(nibVar82);
                                            Object objM112 = p65Var3.M();
                                            if (zH52 || objM112 == uobVar2) {
                                                objM112 = new bgb(nibVar82, 5);
                                                p65Var3.j0(objM112);
                                            }
                                            f76.w((m45) objM112, null, false, null, null, null, yi2.t, p65Var3, 805306368, 510);
                                        }
                                        break;
                                    case 2:
                                        x12 x12Var4 = (x12) obj;
                                        int iIntValue3 = ((Integer) obj2).intValue();
                                        p65 p65Var4 = (p65) x12Var4;
                                        if (!p65Var4.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                                            p65Var4.S();
                                        } else {
                                            boolean zH6 = p65Var4.h(nibVar82);
                                            Object objM12 = p65Var4.M();
                                            if (zH6 || objM12 == uobVar2) {
                                                objM12 = new bgb(nibVar82, 2);
                                                p65Var4.j0(objM12);
                                            }
                                            f76.w((m45) objM12, null, false, null, null, null, yi2.u, p65Var4, 805306368, 510);
                                        }
                                        break;
                                    case 3:
                                        x12 x12Var5 = (x12) obj;
                                        int iIntValue4 = ((Integer) obj2).intValue();
                                        p65 p65Var5 = (p65) x12Var5;
                                        if (!p65Var5.P(1 & iIntValue4, (iIntValue4 & 3) != 2)) {
                                            p65Var5.S();
                                        } else {
                                            boolean zH7 = p65Var5.h(nibVar82);
                                            Object objM13 = p65Var5.M();
                                            if (zH7 || objM13 == uobVar2) {
                                                objM13 = new bgb(nibVar82, 6);
                                                p65Var5.j0(objM13);
                                            }
                                            f76.w((m45) objM13, null, false, null, null, null, yi2.m, p65Var5, 805306368, 510);
                                        }
                                        break;
                                    default:
                                        x12 x12Var6 = (x12) obj;
                                        int iIntValue5 = ((Integer) obj2).intValue();
                                        p65 p65Var6 = (p65) x12Var6;
                                        if (!p65Var6.P(1 & iIntValue5, (iIntValue5 & 3) != 2)) {
                                            p65Var6.S();
                                        } else {
                                            boolean zH8 = p65Var6.h(nibVar82);
                                            Object objM14 = p65Var6.M();
                                            if (zH8 || objM14 == uobVar2) {
                                                objM14 = new bgb(nibVar82, 4);
                                                p65Var6.j0(objM14);
                                            }
                                            f76.w((m45) objM14, null, false, null, null, null, yi2.n, p65Var6, 805306368, 510);
                                        }
                                        break;
                                }
                                return c1eVar2;
                            }
                        }, p65Var), null, pxf.E(1141486924, new b55() { // from class: cgb
                            @Override // defpackage.b55
                            public final Object invoke(Object obj, Object obj2) {
                                int i82 = i9;
                                c1e c1eVar2 = c1e.a;
                                uob uobVar2 = w12.a;
                                nib nibVar82 = nibVar8;
                                switch (i82) {
                                    case 0:
                                        x12 x12Var2 = (x12) obj;
                                        int iIntValue = ((Integer) obj2).intValue();
                                        p65 p65Var2 = (p65) x12Var2;
                                        if (!p65Var2.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                                            p65Var2.S();
                                        } else {
                                            boolean zH42 = p65Var2.h(nibVar82);
                                            Object objM102 = p65Var2.M();
                                            if (zH42 || objM102 == uobVar2) {
                                                objM102 = new bgb(nibVar82, 3);
                                                p65Var2.j0(objM102);
                                            }
                                            f76.w((m45) objM102, null, false, null, null, null, yi2.q, p65Var2, 805306368, 510);
                                        }
                                        break;
                                    case 1:
                                        x12 x12Var3 = (x12) obj;
                                        int iIntValue2 = ((Integer) obj2).intValue();
                                        p65 p65Var3 = (p65) x12Var3;
                                        if (!p65Var3.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                                            p65Var3.S();
                                        } else {
                                            boolean zH52 = p65Var3.h(nibVar82);
                                            Object objM112 = p65Var3.M();
                                            if (zH52 || objM112 == uobVar2) {
                                                objM112 = new bgb(nibVar82, 5);
                                                p65Var3.j0(objM112);
                                            }
                                            f76.w((m45) objM112, null, false, null, null, null, yi2.t, p65Var3, 805306368, 510);
                                        }
                                        break;
                                    case 2:
                                        x12 x12Var4 = (x12) obj;
                                        int iIntValue3 = ((Integer) obj2).intValue();
                                        p65 p65Var4 = (p65) x12Var4;
                                        if (!p65Var4.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                                            p65Var4.S();
                                        } else {
                                            boolean zH6 = p65Var4.h(nibVar82);
                                            Object objM12 = p65Var4.M();
                                            if (zH6 || objM12 == uobVar2) {
                                                objM12 = new bgb(nibVar82, 2);
                                                p65Var4.j0(objM12);
                                            }
                                            f76.w((m45) objM12, null, false, null, null, null, yi2.u, p65Var4, 805306368, 510);
                                        }
                                        break;
                                    case 3:
                                        x12 x12Var5 = (x12) obj;
                                        int iIntValue4 = ((Integer) obj2).intValue();
                                        p65 p65Var5 = (p65) x12Var5;
                                        if (!p65Var5.P(1 & iIntValue4, (iIntValue4 & 3) != 2)) {
                                            p65Var5.S();
                                        } else {
                                            boolean zH7 = p65Var5.h(nibVar82);
                                            Object objM13 = p65Var5.M();
                                            if (zH7 || objM13 == uobVar2) {
                                                objM13 = new bgb(nibVar82, 6);
                                                p65Var5.j0(objM13);
                                            }
                                            f76.w((m45) objM13, null, false, null, null, null, yi2.m, p65Var5, 805306368, 510);
                                        }
                                        break;
                                    default:
                                        x12 x12Var6 = (x12) obj;
                                        int iIntValue5 = ((Integer) obj2).intValue();
                                        p65 p65Var6 = (p65) x12Var6;
                                        if (!p65Var6.P(1 & iIntValue5, (iIntValue5 & 3) != 2)) {
                                            p65Var6.S();
                                        } else {
                                            boolean zH8 = p65Var6.h(nibVar82);
                                            Object objM14 = p65Var6.M();
                                            if (zH8 || objM14 == uobVar2) {
                                                objM14 = new bgb(nibVar82, 4);
                                                p65Var6.j0(objM14);
                                            }
                                            f76.w((m45) objM14, null, false, null, null, null, yi2.n, p65Var6, 805306368, 510);
                                        }
                                        break;
                                }
                                return c1eVar2;
                            }
                        }, p65Var), null, yi2.v, pxf.E(-1377949015, new h9b(4, (ygb) ahbVar), p65Var), null, 0L, 0L, 0L, 0L, null, p65Var, 1772592, 0, 16276);
                        p65Var = p65Var;
                        p65Var.p(false);
                    } else {
                        nibVar5 = nibVar8;
                        if (ahbVar != null) {
                            throw ho2.L(p65Var, -2013953076, false);
                        }
                        p65Var.Y(-2013862438);
                        p65Var.p(false);
                    }
                    nibVar2 = nibVar5;
                }
            }
            nibVar5 = nibVar6;
            nibVar2 = nibVar5;
        } else {
            p65Var.S();
            nibVar2 = nibVar;
        }
        r28 r28Var3 = r28Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) responsesReference, (Object) xfbVar, r28Var3, (que) nibVar2, i, 25);
        }
    }

    public static final void h(aib aibVar, lgb lgbVar, r28 r28Var, x12 x12Var, int i) {
        String strW;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1732810389);
        int i2 = i | (p65Var.f(aibVar) ? 4 : 2) | (p65Var.f(lgbVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z7 = aibVar instanceof xhb;
            if (z7 || (aibVar instanceof vhb) || (aibVar instanceof yhb)) {
                p65Var.Y(-942014456);
                int i3 = ogb.a[aibVar.d().ordinal()];
                strW = i3 != 1 ? i3 != 2 ? km4.w(p65Var, 1216548243, R.string.responses_title, p65Var, false) : km4.w(p65Var, 1216545437, R.string.highlight_responses_title, p65Var, false) : km4.w(p65Var, 1216541393, R.string.replies_title, p65Var, false);
                p65Var.p(false);
            } else if (aibVar instanceof zhb) {
                p65Var.Y(1216552103);
                zhb zhbVar = (zhb) aibVar;
                long j = zhbVar.d;
                ResponsesReference.ResponseViewType responseViewType = zhbVar.m;
                if (responseViewType == ResponsesReference.ResponseViewType.Replies) {
                    strW = km4.w(p65Var, 1216554929, R.string.replies_title, p65Var, false);
                } else if (responseViewType == ResponsesReference.ResponseViewType.HighlightResponses) {
                    strW = km4.w(p65Var, 1216559677, R.string.highlight_responses_title, p65Var, false);
                } else if (j > 0) {
                    p65Var.Y(1216563299);
                    strW = vo7.Q(R.string.responses_title_with_count, new Object[]{String.valueOf(j)}, p65Var);
                    p65Var.p(false);
                } else {
                    strW = km4.w(p65Var, 1216567283, R.string.responses_title, p65Var, false);
                }
                p65Var.p(false);
            } else {
                if (!(aibVar instanceof whb)) {
                    throw ho2.L(p65Var, 1216533455, false);
                }
                strW = km4.w(p65Var, 1216570835, R.string.responses_title, p65Var, false);
            }
            String str = strW;
            boolean z8 = aibVar instanceof vhb;
            if (z8 || z7 || (aibVar instanceof whb)) {
                z = false;
            } else {
                if (aibVar instanceof yhb) {
                    z6 = ((yhb) aibVar).d;
                } else {
                    if (!(aibVar instanceof zhb)) {
                        ygf.a();
                        return;
                    }
                    z6 = ((zhb) aibVar).f;
                }
                z = z6;
            }
            boolean z9 = aibVar instanceof whb;
            if (z9) {
                z2 = true;
            } else {
                if (!z8 && !z7 && !(aibVar instanceof yhb) && !(aibVar instanceof zhb)) {
                    ygf.a();
                    return;
                }
                z2 = false;
            }
            if (z8 || z7 || z9) {
                z3 = false;
            } else {
                if (aibVar instanceof yhb) {
                    z5 = ((yhb) aibVar).e;
                } else {
                    if (!(aibVar instanceof zhb)) {
                        ygf.a();
                        return;
                    }
                    z5 = ((zhb) aibVar).g;
                }
                z3 = z5;
            }
            if (z8 || z7) {
                z4 = false;
            } else if (z9) {
                z4 = ((whb) aibVar).d;
            } else if (aibVar instanceof yhb) {
                z4 = ((yhb) aibVar).f;
            } else {
                if (!(aibVar instanceof zhb)) {
                    ygf.a();
                    return;
                }
                z4 = ((zhb) aibVar).h;
            }
            boolean z10 = aibVar instanceof zhb ? ((zhb) aibVar).i : false;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.common_close);
            boolean z11 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z11 || objM2 == uobVar) {
                objM2 = new uta(0, lgbVar, lgb.class, "onBackPressed", "onBackPressed()V", 0, 28);
                p65Var.j0(objM2);
            }
            qk7.g(r28Var, str, (m45) ((qh6) objM2), pxf.E(737261266, new dgb(lgbVar, aibVar, z3, z4, z10, l78Var, z, z2), p65Var), c09VarJ, strR, 0L, 0L, null, p65Var, ((i2 >> 6) & 14) | 35840, 448);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 10, aibVar, lgbVar, r28Var);
        }
    }

    public static final void d(zhb zhbVar, lgb lgbVar, ngb ngbVar, kv6 kv6Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-53492871);
        int i2 = i | (p65Var.f(zhbVar) ? 4 : 2) | (p65Var.f(lgbVar) ? 32 : 16) | (p65Var.f(ngbVar) ? 256 : 128) | (p65Var.f(kv6Var) ? 2048 : 1024) | 24576;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            boolean z = zhbVar.e;
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i3 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                uta utaVar = new uta(0, lgbVar, lgb.class, "refresh", MaAxRJinch.XCYKlqkDG, 0, 24);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            mz1 mz1VarE = pxf.E(-376048597, new fd3(kv6Var, (Object) zhbVar, (Object) lgbVar, (Object) ngbVar, 5), p65Var);
            o28 o28Var = o28.b;
            er7.d(z, (m45) ((qh6) objM), o28Var, null, 0L, 0L, false, 0.0f, null, null, mz1VarE, p65Var, 384, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            String str = zhbVar.l;
            boolean z3 = ((i2 & 7168) == 2048) | ((i2 & 14) == 4) | (i3 == 32);
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                mw9 mw9Var = new mw9(zhbVar, kv6Var, lgbVar, (n92) null, 17);
                p65Var.j0(mw9Var);
                objM2 = mw9Var;
            }
            kyd.k(p65Var, (b55) objM2, str);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(zhbVar, lgbVar, ngbVar, kv6Var, r28Var2, i);
        }
    }
}
