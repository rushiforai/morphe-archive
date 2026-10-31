package fz;

import android.graphics.Point;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f56317a;

    /* renamed from: b, reason: collision with root package name */
    public final cz.g f56318b;

    /* renamed from: c, reason: collision with root package name */
    public final cz.g f56319c;

    /* renamed from: d, reason: collision with root package name */
    public final cz.g f56320d;

    /* renamed from: e, reason: collision with root package name */
    public final cz.g f56321e;

    /* renamed from: f, reason: collision with root package name */
    public byte f56322f;

    /* renamed from: g, reason: collision with root package name */
    public final Point f56323g = new Point();

    /* renamed from: h, reason: collision with root package name */
    public final Point f56324h = new Point();

    /* renamed from: i, reason: collision with root package name */
    public final int[] f56325i;

    public o0(int i5) {
        this.f56317a = i5;
        this.f56318b = new cz.g(i5);
        this.f56319c = new cz.g(i5);
        this.f56320d = new cz.g(i5);
        this.f56321e = new cz.g(i5);
        int[] iArr = new int[9];
        this.f56325i = iArr;
        if (iArr.length % 2 != 1) {
            throw new IllegalStateException("Checkpointresults must have odd size");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(boolean z11) {
        int i5 = this.f56317a;
        int i11 = i5 / 32;
        if (i11 < 1) {
            i11 = 1;
        }
        int i12 = z11 ? i5 : 0;
        if (!z11) {
            i5 = 0;
        }
        int[] iArr = this.f56325i;
        int length = (iArr.length / 2) + 1;
        boolean z12 = false;
        for (int i13 = 0; i13 < length; i13++) {
            int length2 = (iArr.length - 1) - i13;
            if (z11) {
                if (iArr[i13] <= i12 && iArr[length2] <= i5) {
                    if (i13 != iArr.length / 2 && (iArr[i13] == i12 || iArr[length2] == i5)) {
                        z12 = true;
                    }
                    i12 = iArr[i13];
                    i5 = iArr[length2];
                    if (Math.abs(i12 - i5) <= (iArr.length - i13) * i11) {
                    }
                }
            } else if (iArr[i13] < i12 || iArr[length2] < i5) {
            }
            return 0;
        }
        return z12 ? 2 : 1;
    }

    public final boolean b() {
        int i5 = this.f56317a / 32;
        if (i5 < 1) {
            i5 = 1;
        }
        int[] iArr = this.f56325i;
        int length = iArr.length;
        int i11 = 0;
        for (int i12 = 0; i12 < length; i12++) {
            if (i12 == 0) {
                i11 = iArr[i12];
            }
            if (Math.abs(iArr[i12] - i11) > i5) {
                return false;
            }
            i11 = iArr[i12];
        }
        return true;
    }

    public final void c(byte b11, int i5, int i11, boolean z11) {
        int i12 = b11 & 255;
        if (Intrinsics.h(this.f56322f & 255, i12) < 0) {
            this.f56322f = b11;
            this.f56323g.set(i5, i11);
        }
        UInt.Companion companion = UInt.f71696b;
        if (Integer.compareUnsigned(i12, 240) >= 0) {
            this.f56324h.set(i5, i11);
        }
        int i13 = this.f56317a;
        float f11 = i13;
        float f12 = ((163.0f * f11) / 192.0f) / 2.0f;
        float f13 = ((128.0f * f11) / 192.0f) / 2.0f;
        float f14 = ((176.0f * f11) / 192.0f) / 2.0f;
        float f15 = f11 / 2.0f;
        float fAbs = Math.abs(f15 - i5);
        float fAbs2 = Math.abs(f15 - i11);
        int i14 = z11 ? i11 : i5;
        if (!z11) {
            i5 = i11;
        }
        int[] iArr = this.f56325i;
        int length = iArr.length;
        int i15 = length + 1;
        int i16 = 0;
        while (i16 < length) {
            int i17 = i16 + 1;
            if (i14 == (i13 * i17) / i15) {
                iArr[i16] = i5;
            }
            i16 = i17;
        }
        cz.g gVar = this.f56321e;
        cz.g gVar2 = this.f56320d;
        cz.g gVar3 = this.f56319c;
        cz.g gVar4 = this.f56318b;
        if (fAbs <= 0.0f || fAbs2 <= 0.0f) {
            ((float[]) gVar4.f48614c)[i14] = 1.8f;
            ((float[]) gVar3.f48614c)[i14] = 1.8f;
            ((float[]) gVar2.f48614c)[i14] = 1.8f;
            ((float[]) gVar.f48614c)[i14] = 1.8f;
            return;
        }
        double d5 = fAbs2;
        float fSqrt = f14 / ((float) Math.sqrt((d5 * d5) + (fAbs * fAbs)));
        if (fSqrt > 1.1f) {
            fSqrt = 1.1f;
        }
        float fMin = Math.min(f12 / fAbs2, f12 / fAbs);
        float f16 = fMin <= 1.1f ? fMin : 1.1f;
        float fMin2 = Math.min(f13 / fAbs, f14 / fAbs2);
        if (fMin2 > 1.0f) {
            fMin2 = 1.0f;
        }
        float fMin3 = Math.min(f14 / fAbs, f13 / fAbs2);
        float f17 = fMin3 <= 1.0f ? fMin3 : 1.0f;
        gVar4.d(fSqrt, i14);
        gVar3.d(f16, i14);
        gVar2.d(fMin2, i14);
        gVar.d(f17, i14);
    }
}
