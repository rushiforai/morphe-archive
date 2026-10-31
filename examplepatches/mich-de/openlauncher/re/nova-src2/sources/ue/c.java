package ue;

import java.io.EOFException;
import java.io.InterruptedIOException;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class c implements ke.j {

    /* renamed from: a, reason: collision with root package name */
    public final b f90841a = new b(null, 1);

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90842b = new com.google.android.gms.internal.consent_sdk.a(ReaderJsonLexerKt.BATCH_SIZE);

    /* renamed from: c, reason: collision with root package name */
    public boolean f90843c;

    @Override // ke.j
    public final void a(ke.l lVar) {
        this.f90841a.i(lVar, new d0(0, 1));
        lVar.o();
        lVar.j(new ke.n(-9223372036854775807L));
    }

    @Override // ke.j
    public final void b(long j11, long j12) {
        this.f90843c = false;
        this.f90841a.h();
    }

    @Override // ke.j
    public final boolean c(ke.k kVar) throws EOFException, InterruptedIOException {
        ke.g gVar;
        int i5;
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(10);
        int i11 = 0;
        while (true) {
            gVar = (ke.g) kVar;
            gVar.d((byte[]) aVar.f31986d, 0, 10, false);
            aVar.Y(0);
            if (aVar.P() != 4801587) {
                break;
            }
            aVar.Z(3);
            int iM = aVar.M();
            i11 += iM + 10;
            gVar.a(iM, false);
        }
        gVar.f71400f = 0;
        gVar.a(i11, false);
        int i12 = 0;
        int i13 = i11;
        while (true) {
            int i14 = 7;
            gVar.d((byte[]) aVar.f31986d, 0, 7, false);
            aVar.Y(0);
            int iS = aVar.S();
            if (iS == 44096 || iS == 44097) {
                i12++;
                if (i12 >= 4) {
                    return true;
                }
                byte[] bArr = (byte[]) aVar.f31986d;
                if (bArr.length < 7) {
                    i5 = -1;
                } else {
                    int i15 = ((bArr[2] & 255) << 8) | (bArr[3] & 255);
                    if (i15 == 65535) {
                        i15 = ((bArr[4] & 255) << 16) | ((bArr[5] & 255) << 8) | (bArr[6] & 255);
                    } else {
                        i14 = 4;
                    }
                    if (iS == 44097) {
                        i14 += 2;
                    }
                    i5 = i15 + i14;
                }
                if (i5 == -1) {
                    break;
                }
                gVar.a(i5 - 7, false);
            } else {
                gVar.f71400f = 0;
                i13++;
                if (i13 - i11 >= 8192) {
                    break;
                }
                gVar.a(i13, false);
                i12 = 0;
            }
        }
        return false;
    }

    @Override // ke.j
    public final int g(ke.k kVar, ke.m mVar) throws EOFException, InterruptedIOException {
        com.google.android.gms.internal.consent_sdk.a aVar = this.f90842b;
        int i5 = ((ke.g) kVar).read((byte[]) aVar.f31986d, 0, ReaderJsonLexerKt.BATCH_SIZE);
        if (i5 == -1) {
            return -1;
        }
        aVar.Y(0);
        aVar.X(i5);
        boolean z11 = this.f90843c;
        b bVar = this.f90841a;
        if (!z11) {
            bVar.k(4, 0L);
            this.f90843c = true;
        }
        bVar.f(aVar);
        return 0;
    }

    @Override // ke.j
    public final void release() {
    }
}
