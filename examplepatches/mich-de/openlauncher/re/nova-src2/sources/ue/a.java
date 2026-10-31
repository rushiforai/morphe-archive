package ue;

import java.io.EOFException;
import java.io.InterruptedIOException;

/* loaded from: classes3.dex */
public final class a implements ke.j {

    /* renamed from: a, reason: collision with root package name */
    public final b f90802a = new b(null, 0);

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90803b = new com.google.android.gms.internal.consent_sdk.a(2786);

    /* renamed from: c, reason: collision with root package name */
    public boolean f90804c;

    @Override // ke.j
    public final void a(ke.l lVar) {
        this.f90802a.i(lVar, new d0(0, 1));
        lVar.o();
        lVar.j(new ke.n(-9223372036854775807L));
    }

    @Override // ke.j
    public final void b(long j11, long j12) {
        this.f90804c = false;
        this.f90802a.h();
    }

    @Override // ke.j
    public final boolean c(ke.k kVar) throws EOFException, InterruptedIOException {
        ke.g gVar;
        int iB;
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(10);
        int i5 = 0;
        while (true) {
            gVar = (ke.g) kVar;
            gVar.d((byte[]) aVar.f31986d, 0, 10, false);
            aVar.Y(0);
            if (aVar.P() != 4801587) {
                break;
            }
            aVar.Z(3);
            int iM = aVar.M();
            i5 += iM + 10;
            gVar.a(iM, false);
        }
        gVar.f71400f = 0;
        gVar.a(i5, false);
        int i11 = 0;
        int i12 = i5;
        while (true) {
            gVar.d((byte[]) aVar.f31986d, 0, 6, false);
            aVar.Y(0);
            if (aVar.S() != 2935) {
                gVar.f71400f = 0;
                i12++;
                if (i12 - i5 >= 8192) {
                    break;
                }
                gVar.a(i12, false);
                i11 = 0;
            } else {
                i11++;
                if (i11 >= 4) {
                    return true;
                }
                byte[] bArr = (byte[]) aVar.f31986d;
                if (bArr.length < 6) {
                    iB = -1;
                } else if (((bArr[5] & 248) >> 3) > 10) {
                    iB = ((((bArr[2] & 7) << 8) | (bArr[3] & 255)) + 1) * 2;
                } else {
                    byte b11 = bArr[4];
                    iB = he.a.b((b11 & 192) >> 6, b11 & 63);
                }
                if (iB == -1) {
                    break;
                }
                gVar.a(iB - 6, false);
            }
        }
        return false;
    }

    @Override // ke.j
    public final int g(ke.k kVar, ke.m mVar) throws EOFException, InterruptedIOException {
        com.google.android.gms.internal.consent_sdk.a aVar = this.f90803b;
        int i5 = ((ke.g) kVar).read((byte[]) aVar.f31986d, 0, 2786);
        if (i5 == -1) {
            return -1;
        }
        aVar.Y(0);
        aVar.X(i5);
        boolean z11 = this.f90804c;
        b bVar = this.f90802a;
        if (!z11) {
            bVar.k(4, 0L);
            this.f90804c = true;
        }
        bVar.f(aVar);
        return 0;
    }

    @Override // ke.j
    public final void release() {
    }
}
