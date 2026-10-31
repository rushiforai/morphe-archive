package gf;

import android.net.Uri;
import java.util.Map;

/* loaded from: classes3.dex */
public final class l implements vf.k {

    /* renamed from: a, reason: collision with root package name */
    public final vf.k f57537a;

    /* renamed from: b, reason: collision with root package name */
    public final int f57538b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f57539c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f57540d;

    /* renamed from: e, reason: collision with root package name */
    public int f57541e;

    public l(vf.k kVar, int i5, i0 i0Var) {
        wf.a.e(i5 > 0);
        this.f57537a = kVar;
        this.f57538b = i5;
        this.f57539c = i0Var;
        this.f57540d = new byte[1];
        this.f57541e = i5;
    }

    @Override // vf.k
    public final void addTransferListener(vf.g0 g0Var) {
        g0Var.getClass();
        this.f57537a.addTransferListener(g0Var);
    }

    @Override // vf.k
    public final void close() {
        throw new UnsupportedOperationException();
    }

    @Override // vf.k
    public final Map getResponseHeaders() {
        return this.f57537a.getResponseHeaders();
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f57537a.getUri();
    }

    @Override // vf.k
    public final long open(vf.l lVar) {
        throw new UnsupportedOperationException();
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) {
        int i12 = this.f57541e;
        vf.k kVar = this.f57537a;
        if (i12 == 0) {
            byte[] bArr2 = this.f57540d;
            int i13 = 0;
            if (kVar.read(bArr2, 0, 1) != -1) {
                int i14 = (bArr2[0] & 255) << 4;
                if (i14 != 0) {
                    byte[] bArr3 = new byte[i14];
                    int i15 = i14;
                    while (i15 > 0) {
                        int i16 = kVar.read(bArr3, i13, i15);
                        if (i16 != -1) {
                            i13 += i16;
                            i15 -= i16;
                        }
                    }
                    while (i14 > 0 && bArr3[i14 - 1] == 0) {
                        i14--;
                    }
                    if (i14 > 0) {
                        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(bArr3, i14);
                        i0 i0Var = this.f57539c;
                        long jMax = !i0Var.f57523l ? i0Var.f57520i : Math.max(i0Var.f57524m.u(true), i0Var.f57520i);
                        int iG = aVar.g();
                        s0 s0Var = i0Var.f57522k;
                        s0Var.getClass();
                        s0Var.d(iG, aVar);
                        s0Var.b(jMax, 1, iG, 0, null);
                        i0Var.f57523l = true;
                    }
                }
                this.f57541e = this.f57538b;
            }
            return -1;
        }
        int i17 = kVar.read(bArr, i5, Math.min(this.f57541e, i11));
        if (i17 != -1) {
            this.f57541e -= i17;
        }
        return i17;
    }
}
