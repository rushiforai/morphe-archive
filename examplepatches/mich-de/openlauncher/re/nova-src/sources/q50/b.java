package q50;

import b.c0;
import b.u4;

/* loaded from: classes4.dex */
public final class b implements CharSequence {

    /* renamed from: a, reason: collision with root package name */
    public final int f83676a;

    /* renamed from: b, reason: collision with root package name */
    public final int f83677b;

    /* renamed from: c, reason: collision with root package name */
    public String f83678c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c f83679d;

    public b(c cVar, int i5, int i11) {
        this.f83679d = cVar;
        this.f83676a = i5;
        this.f83677b = i11;
    }

    @Override // java.lang.CharSequence
    public final char charAt(int i5) {
        int i11 = this.f83676a + i5;
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "index is negative: ").toString());
        }
        if (i11 < this.f83677b) {
            return this.f83679d.c(i11);
        }
        StringBuilder sbJ = u4.j(i5, "index (", ") should be less than length (");
        sbJ.append(length());
        sbJ.append(')');
        throw new IllegalArgumentException(sbJ.toString().toString());
    }

    public final boolean equals(Object obj) {
        if (obj instanceof CharSequence) {
            CharSequence charSequence = (CharSequence) obj;
            if (charSequence.length() == length()) {
                int length = length();
                for (int i5 = 0; i5 < length; i5++) {
                    if (this.f83679d.c(this.f83676a + i5) != charSequence.charAt(i5)) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f83678c;
        if (str != null) {
            return str.hashCode();
        }
        int iC = 0;
        for (int i5 = this.f83676a; i5 < this.f83677b; i5++) {
            iC = (iC * 31) + this.f83679d.c(i5);
        }
        return iC;
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.f83677b - this.f83676a;
    }

    @Override // java.lang.CharSequence
    public final CharSequence subSequence(int i5, int i11) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "start is negative: ").toString());
        }
        if (i5 > i11) {
            throw new IllegalArgumentException(("start (" + i5 + ") should be less or equal to end (" + i11 + ')').toString());
        }
        int i12 = this.f83677b;
        int i13 = this.f83676a;
        if (i11 > i12 - i13) {
            throw new IllegalArgumentException(("end should be less than length (" + length() + ')').toString());
        }
        if (i5 == i11) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return new b(this.f83679d, i5 + i13, i13 + i11);
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        String str = this.f83678c;
        if (str != null) {
            return str;
        }
        String string = this.f83679d.b(this.f83676a, this.f83677b).toString();
        this.f83678c = string;
        return string;
    }
}
