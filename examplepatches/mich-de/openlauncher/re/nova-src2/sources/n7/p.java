package n7;

import java.util.Objects;
import org.chromium.support_lib_boundary.WebMessagePayloadBoundaryInterface;

/* loaded from: classes2.dex */
public final class p implements WebMessagePayloadBoundaryInterface {

    /* renamed from: a, reason: collision with root package name */
    public final int f77930a;

    /* renamed from: b, reason: collision with root package name */
    public final String f77931b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f77932c;

    public p(String str) {
        this.f77930a = 0;
        this.f77931b = str;
        this.f77932c = null;
    }

    public final void a(int i5) {
        int i11 = this.f77930a;
        if (i11 != i5) {
            throw new IllegalStateException(b.c0.g(i5, i11, "Expected ", ", but type is "));
        }
    }

    @Override // org.chromium.support_lib_boundary.WebMessagePayloadBoundaryInterface
    public final byte[] getAsArrayBuffer() {
        a(1);
        byte[] bArr = this.f77932c;
        Objects.requireNonNull(bArr);
        return bArr;
    }

    @Override // org.chromium.support_lib_boundary.WebMessagePayloadBoundaryInterface
    public final String getAsString() {
        a(0);
        return this.f77931b;
    }

    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public final String[] getSupportedFeatures() {
        return new String[0];
    }

    @Override // org.chromium.support_lib_boundary.WebMessagePayloadBoundaryInterface
    public final int getType() {
        return this.f77930a;
    }

    public p(byte[] bArr) {
        this.f77930a = 1;
        this.f77931b = null;
        this.f77932c = bArr;
    }
}
