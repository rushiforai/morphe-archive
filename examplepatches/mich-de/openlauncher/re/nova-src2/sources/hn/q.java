package hn;

/* loaded from: classes.dex */
public final class q implements CharSequence {

    /* renamed from: a, reason: collision with root package name */
    public char[] f59941a;

    /* renamed from: b, reason: collision with root package name */
    public String f59942b;

    @Override // java.lang.CharSequence
    public final char charAt(int i5) {
        return this.f59941a[i5];
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.f59941a.length;
    }

    @Override // java.lang.CharSequence
    public final CharSequence subSequence(int i5, int i11) {
        return new String(this.f59941a, i5, i11 - i5);
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        if (this.f59942b == null) {
            this.f59942b = new String(this.f59941a);
        }
        return this.f59942b;
    }
}
