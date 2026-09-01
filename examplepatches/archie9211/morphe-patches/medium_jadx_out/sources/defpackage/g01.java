package defpackage;

import android.R;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.security.keystore.KeyGenParameterSpec;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import gen.model.SourceParameter;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.concurrent.locks.LockSupport;
import javax.crypto.KeyGenerator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class g01 {
    public static final mz1 n;
    public static final mr9 p;
    public static final /* synthetic */ int t = 0;
    public static final /* synthetic */ int u = 0;
    public static final /* synthetic */ int v = 0;
    public static final /* synthetic */ int w = 0;
    public static final /* synthetic */ int x = 0;
    public static hy2 y;
    public static final int[] a = {R.attr.name, R.attr.tint, R.attr.height, R.attr.width, R.attr.alpha, R.attr.autoMirrored, R.attr.tintMode, R.attr.viewportWidth, R.attr.viewportHeight};
    public static final int[] b = {R.attr.name, R.attr.pivotX, R.attr.pivotY, R.attr.scaleX, R.attr.scaleY, R.attr.rotation, R.attr.translateX, R.attr.translateY};
    public static final int[] c = {R.attr.name, R.attr.fillColor, R.attr.pathData, R.attr.strokeColor, R.attr.strokeWidth, R.attr.trimPathStart, R.attr.trimPathEnd, R.attr.trimPathOffset, R.attr.strokeLineCap, R.attr.strokeLineJoin, R.attr.strokeMiterLimit, R.attr.strokeAlpha, R.attr.fillAlpha, R.attr.fillType};
    public static final int[] d = {R.attr.name, R.attr.pathData, R.attr.fillType};
    public static final int[] e = {R.attr.drawable};
    public static final int[] f = {R.attr.name, R.attr.animation};
    public static final int[] g = {R.attr.interpolator, R.attr.duration, R.attr.startOffset, R.attr.repeatCount, R.attr.repeatMode, R.attr.valueFrom, R.attr.valueTo, R.attr.valueType};
    public static final int[] h = {R.attr.ordering};
    public static final int[] i = {R.attr.valueFrom, R.attr.valueTo, R.attr.valueType, R.attr.propertyName};
    public static final int[] j = {R.attr.value, R.attr.interpolator, R.attr.valueType, R.attr.fraction};
    public static final int[] k = {R.attr.propertyName, R.attr.pathData, R.attr.propertyXName, R.attr.propertyYName};
    public static final mz1 l = new mz1(new e02(14), false, 287754814);
    public static final mz1 m = new mz1(new a02(23), false, -1806301942);
    public static final mz1 o = new mz1(new zz1(20), false, 1156462156);
    public static final wz1 q = new wz1(2);
    public static final Object r = new Object();
    public static final Object s = new Object();

    static {
        int i2 = 4;
        n = new mz1(new m02(i2), false, 2081510612);
        p = new mr9(i2);
    }

    public static final void A(final lp8 lp8Var, final boolean z, final mcb mcbVar, final boolean z2, long j2, final float f2, final q4d q4dVar, x12 x12Var, final int i2) {
        int i3;
        long j3;
        int i4;
        long j4;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-466280168);
        if ((i2 & 6) == 0) {
            i3 = ((i2 & 8) == 0 ? p65Var.f(lp8Var) : p65Var.h(lp8Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.d(mcbVar.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= 8192;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.f(q4dVar) ? 1048576 : 524288;
        }
        if (p65Var.P(i3 & 1, (533651 & i3) != 533650)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                i4 = i3 & (-57345);
                j4 = 9205357640488583168L;
            } else {
                p65Var.S();
                i4 = i3 & (-57345);
                j4 = j2;
            }
            p65Var.q();
            if (z) {
                iyb iybVar = ixb.a;
                z3 = (mcbVar == mcb.Ltr && !z2) || (mcbVar == mcb.Rtl && z2);
            } else {
                iyb iybVar2 = ixb.a;
                z3 = (mcbVar != mcb.Ltr || z2) && !(mcbVar == mcb.Rtl && z2);
            }
            xq0 xq0Var = z3 ? bo.b : bo.a;
            int i5 = i4 & 14;
            boolean zG = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i5 == 4 || ((i4 & 8) != 0 && p65Var.h(lp8Var))) | p65Var.g(z3);
            Object objM = p65Var.M();
            if (zG || objM == w12.a) {
                objM = new cs(lp8Var, z, z3);
                p65Var.j0(objM);
            }
            long j5 = j4;
            xq0 xq0Var2 = xq0Var;
            j3 = j5;
            n(lp8Var, xq0Var2, pxf.E(1365123137, new ds((zte) p65Var.j(z22.u), j3, z3, wxb.a(q4dVar, false, (x45) objM), lp8Var), p65Var), p65Var, i5 | 384);
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final long j6 = j3;
            mwaVarS.d = new b55() { // from class: es
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    g01.A(lp8Var, z, mcbVar, z2, j6, f2, q4dVar, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void B(int i2, x12 x12Var, m45 m45Var, r28 r28Var, boolean z) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2111672474);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.g(z) ? 256 : 128);
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            iyb iybVar = ixb.a;
            hp7.t(p65Var, gx1.E(jfc.m(r28Var, 25.0f, 25.0f), new tn7(m45Var, z)));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hs(r28Var, m45Var, z, i2);
        }
    }

    public static final void C(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1606263451);
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
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            gq7.a(null, null, "No dismissable flags", null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 384, 0, 2043);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 7);
        }
    }

    public static final void D(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1094927584);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            iq7.b(iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, null, null, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 9);
        }
    }

    public static final void F(r28 r28Var, x12 x12Var, int i2) {
        nr5 nr5Var = rv8.r;
        fa4 fa4Var = qb8.a;
        zq0 zq0Var = z46.n;
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-811039404);
        int i3 = i2 | (p65Var.f(r28Var) ? 4 : 2);
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var2 = o28Var;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            ar0 ar0Var3 = ar0Var;
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD2 = w2g.D(jfc.d(o28Var2, 1.0f), 24.0f, 12.0f);
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j5 = p65Var.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            sq6 sq6Var = new sq6(1.0f, true);
            p65Var.Y(122832139);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).e.b.c);
            p65Var.p(false);
            r28 r28VarE = jfc.e(sq6Var, fZ);
            sn3 sn3Var3 = kt7.b;
            dy0.a(flb.a0(r28VarE, ((zo7) p65Var.j(sn3Var3)).b, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var2, 8.0f));
            r28 r28VarP = jfc.p(o28Var2, 100.0f);
            p65Var.Y(122844011);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).e.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.e(r28VarP, fZ2), ((zo7) p65Var.j(sn3Var3)).b, nr5Var), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.Y(-849246361);
            int iR = 0;
            while (iR < 18) {
                r28 r28VarJ2 = ka1.j((jp7) p65Var.j(kt7.a), o28Var2, 3, 1.0f);
                zk7 zk7VarC3 = dy0.c(ar0Var2, false);
                long j6 = p65Var.T;
                int i8 = (int) (j6 ^ (j6 >>> 32));
                i89 i89VarL5 = p65Var.l();
                r28 r28VarR5 = gx1.R(p65Var, r28VarJ2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC3);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL5);
                Integer numValueOf2 = Integer.valueOf(i8);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR5);
                o28 o28Var3 = o28Var2;
                r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(ar0Var3, false);
                int i9 = iR;
                long j7 = p65Var.T;
                int i10 = (int) (j7 ^ (j7 >>> 32));
                i89 i89VarL6 = p65Var.l();
                r28 r28VarR6 = gx1.R(p65Var, r28VarD3);
                p65Var.c0();
                ar0 ar0Var4 = ar0Var3;
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC4);
                tp7.B(p65Var, cuVar6, i89VarL6);
                ka1.z(i10, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR6);
                r28 r28VarE2 = w2g.E(jfc.e(jfc.d(o28Var3, 1.0f), 48.0f), 24.0f, 0.0f, 2);
                omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
                long j8 = p65Var.T;
                int i11 = (int) (j8 ^ (j8 >>> 32));
                i89 i89VarL7 = p65Var.l();
                r28 r28VarR7 = gx1.R(p65Var, r28VarE2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, ombVarA2);
                tp7.B(p65Var, cuVar6, i89VarL7);
                ka1.z(i11, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR7);
                sq6 sq6Var2 = new sq6(1.0f, true);
                p65Var.Y(1395003962);
                float fZ3 = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).o.b.c);
                p65Var.p(false);
                r28 r28VarE3 = jfc.e(sq6Var2, fZ3);
                sn3 sn3Var4 = kt7.b;
                dy0.a(flb.a0(r28VarE3, ((zo7) p65Var.j(sn3Var4)).b, nr5Var), p65Var, 0);
                hp7.t(p65Var, jfc.l(o28Var3, 8.0f));
                dy0.a(flb.a0(jfc.e(jfc.p(o28Var3, 52.0f), 32.0f), ((zo7) p65Var.j(sn3Var4)).b, nr5Var), p65Var, 0);
                p65Var.p(true);
                tp7.c(0.0f, 0, 6, 0L, p65Var, iy0.a.a(o28Var3, z46.j));
                iR = wgd.r(p65Var, true, true, i9, 1);
                o28Var2 = o28Var3;
                ar0Var3 = ar0Var4;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 8);
        }
    }

    public static final void G(qlb qlbVar, String str, r28 r28Var, sae saeVar, x12 x12Var, int i2) {
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1013268405);
        int i3 = (p65Var.f(qlbVar) ? 4 : 2) | i2 | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new nmc(str, 7);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                saeVar = (sae) to7.z(n1b.a.b(sae.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
            }
            int i4 = i3 & (-7169);
            p65Var.q();
            H(new lae(saeVar, qlbVar), r28Var, (qae) guc.z(saeVar.h, p65Var, 0).getValue(), p65Var, (i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
        } else {
            p65Var.S();
        }
        sae saeVar2 = saeVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 24, r28Var, (Object) qlbVar, (Object) str, (Object) saeVar2);
        }
    }

    public static final void H(lae laeVar, r28 r28Var, qae qaeVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1305665430);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(laeVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(qaeVar) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new obb(laeVar, null, 22);
                p65Var2.j0(objM);
            }
            kyd.k(p65Var2, (b55) objM, c1e.a);
            p65Var = p65Var2;
            pr7.b(bgf.N(r28Var, "scaffold").b(jfc.c), pxf.E(-1759866514, new f4e(i4, laeVar), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(2012383737, new so1(i4, qaeVar), p65Var2), p65Var, 805306416, 508);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 23, laeVar, r28Var, qaeVar);
        }
    }

    public static final void I(lae laeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1738197156);
        int i3 = (p65Var2.f(laeVar) ? 4 : 2) | i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new k8e(0, laeVar, lae.class, "onBackPressed", "onBackPressed()V", 0, 1);
                p65Var2.j0(objM);
            }
            m45 m45Var = (m45) ((qh6) objM);
            long j2 = ((zo7) p65Var2.j(kt7.b)).c;
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, "User Dismissable Flags", m45Var, null, null, null, 0L, j2, null, p65Var, 54, IptcDirectory.TAG_ARM_IDENTIFIER);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(laeVar, r28Var2, i2, 25);
        }
    }

    public static final boolean K(bqc bqcVar, int i2, y1 y1Var, boolean z) {
        boolean z2;
        synchronized (r) {
            try {
                int i3 = bqcVar.d;
                if (i3 == i2) {
                    bqcVar.c = y1Var;
                    z2 = true;
                    if (z) {
                        bqcVar.e++;
                    }
                    bqcVar.d = i3 + 1;
                } else {
                    z2 = false;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return z2;
    }

    public static final List L(wt6 wt6Var, du6 du6Var, rz2 rz2Var) {
        n46 n46Var;
        o78 o78Var = (o78) rz2Var.b;
        if (!(o78Var.c != 0) && du6Var.a.isEmpty()) {
            return ey3.a;
        }
        ArrayList arrayList = new ArrayList();
        if (((o78) rz2Var.b).c != 0) {
            int i2 = o78Var.c;
            if (i2 == 0) {
                ywb.h("MutableVector is empty.");
                return null;
            }
            Object[] objArr = o78Var.a;
            int i3 = ((bt6) objArr[0]).a;
            for (int i4 = 0; i4 < i2; i4++) {
                int i5 = ((bt6) objArr[i4]).a;
                if (i5 < i3) {
                    i3 = i5;
                }
            }
            if (i3 < 0) {
                e26.a("negative minIndex");
            }
            int i6 = o78Var.c;
            if (i6 == 0) {
                ywb.h("MutableVector is empty.");
                return null;
            }
            Object[] objArr2 = o78Var.a;
            int i7 = ((bt6) objArr2[0]).b;
            for (int i8 = 0; i8 < i6; i8++) {
                int i9 = ((bt6) objArr2[i8]).b;
                if (i9 > i7) {
                    i7 = i9;
                }
            }
            n46Var = new n46(i3, Math.min(i7, wt6Var.a() - 1), 1);
        } else {
            n46Var = n46.d;
        }
        int size = du6Var.a.size();
        for (int i10 = 0; i10 < size; i10++) {
            cu6 cu6Var = (cu6) du6Var.get(i10);
            int iH = vc2.H(wt6Var, cu6Var.a, cu6Var.c);
            int i11 = n46Var.a;
            if ((iH > n46Var.b || i11 > iH) && iH >= 0 && iH < wt6Var.a()) {
                arrayList.add(Integer.valueOf(iH));
            }
        }
        int i12 = n46Var.a;
        int i13 = n46Var.b;
        if (i12 <= i13) {
            while (true) {
                arrayList.add(Integer.valueOf(i12));
                if (i12 == i13) {
                    break;
                }
                i12++;
            }
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.wp M(defpackage.d31 r28, float r29) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g01.M(d31, float):wp");
    }

    public static final void N(anb anbVar) {
        anbVar.getClass();
        f17 f17VarB = d46.B();
        gnb gnbVarB0 = anbVar.B0("SELECT name FROM sqlite_master WHERE type = 'trigger'");
        while (gnbVarB0.w0()) {
            try {
                f17VarB.add(gnbVarB0.d0(0));
            } finally {
            }
        }
        xz5.F(gnbVarB0, null);
        ListIterator listIterator = d46.w(f17VarB).listIterator(0);
        while (true) {
            wn5 wn5Var = (wn5) listIterator;
            if (!wn5Var.hasNext()) {
                return;
            }
            String str = (String) wn5Var.next();
            if (tuc.N(str, "room_fts_content_sync_", false)) {
                qk7.q(anbVar, "DROP TRIGGER IF EXISTS ".concat(str));
            }
        }
    }

    public static int O(float f2, int i2, int i3) {
        if (i2 == i3 || f2 <= 0.0f) {
            return i2;
        }
        if (f2 >= 1.0f) {
            return i3;
        }
        float f3 = ((i2 >> 24) & 255) / 255.0f;
        float f4 = ((i3 >> 24) & 255) / 255.0f;
        float fC = c(((i2 >> 16) & 255) / 255.0f);
        float fC2 = c(((i2 >> 8) & 255) / 255.0f);
        float fC3 = c((i2 & 255) / 255.0f);
        float fC4 = c(((i3 >> 16) & 255) / 255.0f);
        float fC5 = c(((i3 >> 8) & 255) / 255.0f);
        float fC6 = c((i3 & 255) / 255.0f);
        float fE = lv8.e(f4, f3, f2, f3);
        float fE2 = lv8.e(fC4, fC, f2, fC);
        float fE3 = lv8.e(fC5, fC2, f2, fC2);
        float fE4 = lv8.e(fC6, fC3, f2, fC3);
        float fZ = z(fE2) * 255.0f;
        float fZ2 = z(fE3) * 255.0f;
        return Math.round(z(fE4) * 255.0f) | (Math.round(fZ) << 16) | (Math.round(fE * 255.0f) << 24) | (Math.round(fZ2) << 8);
    }

    public static long P(int i2, int i3, int i4, int i5) {
        int i6 = 262142;
        int iMin = Math.min(i4, 262142);
        int iMin2 = i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.min(i5, 262142);
        int i7 = iMin2 == Integer.MAX_VALUE ? iMin : iMin2;
        if (i7 >= 8191) {
            if (i7 < 32767) {
                i6 = 65534;
            } else if (i7 < 65535) {
                i6 = 32766;
            } else {
                if (i7 >= 262143) {
                    h72.l(i7);
                    z72.b();
                    return 0L;
                }
                i6 = 8190;
            }
        }
        return h72.a(Math.min(i6, i2), i3 != Integer.MAX_VALUE ? Math.min(i6, i3) : Integer.MAX_VALUE, iMin, iMin2);
    }

    public static long Q(int i2, int i3, int i4, int i5) {
        int i6 = 262142;
        int iMin = Math.min(i2, 262142);
        int iMin2 = i3 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.min(i3, 262142);
        int i7 = iMin2 == Integer.MAX_VALUE ? iMin : iMin2;
        if (i7 >= 8191) {
            if (i7 < 32767) {
                i6 = 65534;
            } else if (i7 < 65535) {
                i6 = 32766;
            } else {
                if (i7 >= 262143) {
                    h72.l(i7);
                    z72.b();
                    return 0L;
                }
                i6 = 8190;
            }
        }
        return h72.a(iMin, iMin2, Math.min(i6, i4), i5 != Integer.MAX_VALUE ? Math.min(i6, i5) : Integer.MAX_VALUE);
    }

    public static final bqc R(ejc ejcVar) {
        bqc bqcVar = ejcVar.a;
        bqcVar.getClass();
        return (bqc) uic.t(bqcVar, ejcVar);
    }

    public static final int S(ejc ejcVar) {
        bqc bqcVar = ejcVar.a;
        bqcVar.getClass();
        return ((bqc) uic.f(bqcVar)).e;
    }

    public static final boolean T(ejc ejcVar, x45 x45Var) {
        int i2;
        y1 y1Var;
        Object objInvoke;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (r) {
                bqc bqcVar = ejcVar.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i2 = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            x89 x89VarP = y1Var.p();
            objInvoke = x45Var.invoke(x89VarP);
            y1 y1VarD = x89VarP.d();
            if (g76.L(y1VarD, y1Var)) {
                break;
            }
            bqc bqcVar3 = ejcVar.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = K((bqc) uic.x(bqcVar3, ejcVar, oicVarH), i2, y1VarD, true);
            }
            uic.m(oicVarH, ejcVar);
        } while (!zK);
        return ((Boolean) objInvoke).booleanValue();
    }

    public static final Object U(ib2 ib2Var, b55 b55Var) throws Throwable {
        k34 k34VarA;
        ib2 ib2VarD;
        long jL0;
        hb2 hb2Var = wz7.d;
        kb2 kb2Var = (kb2) ib2Var.o0(hb2Var);
        zx3 zx3Var = zx3.a;
        if (kb2Var == null) {
            k34VarA = ald.a();
            ib2VarD = guc.D(zx3Var, ib2Var.j0(k34VarA), true);
            r13 r13Var = xg3.a;
            if (ib2VarD != r13Var && ib2VarD.o0(hb2Var) == null) {
                ib2VarD = ib2VarD.j0(r13Var);
            }
        } else {
            k34VarA = (k34) ald.a.get();
            ib2VarD = guc.D(zx3Var, ib2Var, true);
            r13 r13Var2 = xg3.a;
            if (ib2VarD != r13Var2 && ib2VarD.o0(hb2Var) == null) {
                ib2VarD = ib2VarD.j0(r13Var2);
            }
        }
        qs0 qs0Var = new qs0(ib2VarD, Thread.currentThread(), k34VarA);
        wb2.DEFAULT.invoke(b55Var, qs0Var, qs0Var);
        k34 k34Var = qs0Var.e;
        if (k34Var != null) {
            int i2 = k34.f;
            k34Var.K0(false);
        }
        while (true) {
            if (k34Var != null) {
                try {
                    jL0 = k34Var.L0();
                } catch (Throwable th) {
                    if (k34Var != null) {
                        int i3 = k34.f;
                        k34Var.I0(false);
                    }
                    throw th;
                }
            } else {
                jL0 = Long.MAX_VALUE;
            }
            if (qs0Var.P()) {
                break;
            }
            LockSupport.parkNanos(qs0Var, jL0);
            if (Thread.interrupted()) {
                qs0Var.k(new InterruptedException());
            }
        }
        if (k34Var != null) {
            int i4 = k34.f;
            k34Var.I0(false);
        }
        Object objK = o7f.K(qs0Var.H());
        cy1 cy1Var = objK instanceof cy1 ? (cy1) objK : null;
        if (cy1Var == null) {
            return objK;
        }
        throw cy1Var.a;
    }

    public static final void V(int i2, int i3) {
        if (i2 < 0 || i2 >= i3) {
            throw new IndexOutOfBoundsException("index (" + i2 + ") is out of bound of [0, " + i3 + ')');
        }
    }

    public static kfg W(String str) throws GeneralSecurityException {
        kfg kfgVar;
        try {
            synchronized (s) {
                try {
                    kfgVar = new kfg(mo7.V(str));
                    byte[] bArrA = qig.a(10);
                    byte[] bArr = new byte[0];
                    if (!Arrays.equals(bArrA, kfgVar.b(kfgVar.c(bArrA, bArr), bArr))) {
                        throw new KeyStoreException("cannot use Android Keystore: encryption/decryption of non-empty message and empty aad returns an incorrect result");
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            return kfgVar;
        } catch (IOException e2) {
            throw new GeneralSecurityException(e2);
        }
    }

    public static boolean X(String str) {
        synchronized (s) {
            try {
                String strV = mo7.V(str);
                try {
                    KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
                    keyStore.load(null);
                    if (keyStore.containsAlias(strV)) {
                        return false;
                    }
                    KeyGenParameterSpec keyGenParameterSpecBuild = new KeyGenParameterSpec.Builder(strV, 3).setKeySize(256).setBlockModes("GCM").setEncryptionPaddings("NoPadding").build();
                    KeyGenerator keyGenerator = KeyGenerator.getInstance("AES", "AndroidKeyStore");
                    keyGenerator.init(keyGenParameterSpecBuild);
                    keyGenerator.generateKey();
                    return true;
                } catch (IOException e2) {
                    throw new GeneralSecurityException(e2);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static final void a(rg1 rg1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1764589601);
        int i3 = (p65Var.f(rg1Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            d46.a(rg1Var.c, as7.j, null, null, null, null, null, 0.0f, 0, null, null, p65Var, 0, 0, 4092);
            String strW = rg1Var.b;
            if (strW == null) {
                strW = km4.w(p65Var, 180745071, com.medium.reader.R.string.catalog_item_unknown_user, p65Var, false);
            } else {
                p65Var.Y(180744389);
                p65Var.p(false);
            }
            o28 o28Var = o28.b;
            jjd.b(strW, bgf.N(w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), "author_name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 24960, 110588);
            p65Var = p65Var;
            if (rg1Var.d) {
                p65Var.Y(1308534457);
                w2g.e(vn7.J(com.medium.reader.R.drawable.ic_book_author, 0, p65Var), vo7.R(p65Var, com.medium.reader.R.string.book_author), bgf.N(w2g.E(o28Var, 4.0f, 0.0f, 2), "verified_author"), null, null, 0.0f, null, p65Var, 392, 120);
            } else {
                p65Var.Y(1300348101);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(rg1Var, r28Var, i2, 23);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.rg1 r22, defpackage.ye1 r23, defpackage.r28 r24, defpackage.oe1 r25, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 300
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g01.b(rg1, ye1, r28, oe1, x12, int, int):void");
    }

    public static float c(float f2) {
        return f2 <= 0.04045f ? f2 / 12.92f : (float) Math.pow((f2 + 0.055f) / 1.055f, 2.4000000953674316d);
    }

    public static final void d(final sb4 sb4Var, final s26 s26Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        int i3;
        fn fnVar;
        cu cuVar;
        cu cuVar2;
        fa4 fa4Var;
        cu cuVar3;
        ot2 ot2Var;
        cu cuVar4;
        uob uobVar;
        zq0 zq0Var;
        int i4;
        o28 o28Var;
        final s26 s26Var2 = s26Var;
        sb4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(301868745);
        int i5 = i2 | (p65Var.f(sb4Var) ? 4 : 2) | (p65Var.f(s26Var2) ? 32 : 16) | 384;
        final int i6 = 1;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i8 = i5 & 14;
            boolean z = (i7 == 32) | (i8 == 4);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z || objM == uobVar2) {
                objM = new m45() { // from class: rb4
                    @Override // defpackage.m45
                    public final Object invoke() throws PendingIntent.CanceledException {
                        int i9 = i6;
                        c1e c1eVar = c1e.a;
                        sb4 sb4Var2 = sb4Var;
                        s26 s26Var3 = s26Var2;
                        switch (i9) {
                            case 0:
                                String str = sb4Var2.a;
                                SourceParameter sourceParameter = sb4Var2.j;
                                str.getClass();
                                FeaturedPostsFragment featuredPostsFragment = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment.Z()).r(featuredPostsFragment.S(), str, gp7.u(sourceParameter));
                                break;
                            case 1:
                                String str2 = sb4Var2.a;
                                SourceParameter sourceParameter2 = sb4Var2.j;
                                str2.getClass();
                                FeaturedPostsFragment featuredPostsFragment2 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                b09.O(featuredPostsFragment2.Z(), featuredPostsFragment2.S(), str2, gp7.u(sourceParameter2), null, null, null, 120);
                                break;
                            default:
                                String str3 = sb4Var2.d;
                                SourceParameter sourceParameter3 = sb4Var2.j;
                                str3.getClass();
                                FeaturedPostsFragment featuredPostsFragment3 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment3.Z()).Q(featuredPostsFragment3.S(), str3, gp7.u(sourceParameter3));
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(hlg.r(o28Var2, false, null, null, (m45) objM, 15), "featured_post");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i9 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var, cuVar5, wv1VarA);
            cu cuVar6 = q12.e;
            tp7.B(p65Var, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i9);
            cu cuVar7 = q12.g;
            tp7.B(p65Var, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var, cuVar8, r28VarR);
            hp7.t(p65Var, jfc.l(o28Var2, 28.0f));
            r28 r28VarG = w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zq0 zq0Var2 = z46.n;
            fa4 fa4Var2 = qb8.a;
            omb ombVarA = nmb.a(fa4Var2, zq0Var2, p65Var, 48);
            long j3 = p65Var.T;
            int i10 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar5, ombVarA);
            tp7.B(p65Var, cuVar6, i89VarL2);
            ka1.z(i10, p65Var, cuVar7, p65Var, fnVar2);
            tp7.B(p65Var, cuVar8, r28VarR2);
            if (sb4Var.c) {
                p65Var.Y(449373986);
                i3 = i8;
                fnVar = fnVar2;
                cuVar = cuVar7;
                cuVar4 = cuVar8;
                uobVar = uobVar2;
                ot2Var = ot2Var2;
                zq0Var = zq0Var2;
                cuVar2 = cuVar5;
                cuVar3 = cuVar6;
                o28Var = o28Var2;
                fa4Var = fa4Var2;
                i4 = i7;
                w2g.e(vn7.J(com.medium.reader.R.drawable.ic_member_16, 0, p65Var), vo7.R(p65Var, com.medium.reader.R.string.cd_member_only), bgf.N(o28Var2, "featured_post_member_only"), null, null, 0.0f, null, p65Var, 392, 120);
                lv8.y(o28Var, 8.0f, p65Var, false);
            } else {
                i3 = i8;
                fnVar = fnVar2;
                cuVar = cuVar7;
                cuVar2 = cuVar5;
                fa4Var = fa4Var2;
                cuVar3 = cuVar6;
                ot2Var = ot2Var2;
                cuVar4 = cuVar8;
                uobVar = uobVar2;
                zq0Var = zq0Var2;
                i4 = i7;
                o28Var = o28Var2;
                p65Var.Y(447260499);
                p65Var.p(false);
            }
            String strR = vo7.R(p65Var, com.medium.reader.R.string.featured_post_featured_by);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).n;
            sn3 sn3Var2 = kt7.b;
            o28 o28Var3 = o28Var;
            cu cuVar9 = cuVar4;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.l(o28Var3, 2.0f));
            String strW = sb4Var.e;
            if (strW == null) {
                strW = km4.w(p65Var, 1122897051, com.medium.reader.R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(1122896369);
                p65Var.p(false);
            }
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarY = r40.y(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), bmb.a(4.0f));
            int i11 = i3;
            boolean z2 = (i4 == 32) | (i11 == 4);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                final int i12 = 2;
                objM2 = new m45() { // from class: rb4
                    @Override // defpackage.m45
                    public final Object invoke() throws PendingIntent.CanceledException {
                        int i92 = i12;
                        c1e c1eVar = c1e.a;
                        sb4 sb4Var2 = sb4Var;
                        s26 s26Var3 = s26Var;
                        switch (i92) {
                            case 0:
                                String str = sb4Var2.a;
                                SourceParameter sourceParameter = sb4Var2.j;
                                str.getClass();
                                FeaturedPostsFragment featuredPostsFragment = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment.Z()).r(featuredPostsFragment.S(), str, gp7.u(sourceParameter));
                                break;
                            case 1:
                                String str2 = sb4Var2.a;
                                SourceParameter sourceParameter2 = sb4Var2.j;
                                str2.getClass();
                                FeaturedPostsFragment featuredPostsFragment2 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                b09.O(featuredPostsFragment2.Z(), featuredPostsFragment2.S(), str2, gp7.u(sourceParameter2), null, null, null, 120);
                                break;
                            default:
                                String str3 = sb4Var2.d;
                                SourceParameter sourceParameter3 = sb4Var2.j;
                                str3.getClass();
                                FeaturedPostsFragment featuredPostsFragment3 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment3.Z()).Q(featuredPostsFragment3.S(), str3, gp7.u(sourceParameter3));
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            uob uobVar3 = uobVar;
            jjd.b(strW, bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM2, 15), 2.0f, 4.0f, 2.0f, 4.0f), "featured_post_editor_name"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var3, 2.0f));
            String str = new SimpleDateFormat("MMM d, yyyy", Locale.US).format(Long.valueOf(sb4Var.f));
            str.getClass();
            jjd.b(vo7.Q(com.medium.reader.R.string.featured_post_on_date, new Object[]{str}, p65Var), bgf.N(o28Var3, "featured_post_date"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            ka1.B(p65Var, true, o28Var3, 8.0f, p65Var);
            String strW2 = sb4Var.b;
            if (strW2 == null) {
                strW2 = km4.w(p65Var, -1137046623, com.medium.reader.R.string.common_untitled_story, p65Var, false);
            } else {
                p65Var.Y(-1137047274);
                p65Var.p(false);
            }
            jjd.b(strW2, bgf.N(w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10), "featured_post_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).e, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var3, 12.0f));
            r28 r28VarG2 = w2g.G(o28Var3, 8.0f, 0.0f, 12.0f, 0.0f, 10);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j4 = p65Var.T;
            int i13 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, ombVarA2);
            tp7.B(p65Var, cuVar3, i89VarL3);
            ka1.z(i13, p65Var, cuVar, p65Var, fnVar);
            tp7.B(p65Var, cuVar9, r28VarR3);
            boolean z3 = (i11 == 4) | (i4 == 32);
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar3) {
                s26Var2 = s26Var;
                final int i14 = 0;
                objM3 = new m45() { // from class: rb4
                    @Override // defpackage.m45
                    public final Object invoke() throws PendingIntent.CanceledException {
                        int i92 = i14;
                        c1e c1eVar = c1e.a;
                        sb4 sb4Var2 = sb4Var;
                        s26 s26Var3 = s26Var2;
                        switch (i92) {
                            case 0:
                                String str2 = sb4Var2.a;
                                SourceParameter sourceParameter = sb4Var2.j;
                                str2.getClass();
                                FeaturedPostsFragment featuredPostsFragment = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment.Z()).r(featuredPostsFragment.S(), str2, gp7.u(sourceParameter));
                                break;
                            case 1:
                                String str22 = sb4Var2.a;
                                SourceParameter sourceParameter2 = sb4Var2.j;
                                str22.getClass();
                                FeaturedPostsFragment featuredPostsFragment2 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                b09.O(featuredPostsFragment2.Z(), featuredPostsFragment2.S(), str22, gp7.u(sourceParameter2), null, null, null, 120);
                                break;
                            default:
                                String str3 = sb4Var2.d;
                                SourceParameter sourceParameter3 = sb4Var2.j;
                                str3.getClass();
                                FeaturedPostsFragment featuredPostsFragment3 = (FeaturedPostsFragment) ((rz2) s26Var3.b).b;
                                ((p13) featuredPostsFragment3.Z()).Q(featuredPostsFragment3.S(), str3, gp7.u(sourceParameter3));
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM3);
            } else {
                s26Var2 = s26Var;
            }
            fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) objM3, xn7.M, bgf.N(o28Var3, "cta_view_stats"), vo7.R(p65Var, com.medium.reader.R.string.featured_post_view_story_stats), false, false);
            p65Var = p65Var;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            hp7.t(p65Var, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true));
            f(sb4Var, s26Var2, null, p65Var, i5 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            ka1.B(p65Var, true, o28Var3, 20.0f, p65Var);
            p65Var.p(true);
            obj = o28Var3;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 9, sb4Var, s26Var2, obj);
        }
    }

    public static final void e(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(295960233);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).o;
            o28 o28Var = o28.b;
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            r28 r28VarE = jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0.7f), 16.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarE, j2, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            p65Var.Y(525871055);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).e.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), fZ * 2.0f), j2, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            dy0.a(flb.a0(jfc.m(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 100.0f, 20.0f), j2, nr5Var), p65Var, 0);
            lv8.y(o28Var, 24.0f, p65Var, true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 21);
        }
    }

    public static final void f(sb4 sb4Var, s26 s26Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1840709611);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(sb4Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= (i2 & 64) == 0 ? p65Var.f(s26Var) : p65Var.h(s26Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var, 24);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, bgf.N(o28Var, "more_options"), false, null, null, pxf.E(1505383409, new l23(10, sb4Var), p65Var), p65Var, 1572918, 60);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new vs(l78Var, 25);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(75247476, new nh(sb4Var, s26Var, l78Var, 22), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 16, sb4Var, s26Var, r28Var2);
        }
    }

    public static final void g(int i2, x12 x12Var, m45 m45Var, r28 r28Var, boolean z) {
        m45 m45Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(453254151);
        int i3 = (p65Var.g(z) ? 4 : 2) | i2 | (p65Var.h(m45Var) ? 32 : 16) | 384;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            m45Var2 = m45Var;
            f49.l(m45Var2, bgf.N(o28Var, "follow_catalog_button").b(o28Var), false, rv8.F(((zo7) p65Var.j(kt7.b)).n, p65Var), null, pxf.E(1814299817, new ts4(i4, z), p65Var), p65Var, ((i3 >> 3) & 14) | 1572864, 52);
            r28Var = o28Var;
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new us4(z, m45Var2, r28Var, i2);
        }
    }

    public static final void h(lx4 lx4Var, m45 m45Var, cs1 cs1Var, kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-251490685);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(lx4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(cs1Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(kv6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var = p65Var2;
            er7.d(lx4Var.b, m45Var, r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1294835765, new gx4(kv6Var, lx4Var, cs1Var, i4), p65Var2), p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(lx4Var, m45Var, cs1Var, kv6Var, r28Var, i2);
        }
    }

    public static final void i(mx4 mx4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1553598202);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(mx4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
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
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            gq7.a(jfc.c, null, vo7.R(p65Var, mx4Var.a ? com.medium.reader.R.string.following_tab_publications_empty_state_title_current_user : com.medium.reader.R.string.following_tab_publications_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(mx4Var, r28Var, i2, 14);
        }
    }

    public static final void j(nx4 nx4Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1985559880);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(nx4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            int i5 = i3;
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(nx4Var.a, iy0.a.a(o28Var, ar0Var), null, null, null, null, m45Var, null, p65Var, (i5 << 15) & 3670016, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 20, nx4Var, m45Var, r28Var);
        }
    }

    public static final void k(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1614870580);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = 8;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarB = r28Var.b(jfc.c);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new cq4(i4);
                p65Var.j0(objM);
            }
            k40.t(r28VarB, null, null, null, null, null, false, null, (x45) objM, p65Var, 817889280, 382);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 8);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:75:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.px4 r14, defpackage.cs1 r15, defpackage.r28 r16, defpackage.m45 r17, defpackage.x12 r18, int r19, int r20) {
        /*
            Method dump skipped, instruction units count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g01.l(px4, cs1, r28, m45, x12, int, int):void");
    }

    public static final void m(String str, String str2, rz2 rz2Var, nhc nhcVar, r28 r28Var, sx4 sx4Var, x12 x12Var, int i2) {
        r28 r28Var2;
        sx4 sx4Var2;
        int i3;
        sx4 sx4Var3;
        r28 r28Var3;
        sx4 sx4Var4;
        str.getClass();
        str2.getClass();
        nhcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-822710950);
        int i4 = 4;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(rz2Var) ? 256 : 128) | (p65Var.f(nhcVar) ? 2048 : 1024) | 90112;
        int i6 = 0;
        if (p65Var.P(i5 & 1, (74899 & i5) != 74898)) {
            p65Var.U();
            int i7 = i2 & 1;
            uob uobVar = w12.a;
            if (i7 == 0 || p65Var.z()) {
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
                    i3 = i5 & (-458753);
                    sx4Var3 = (sx4) to7.z(n1b.a.b(sx4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i5 & (-458753);
                r28Var3 = r28Var;
                sx4Var3 = sx4Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(sx4Var3.m, p65Var, 0);
            hx4 hx4Var = new hx4(rz2Var, i6, sx4Var3);
            px4 px4Var = (px4) l78VarZ.getValue();
            boolean zH = p65Var.h(sx4Var3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new gi4(0, sx4Var3, sx4.class, "refresh", "refresh()V", 0, 18);
                p65Var.j0(objM2);
            }
            sx4 sx4Var5 = sx4Var3;
            l(px4Var, hx4Var, r28Var3, (m45) ((qh6) objM2), p65Var, 384, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH2 = p65Var.h(sx4Var5) | ((i3 & 7168) == 2048) | p65Var.h(resources) | p65Var.f(hx4Var);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                sx4Var4 = sx4Var5;
                fl2 fl2Var = new fl2(sx4Var4, nhcVar, resources, hx4Var, null, 21);
                p65Var.j0(fl2Var);
                objM3 = fl2Var;
            } else {
                sx4Var4 = sx4Var5;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            sx4Var2 = sx4Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            sx4Var2 = sx4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, rz2Var, nhcVar, r28Var2, sx4Var2, i2, 10);
        }
    }

    public static final void n(lp8 lp8Var, xd xdVar, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1090171650);
        if ((i2 & 6) == 0) {
            i3 = ((i2 & 8) == 0 ? p65Var.f(lp8Var) : p65Var.h(lp8Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(xdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(mz1Var) ? 256 : 128;
        }
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            if ((i3 & 14) != 4 && ((i3 & 8) == 0 || !p65Var.f(lp8Var))) {
                z = false;
            }
            boolean z3 = z2 | z;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new bi5(xdVar, lp8Var);
                p65Var.j0(objM);
            }
            tr.a((bi5) objM, null, new hd9(false, ovb.Inherit, false), mz1Var, p65Var, ((i3 << 3) & 7168) | 384, 2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 1, lp8Var, xdVar, mz1Var);
        }
    }

    public static final void o(long j2, oe1 oe1Var, az5 az5Var, int i2, x12 x12Var, int i3) {
        float f2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(439018749);
        int i4 = i3 | (p65Var.e(j2) ? 4 : 2) | (p65Var.d(oe1Var.ordinal()) ? 32 : 16) | (p65Var.f(az5Var) ? 256 : 128);
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            c09 c09VarJ = vn7.J(com.medium.reader.R.drawable.list_preview_placeholder, 0, p65Var);
            sw5 sw5Var = (sw5) bu1.A0(i2, az5Var);
            Context context = (Context) p65Var.j(eo.b);
            int iH = f72.h(j2);
            int iG = f72.g(j2);
            oe1Var.getClass();
            int i5 = fg1.a[oe1Var.ordinal()];
            if (i5 == 1 && i2 == 0) {
                f2 = 0.44f;
            } else if (i5 == 1 && i2 == 1) {
                f2 = 0.38f;
            } else if (i5 == 1 && i2 == 2) {
                f2 = 0.18f;
            } else if (i5 == 2 && i2 == 0) {
                f2 = 0.54f;
            } else if (i5 == 2 && i2 == 1) {
                f2 = 0.3f;
            } else {
                if (i5 != 2 || i2 != 2) {
                    ay0.e(ev6.w("Preview index: ", i2, " not supported!"));
                    return;
                }
                f2 = 0.14f;
            }
            xe3 xe3VarA0 = vv2.a0(nk7.w0(iH * f2));
            xe3 xe3VarA02 = vv2.a0(iG);
            cfc cfcVar = new cfc(xe3VarA0, xe3VarA02);
            r28 r28VarG = w2g.G(o28.b, i2 > 0 ? 2.0f : 0.0f, 0.0f, 0.0f, 0.0f, 14);
            sn3 sn3Var = z22.h;
            k40.c(u57.a.a(new me1(((zo7) p65Var.j(kt7.b)).b)), pxf.E(165759037, new e45(context, sw5Var, cfcVar, bgf.N(jfc.m(r28VarG, vv2.b0(xe3VarA0, (m73) p65Var.j(sn3Var)), vv2.b0(xe3VarA02, (m73) p65Var.j(sn3Var))), "image_preview"), c09VarJ, 10), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new be1(j2, oe1Var, az5Var, i2, i3);
        }
    }

    public static final void p(az5 az5Var, oe1 oe1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1862571566);
        int i3 = (p65Var.f(az5Var) ? 4 : 2) | i2 | (p65Var.d(oe1Var.ordinal()) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r40.h(r28Var, null, pxf.E(1124914968, new ec(oe1Var, i4, az5Var), p65Var), p65Var, ((i3 >> 6) & 14) | 3072, 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 11, az5Var, oe1Var, r28Var);
        }
    }

    public static final x16 q(pj6 pj6Var, String str) {
        return new x16(str, new y16(pj6Var));
    }

    public static final void r(rg1 rg1Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        String strD;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1060517440);
        int i4 = i2 | (p65Var.f(rg1Var) ? 4 : 2) | (p65Var.f(ye1Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i6 = i4 & 14;
            int i7 = rg1Var.g;
            bo4 bo4Var = rg1Var.j;
            if (i7 == 0) {
                strD = km4.w(p65Var, 1271933747, com.medium.reader.R.string.catalog_item_no_stories, p65Var, false);
            } else {
                p65Var.Y(1272005946);
                int i8 = rg1Var.g;
                strD = vo7.D(com.medium.reader.R.plurals.n_stories, i8, new Object[]{String.valueOf(i8)}, p65Var);
                p65Var.p(false);
            }
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
            sn3 sn3Var = kt7.b;
            String str = strD;
            mkd mkdVarA = mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            o28 o28Var = o28.b;
            jjd.b(str, bgf.N(o28Var, "item_count"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var, 48, 24960, 110588);
            p65Var = p65Var;
            if (rg1Var.h != CatalogVisibility.PUBLIC) {
                p65Var.Y(-376958536);
                qv5.b(vn7.J(com.medium.reader.R.drawable.ic_lock_filled, 0, p65Var), vo7.R(p65Var, com.medium.reader.R.string.cd_private), w2g.G(bgf.N(o28Var, "visibility_lock"), 12.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(sn3Var)).n, p65Var, 392, 0);
            } else {
                p65Var.Y(-386109922);
            }
            p65Var.p(false);
            hp7.t(p65Var, new sq6(1.0f, true));
            boolean z = rg1Var.k;
            uob uobVar = w12.a;
            if (z) {
                p65Var.Y(-376416687);
                l78 l78VarX = guc.x(rg1Var.l, ng1.a, p65Var, 48);
                String strA = af1.a(rg1Var.f, p65Var);
                pg1 pg1Var = (pg1) l78VarX.getValue();
                kj3 kj3Var = kj3.SMALL;
                boolean z2 = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i6 == 4);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new ae1(ye1Var, rg1Var, 1);
                    p65Var.j0(objM);
                }
                i3 = -386109922;
                guc.c(strA, pg1Var, kj3Var, (m45) objM, null, 0L, p65Var, 384, 48);
                p65Var = p65Var;
            } else {
                i3 = -386109922;
                p65Var.Y(-386109922);
            }
            p65Var.p(false);
            if (bo4Var != null) {
                p65Var.Y(-375751365);
                l78 l78VarX2 = guc.x(bo4Var, new bjb(Boolean.FALSE), p65Var, 0);
                if (((bjb) l78VarX2.getValue()).a instanceof ajb) {
                    p65Var.Y(i3);
                } else {
                    p65Var.Y(-375565241);
                    Object obj = ((bjb) l78VarX2.getValue()).a;
                    br7.v(obj);
                    boolean zBooleanValue = ((Boolean) obj).booleanValue();
                    boolean zF = (i6 == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(l78VarX2);
                    Object objM2 = p65Var.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new ce1(ye1Var, rg1Var, l78VarX2, 3);
                        p65Var.j0(objM2);
                    }
                    g(0, p65Var, (m45) objM2, null, zBooleanValue);
                }
                p65Var.p(false);
            } else {
                p65Var.Y(i3);
            }
            p65Var.p(false);
            x(rg1Var, ye1Var, null, p65Var, i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 10, rg1Var, ye1Var, r28Var);
        }
    }

    public static final void s(wd7 wd7Var, nhc nhcVar, ld7 ld7Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        wd7Var.getClass();
        nhcVar.getClass();
        ld7Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1121661555);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(wd7Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(ld7Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new vx5(29);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "magic_link_confirmation_screen"), pxf.E(1305506449, new jd7(wd7Var, ld7Var), p65Var2), null, pxf.E(-44903661, new w87(nhcVar, i4), p65Var2), null, 0, 0L, 0L, null, pxf.E(1786395164, new g64(wd7Var, 19, ld7Var), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 29, wd7Var, nhcVar, ld7Var, r28Var);
        }
    }

    public static final void t(String str, String str2, SusiDestination susiDestination, SusiOperation susiOperation, hd7 hd7Var, r28 r28Var, zd7 zd7Var, x12 x12Var, int i2) {
        r28 r28Var2;
        zd7 zd7Var2;
        zd7 zd7Var3;
        int i3;
        r28 r28Var3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1579388511);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(susiDestination) ? 256 : 128) | (p65Var.d(susiOperation == null ? -1 : susiOperation.ordinal()) ? 2048 : 1024) | (p65Var.f(hd7Var) ? 16384 : 8192) | 720896;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256) | ((i4 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    iu iuVar = new iu(str, str2, susiDestination, susiOperation, 13);
                    p65Var.j0(iuVar);
                    objM = iuVar;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    zd7Var3 = (zd7) to7.z(n1b.a.b(zd7.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-3670017);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-3670017);
                r28Var3 = r28Var;
                zd7Var3 = zd7Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(zd7Var3.n, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            int i7 = i3 & 57344;
            boolean zF = (i7 == 16384) | p65Var.f(zd7Var3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ld7(hd7Var, zd7Var3);
                p65Var.j0(objM3);
            }
            r28 r28Var4 = r28Var3;
            s((wd7) l78VarZ.getValue(), nhcVar, (ld7) objM3, r28Var4, p65Var, 3120);
            boolean zH = p65Var.h(zd7Var3) | (i7 == 16384);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new kd7(zd7Var3, hd7Var, null, i5);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            zd7Var2 = zd7Var3;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            zd7Var2 = zd7Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, str2, susiDestination, susiOperation, hd7Var, r28Var2, zd7Var2, i2, 5);
        }
    }

    public static final void u(wd7 wd7Var, ld7 ld7Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-958446190);
        int i3 = (p65Var2.f(wd7Var) ? 4 : 2) | i2 | (p65Var2.f(ld7Var) ? 32 : 16);
        if (!p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var = p65Var2;
            p65Var.S();
        } else if (wd7Var instanceof vd7) {
            p65Var2.Y(-1943779786);
            p65Var2.p(false);
            p65Var = p65Var2;
        } else {
            if (!(wd7Var instanceof ud7)) {
                throw ho2.L(p65Var2, -1943782170, false);
            }
            p65Var2.Y(-1943777588);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new ek5(0, ld7Var, ld7.class, "onBackPressed", "onBackPressed()V", 0, 22);
                p65Var2.j0(objM);
            }
            qk7.g(null, null, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var2, 0, 507);
            p65Var = p65Var2;
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jd7(wd7Var, ld7Var, i2);
        }
    }

    public static final void v(ud7 ud7Var, r28 r28Var, x12 x12Var, int i2) {
        String strR;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1715454795);
        int i3 = (p65Var.f(ud7Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(jfc.c), "error"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            td7 td7Var = ud7Var.a;
            if (td7Var instanceof rd7) {
                p65Var.Y(-1946881586);
                strR = vo7.R(p65Var, ((rd7) td7Var).a);
                p65Var.p(false);
            } else {
                if (!(td7Var instanceof sd7)) {
                    throw ho2.L(p65Var, -1946884487, false);
                }
                p65Var.Y(-1946877433);
                p65Var.p(false);
                strR = ((sd7) td7Var).a;
            }
            iq7.b(iy0.a.a(o28Var, ar0Var), strR, null, null, null, null, null, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(ud7Var, r28Var, i2, 22);
        }
    }

    public static final void w(ld7 ld7Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2089573980);
        int i3 = (p65Var.f(ld7Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "loading"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
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
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            n92 n92Var = null;
            xz5.o(iy0.a.a(o28Var, ar0Var), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            b09.H(p65Var, true, true, true);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new lo5(ld7Var, n92Var, 5);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(ld7Var, r28Var, i2, 21);
        }
    }

    public static final void x(rg1 rg1Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-820797444);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(rg1Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(ye1Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var, 7);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, bgf.N(o28Var, "more_options"), false, null, null, pxf.E(859812312, new k6c(23, rg1Var), p65Var), p65Var, 1572918, 60);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new vs(l78Var, 6);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-1658416421, new nh(rg1Var, ye1Var, l78Var, 17), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 9, rg1Var, ye1Var, r28Var2);
        }
    }

    public static final void y(l78 l78Var, boolean z) {
        l78Var.setValue(Boolean.valueOf(z));
    }

    public static float z(float f2) {
        return f2 <= 0.0031308f ? f2 * 12.92f : (float) ((Math.pow(f2, 0.4166666567325592d) * 1.0549999475479126d) - 0.054999999701976776d);
    }

    public abstract String J();

    public static final void E(oae oaeVar, r28 r28Var, x12 x12Var, int i2) {
        oae oaeVar2;
        ot2 ot2Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1309353292);
        int i3 = i2 | (p65Var.f(oaeVar) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            jt jtVar = (jt) p65Var.j(z22.t);
            r28 r28VarD = w2g.D(wgf.R(r28Var, wgf.K(p65Var), false, 14), 24.0f, 12.0f);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            sn3 sn3Var = kt7.a;
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
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
            p65Var.Y(1165518048);
            kx kxVar = new kx();
            kxVar.d("To remove a dismissable flag, visit ");
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean zH = p65Var.h(jtVar) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new bf0(jtVar, 8, oaeVar);
                p65Var.j0(objM);
            }
            int iV = ho2.v("remove_dismissable_flags", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d("Admin Tools Users Debugger");
                kxVar.f(iV);
                kxVar.d(DtuT.FQPxzSAvSVut);
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                jjd.c(mxVarI, w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 12.0f, 7), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, 48, 0, 262140);
                p65Var = p65Var;
                p65Var.p(true);
                p65Var.p(true);
                r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
                int i7 = 0;
                zk7 zk7VarC3 = dy0.c(ar0Var, false);
                long j5 = p65Var.T;
                int i8 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
                p65Var.c0();
                if (p65Var.S) {
                    ot2Var = ot2Var2;
                    p65Var.k(ot2Var);
                } else {
                    ot2Var = ot2Var2;
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC3);
                tp7.B(p65Var, cuVar2, i89VarL4);
                ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR4);
                r28 r28VarD3 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(ar0Var2, false);
                long j6 = p65Var.T;
                int i9 = (int) (j6 ^ (j6 >>> 32));
                i89 i89VarL5 = p65Var.l();
                r28 r28VarR5 = gx1.R(p65Var, r28VarD3);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC4);
                tp7.B(p65Var, cuVar2, i89VarL5);
                ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR5);
                oaeVar2 = oaeVar;
                m40.p(null, new h70(4.0f, true, new f70(i7, yq0Var)), null, null, 0, 0, pxf.E(-539061525, new nra(14, oaeVar2), p65Var), p65Var, 1572912, 61);
                b09.H(p65Var, true, true, true);
            } catch (Throwable th) {
                kxVar.f(iV);
                throw th;
            }
        } else {
            oaeVar2 = oaeVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(oaeVar2, r28Var, i2, 26);
        }
    }
}
