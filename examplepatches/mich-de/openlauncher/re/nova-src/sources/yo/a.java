package yo;

import b.c0;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final a f97393c = new a(3, 4);

    /* renamed from: d, reason: collision with root package name */
    public static final a f97394d = new a(1, 2);

    /* renamed from: a, reason: collision with root package name */
    public final int f97395a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97396b;

    public a(int i5, int i11) {
        this.f97395a = i5;
        this.f97396b = i11;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CipherMode [forEncryption=");
        sb2.append(this.f97395a);
        sb2.append(", forDecryption=");
        return c0.o(sb2, this.f97396b, "]");
    }
}
