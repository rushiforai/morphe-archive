package pg;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class j extends i {

    /* renamed from: l, reason: collision with root package name */
    public final byte[] f82577l;

    public j(byte[] bArr) {
        super(Arrays.copyOfRange(bArr, 0, 25));
        this.f82577l = bArr;
    }

    @Override // pg.i
    public final byte[] U() {
        return this.f82577l;
    }
}
