package m7;

import java.util.Objects;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final k[] f76025a;

    /* renamed from: b, reason: collision with root package name */
    public final String f76026b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f76027c;

    /* renamed from: d, reason: collision with root package name */
    public final int f76028d;

    public j(String str, k[] kVarArr) {
        this.f76026b = str;
        this.f76027c = null;
        this.f76025a = kVarArr;
        this.f76028d = 0;
    }

    public final void a(int i5) {
        int i11 = this.f76028d;
        if (i5 == i11) {
            return;
        }
        StringBuilder sb2 = new StringBuilder("Wrong data accessor type detected. ");
        sb2.append(i11 != 0 ? i11 != 1 ? "Unknown" : "ArrayBuffer" : "String");
        sb2.append(" expected, but got ");
        sb2.append(i5 != 0 ? i5 != 1 ? "Unknown" : "ArrayBuffer" : "String");
        throw new IllegalStateException(sb2.toString());
    }

    public final String b() {
        a(0);
        return this.f76026b;
    }

    public final int c() {
        return this.f76028d;
    }

    public j(byte[] bArr, k[] kVarArr) {
        Objects.requireNonNull(bArr);
        this.f76027c = bArr;
        this.f76026b = null;
        this.f76025a = kVarArr;
        this.f76028d = 1;
    }
}
