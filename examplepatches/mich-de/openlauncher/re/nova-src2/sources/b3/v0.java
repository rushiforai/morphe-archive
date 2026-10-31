package b3;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v0 implements y3.c {

    /* renamed from: a, reason: collision with root package name */
    public boolean f17378a;

    /* renamed from: b, reason: collision with root package name */
    public long f17379b = 9223372034707292159L;

    /* renamed from: c, reason: collision with root package name */
    public long f17380c = 0;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ y0 f17381d;

    public v0(y0 y0Var) {
        this.f17381d = y0Var;
    }

    public final boolean a() {
        return this.f17378a;
    }

    public final long b() {
        return this.f17379b;
    }

    public final long f() {
        return this.f17380c;
    }

    /* JADX WARN: Type inference failed for: r3v8, types: [java.io.Serializable, z2.p[]] */
    public final void g(z2.p pVar, float f11) {
        y0 y0Var = this.f17381d;
        o2 o2Var = y0Var.f17409m;
        if (o2Var == null) {
            o2Var = new o2(0);
            y0Var.f17409m = o2Var;
        }
        int iF0 = kotlin.collections.c.F0(pVar, (z2.p[]) o2Var.f17302b);
        if (iF0 >= 0) {
            float[] fArr = (float[]) o2Var.f17303c;
            if (fArr[iF0] != f11) {
                fArr[iF0] = f11;
                ((byte[]) o2Var.f17304d)[iF0] = 1;
                return;
            } else {
                byte[] bArr = (byte[]) o2Var.f17304d;
                if (bArr[iF0] == 2) {
                    bArr[iF0] = 0;
                    return;
                }
                return;
            }
        }
        int i5 = o2Var.f17301a;
        z2.p[] pVarArr = (z2.p[]) o2Var.f17302b;
        if (i5 == pVarArr.length) {
            int i11 = i5 * 2;
            Object[] objArrCopyOf = Arrays.copyOf(pVarArr, i11);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            o2Var.f17302b = (z2.p[]) objArrCopyOf;
            float[] fArrCopyOf = Arrays.copyOf((float[]) o2Var.f17303c, i11);
            Intrinsics.f(fArrCopyOf, "copyOf(...)");
            o2Var.f17303c = fArrCopyOf;
            byte[] bArrCopyOf = Arrays.copyOf((byte[]) o2Var.f17304d, i11);
            Intrinsics.f(bArrCopyOf, "copyOf(...)");
            o2Var.f17304d = bArrCopyOf;
        }
        ((z2.p[]) o2Var.f17302b)[i5] = pVar;
        ((byte[]) o2Var.f17304d)[i5] = 3;
        ((float[]) o2Var.f17303c)[i5] = f11;
        o2Var.f17301a++;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f17381d.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f17381d.getFontScale();
    }
}
