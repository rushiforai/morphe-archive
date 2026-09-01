package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jk7 {
    public static final sn3 a;

    static {
        vx0.e0(new ov6(13));
        a = new sn3(1, new ov6(14));
    }

    public static final void a(fv1 fv1Var, h48 h48Var, w4c w4cVar, lyd lydVar, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        char c;
        char c2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(904511636);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(fv1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(h48Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(w4cVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(lydVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(mz1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            skb skbVarA = qkb.a(0.0f, 7, 0L, false);
            long j = fv1Var.a;
            boolean zE = p65Var.e(j);
            Object objM = p65Var.M();
            if (zE || objM == w12.a) {
                c = 2;
                c2 = 4;
                objM = new ekd(j, uu1.b(0.4f, j));
                p65Var.j0(objM);
            } else {
                c = 2;
                c2 = 4;
            }
            o10 o10VarA = iv1.a.a(fv1Var);
            o10 o10VarA2 = a.a(h48Var);
            o10 o10VarA3 = s06.a.a(skbVarA);
            o10 o10VarA4 = z4c.a.a(w4cVar);
            o10 o10VarA5 = fkd.a.a((ekd) objM);
            o10 o10VarA6 = pyd.a.a(lydVar);
            o10[] o10VarArr = new o10[6];
            o10VarArr[0] = o10VarA;
            o10VarArr[1] = o10VarA2;
            o10VarArr[c] = o10VarA3;
            o10VarArr[3] = o10VarA4;
            o10VarArr[c2] = o10VarA5;
            o10VarArr[5] = o10VarA6;
            k40.d(o10VarArr, pxf.E(-1750539308, new kd(lydVar, 6, mz1Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(fv1Var, h48Var, w4cVar, lydVar, mz1Var, i, 10);
        }
    }

    public static final void b(fv1 fv1Var, w4c w4cVar, lyd lydVar, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-449719819);
        int i2 = i | (p65Var.f(fv1Var) ? 4 : 2) | (p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            a(fv1Var, (h48) p65Var.j(a), w4cVar, lydVar, mz1Var, p65Var, (i2 & 14) | 3456 | ((i2 << 3) & 57344));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 13, fv1Var, w4cVar, lydVar, mz1Var);
        }
    }
}
