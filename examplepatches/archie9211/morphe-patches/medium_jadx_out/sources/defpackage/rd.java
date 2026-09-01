package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class rd {
    public static final r28 a;
    public static final r28 b;
    public static final long c;
    public static final long d;
    public static final long e;

    static {
        o28 o28Var = o28.b;
        a = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
        b = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 28.0f, 2);
        c = en7.B(40);
        d = en7.B(36);
        e = en7.B(38);
    }

    public static final void b(final mz1 mz1Var, final r28 r28Var, final b55 b55Var, final b55 b55Var2, final m3c m3cVar, final long j, final long j2, x12 x12Var, final int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1945098332);
        int i2 = i | (p65Var.h(mz1Var) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16) | (p65Var.h(b55Var) ? 256 : 128) | (p65Var.h(b55Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(m3cVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.e(j) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.e(j2) ? 1048576 : 524288);
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            int i3 = ((i2 >> 3) & 14) | 1572864;
            int i4 = i2 >> 9;
            br7.i(r28Var, m3cVar, j, j2, 0.0f, pxf.E(802957984, new b45(b55Var, b55Var2, mz1Var, 6), p65Var), p65Var, i3 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 896) | (i4 & 7168), 48);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(r28Var, b55Var, b55Var2, m3cVar, j, j2, i) { // from class: fd
                public final /* synthetic */ r28 b;
                public final /* synthetic */ b55 c;
                public final /* synthetic */ b55 d;
                public final /* synthetic */ m3c e;
                public final /* synthetic */ long f;
                public final /* synthetic */ long g;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    rd.b(this.a, this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1271829505);
        int i2 = 0;
        if (p65Var.P(i & 1, (i & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new id(13);
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(6, mz1Var, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var, i, i2);
        }
    }

    public static final void a(b55 b55Var, b55 b55Var2, x12 x12Var, int i) {
        boolean z;
        boolean z2;
        ar0 ar0Var = z46.d;
        yq0 yq0Var = z46.p;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1213983107);
        int i2 = i | (p65Var.h(b55Var) ? 32 : 16) | (p65Var.h(b55Var2) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            sq6 sq6Var = new sq6(1.0f, false);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = id.b;
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, sq6Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7Var);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            if (b55Var == null) {
                p65Var.Y(1809237538);
                p65Var.p(false);
                z = false;
            } else {
                p65Var.Y(1809237539);
                r28 r28VarA = xv1.a(yq0Var, kng.J(a, QFTsJPDEnO.RppClO));
                zk7 zk7VarC = dy0.c(ar0Var, false);
                int iS2 = w2g.s(p65Var);
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarA);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC);
                tp7.B(p65Var, cuVar2, i89VarL2);
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                    lv8.w(iS2, p65Var, iS2, cuVar3);
                }
                tp7.B(p65Var, cuVar4, r28VarR2);
                b55Var.invoke(p65Var, 0);
                p65Var.p(true);
                z = false;
                p65Var.p(false);
            }
            if (b55Var2 == null) {
                p65Var.Y(1809370342);
                p65Var.p(z);
                z2 = true;
            } else {
                p65Var.Y(1809370343);
                r28 r28VarA2 = xv1.a(yq0Var, kng.J(b, "text"));
                zk7 zk7VarC2 = dy0.c(ar0Var, z);
                int iS3 = w2g.s(p65Var);
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarA2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS3))) {
                    lv8.w(iS3, p65Var, iS3, cuVar3);
                }
                tp7.B(p65Var, cuVar4, r28VarR3);
                b55Var2.invoke(p65Var, 0);
                z2 = true;
                p65Var.p(true);
                p65Var.p(false);
            }
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(b55Var, b55Var2, i, 7);
        }
    }
}
