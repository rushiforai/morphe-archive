package q50;

import b.c0;
import b.u4;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements CharSequence, Appendable {

    /* renamed from: a, reason: collision with root package name */
    public final b60.e f83680a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f83681b;

    /* renamed from: c, reason: collision with root package name */
    public char[] f83682c;

    /* renamed from: d, reason: collision with root package name */
    public String f83683d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f83684e;

    /* renamed from: f, reason: collision with root package name */
    public int f83685f;

    /* renamed from: g, reason: collision with root package name */
    public int f83686g;

    public c() {
        b60.e pool = e.f83687a;
        Intrinsics.g(pool, "pool");
        this.f83680a = pool;
    }

    public final char[] a(int i5) {
        ArrayList arrayList = this.f83681b;
        if (arrayList != null) {
            char[] cArr = this.f83682c;
            Intrinsics.d(cArr);
            return (char[]) arrayList.get(i5 / cArr.length);
        }
        if (i5 >= 2048) {
            e(i5);
            throw null;
        }
        char[] cArr2 = this.f83682c;
        if (cArr2 != null) {
            return cArr2;
        }
        e(i5);
        throw null;
    }

    @Override // java.lang.Appendable
    public final Appendable append(char c11) {
        char[] cArrD = d();
        char[] cArr = this.f83682c;
        Intrinsics.d(cArr);
        int length = cArr.length;
        int i5 = this.f83685f;
        cArrD[length - i5] = c11;
        this.f83683d = null;
        this.f83685f = i5 - 1;
        this.f83686g++;
        return this;
    }

    public final CharSequence b(int i5, int i11) {
        if (i5 == i11) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        StringBuilder sb2 = new StringBuilder(i11 - i5);
        for (int i12 = i5 - (i5 % 2048); i12 < i11; i12 += 2048) {
            char[] cArrA = a(i12);
            int iMin = Math.min(i11 - i12, 2048);
            for (int iMax = Math.max(0, i5 - i12); iMax < iMin; iMax++) {
                sb2.append(cArrA[iMax]);
            }
        }
        return sb2;
    }

    public final char c(int i5) {
        char[] cArrA = a(i5);
        char[] cArr = this.f83682c;
        Intrinsics.d(cArr);
        return cArrA[i5 % cArr.length];
    }

    @Override // java.lang.CharSequence
    public final char charAt(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "index is negative: ").toString());
        }
        if (i5 < this.f83686g) {
            return c(i5);
        }
        throw new IllegalArgumentException(a2.c.m(u4.j(i5, "index ", " is not in range [0, "), this.f83686g, ')').toString());
    }

    public final char[] d() {
        if (this.f83685f != 0) {
            char[] cArr = this.f83682c;
            Intrinsics.d(cArr);
            return cArr;
        }
        char[] cArr2 = (char[]) this.f83680a.J();
        char[] cArr3 = this.f83682c;
        this.f83682c = cArr2;
        this.f83685f = cArr2.length;
        this.f83684e = false;
        if (cArr3 != null) {
            ArrayList arrayList = this.f83681b;
            if (arrayList == null) {
                arrayList = new ArrayList();
                this.f83681b = arrayList;
                arrayList.add(cArr3);
            }
            arrayList.add(cArr2);
        }
        return cArr2;
    }

    public final void e(int i5) {
        if (this.f83684e) {
            throw new IllegalStateException("Buffer is already released");
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(i5);
        sb2.append(" is not in range [0; ");
        char[] cArr = this.f83682c;
        Intrinsics.d(cArr);
        sb2.append(cArr.length - this.f83685f);
        sb2.append(')');
        throw new IndexOutOfBoundsException(sb2.toString());
    }

    public final boolean equals(Object obj) {
        if (obj instanceof CharSequence) {
            CharSequence charSequence = (CharSequence) obj;
            if (this.f83686g == charSequence.length()) {
                int i5 = this.f83686g;
                for (int i11 = 0; i11 < i5; i11++) {
                    if (c(i11) != charSequence.charAt(i11)) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f83683d;
        if (str != null) {
            return str.hashCode();
        }
        int i5 = this.f83686g;
        int iC = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iC = (iC * 31) + c(i11);
        }
        return iC;
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.f83686g;
    }

    @Override // java.lang.CharSequence
    public final CharSequence subSequence(int i5, int i11) {
        if (i5 <= i11) {
            if (i5 < 0) {
                throw new IllegalArgumentException(c0.h(i5, "startIndex is negative: ").toString());
            }
            if (i11 <= this.f83686g) {
                return new b(this, i5, i11);
            }
            throw new IllegalArgumentException(a2.c.m(u4.j(i11, "endIndex (", ") is greater than length ("), this.f83686g, ')').toString());
        }
        throw new IllegalArgumentException(("startIndex (" + i5 + ") should be less or equal to endIndex (" + i11 + ')').toString());
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        String str = this.f83683d;
        if (str != null) {
            return str;
        }
        String string = b(0, this.f83686g).toString();
        this.f83683d = string;
        return string;
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i5, int i11) {
        if (charSequence == null) {
            return this;
        }
        int i12 = i5;
        while (i12 < i11) {
            char[] cArrD = d();
            int length = cArrD.length;
            int i13 = this.f83685f;
            int i14 = length - i13;
            int iMin = Math.min(i11 - i12, i13);
            for (int i15 = 0; i15 < iMin; i15++) {
                cArrD[i14 + i15] = charSequence.charAt(i12 + i15);
            }
            i12 += iMin;
            this.f83685f -= iMin;
        }
        this.f83683d = null;
        this.f83686g = (i11 - i5) + this.f83686g;
        return this;
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence) {
        if (charSequence == null) {
            return this;
        }
        append(charSequence, 0, charSequence.length());
        return this;
    }
}
