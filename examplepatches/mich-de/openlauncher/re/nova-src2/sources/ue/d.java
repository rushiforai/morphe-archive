package ue;

import com.google.android.exoplayer2.ParserException;
import java.io.EOFException;
import java.io.InterruptedIOException;

/* loaded from: classes3.dex */
public final class d implements ke.j {

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90848c;

    /* renamed from: d, reason: collision with root package name */
    public final ke.x f90849d;

    /* renamed from: e, reason: collision with root package name */
    public ke.l f90850e;

    /* renamed from: f, reason: collision with root package name */
    public long f90851f;

    /* renamed from: h, reason: collision with root package name */
    public boolean f90853h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f90854i;

    /* renamed from: a, reason: collision with root package name */
    public final e f90846a = new e(true, null);

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90847b = new com.google.android.gms.internal.consent_sdk.a(2048);

    /* renamed from: g, reason: collision with root package name */
    public long f90852g = -1;

    public d() {
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(10);
        this.f90848c = aVar;
        byte[] bArr = (byte[]) aVar.f31986d;
        this.f90849d = new ke.x(bArr, bArr.length);
    }

    @Override // ke.j
    public final void a(ke.l lVar) {
        this.f90850e = lVar;
        this.f90846a.i(lVar, new d0(0, 1));
        lVar.o();
    }

    @Override // ke.j
    public final void b(long j11, long j12) {
        this.f90853h = false;
        this.f90846a.h();
        this.f90851f = j12;
    }

    @Override // ke.j
    public final boolean c(ke.k kVar) throws EOFException, InterruptedIOException {
        int i5 = 0;
        while (true) {
            com.google.android.gms.internal.consent_sdk.a aVar = this.f90848c;
            kVar.b(0, 10, (byte[]) aVar.f31986d);
            aVar.Y(0);
            if (aVar.P() != 4801587) {
                break;
            }
            aVar.Z(3);
            int iM = aVar.M();
            i5 += iM + 10;
            kVar.k(iM);
        }
        kVar.e();
        kVar.k(i5);
        if (this.f90852g == -1) {
            this.f90852g = i5;
        }
        int i11 = i5;
        int i12 = 0;
        int i13 = 0;
        do {
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f90848c;
            ke.g gVar = (ke.g) kVar;
            gVar.d((byte[]) aVar2.f31986d, 0, 2, false);
            aVar2.Y(0);
            if ((aVar2.S() & 65526) == 65520) {
                i12++;
                if (i12 >= 4 && i13 > 188) {
                    return true;
                }
                gVar.d((byte[]) aVar2.f31986d, 0, 4, false);
                ke.x xVar = this.f90849d;
                xVar.o(14);
                int i14 = xVar.i(13);
                if (i14 <= 6) {
                    i11++;
                    gVar.f71400f = 0;
                    gVar.a(i11, false);
                } else {
                    gVar.a(i14 - 6, false);
                    i13 += i14;
                }
            } else {
                i11++;
                gVar.f71400f = 0;
                gVar.a(i11, false);
            }
            i12 = 0;
            i13 = 0;
        } while (i11 - i5 < 8192);
        return false;
    }

    @Override // ke.j
    public final int g(ke.k kVar, ke.m mVar) throws ParserException, EOFException, InterruptedIOException {
        wf.a.j(this.f90850e);
        long j11 = ((ke.g) kVar).f71397c;
        com.google.android.gms.internal.consent_sdk.a aVar = this.f90847b;
        int i5 = ((ke.g) kVar).read((byte[]) aVar.f31986d, 0, 2048);
        boolean z11 = i5 == -1;
        if (!this.f90854i) {
            this.f90850e.j(new ke.n(-9223372036854775807L));
            this.f90854i = true;
        }
        if (z11) {
            return -1;
        }
        aVar.Y(0);
        aVar.X(i5);
        boolean z12 = this.f90853h;
        e eVar = this.f90846a;
        if (!z12) {
            eVar.k(4, this.f90851f);
            this.f90853h = true;
        }
        eVar.f(aVar);
        return 0;
    }

    @Override // ke.j
    public final void release() {
    }
}
