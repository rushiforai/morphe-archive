package gl;

import com.google.android.gms.internal.measurement.a0;
import h6.c1;
import java.security.GeneralSecurityException;

/* loaded from: classes3.dex */
public final class k extends c3.b {

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f57737g;

    public k(byte[] bArr, int i5) throws GeneralSecurityException {
        this.f57737g = i5;
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use ChaCha20Poly1305 in FIPS-mode.");
        }
        this.f19222a = t(1, bArr);
        this.f19223b = t(0, bArr);
    }

    @Override // c3.b
    public final a0 t(int i5, byte[] bArr) {
        switch (this.f57737g) {
            case 0:
                return new j(bArr, i5, 0);
            default:
                return new j(bArr, i5, 1);
        }
    }
}
