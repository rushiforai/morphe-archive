package ue;

/* loaded from: classes3.dex */
public final class a0 implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final z f90805a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90806b = new com.google.android.gms.internal.consent_sdk.a(32);

    /* renamed from: c, reason: collision with root package name */
    public int f90807c;

    /* renamed from: d, reason: collision with root package name */
    public int f90808d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f90809e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f90810f;

    public a0(z zVar) {
        this.f90805a = zVar;
    }

    @Override // ue.e0
    public final void a(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        boolean z11 = (i5 & 1) != 0;
        int iN = z11 ? aVar.f31984b + aVar.N() : -1;
        if (this.f90810f) {
            if (!z11) {
                return;
            }
            this.f90810f = false;
            aVar.Y(iN);
            this.f90808d = 0;
        }
        while (aVar.g() > 0) {
            int i11 = this.f90808d;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f90806b;
            if (i11 < 3) {
                if (i11 == 0) {
                    int iN2 = aVar.N();
                    aVar.Y(aVar.f31984b - 1);
                    if (iN2 == 255) {
                        this.f90810f = true;
                        return;
                    }
                }
                int iMin = Math.min(aVar.g(), 3 - this.f90808d);
                aVar.z(this.f90808d, iMin, (byte[]) aVar2.f31986d);
                int i12 = this.f90808d + iMin;
                this.f90808d = i12;
                if (i12 == 3) {
                    aVar2.Y(0);
                    aVar2.X(3);
                    aVar2.Z(1);
                    int iN3 = aVar2.N();
                    int iN4 = aVar2.N();
                    this.f90809e = (iN3 & 128) != 0;
                    int i13 = (((iN3 & 15) << 8) | iN4) + 3;
                    this.f90807c = i13;
                    byte[] bArr = (byte[]) aVar2.f31986d;
                    if (bArr.length < i13) {
                        aVar2.p(Math.min(4098, Math.max(i13, bArr.length * 2)));
                    }
                }
            } else {
                int iMin2 = Math.min(aVar.g(), this.f90807c - this.f90808d);
                aVar.z(this.f90808d, iMin2, (byte[]) aVar2.f31986d);
                int i14 = this.f90808d + iMin2;
                this.f90808d = i14;
                int i15 = this.f90807c;
                if (i14 != i15) {
                    continue;
                } else {
                    if (this.f90809e) {
                        byte[] bArr2 = (byte[]) aVar2.f31986d;
                        int i16 = -1;
                        for (int i17 = 0; i17 < i15; i17++) {
                            i16 = wf.v.f94386k[((i16 >>> 24) ^ (bArr2[i17] & 255)) & 255] ^ (i16 << 8);
                        }
                        int i18 = wf.v.f94376a;
                        if (i16 != 0) {
                            this.f90810f = true;
                            return;
                        }
                        aVar2.X(this.f90807c - 4);
                    } else {
                        aVar2.X(i15);
                    }
                    aVar2.Y(0);
                    this.f90805a.f(aVar2);
                    this.f90808d = 0;
                }
            }
        }
    }

    @Override // ue.e0
    public final void g(wf.t tVar, ke.l lVar, d0 d0Var) {
        this.f90805a.g(tVar, lVar, d0Var);
        this.f90810f = true;
    }

    @Override // ue.e0
    public final void h() {
        this.f90810f = true;
    }
}
