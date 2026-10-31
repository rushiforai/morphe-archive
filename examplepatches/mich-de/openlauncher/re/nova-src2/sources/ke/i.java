package ke;

import androidx.recyclerview.widget.u1;
import fe.k0;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class i implements v {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f71405a = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];

    @Override // ke.v
    public final void a(k0 k0Var) {
    }

    @Override // ke.v
    public final void b(long j11, int i5, int i11, int i12, u uVar) {
    }

    @Override // ke.v
    public final int c(vf.h hVar, int i5, boolean z11) throws EOFException {
        byte[] bArr = this.f71405a;
        int i11 = hVar.read(bArr, 0, Math.min(bArr.length, i5));
        if (i11 != -1) {
            return i11;
        }
        if (z11) {
            return -1;
        }
        throw new EOFException();
    }

    @Override // ke.v
    public final void d(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        aVar.Z(i5);
    }
}
