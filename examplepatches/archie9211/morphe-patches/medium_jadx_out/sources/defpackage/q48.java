package defpackage;

import android.os.Build;
import android.view.ViewConfiguration;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q48 extends rh8 {
    public final zg7 f;
    public final uz0 g;
    public enc h;

    public q48(vsb vsbVar, zg7 zg7Var, lz1 lz1Var, m73 m73Var) {
        super(vsbVar, lz1Var, m73Var);
        this.f = zg7Var;
        this.g = pwd.e(Integer.MAX_VALUE, 6, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object e(defpackage.q48 r13, defpackage.rya r14, defpackage.oya r15, defpackage.vsb r16, defpackage.rya r17, long r18, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 208
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q48.e(q48, rya, oya, vsb, rya, long, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static m48 g(uz0 uz0Var) {
        m48 m48Var = null;
        nzb nzbVarF = vn7.F(new i05(new l48(uz0Var, 0), 0 == true ? 1 : 0, 2));
        while (nzbVarF.hasNext()) {
            m48 m48VarA = (m48) nzbVarF.next();
            if (m48Var != null) {
                m48VarA = m48Var.a(m48VarA);
            }
            m48Var = m48VarA;
        }
        return m48Var;
    }

    public final float c(tsb tsbVar, float f) {
        vsb vsbVar = this.a;
        long jH = vsbVar.h(vsbVar.d(f));
        vsb vsbVar2 = tsbVar.a;
        return vsbVar.g(vsbVar.e(vsbVar2.c(vsbVar2.k, jH, 1)));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.vsb r22, defpackage.m48 r23, float r24, float r25, defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 356
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q48.d(vsb, m48, float, float, p92):java.lang.Object");
    }

    public final boolean f(lb9 lb9Var) {
        long j;
        m73 m73Var = this.c;
        ViewConfiguration viewConfiguration = (ViewConfiguration) this.f.b;
        int i = Build.VERSION.SDK_INT;
        float f = -(i > 26 ? u36.l(viewConfiguration) : m73Var.Z(64.0f));
        float f2 = -(i > 26 ? u36.k(viewConfiguration) : m73Var.Z(64.0f));
        List list = lb9Var.a;
        ip8 ip8Var = new ip8(0L);
        int size = list.size();
        boolean zD = false;
        int i2 = 0;
        while (true) {
            j = ip8Var.a;
            if (i2 >= size) {
                break;
            }
            ip8Var = new ip8(ip8.e(j, ((rb9) list.get(i2)).j));
            i2++;
        }
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j >> 32)) * f2)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j & 4294967295L)) * f)) & 4294967295L);
        vsb vsbVar = this.a;
        float fI = vsbVar.i(vsbVar.e(jFloatToRawIntBits));
        if (fI != 0.0f) {
            nsb nsbVar = vsbVar.a;
            zD = fI > 0.0f ? nsbVar.d() : nsbVar.c();
        }
        if (zD) {
            return !(this.g.e(new m48(jFloatToRawIntBits, ((rb9) bu1.x0(lb9Var.a)).b, false)) instanceof jk1);
        }
        return this.d;
    }
}
