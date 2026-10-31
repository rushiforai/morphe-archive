package sd;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f87210a;

    /* renamed from: b, reason: collision with root package name */
    public byte[] f87211b;

    public r() {
    }

    public s a() {
        return new s(this.f87210a, this.f87211b);
    }

    public void b(byte[] bArr) {
        this.f87210a = bArr;
    }

    public void c(byte[] bArr) {
        this.f87211b = bArr;
    }

    public r(byte[] bArr, byte[] bArr2) {
        Objects.requireNonNull(bArr);
        this.f87210a = bArr;
        Objects.requireNonNull(bArr2);
        this.f87211b = bArr2;
    }
}
