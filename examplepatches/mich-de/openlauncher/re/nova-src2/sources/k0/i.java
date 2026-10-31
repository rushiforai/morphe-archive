package k0;

import b.c9;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i implements h, j {

    /* renamed from: a, reason: collision with root package name */
    public final float f70637a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f70638b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f70639c;

    /* renamed from: d, reason: collision with root package name */
    public final float f70640d;

    public i(float f11, boolean z11, Function2 function2) {
        this.f70637a = f11;
        this.f70638b = z11;
        this.f70639c = function2;
        this.f70640d = f11;
    }

    @Override // k0.h, k0.j
    public final float a() {
        return this.f70640d;
    }

    @Override // k0.j
    public final void b(y3.c cVar, int i5, int[] iArr, int[] iArr2) {
        k(cVar, i5, iArr, y3.n.f96612a, iArr2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return y3.f.a(this.f70637a, iVar.f70637a) && this.f70638b == iVar.f70638b && Intrinsics.b(this.f70639c, iVar.f70639c);
    }

    public final int hashCode() {
        int iF = c9.f(Float.hashCode(this.f70637a) * 31, 31, this.f70638b);
        Function2 function2 = this.f70639c;
        return iF + (function2 == null ? 0 : function2.hashCode());
    }

    @Override // k0.h
    public final void k(y3.c cVar, int i5, int[] iArr, y3.n nVar, int[] iArr2) {
        int i11;
        int iMin;
        if (iArr.length == 0) {
            return;
        }
        int iMo96roundToPx0680j_4 = cVar.mo96roundToPx0680j_4(this.f70637a);
        boolean z11 = this.f70638b && nVar == y3.n.f96613b;
        g gVar = k.f70655a;
        if (z11) {
            i11 = 0;
            iMin = 0;
            for (int length = iArr.length - 1; -1 < length; length--) {
                int i12 = iArr[length];
                int iMin2 = Math.min(i11, i5 - i12);
                iArr2[length] = iMin2;
                iMin = Math.min(iMo96roundToPx0680j_4, (i5 - iMin2) - i12);
                i11 = iArr2[length] + i12 + iMin;
            }
        } else {
            int length2 = iArr.length;
            int i13 = 0;
            i11 = 0;
            iMin = 0;
            int i14 = 0;
            while (i13 < length2) {
                int i15 = iArr[i13];
                int iMin3 = Math.min(i11, i5 - i15);
                iArr2[i14] = iMin3;
                int iMin4 = Math.min(iMo96roundToPx0680j_4, (i5 - iMin3) - i15);
                int i16 = iArr2[i14] + i15 + iMin4;
                i13++;
                iMin = iMin4;
                i11 = i16;
                i14++;
            }
        }
        int i17 = i11 - iMin;
        Function2 function2 = this.f70639c;
        if (function2 == null || i17 >= i5) {
            return;
        }
        int iIntValue = ((Number) function2.invoke(Integer.valueOf(i5 - i17), nVar)).intValue();
        int length3 = iArr2.length;
        for (int i18 = 0; i18 < length3; i18++) {
            iArr2[i18] = iArr2[i18] + iIntValue;
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f70638b ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : "Absolute");
        sb2.append("Arrangement#spacedAligned(");
        sb2.append((Object) y3.f.b(this.f70637a));
        sb2.append(", ");
        sb2.append(this.f70639c);
        sb2.append(')');
        return sb2.toString();
    }
}
