package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.apollographql.apollo.exception.ApolloException;
import com.apollographql.apollo.exception.CacheMissException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class gsa {
    public static final mz1 a = new mz1(new p02(27), false, -1292850965);
    public static final mz1 b = new mz1(new p02(28), false, -1794755422);
    public static final mz1 c = new mz1(new p02(29), false, 1215109899);
    public static final mz1 d = new mz1(new f02(16), false, -2024498987);
    public static final mz1 e = new mz1(new f02(17), false, 962606696);
    public static final mz1 f = new mz1(new n02(23), false, 514927673);
    public static final u2f g = new u2f(0.31006f, 0.31616f);
    public static final u2f h = new u2f(0.34567f, 0.3585f);
    public static final u2f i = new u2f(0.32168f, 0.33767f);
    public static final u2f j = new u2f(0.31271f, 0.32902f);
    public static final float[] k = {0.964212f, 1.0f, 0.825188f};
    public static final h1c l = new h1c(25);
    public static final /* synthetic */ int m = 0;

    public static final void A(boolean z, wc0 wc0Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1281069502);
        int i3 = i2 | (p65Var.g(z) ? 4 : 2) | (p65Var.f(wc0Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new s0(6, wc0Var);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            r28 r28VarY = r40.y(jfc.d(r28Var, 1.0f), bmb.a(4.0f));
            vkb vkbVar = new vkb(1);
            int i5 = i3 & 14;
            boolean zF = (i5 == 4) | p65Var.f(x45Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new ic0(x45Var, z, i4);
                p65Var.j0(objM2);
            }
            r28 r28VarQ = hlg.Q(r28VarY, z, vkbVar, (m45) objM2);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarQ);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            iy0 iy0Var = iy0.a;
            ar0 ar0Var = z46.h;
            o28 o28Var = o28.b;
            r28 r28VarA = iy0Var.a(o28Var, ar0Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarA);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            vo7.b(z, x45Var, w2g.G(bgf.N(o28Var, "remember_me_checkbox"), 0.0f, 0.0f, 0.0f, 0.0f, 14), false, null, p65Var, i5 | 384, 24);
            jjd.b(y30.n(4.0f, R.string.susi_auth_remember_me, p65Var, p65Var, o28Var), bgf.N(o28Var, "remember_me_label"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 15.0f));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jc0(z, wc0Var, r28Var, i2, 0);
        }
    }

    public static final void B(yab yabVar, mab mabVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object utaVar;
        yab yabVar2 = yabVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1488451196);
        int i3 = i2 | (p65Var.f(yabVar2) ? 4 : 2) | (p65Var.f(mabVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "error_state").b(jfc.c), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            yabVar2 = yabVar;
            b24 b24Var = yabVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                utaVar = new uta(0, mabVar, mab.class, "refresh", "refresh()V", 0, 19);
                p65Var.j0(utaVar);
            } else {
                utaVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(o28Var, ar0Var), null, null, null, null, (m45) ((qh6) utaVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 7, yabVar2, mabVar, r28Var);
        }
    }

    public static final void C(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2093530676);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(bgf.N(r28Var, "loading_state").b(jfc.c), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1757332941);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                char c3 = c2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                tr7.g(0, 1, p65Var, null);
                iR = wgd.r(p65Var, true, true, iR, 1);
                z = true;
                c2 = c3;
            }
            p65Var.p(false);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 22);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x011f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void D(defpackage.abb r33, defpackage.kv6 r34, defpackage.mab r35, defpackage.obe r36, defpackage.nab r37, defpackage.r28 r38, defpackage.x12 r39, int r40) {
        /*
            Method dump skipped, instruction units count: 336
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.D(abb, kv6, mab, obe, nab, r28, x12, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:90:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void E(defpackage.bbb r27, defpackage.nhc r28, defpackage.mab r29, defpackage.obe r30, defpackage.nab r31, defpackage.r28 r32, defpackage.pab r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 422
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.E(bbb, nhc, mab, obe, nab, r28, pab, x12, int, int):void");
    }

    public static final void F(String str, String str2, jab jabVar, r28 r28Var, jbb jbbVar, x12 x12Var, int i2) {
        jbb jbbVar2;
        int i3;
        jbb jbbVar3;
        jbb jbbVar4;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-227447321);
        int i4 = 16;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(jabVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    jbb jbbVar5 = (jbb) to7.z(n1b.a.b(jbb.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i5 & (-57345);
                    jbbVar3 = jbbVar5;
                }
            } else {
                p65Var.S();
                i3 = i5 & (-57345);
                jbbVar3 = jbbVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(jbbVar3.r, p65Var, 0);
            l78 l78VarZ2 = guc.z(jbbVar3.p, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            Context context = (Context) p65Var.j(eo.b);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            int i7 = i3 & 896;
            boolean zF = (i7 == 256) | p65Var.f(jbbVar3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new mab(jabVar, jbbVar3, str);
                p65Var.j0(objM3);
            }
            mab mabVar = (mab) objM3;
            boolean zF2 = p65Var.f(jbbVar3) | (i7 == 256);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new nab(jabVar, jbbVar3, context, mabVar);
                p65Var.j0(objM4);
            }
            nab nabVar = (nab) objM4;
            boolean zF3 = p65Var.f(nabVar);
            Object objM5 = p65Var.M();
            if (zF3 || objM5 == uobVar) {
                objM5 = new oab(nabVar);
                p65Var.j0(objM5);
            }
            oab oabVar = (oab) objM5;
            E((bbb) l78VarZ.getValue(), nhcVarF, mabVar, oabVar, nabVar, r28Var, (pab) l78VarZ2.getValue(), p65Var, (i3 << 6) & 458752, 0);
            boolean zH = p65Var.h(jbbVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(oabVar);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                jbbVar4 = jbbVar3;
                uk8 uk8Var = new uk8(jbbVar4, nhcVarF, sb2Var, resources, oabVar, (n92) null, 22);
                p65Var.j0(uk8Var);
                objM6 = uk8Var;
            } else {
                jbbVar4 = jbbVar3;
            }
            kyd.k(p65Var, (b55) objM6, c1e.a);
            jbbVar2 = jbbVar4;
        } else {
            p65Var.S();
            jbbVar2 = jbbVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) jabVar, r28Var, (que) jbbVar2, i2, 23);
        }
    }

    public static final void G(bbb bbbVar, float f2, mab mabVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        String str;
        String strD;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(11669495);
        int i3 = i2 | (p65Var.f(bbbVar) ? 4 : 2) | (p65Var.c(f2) ? 32 : 16) | (p65Var.f(mabVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            str = "";
            if (bbbVar instanceof abb) {
                p65Var.Y(-246150552);
                Integer num = ((abb) bbbVar).a;
                if (num == null) {
                    p65Var.Y(-246128636);
                    p65Var.p(false);
                    strD = null;
                } else {
                    p65Var.Y(-246128635);
                    int iIntValue = num.intValue();
                    strD = vo7.D(R.plurals.reposters_title, iIntValue, new Object[]{dq1.g(Integer.valueOf(iIntValue))}, p65Var);
                    p65Var.p(false);
                }
                str = strD != null ? strD : "";
                p65Var.p(false);
            } else if (bbbVar instanceof yab) {
                p65Var.Y(-245871833);
                p65Var.p(false);
            } else {
                if (!(bbbVar instanceof zab)) {
                    throw ho2.L(p65Var, -1670510714, false);
                }
                p65Var.Y(-245818265);
                p65Var.p(false);
            }
            String str2 = str;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarW = wo7.w(o28Var, f2, nr5Var, 0L, 0L, 28);
            boolean z = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                uta utaVar = new uta(0, mabVar, mab.class, "onBackPressed", "onBackPressed()V", 0, 22);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            qk7.g(r28VarW, str2, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 504);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(bbbVar, f2, mabVar, r28Var2, i2, 5);
        }
    }

    public static final void H(ld0 ld0Var, qc0 qc0Var, r28 r28Var, x12 x12Var, int i2) {
        String str = ld0Var.e;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1464962086);
        int i3 = i2 | (p65Var.f(ld0Var) ? 4 : 2) | (p65Var.f(qc0Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            int i4 = xc0.b[ld0Var.g.ordinal()];
            if (i4 == 1) {
                p65Var.Y(920715624);
                r(ld0Var.h, qc0Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_CAPTION, 0);
                p65Var.p(false);
            } else if (i4 == 2) {
                p65Var.Y(920721226);
                q(ld0Var.h, qc0Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_CAPTION, 0);
                p65Var.p(false);
            } else if (i4 == 3) {
                p65Var.Y(920726777);
                d(str, qc0Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_CAPTION, 0);
                p65Var.p(false);
            } else if (i4 == 4) {
                p65Var.Y(920731595);
                S(qc0Var, r28Var, p65Var, (i3 >> 3) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, 0);
                p65Var.p(false);
            } else {
                if (i4 != 5) {
                    throw ho2.L(p65Var, 920714525, false);
                }
                p65Var.Y(920734390);
                o(ld0Var.h, ld0Var.f, str, ld0Var.d, qc0Var, r28Var, p65Var, (i3 << 9) & 516096, 0);
                p65Var = p65Var;
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 27, ld0Var, qc0Var, r28Var);
        }
    }

    public static final void I(md0 md0Var, wc0 wc0Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        wc0 wc0Var2;
        String str;
        String str2 = md0Var.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1694157993);
        int i3 = i2 | (p65Var.f(md0Var) ? 4 : 2) | (p65Var.f(wc0Var) ? 32 : 16) | 384;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(new h70(16.0f, false, new f70(i4, z46.n)), z46.p, p65Var, 6);
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
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
            boolean z = md0Var.f;
            SusiOperation susiOperation = md0Var.a;
            if (z) {
                p65Var.Y(-1938788269);
                r(md0Var.a, wc0Var, null, p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 4);
            } else {
                p65Var.Y(-1963477227);
            }
            p65Var.p(false);
            if (md0Var.e) {
                p65Var.Y(-1938644367);
                q(md0Var.a, wc0Var, null, p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 4);
            } else {
                p65Var.Y(-1963477227);
            }
            p65Var.p(false);
            if (md0Var.c && susiOperation == SusiOperation.LOGIN) {
                p65Var.Y(-1938394910);
                wc0Var2 = wc0Var;
                str = str2;
                d(str, wc0Var2, null, p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 4);
            } else {
                wc0Var2 = wc0Var;
                str = str2;
                p65Var.Y(-1963477227);
            }
            p65Var.p(false);
            if (md0Var.g && susiOperation == SusiOperation.LOGIN) {
                p65Var.Y(-1938174996);
                S(wc0Var2, null, p65Var, (i3 >> 3) & 14, 2);
            } else {
                p65Var.Y(-1963477227);
            }
            p65Var.p(false);
            if (md0Var.d) {
                p65Var.Y(-1938027126);
                o(md0Var.a, md0Var.b, str, md0Var.i, wc0Var, null, p65Var, (i3 << 9) & 57344, 32);
                p65Var = p65Var;
            } else {
                p65Var.Y(-1963477227);
            }
            p65Var.p(false);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gc0(md0Var, wc0Var, r28Var2, i2, 0);
        }
    }

    public static final void J(m45 m45Var, String str, int i2, r28 r28Var, long j2, x12 x12Var, int i3, int i4) {
        long j3;
        int i5;
        long j4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1012409888);
        int i6 = i3 | (p65Var.h(m45Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.d(i2) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i7 = i4 & 16;
        if (i7 != 0) {
            i5 = i6 | 24576;
            j3 = j2;
        } else {
            j3 = j2;
            i5 = i6 | (p65Var.e(j3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        }
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            if (i7 != 0) {
                j3 = uu1.h;
            }
            long j5 = j3;
            amb ambVarA = bmb.a(21.0f);
            r28 r28VarC = w2g.C(hlg.r(bo.B(r40.y(jfc.e(jfc.d(r28Var, 1.0f), 42.0f), ambVarA), 1.0f, ((zo7) p65Var.j(kt7.b)).y, ambVarA), false, null, new vkb(0), m45Var, 11), 9.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j6 = p65Var.T;
            int i8 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i8));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(i2, (i5 >> 6) & 14, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarL = jfc.l(o28Var, 24.0f);
            ar0 ar0Var = z46.g;
            iy0 iy0Var = iy0.a;
            int i9 = i5 >> 3;
            qv5.b(c09VarJ, null, iy0Var.a(r28VarL, ar0Var), j5, p65Var, 56 | (i9 & 7168), 0);
            jjd.b(str, w2g.E(iy0Var.a(jfc.d(o28Var, 1.0f), z46.h), 42.0f, 0.0f, 2), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, i9 & 14, 0, 130044);
            p65Var = p65Var;
            p65Var.p(true);
            j4 = j5;
        } else {
            p65Var.S();
            j4 = j3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zb(m45Var, str, i2, r28Var, j4, i3, i4);
        }
    }

    public static final void K(m8d m8dVar, kv6 kv6Var, f8d f8dVar, h8d h8dVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2078814370);
        int i3 = i2 | (p65Var.f(m8dVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(f8dVar) ? 256 : 128) | (p65Var.f(h8dVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (!p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.S();
        } else if (m8dVar instanceof j8d) {
            p65Var.Y(-580807237);
            L(((j8d) m8dVar).a, h8dVar, r28Var, p65Var, (i3 >> 6) & PhotoshopDirectory.TAG_CAPTION);
            p65Var.p(false);
        } else if (g76.L(m8dVar, k8d.a)) {
            p65Var.Y(-580800654);
            Q(r28Var, p65Var, (i3 >> 12) & 14);
            p65Var.p(false);
        } else {
            if (!(m8dVar instanceof l8d)) {
                throw ho2.L(p65Var, -580809091, false);
            }
            p65Var.Y(-580798123);
            P((l8d) m8dVar, kv6Var, f8dVar, h8dVar, r28Var, p65Var, i3 & 65534);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(m8dVar, kv6Var, f8dVar, h8dVar, r28Var, i2, 3);
        }
    }

    public static final void L(b24 b24Var, h8d h8dVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1094072636);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(b24Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(h8dVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarB = r28Var.b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                joc jocVar = new joc(0, h8dVar, h8d.class, "refresh", "refresh()V", 0, 23);
                p65Var.j0(jocVar);
                objM = jocVar;
            }
            iq7.a(b24Var, jfc.d(o28.b, 1.0f), null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 12, b24Var, h8dVar, r28Var);
        }
    }

    public static final void M(m8d m8dVar, kv6 kv6Var, f8d f8dVar, h8d h8dVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        kv6 kv6Var2;
        m8dVar.getClass();
        kv6Var.getClass();
        h8dVar.getClass();
        r28Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(743398505);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(m8dVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            kv6Var2 = kv6Var;
            i3 |= p65Var.f(kv6Var2) ? 32 : 16;
        } else {
            kv6Var2 = kv6Var;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(f8dVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(h8dVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            upc upcVarA = zu.a(nk7.o0(kv6Var2), null, "elevation", p65Var, 384, 10);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new d3d(7);
                p65Var.j0(objM);
            }
            pr7.b(wxb.a(r28Var, false, (x45) objM), pxf.E(-451933211, new h5d(m8dVar, f8dVar, upcVarA, i4), p65Var), null, null, null, 0, 0L, 0L, null, pxf.E(523707578, new ov2(m8dVar, kv6Var2, f8dVar, h8dVar, 22), p65Var), p65Var, 805306416, 508);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(m8dVar, kv6Var, f8dVar, h8dVar, r28Var, i2, 17);
        }
    }

    public static final void N(String str, String str2, f8d f8dVar, r28 r28Var, p8d p8dVar, x12 x12Var, int i2) {
        p8d p8dVar2;
        p8d p8dVar3;
        int i3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(636801069);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(f8dVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 20);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    p8dVar3 = (p8d) to7.z(n1b.a.b(p8d.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                p8dVar3 = p8dVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(p8dVar3.h, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            boolean zF = p65Var.f(p8dVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new h8d(p8dVar3);
                p65Var.j0(objM2);
            }
            M((m8d) l78VarZ.getValue(), kv6VarA, f8dVar, (h8d) objM2, r28Var, p65Var, (i3 & 896) | ((i3 << 3) & 57344));
            p8dVar2 = p8dVar3;
        } else {
            p65Var.S();
            p8dVar2 = p8dVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, str2, f8dVar, r28Var, p8dVar2, i2, 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void O(defpackage.m8d r16, defpackage.f8d r17, float r18, defpackage.x12 r19, int r20) {
        /*
            Method dump skipped, instruction units count: 229
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.O(m8d, f8d, float, x12, int):void");
    }

    public static final void P(l8d l8dVar, kv6 kv6Var, f8d f8dVar, h8d h8dVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1313795573);
        int i3 = i2 | (p65Var.f(l8dVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(f8dVar) ? 256 : 128) | (p65Var.f(h8dVar) ? 2048 : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            jy8 jy8VarH = w2g.h(0.0f, 16.0f, 0.0f, 16.0f, 5);
            boolean z = ((i3 & 14) == 4) | ((i3 & 896) == 256);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new pda(l8dVar, 20, f8dVar);
                p65Var.j0(objM);
            }
            k40.t(r28Var, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, ((i3 >> 12) & 14) | 384 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 504);
            boolean z2 = (i3 & 7168) == 2048;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new obb(h8dVar, null, 14);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(l8dVar, kv6Var, f8dVar, h8dVar, r28Var, i2, 4);
        }
    }

    public static final void Q(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1005477044);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            long j3 = ((zo7) p65Var.j(kt7.b)).c;
            o28 o28Var = o28.b;
            r28 r28VarM = jfc.m(w2g.F(o28Var, 24.0f, 28.0f, 24.0f, 12.0f), 140.0f, 24.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarM, j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 40.0f, 12.0f, 24.0f, 12.0f), 240.0f, 24.0f), j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 56.0f, 12.0f, 24.0f, 12.0f), 280.0f, 24.0f), j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 56.0f, 12.0f, 24.0f, 12.0f), 200.0f, 24.0f), j3, nr5Var), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 18);
        }
    }

    public static final void R(wc0 wc0Var, String str, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1662727287);
        int i3 = (i2 & 6) == 0 ? i2 | (p65Var2.f(wc0Var) ? 4 : 2) : i2;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(str) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarY = r40.y(jfc.f(jfc.d(o28Var, 1.0f), 48.0f, 0.0f, 2), bmb.a(4.0f));
            vkb vkbVar = new vkb(0);
            boolean z = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new n(wc0Var, 10, str);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(hlg.r(r28VarY, false, null, vkbVar, (m45) objM, 11), "get_help");
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            p65Var2.Y(1329701561);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.susi_auth_sign_in_get_help);
            String strQ = vo7.Q(R.string.susi_auth_sign_in_forgot_email_or_trouble, new Object[]{strR}, p65Var2);
            sb.append(strQ);
            int iZ = muc.Z(strQ, strR, 0, false, 6);
            arrayListV.add(new jx(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), iZ, strR.length() + iZ, 8));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i6 = 0; i6 < arrayListV.size(); i6 = lv8.i(sb, (jx) arrayListV.get(i6), arrayList, i6, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            jjd.c(mxVar, iy0.a.a(o28Var, z46.h), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 261116);
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
            mwaVarS.d = new ac(i2, 4, wc0Var, str, r28Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:45:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void S(defpackage.ec0 r19, defpackage.r28 r20, defpackage.x12 r21, int r22, int r23) {
        /*
            r2 = r19
            r8 = r22
            r9 = r23
            r10 = r21
            p65 r10 = (defpackage.p65) r10
            r0 = 727682379(0x2b5f8d4b, float:7.94216E-13)
            r10.a0(r0)
            r0 = r8 & 6
            r1 = 4
            if (r0 != 0) goto L20
            boolean r0 = r10.f(r2)
            if (r0 == 0) goto L1d
            r0 = r1
            goto L1e
        L1d:
            r0 = 2
        L1e:
            r0 = r0 | r8
            goto L21
        L20:
            r0 = r8
        L21:
            r3 = r9 & 2
            if (r3 == 0) goto L2a
            r0 = r0 | 48
        L27:
            r4 = r20
            goto L3c
        L2a:
            r4 = r8 & 48
            if (r4 != 0) goto L27
            r4 = r20
            boolean r5 = r10.f(r4)
            if (r5 == 0) goto L39
            r5 = 32
            goto L3b
        L39:
            r5 = 16
        L3b:
            r0 = r0 | r5
        L3c:
            r5 = r0 & 19
            r6 = 18
            r7 = 1
            r11 = 0
            if (r5 == r6) goto L46
            r5 = r7
            goto L47
        L46:
            r5 = r11
        L47:
            r6 = r0 & 1
            boolean r5 = r10.P(r6, r5)
            if (r5 == 0) goto La1
            if (r3 == 0) goto L55
            o28 r3 = defpackage.o28.b
            r12 = r3
            goto L56
        L55:
            r12 = r4
        L56:
            r0 = r0 & 14
            if (r0 != r1) goto L5b
            goto L5c
        L5b:
            r7 = r11
        L5c:
            java.lang.Object r0 = r10.M()
            if (r7 != 0) goto L66
            uob r1 = defpackage.w12.a
            if (r0 != r1) goto L77
        L66:
            sc0 r0 = new sc0
            r6 = 0
            r7 = 2
            r1 = 0
            java.lang.Class<ec0> r3 = defpackage.ec0.class
            java.lang.String r4 = "signInXButtonClicked"
            java.lang.String r5 = "signInXButtonClicked()V"
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            r10.j0(r0)
        L77:
            qh6 r0 = (defpackage.qh6) r0
            r1 = 2132018953(0x7f140709, float:1.9676227E38)
            java.lang.String r11 = defpackage.vo7.R(r10, r1)
            sn3 r1 = defpackage.kt7.b
            java.lang.Object r1 = r10.j(r1)
            zo7 r1 = (defpackage.zo7) r1
            long r14 = r1.n
            java.lang.String r1 = "x_button"
            r28 r13 = defpackage.bgf.N(r12, r1)
            m45 r0 = (defpackage.m45) r0
            r17 = 0
            r18 = 0
            r3 = r12
            r12 = 2131231105(0x7f080181, float:1.8078282E38)
            r16 = r10
            r10 = r0
            J(r10, r11, r12, r13, r14, r16, r17, r18)
            goto La7
        La1:
            r16 = r10
            r16.S()
            r3 = r4
        La7:
            mwa r0 = r16.s()
            if (r0 == 0) goto Lb4
            ya0 r1 = new ya0
            r1.<init>(r2, r3, r8, r9)
            r0.d = r1
        Lb4:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.S(ec0, r28, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:189:0x0295  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x02e3  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x030d  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0396  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x0535  */
    /* JADX WARN: Removed duplicated region for block: B:339:0x0579  */
    /* JADX WARN: Removed duplicated region for block: B:410:0x06a4  */
    /* JADX WARN: Removed duplicated region for block: B:413:0x06af  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x06b2  */
    /* JADX WARN: Removed duplicated region for block: B:417:0x06b8  */
    /* JADX WARN: Removed duplicated region for block: B:418:0x06bb  */
    /* JADX WARN: Removed duplicated region for block: B:420:0x06bf  */
    /* JADX WARN: Removed duplicated region for block: B:425:0x06cf  */
    /* JADX WARN: Removed duplicated region for block: B:427:0x06d3 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:437:0x06ef A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0115  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void T(defpackage.c72 r40, defpackage.wz6 r41, java.util.ArrayList r42, int r43) {
        /*
            Method dump skipped, instruction units count: 1788
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.T(c72, wz6, java.util.ArrayList, int):void");
    }

    public static final uo0 V(mz1 mz1Var, x12 x12Var, int i2) {
        boolean z = (((i2 & 14) ^ 6) > 4 && ((p65) x12Var).f(mz1Var)) || (i2 & 6) == 4;
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (z || objM == uobVar) {
            objM = new uo0(mz1Var);
            p65Var.j0(objM);
        }
        uo0 uo0Var = (uo0) objM;
        boolean zF = p65Var.f(uo0Var);
        Object objM2 = p65Var.M();
        if (zF || objM2 == uobVar) {
            objM2 = new s0(8, uo0Var);
            p65Var.j0(objM2);
        }
        kyd.h(uo0Var, (x45) objM2, p65Var);
        return uo0Var;
    }

    public static Handler W(Looper looper) {
        if (Build.VERSION.SDK_INT >= 28) {
            return uy.f(looper);
        }
        try {
            return (Handler) Handler.class.getDeclaredConstructor(Looper.class, Handler.Callback.class, Boolean.TYPE).newInstance(looper, null, Boolean.TRUE);
        } catch (IllegalAccessException e2) {
            e = e2;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (InstantiationException e3) {
            e = e3;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (NoSuchMethodException e4) {
            e = e4;
            Log.w("HandlerCompat", "Unable to invoke Handler(Looper, Callback, boolean) constructor", e);
            return new Handler(looper);
        } catch (InvocationTargetException e5) {
            Throwable cause = e5.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            ik4.j(cause);
            return null;
        }
    }

    public static final Object X(long j2, n92 n92Var) {
        if (j2 > 0) {
            x51 x51Var = new x51(1, pwd.Q(n92Var));
            x51Var.s();
            if (j2 < Long.MAX_VALUE) {
                g0(x51Var.e).g0(j2, x51Var);
            }
            Object objQ = x51Var.q();
            if (objQ == tb2.COROUTINE_SUSPENDED) {
                return objQ;
            }
        }
        return c1e.a;
    }

    public static final Object Y(long j2, p92 p92Var) {
        Object objX = X(p0(j2), p92Var);
        return objX == tb2.COROUTINE_SUSPENDED ? objX : c1e.a;
    }

    public static Exception Z(k kVar, String str, Exception exc) throws FrameworkClassParsingException {
        if (exc instanceof CreatePublicKeyCredentialDomException) {
            return new CreatePublicKeyCredentialDomException(kVar, str);
        }
        if (exc instanceof GetPublicKeyCredentialDomException) {
            return new GetPublicKeyCredentialDomException(kVar, str);
        }
        throw new FrameworkClassParsingException();
    }

    public static final void a(sj3 sj3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        String strQ;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(834716941);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(sj3Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarB = jfc.d(o28Var, 1.0f).b(o28Var);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            String strR = vo7.R(p65Var, R.string.downloaded_content_all_downloads);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).n;
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 24.0f, 16.0f, 0.0f, 16.0f, 4), true);
            sn3 sn3Var2 = kt7.b;
            jjd.b(strR, r28VarU, ((zo7) p65Var.j(sn3Var2)).n, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 131064);
            long j3 = sj3Var.a;
            if (j3 < 1024) {
                p65Var.Y(-1529729908);
                strQ = vo7.Q(R.string.common_bytes, new Object[]{String.valueOf(j3)}, p65Var);
                p65Var.p(false);
            } else if (j3 < 1048576) {
                p65Var.Y(-176901950);
                strQ = vo7.Q(R.string.common_kilobytes, new Object[]{String.valueOf(j3 / 1024)}, p65Var);
                p65Var.p(false);
            } else if (j3 < 1073741824) {
                p65Var.Y(-176731326);
                strQ = vo7.Q(R.string.common_megabytes, new Object[]{String.valueOf(j3 / 1048576)}, p65Var);
                p65Var.p(false);
            } else {
                p65Var.Y(-176573598);
                strQ = vo7.Q(R.string.common_gigabytes, new Object[]{String.valueOf(j3 / 1073741824)}, p65Var);
                p65Var.p(false);
            }
            jjd.b(strQ, w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11).b(new qse(z46.n)), ((zo7) p65Var.j(sn3Var2)).o, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131064);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(sj3Var, r28Var2, i2, 8);
        }
    }

    public static final long a0(x12 x12Var) {
        return uu1.b(0.06f, ((zo7) ((p65) x12Var).j(kt7.b)).y);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.oi r22, defpackage.nhc r23, defpackage.hi r24, defpackage.cs1 r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.b(oi, nhc, hi, cs1, r28, x12, int, int):void");
    }

    public static final long b0(x12 x12Var) {
        return uu1.b(0.06f, ((zo7) ((p65) x12Var).j(kt7.b)).y);
    }

    public static final void c(String str, fi fiVar, r28 r28Var, si siVar, x12 x12Var, int i2) {
        si siVar2;
        int i3;
        si siVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1120095035);
        int i4 = 4;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(fiVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = (i5 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i5 & (-7169);
                    siVar3 = (si) to7.z(n1b.a.b(si.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i5 & (-7169);
                siVar3 = siVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(siVar3.l, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i7 == 32) | p65Var.f(siVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new hi(fiVar, siVar3);
                p65Var.j0(objM2);
            }
            hi hiVar = (hi) objM2;
            boolean zF2 = p65Var.f(siVar3) | (i7 == 32);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new gi(fiVar, siVar3);
                p65Var.j0(objM3);
            }
            gi giVar = (gi) objM3;
            b((oi) l78VarZ.getValue(), nhcVarF, hiVar, giVar, r28Var, p65Var, (i3 << 6) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(siVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(giVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ra raVar = new ra(siVar3, nhcVarF, resources, giVar, null, 14);
                p65Var.j0(raVar);
                objM4 = raVar;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            siVar2 = siVar3;
        } else {
            p65Var.S();
            siVar2 = siVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 9, str, fiVar, r28Var, siVar2);
        }
    }

    public static final g15 c0(m00 m00Var, i15 i15Var, i31 i31Var, yl2 yl2Var, f31 f31Var) {
        Object ajbVar;
        yl2Var.getClass();
        f31Var.getClass();
        try {
            ajbVar = ((zw2) m00Var).c(i15Var, i31Var, yl2Var, f31Var);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            if (thB instanceof CacheMissException) {
                wld.a.e(thB, "Cache miss on fragment " + i15Var + " with cache key " + i31Var + ".", new Object[0]);
            } else if (thB instanceof ApolloException) {
                wld.a.e(thB, "Cache read error on fragment " + i15Var + " with cache key " + i31Var + ".", new Object[0]);
            } else {
                wld.a.e(thB, "Unexpected error while reading fragment " + i15Var + " with cache key " + i31Var + ".", new Object[0]);
            }
        }
        if (ajbVar instanceof ajb) {
            ajbVar = null;
        }
        return (g15) ajbVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:56:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(java.lang.String r17, defpackage.ec0 r18, defpackage.r28 r19, defpackage.x12 r20, int r21, int r22) {
        /*
            r1 = r17
            r2 = r18
            r4 = r21
            r11 = r20
            p65 r11 = (defpackage.p65) r11
            r0 = -4474(0xffffffffffffee86, float:NaN)
            r11.a0(r0)
            r0 = r4 & 6
            r3 = 4
            if (r0 != 0) goto L1f
            boolean r0 = r11.f(r1)
            if (r0 == 0) goto L1c
            r0 = r3
            goto L1d
        L1c:
            r0 = 2
        L1d:
            r0 = r0 | r4
            goto L20
        L1f:
            r0 = r4
        L20:
            r5 = r4 & 48
            r6 = 32
            if (r5 != 0) goto L31
            boolean r5 = r11.f(r2)
            if (r5 == 0) goto L2e
            r5 = r6
            goto L30
        L2e:
            r5 = 16
        L30:
            r0 = r0 | r5
        L31:
            r5 = r22 & 4
            if (r5 == 0) goto L3a
            r0 = r0 | 384(0x180, float:5.38E-43)
        L37:
            r7 = r19
            goto L4c
        L3a:
            r7 = r4 & 384(0x180, float:5.38E-43)
            if (r7 != 0) goto L37
            r7 = r19
            boolean r8 = r11.f(r7)
            if (r8 == 0) goto L49
            r8 = 256(0x100, float:3.59E-43)
            goto L4b
        L49:
            r8 = 128(0x80, float:1.8E-43)
        L4b:
            r0 = r0 | r8
        L4c:
            r8 = r0 & 147(0x93, float:2.06E-43)
            r9 = 146(0x92, float:2.05E-43)
            r10 = 1
            r12 = 0
            if (r8 == r9) goto L56
            r8 = r10
            goto L57
        L56:
            r8 = r12
        L57:
            r9 = r0 & 1
            boolean r8 = r11.P(r9, r8)
            if (r8 == 0) goto Lb1
            if (r5 == 0) goto L65
            o28 r5 = defpackage.o28.b
            r14 = r5
            goto L66
        L65:
            r14 = r7
        L66:
            r5 = 2132018946(0x7f140702, float:1.9676213E38)
            java.lang.String r5 = defpackage.vo7.R(r11, r5)
            sn3 r7 = defpackage.kt7.b
            java.lang.Object r7 = r11.j(r7)
            zo7 r7 = (defpackage.zo7) r7
            long r7 = r7.n
            java.lang.String r9 = "apple_button"
            r28 r9 = defpackage.bgf.N(r14, r9)
            r13 = r0 & 112(0x70, float:1.57E-43)
            if (r13 != r6) goto L83
            r6 = r10
            goto L84
        L83:
            r6 = r12
        L84:
            r0 = r0 & 14
            if (r0 != r3) goto L89
            goto L8a
        L89:
            r10 = r12
        L8a:
            r0 = r6 | r10
            java.lang.Object r3 = r11.M()
            if (r0 != 0) goto L96
            uob r0 = defpackage.w12.a
            if (r3 != r0) goto La0
        L96:
            n r3 = new n
            r0 = 12
            r3.<init>(r2, r0, r1)
            r11.j0(r3)
        La0:
            m45 r3 = (defpackage.m45) r3
            r12 = 0
            r13 = 0
            r15 = r7
            r8 = r9
            r9 = r15
            r7 = 2131230915(0x7f0800c3, float:1.8077896E38)
            r6 = r5
            r5 = r3
            J(r5, r6, r7, r8, r9, r11, r12, r13)
            r3 = r14
            goto Lb5
        Lb1:
            r11.S()
            r3 = r7
        Lb5:
            mwa r7 = r11.s()
            if (r7 == 0) goto Lc5
            oc0 r0 = new oc0
            r6 = 0
            r5 = r22
            r0.<init>(r1, r2, r3, r4, r5, r6)
            r7.d = r0
        Lc5:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.d(java.lang.String, ec0, r28, x12, int, int):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:62:0x03ae  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x03b1  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x03b5  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x03b7  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x03c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(final defpackage.ld0 r59, final defpackage.wc0 r60, defpackage.r28 r61, defpackage.x12 r62, int r63) {
        /*
            Method dump skipped, instruction units count: 1006
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.e(ld0, wc0, r28, x12, int):void");
    }

    public static final du8 e0(m00 m00Var, uqa uqaVar, yl2 yl2Var, f31 f31Var) {
        Object ajbVar;
        yl2Var.getClass();
        f31Var.getClass();
        try {
            ajbVar = ((zw2) m00Var).d(uqaVar, yl2Var, f31Var);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            if (thB instanceof CacheMissException) {
                wld.a.a("Cache miss on operation " + uqaVar + ".", new Object[0]);
            } else if (thB instanceof ApolloException) {
                wld.a.e(thB, "Cache read error on operation " + uqaVar + ".", new Object[0]);
            } else {
                wld.a.e(thB, "Unexpected error while reading operation " + uqaVar + ".", new Object[0]);
            }
        }
        if (ajbVar instanceof ajb) {
            ajbVar = null;
        }
        return (du8) ajbVar;
    }

    public static final void f(od0 od0Var, wc0 wc0Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1222231762);
        int i3 = (p65Var.f(od0Var) ? 4 : 2) | i2 | (p65Var.f(wc0Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (od0Var instanceof nd0) {
            p65Var.Y(2038657580);
            h(r28Var, p65Var, (i3 >> 6) & 14);
            p65Var.p(false);
        } else if (od0Var instanceof ld0) {
            p65Var.Y(2038660182);
            e((ld0) od0Var, wc0Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        } else {
            if (!(od0Var instanceof md0)) {
                throw ho2.L(p65Var, 2038655931, false);
            }
            p65Var.Y(2038665938);
            g((md0) od0Var, wc0Var, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 28, od0Var, wc0Var, r28Var);
        }
    }

    public static final x33 g0(ib2 ib2Var) {
        gb2 gb2VarO0 = ib2Var.o0(wz7.d);
        x33 x33Var = gb2VarO0 instanceof x33 ? (x33) gb2VarO0 : null;
        return x33Var == null ? xy2.a : x33Var;
    }

    public static final void h(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1986725727);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarB = r28Var.b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            xz5.o(bgf.N(iy0.a.a(o28.b, z46.h), "loading"), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, i4);
        }
    }

    public static final void i(od0 od0Var, wc0 wc0Var, r28 r28Var, nhc nhcVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        od0Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(236177129);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(od0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = 16;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(wc0Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(nhcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarN = bgf.N(r28Var.b(jfc.c), "auth_screen");
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new nx(6);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(wxb.a(r28VarN, false, (x45) objM), null, null, pxf.E(-880496785, new u8(nhcVar, 14), p65Var2), null, 0, ((zo7) p65Var2.j(kt7.b)).a, 0L, null, pxf.E(-110900488, new ec(od0Var, i4, wc0Var), p65Var2), p65Var, 805309440, 438);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(od0Var, wc0Var, r28Var, nhcVar, i2);
        }
    }

    public static final gv7 i0(i6a i6aVar, p98 p98Var, wjc wjcVar, boolean z, boolean z2, boolean z3) {
        p98Var.getClass();
        o75 o75Var = gg6.d;
        o75Var.getClass();
        ag6 ag6Var = (ag6) il7.z(i6aVar, o75Var);
        if (ag6Var != null) {
            if (z) {
                q74 q74Var = hg6.a;
                if6 if6VarB = hg6.b(i6aVar, p98Var, wjcVar, z3);
                if (if6VarB != null) {
                    return en7.v(if6VarB);
                }
            } else if (z2 && (ag6Var.b & 2) == 2) {
                yf6 yf6Var = ag6Var.d;
                yf6Var.getClass();
                return new gv7(p98Var.getString(yf6Var.c).concat(p98Var.getString(yf6Var.d)));
            }
        }
        return null;
    }

    public static final void j(List list, String str, o41 o41Var, aa7 aa7Var, zg7 zg7Var, String str2, SusiDestination susiDestination, SusiOperation susiOperation, r28 r28Var, yd0 yd0Var, x12 x12Var, int i2) {
        r28 r28Var2;
        yd0 yd0Var2;
        Object obj;
        int i3;
        r28 r28Var3;
        yd0 yd0Var3;
        r28 r28Var4;
        int i4;
        Object obj2;
        list.getClass();
        str.getClass();
        str2.getClass();
        susiOperation.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-400742077);
        int i5 = i2 | (p65Var.h(list) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(o41Var) ? 256 : 128) | (p65Var.h(aa7Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(zg7Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(str2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(susiDestination) ? 1048576 : 524288) | (p65Var.d(susiOperation.ordinal()) ? 8388608 : 4194304) | 369098752;
        if (p65Var.P(i5 & 1, (306783379 & i5) != 306783378)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((458752 & i5) == 131072) | ((3670016 & i5) == 1048576) | ((29360128 & i5) == 8388608);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    o8 o8Var = new o8(str2, susiDestination, susiOperation);
                    p65Var.j0(o8Var);
                    obj = o8Var;
                } else {
                    obj = objM;
                }
                x45 x45Var = (x45) obj;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                yd0 yd0Var4 = (yd0) to7.z(n1b.a.b(yd0.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i3 = i5 & (-1879048193);
                r28Var3 = o28.b;
                yd0Var3 = yd0Var4;
            } else {
                p65Var.S();
                yd0Var3 = yd0Var;
                i3 = i5 & (-1879048193);
                r28Var3 = r28Var;
            }
            p65Var.q();
            Activity activity = (Activity) p65Var.j(r57.a);
            Context context = (Context) p65Var.j(eo.b);
            iy6 iy6Var = (iy6) p65Var.j(y57.a);
            Object objM2 = p65Var.M();
            Object objJ = objM2;
            if (objM2 == uobVar) {
                objJ = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objJ;
            l78 l78VarZ = guc.z(yd0Var3.s, p65Var, 0);
            yw6 yw6Var = yw6.NONE;
            boolean zH = p65Var.h(context);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                r28Var4 = r28Var3;
                i4 = 0;
                nc0 nc0Var = new nc0(context, i4);
                p65Var.j0(nc0Var);
                obj2 = nc0Var;
            } else {
                r28Var4 = r28Var3;
                i4 = 0;
                obj2 = objM3;
            }
            vq6 vq6VarD0 = vx0.d0(yw6Var, (m45) obj2);
            int i7 = i4;
            r28 r28Var5 = r28Var4;
            i((od0) l78VarZ.getValue(), new wc0(yd0Var3, zg7Var, iy6Var, str, context, vq6VarD0, aa7Var, o41Var, activity, list), r28Var5, nhcVar, p65Var, 3456);
            Resources resources = (Resources) p65Var.j(eo.c);
            int i8 = (p65Var.h(yd0Var3) ? 1 : 0) | (p65Var.h(resources) ? 1 : 0) | ((i3 & 57344) == 16384 ? 1 : i7) | (p65Var.h(iy6Var) ? 1 : 0) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? 1 : i7) | (p65Var.h(vq6VarD0) ? 1 : 0) | (p65Var.h(context) ? 1 : 0);
            Object objM4 = p65Var.M();
            if (i8 != 0 || objM4 == uobVar) {
                uc0 uc0Var = new uc0(yd0Var3, nhcVar, resources, zg7Var, iy6Var, str, context, vq6VarD0, null, 0);
                p65Var.j0(uc0Var);
                objM4 = uc0Var;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            yd0Var2 = yd0Var3;
            r28Var2 = r28Var5;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            yd0Var2 = yd0Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pc0(list, str, o41Var, aa7Var, zg7Var, str2, susiDestination, susiOperation, r28Var2, yd0Var2, i2);
        }
    }

    public static final void k(li liVar, hi hiVar, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        hi hiVar2 = hiVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1574300758);
        int i3 = i2 | (p65Var.f(liVar) ? 4 : 2) | (p65Var.f(hiVar2) ? 32 : 16) | (p65Var.f(cs1Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z = liVar.b;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i4 == 32;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, hiVar, hi.class, "onRefresh", "onRefresh()V", 0, 15);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(571810916, new fd3(kv6VarA, (Object) liVar, (Object) cs1Var, (Object) hiVar, 19), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i4 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                hiVar2 = hiVar;
                objM2 = new z8(hiVar2, null, 8);
                p65Var.j0(objM2);
            } else {
                hiVar2 = hiVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 8, liVar, hiVar2, cs1Var, r28Var);
        }
    }

    public static final void l(sj3 sj3Var, oj3 oj3Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        boolean z;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1774233626);
        int i3 = i2 | (p65Var.f(sj3Var) ? 4 : 2) | (p65Var.f(oj3Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            rh4 rh4Var = jfc.c;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, rh4Var);
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
            a(sj3Var, null, p65Var, i3 & 14);
            o28 o28Var = o28.b;
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 1.0f), ((zo7) p65Var.j(kt7.b)).z, rv8.r), p65Var, 0);
            boolean z3 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                gu1 gu1Var = new gu1(0, oj3Var, oj3.class, "onRemoveDownloadedContent", "onRemoveDownloadedContent()V", 0, 19);
                p65Var.j0(gu1Var);
                objM = gu1Var;
            }
            qh6 qh6Var = (qh6) objM;
            r28 r28VarI = ka1.i(z46.q, w2g.G(o28Var, 0.0f, 32.0f, 0.0f, 0.0f, 13));
            String strR = vo7.R(p65Var, R.string.downloaded_content_remove_all_downloads);
            if (sj3Var.a > 0) {
                z2 = true;
                z = true;
            } else {
                z = false;
                z2 = true;
            }
            fo7.i((m45) qh6Var, strR, xn7.M, r28VarI, z, p65Var, 384, 0);
            p65Var.p(z2);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 27, sj3Var, oj3Var, r28Var2);
        }
    }

    public static final Object l0(m00 m00Var, i31 i31Var, p92 p92Var) {
        Object objB;
        zw2 zw2Var = (zw2) m00Var;
        Set set = (Set) zw2Var.g.N(new gf2(new s0(5, i31Var), 19, zw2Var));
        return (set.isEmpty() || (objB = zw2Var.b(set, p92Var)) != tb2.COROUTINE_SUSPENDED) ? c1e.a : objB;
    }

    public static final void m(vpc vpcVar, oj3 oj3Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        vpcVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(491775944);
        int i3 = i2 | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.f(oj3Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var = p65Var2;
            pr7.b(jfc.c, pxf.E(1179827780, new rj3(oj3Var), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(6083161, new ec(oj3Var, 28, guc.z(vpcVar, p65Var2, i3 & 14)), p65Var2), p65Var, 805306416, 508);
            r28Var2 = o28.b;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 26, vpcVar, oj3Var, r28Var2);
        }
    }

    public static boolean m0(String str) {
        return ("Connection".equalsIgnoreCase(str) || "Keep-Alive".equalsIgnoreCase(str) || "Proxy-Authenticate".equalsIgnoreCase(str) || "Proxy-Authorization".equalsIgnoreCase(str) || "TE".equalsIgnoreCase(str) || "Trailers".equalsIgnoreCase(str) || "Transfer-Encoding".equalsIgnoreCase(str) || "Upgrade".equalsIgnoreCase(str)) ? false : true;
    }

    public static final void n(oj3 oj3Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(179769674);
        int i3 = (p65Var2.f(oj3Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.downloaded_content_title);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new gu1(0, oj3Var, oj3.class, "onBackPressed", "onBackPressed()V", 0, 20);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 505);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rj3(oj3Var, i2);
        }
    }

    public static final pw6 n0(x12 x12Var) {
        Object[] objArr = new Object[0];
        mya myaVar = pw6.x;
        boolean zD = ((p65) x12Var).d(0) | ((p65) x12Var).d(0);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (zD || objM == w12.a) {
            objM = new ov6(1);
            p65Var.j0(objM);
        }
        return (pw6) hp7.F(objArr, myaVar, (m45) objM, p65Var, 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:96:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(final com.medium.android.core.susi.SusiOperation r17, final com.medium.android.core.susi.SusiDestination r18, final java.lang.String r19, final boolean r20, final defpackage.ec0 r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 335
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.o(com.medium.android.core.susi.SusiOperation, com.medium.android.core.susi.SusiDestination, java.lang.String, boolean, ec0, r28, x12, int, int):void");
    }

    public static final void p(b24 b24Var, hi hiVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object vfVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(471229195);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(hiVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                vfVar = new vf(0, hiVar, hi.class, "onRefresh", "onRefresh()V", 0, 17);
                p65Var.j0(vfVar);
            } else {
                vfVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(o28Var, ar0Var), null, null, null, null, (m45) ((qh6) vfVar), null, p65Var, i3 & 14, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 14, b24Var, hiVar, r28Var);
        }
    }

    public static final long p0(long j2) {
        int i2 = in3.d;
        boolean z = j2 > 0;
        if (z) {
            return in3.d(in3.h(j2, hlg.U(999999L, mn3.NANOSECONDS)));
        }
        if (!z) {
            return 0L;
        }
        ygf.a();
        return 0L;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void q(com.medium.android.core.susi.SusiOperation r20, defpackage.ec0 r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.q(com.medium.android.core.susi.SusiOperation, ec0, r28, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0098  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.drawable.Icon q0(androidx.core.graphics.drawable.IconCompat r7, android.content.Context r8) {
        /*
            Method dump skipped, instruction units count: 368
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.q0(androidx.core.graphics.drawable.IconCompat, android.content.Context):android.graphics.drawable.Icon");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(com.medium.android.core.susi.SusiOperation r16, defpackage.ec0 r17, defpackage.r28 r18, defpackage.x12 r19, int r20, int r21) {
        /*
            Method dump skipped, instruction units count: 235
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.r(com.medium.android.core.susi.SusiOperation, ec0, r28, x12, int, int):void");
    }

    public static final String r0(String str) throws IOException {
        str.getClass();
        if (!muc.R(str, '_')) {
            return str;
        }
        Locale locale = Locale.US;
        String strF0 = bu1.F0(muc.o0(str, new char[]{'_'}), "", null, null, new be7(2), 30);
        if (strF0.length() <= 0) {
            return strF0;
        }
        StringBuilder sb = new StringBuilder();
        char cCharAt = strF0.charAt(0);
        locale.getClass();
        String strValueOf = String.valueOf(cCharAt);
        strValueOf.getClass();
        String lowerCase = strValueOf.toLowerCase(locale);
        lowerCase.getClass();
        sb.append((Object) lowerCase);
        sb.append(strF0.substring(1));
        return sb.toString();
    }

    public static final void s(SusiOperation susiOperation, final String str, final wc0 wc0Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        sn3 sn3Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-111507949);
        int i4 = (i2 & 6) == 0 ? (p65Var2.d(susiOperation.ordinal()) ? 4 : 2) | i2 : i2;
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.f(wc0Var) ? 256 : 128;
        }
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var2.Y(215049465);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.common_terms_of_service);
            String strR2 = vo7.R(p65Var2, R.string.common_privacy_policy);
            int i5 = xc0.a[susiOperation.ordinal()];
            if (i5 == 1) {
                i3 = R.string.susi_auth_sign_in_terms_privacy_message;
            } else {
                if (i5 != 2) {
                    ygf.a();
                    return;
                }
                i3 = R.string.susi_auth_sign_up_terms_privacy_message;
            }
            String strQ = vo7.Q(i3, new Object[]{strR, strR2}, p65Var2);
            int iZ = muc.Z(strQ, strR, 0, false, 6);
            int length = strR.length() + iZ;
            int iZ2 = muc.Z(strQ, strR2, 0, false, 6);
            int length2 = strR2.length() + iZ2;
            sb.append(strQ);
            ohd ohdVar = ohd.c;
            skc skcVar = new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439);
            sn3 sn3Var2 = kt7.b;
            skc skcVar2 = new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, ((zo7) p65Var2.j(sn3Var2)).b, ohdVar, (i3c) null, 59391);
            wjd wjdVar = new wjd(skcVar, skcVar2, 6);
            int i6 = i4 & 896;
            boolean z = i6 == 256;
            int i7 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = (i7 == 32) | z;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                sn3Var = sn3Var2;
                final int i8 = 0;
                objM = new e07() { // from class: hc0
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i9 = i8;
                        String str2 = str;
                        wc0 wc0Var2 = wc0Var;
                        switch (i9) {
                            case 0:
                                d07Var.getClass();
                                ((AuthFragment) wc0Var2.b.b).i1().Y(str2);
                                break;
                            default:
                                d07Var.getClass();
                                ((AuthFragment) wc0Var2.b.b).i1().X(str2);
                                break;
                        }
                    }
                };
                p65Var2.j0(objM);
            } else {
                sn3Var = sn3Var2;
            }
            b07 b07Var = new b07("terms_of_service", wjdVar, (e07) objM);
            int i9 = 8;
            arrayListV.add(new jx(b07Var, iZ, length, i9));
            wjd wjdVar2 = new wjd(skcVar, skcVar2, 6);
            boolean z3 = (i7 == 32) | (i6 == 256);
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                final int i10 = 1;
                objM2 = new e07() { // from class: hc0
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i92 = i10;
                        String str2 = str;
                        wc0 wc0Var2 = wc0Var;
                        switch (i92) {
                            case 0:
                                d07Var.getClass();
                                ((AuthFragment) wc0Var2.b.b).i1().Y(str2);
                                break;
                            default:
                                d07Var.getClass();
                                ((AuthFragment) wc0Var2.b.b).i1().X(str2);
                                break;
                        }
                    }
                };
                p65Var2.j0(objM2);
            }
            arrayListV.add(new jx(new b07("privacy_policy", wjdVar2, (e07) objM2), iZ2, length2, i9));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i11 = 0; i11 < arrayListV.size(); i11 = lv8.i(sb, (jx) arrayListV.get(i11), arrayList, i11, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            p65Var = p65Var2;
            jjd.c(mxVar, bgf.N(jfc.d(o28.b, 1.0f), "legal_text"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 3, 0L, null, null, 16744446), p65Var, 48, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 3, susiOperation, str, wc0Var);
        }
    }

    public static void s0(Object obj) throws Throwable {
        if (obj instanceof b9f) {
            throw ((b9f) obj).a;
        }
    }

    public static final void t(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-765820166);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-961380901);
            for (int i7 = 0; i7 < 10; i7++) {
                yi2.p(0, 0L, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 7);
        }
    }

    public static final void u(sk8 sk8Var, kv6 kv6Var, ik8 ik8Var, ek8 ek8Var, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(779429272);
        int i3 = 2;
        int i4 = i2 | (p65Var2.f(sk8Var) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(ik8Var) ? 256 : 128) | (p65Var2.f(ek8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(obeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 196608;
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            boolean z2 = sk8Var instanceof pk8;
            uob uobVar = w12.a;
            o28 o28Var = o28.b;
            if (z2) {
                p65Var2.Y(1384620286);
                rh4 rh4Var = jfc.c;
                z = (i4 & 896) == 256;
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    objM = new yj8(i3, ik8Var);
                    p65Var2.j0(objM);
                }
                p65Var = p65Var2;
                iq7.b(rh4Var, null, null, null, null, (m45) objM, null, p65Var, 0, 94);
                p65Var.p(false);
                o28Var = o28Var;
            } else {
                p65Var = p65Var2;
                if (sk8Var instanceof rk8) {
                    p65Var.Y(1707239572);
                    hk7.f(0, 0L, p65Var, jfc.c);
                    p65Var.p(false);
                } else if (sk8Var instanceof ok8) {
                    p65Var.Y(1707243522);
                    z = (i4 & 896) == 256;
                    Object objM2 = p65Var.M();
                    if (z || objM2 == uobVar) {
                        qv7 qv7Var = new qv7(0, ik8Var, ik8.class, "reportScreenViewed", "reportScreenViewed()V", 0, 17);
                        p65Var.j0(qv7Var);
                        objM2 = qv7Var;
                    }
                    ek7.j(48, p65Var, (m45) ((qh6) objM2), o28Var);
                    p65Var.p(false);
                } else {
                    if (!(sk8Var instanceof qk8)) {
                        throw ho2.L(p65Var, 1707231428, false);
                    }
                    p65Var.Y(1707250053);
                    int i5 = i4 >> 3;
                    v((qk8) sk8Var, ik8Var, ek8Var, obeVar, kv6Var, jfc.c, p65Var, (i4 & 14) | (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i5 & 896) | (i5 & 7168) | ((i4 << 9) & 57344));
                    p65Var.p(false);
                }
            }
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 16, r28Var2, sk8Var, kv6Var, ik8Var, ek8Var, obeVar);
        }
    }

    public static final void v(qk8 qk8Var, ik8 ik8Var, ek8 ek8Var, obe obeVar, kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        kv6 kv6Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1966582483);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(qk8Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(ik8Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(ek8Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(obeVar) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            kv6Var2 = kv6Var;
            i3 |= p65Var2.f(kv6Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            kv6Var2 = kv6Var;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            r28 r28VarB = r28Var.b(jfc.c);
            boolean z = ((i3 & 14) == 4) | ((i3 & 896) == 256) | ((i3 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new o8(qk8Var, ek8Var, obeVar, 28);
                p65Var2.j0(objM);
            }
            k40.t(r28VarB, kv6Var2, null, null, null, null, false, null, (x45) objM, p65Var2, (i3 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 508);
            p65Var = p65Var2;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new lo5(ik8Var, null, 9);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(qk8Var, ik8Var, ek8Var, obeVar, kv6Var, r28Var, i2, 7);
        }
    }

    public static final void w(sk8 sk8Var, nhc nhcVar, ik8 ik8Var, ek8 ek8Var, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        ek8 ek8Var2;
        obe obeVar2;
        sk8Var.getClass();
        nhcVar.getClass();
        ik8Var.getClass();
        obeVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(475649076);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(sk8Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(ik8Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            ek8Var2 = ek8Var;
            i3 |= p65Var.f(ek8Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            ek8Var2 = ek8Var;
        }
        if ((i2 & 24576) == 0) {
            obeVar2 = obeVar;
            i3 |= p65Var.f(obeVar2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            obeVar2 = obeVar;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i5 = i3;
        if (p65Var.P(i5 & 1, (i5 & 74899) != 74898)) {
            kv6 kv6VarA = pv6.a(p65Var);
            pr7.b(r28Var, pxf.E(-1275497040, new ho5(sk8Var, ik8Var, zu.a(nk7.o0(kv6VarA), null, "elevation", p65Var, 384, 10), 19), p65Var), null, pxf.E(-1510770578, new w87(nhcVar, i4), p65Var), null, 0, 0L, 0L, null, pxf.E(1024952325, new g91(sk8Var, kv6VarA, ik8Var, ek8Var2, obeVar2, 17), p65Var), p65Var, ((i5 >> 15) & 14) | 805309488, 500);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(sk8Var, nhcVar, ik8Var, ek8Var, obeVar, r28Var, i2, 8);
        }
    }

    public static final void x(String str, String str2, ek8 ek8Var, r28 r28Var, tk8 tk8Var, x12 x12Var, int i2) {
        tk8 tk8Var2;
        int i3;
        tk8 tk8Var3;
        tk8 tk8Var4;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-900941012);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(ek8Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            int i6 = 6;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, i6);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    tk8 tk8Var5 = (tk8) to7.z(n1b.a.b(tk8.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                    tk8Var3 = tk8Var5;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                tk8Var3 = tk8Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(tk8Var3.l, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = i3 & 896;
            boolean zF = (i7 == 256) | p65Var.f(tk8Var3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new ik8(ek8Var, tk8Var3);
                p65Var.j0(objM2);
            }
            ik8 ik8Var = (ik8) objM2;
            boolean zF2 = p65Var.f(tk8Var3) | (i7 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new jk8(ek8Var, tk8Var3);
                p65Var.j0(objM3);
            }
            jk8 jk8Var = (jk8) objM3;
            w((sk8) l78VarZ.getValue(), nhcVarF, ik8Var, ek8Var, jk8Var, r28Var, p65Var, ((i3 << 3) & 7168) | ((i3 << 6) & 458752));
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = kyd.M(p65Var);
                p65Var.j0(objM4);
            }
            sb2 sb2Var = (sb2) objM4;
            boolean zH = p65Var.h(tk8Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(jk8Var);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                tk8Var4 = tk8Var3;
                b9 b9Var = new b9((que) tk8Var4, nhcVarF, sb2Var, resources, (Object) jk8Var, (n92) null, 26);
                p65Var.j0(b9Var);
                objM5 = b9Var;
            } else {
                tk8Var4 = tk8Var3;
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
            tk8Var2 = tk8Var4;
        } else {
            p65Var.S();
            tk8Var2 = tk8Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) ek8Var, r28Var, (que) tk8Var2, i2, 1);
        }
    }

    public static final void y(Long l2, ik8 ik8Var, float f2, x12 x12Var, int i2) {
        String strW;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1440780556);
        int i3 = i2 | (p65Var.f(l2) ? 4 : 2) | (p65Var.f(ik8Var) ? 32 : 16) | (p65Var.c(f2) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            if (l2 != null) {
                p65Var.Y(-1609435292);
                strW = vo7.T((Context) p65Var.j(eo.b), l2.longValue());
                p65Var.p(false);
            } else {
                strW = km4.w(p65Var, -1609348678, R.string.notifications_title, p65Var, false);
            }
            String str = strW;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                qv7 qv7Var = new qv7(0, ik8Var, ik8.class, "onBackPressed", "onBackPressed()V", 0, 18);
                p65Var.j0(qv7Var);
                objM = qv7Var;
            }
            qk7.g(wo7.w(o28.b, f2, rv8.r, 0L, 0L, 28), str, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 504);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lg5(l2, ik8Var, f2, i2, 1);
        }
    }

    public static final void z(r28 r28Var, d8a d8aVar, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        mz1 mz1Var2;
        mz1 mz1Var3 = g76.b;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-714464401);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(d8aVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(mz1Var3) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                k49 k49Var = new k49(null, y3b.h);
                p65Var.j0(k49Var);
                objM = k49Var;
            }
            uo0 uo0VarV = V(mz1Var3, p65Var, (i3 >> 6) & 14);
            r28Var2 = r28Var;
            mz1Var2 = mz1Var;
            k40.c(d8aVar.a(uo0VarV), pxf.E(274270255, new swe(r28Var2, (l78) objM, mz1Var2, uo0VarV, 15), p65Var), p65Var, 56);
        } else {
            r28Var2 = r28Var;
            mz1Var2 = mz1Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(r28Var2, d8aVar, mz1Var2, i2);
        }
    }

    public abstract void f0(j4c j4cVar, float f2, float f3);

    public abstract float k0(dk7 dk7Var);

    public abstract void o0(dk7 dk7Var, float f2);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.tb2 U(defpackage.p92 r5) {
        /*
            boolean r0 = r5 instanceof defpackage.y33
            if (r0 == 0) goto L13
            r0 = r5
            y33 r0 = (defpackage.y33) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            y33 r0 = new y33
            r0.<init>(r5)
        L18:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2f
            if (r2 == r4) goto L2b
            r5 = 0
            java.lang.String r5 = com.drew.imaging.raf.yvq.AXoTRPEGKEve.ZjCLkgDPAZKcr
            defpackage.ygf.f(r5)
            return r3
        L2b:
            defpackage.br7.v(r5)
            goto L47
        L2f:
            defpackage.br7.v(r5)
            r0.c = r4
            x51 r5 = new x51
            n92 r0 = defpackage.pwd.Q(r0)
            r5.<init>(r4, r0)
            r5.s()
            java.lang.Object r5 = r5.q()
            if (r5 != r1) goto L47
            return r1
        L47:
            defpackage.z72.b()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gsa.U(p92):tb2");
    }

    public static final void g(md0 md0Var, wc0 wc0Var, r28 r28Var, x12 x12Var, int i2) {
        wc0 wc0Var2;
        char c2;
        int i3;
        String str;
        char c3;
        boolean z;
        int i4;
        int i5;
        int i6;
        boolean z2;
        boolean z3;
        int i7;
        int i8;
        String str2 = md0Var.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(922676714);
        int i9 = i2 | (p65Var.f(md0Var) ? 4 : 2) | (p65Var.f(wc0Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i9 & 1, (i9 & 147) != 146)) {
            r28 r28VarN = bgf.N(r28Var, "content");
            rh4 rh4Var = jfc.c;
            r28 r28VarD = jfc.d(jfc.r(r28VarN.b(rh4Var), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i10 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
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
            Integer numValueOf = Integer.valueOf(i10);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 448.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i11 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i11, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD3 = w2g.D(wgf.R(rh4Var, wgf.K(p65Var), false, 14), 24.0f, 32.0f);
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j4 = p65Var.T;
            int i12 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i12, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            SusiOperation susiOperation = md0Var.a;
            int[] iArr = xc0.a;
            int i13 = iArr[susiOperation.ordinal()];
            if (i13 != 1) {
                c2 = 2;
                if (i13 != 2) {
                    ygf.a();
                    return;
                }
                i3 = R.string.susi_welcome_create_account;
            } else {
                c2 = 2;
                i3 = R.string.susi_welcome_log_in;
            }
            String strR = vo7.R(p65Var, i3);
            r28 r28VarN2 = bgf.N(jfc.d(o28Var, 1.0f), "auth_title");
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarN2, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).F, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            w2g.e(vn7.J(R.drawable.ic_susi, 0, p65Var), null, bgf.N(new dr5(yq0Var), "auth_illustration"), null, null, 0.0f, null, p65Var, 56, 120);
            hp7.t(p65Var, jfc.l(o28Var, 40.0f));
            int i14 = i9 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            I(md0Var, wc0Var, null, p65Var, i9 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            hp7.t(p65Var, jfc.l(o28Var, 26.0f));
            A(md0Var.i, wc0Var, new dr5(yq0Var), p65Var, i14);
            if (susiOperation == SusiOperation.LOGIN) {
                km4.F(10.0f, 1974232199, p65Var, p65Var, o28Var);
                str = str2;
                R(wc0Var, str, null, p65Var, (i9 >> 3) & 14);
                lv8.y(o28Var, 10.0f, p65Var, false);
            } else {
                str = str2;
                km4.F(26.0f, 1974474495, p65Var, p65Var, o28Var);
                p65Var.p(false);
            }
            s(susiOperation, str, wc0Var, p65Var, (i9 << 3) & 896);
            hp7.t(p65Var, jfc.l(o28Var, 40.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 40.0f));
            int i15 = iArr[susiOperation.ordinal()];
            if (i15 != 1) {
                c3 = 2;
                if (i15 != 2) {
                    throw ho2.L(p65Var, 1587726125, false);
                }
                i4 = 1587728449;
                i5 = R.string.susi_auth_already_have_an_account;
                z = false;
            } else {
                c3 = 2;
                z = false;
                i4 = 1587731718;
                i5 = R.string.susi_auth_already_dont_have_an_account;
            }
            jjd.b(km4.w(p65Var, i4, i5, p65Var, z), bgf.N(jfc.d(o28Var, 1.0f), "dont_have_an_account"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).G, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            boolean z4 = i14 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                i6 = i14;
                z2 = true;
                sc0 sc0Var = new sc0(0, wc0Var, ec0.class, "susiButtonClicked", JWcjNoweKCnTr.DRJ, 0, 0);
                wc0Var2 = wc0Var;
                p65Var.j0(sc0Var);
                objM = sc0Var;
            } else {
                i6 = i14;
                z2 = true;
                wc0Var2 = wc0Var;
            }
            m45 m45Var = (m45) ((qh6) objM);
            int i16 = iArr[susiOperation.ordinal()];
            if (i16 == z2) {
                z3 = false;
                i7 = 1587752603;
                i8 = R.string.susi_auth_create_an_account;
            } else {
                if (i16 != 2) {
                    throw ho2.L(p65Var, 1587747506, false);
                }
                i7 = 1587749841;
                i8 = R.string.susi_auth_sign_in;
                z3 = false;
            }
            boolean z5 = z3;
            fo7.j(m45Var, km4.w(p65Var, i7, i8, p65Var, z3), xn7.L, bgf.N(jfc.d(o28Var, 1.0f), "create_an_account"), false, null, p65Var, 3456, 48);
            p65Var = p65Var;
            b09.H(p65Var, z2, z2, z2);
            boolean z6 = i6 == 32 ? z2 : z5;
            Object objM2 = p65Var.M();
            if (z6 || objM2 == uobVar) {
                objM2 = new z8(wc0Var2, null, 12);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            wc0Var2 = wc0Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gc0(md0Var, wc0Var2, r28Var, i2, 1);
        }
    }

    public static d34 h0(JSONObject jSONObject) throws JSONException {
        String string = jSONObject.getString("event_name");
        String string2 = jSONObject.getString("method");
        string2.getClass();
        Locale locale = Locale.ENGLISH;
        locale.getClass();
        String upperCase = string2.toUpperCase(locale);
        upperCase.getClass();
        c34 c34VarValueOf = c34.valueOf(upperCase);
        String string3 = jSONObject.getString("event_type");
        string3.getClass();
        String upperCase2 = string3.toUpperCase(locale);
        upperCase2.getClass();
        b34 b34VarValueOf = b34.valueOf(upperCase2);
        String string4 = jSONObject.getString("app_version");
        JSONArray jSONArray = jSONObject.getJSONArray("path");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i2);
            jSONObject2.getClass();
            arrayList.add(new j59(jSONObject2));
        }
        String strOptString = jSONObject.optString("path_type", MaAxRJinch.latnYp);
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("parameters");
        ArrayList arrayList2 = new ArrayList();
        if (jSONArrayOptJSONArray != null) {
            int length2 = jSONArrayOptJSONArray.length();
            for (int i3 = 0; i3 < length2; i3++) {
                JSONObject jSONObject3 = jSONArrayOptJSONArray.getJSONObject(i3);
                jSONObject3.getClass();
                arrayList2.add(new q39(jSONObject3));
            }
        }
        String strOptString2 = jSONObject.optString("component_id");
        String strOptString3 = jSONObject.optString("activity_name");
        string.getClass();
        string4.getClass();
        strOptString2.getClass();
        strOptString.getClass();
        strOptString3.getClass();
        return new d34(string, c34VarValueOf, b34VarValueOf, string4, arrayList, arrayList2, strOptString2, strOptString, strOptString3);
    }
}
