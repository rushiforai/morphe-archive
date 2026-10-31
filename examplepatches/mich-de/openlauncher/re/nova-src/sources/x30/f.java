package x30;

import b.c0;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f95052a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95053b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95054c;

    /* renamed from: d, reason: collision with root package name */
    public final int f95055d;

    public f(int i5, int i11, int i12, int i13) {
        this.f95052a = i5;
        this.f95053b = i11;
        this.f95054c = i12;
        this.f95055d = i13;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SegmentPosition{ row:");
        sb2.append(this.f95052a);
        sb2.append(" ");
        sb2.append(this.f95055d);
        sb2.append(" grid:");
        sb2.append(this.f95053b);
        sb2.append(" ");
        return c0.o(sb2, this.f95054c, "}");
    }
}
