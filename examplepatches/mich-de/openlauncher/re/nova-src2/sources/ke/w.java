package ke;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f71439a = new byte[10];

    /* renamed from: b, reason: collision with root package name */
    public boolean f71440b;

    /* renamed from: c, reason: collision with root package name */
    public int f71441c;

    /* renamed from: d, reason: collision with root package name */
    public long f71442d;

    /* renamed from: e, reason: collision with root package name */
    public int f71443e;

    /* renamed from: f, reason: collision with root package name */
    public int f71444f;

    /* renamed from: g, reason: collision with root package name */
    public int f71445g;

    public final void a(v vVar, u uVar) {
        if (this.f71441c > 0) {
            vVar.b(this.f71442d, this.f71443e, this.f71444f, this.f71445g, uVar);
            this.f71441c = 0;
        }
    }

    public final void b(v vVar, long j11, int i5, int i11, int i12, u uVar) {
        if (!(this.f71445g <= i11 + i12)) {
            throw new IllegalStateException("TrueHD chunk samples must be contiguous in the sample queue.");
        }
        if (this.f71440b) {
            int i13 = this.f71441c;
            int i14 = i13 + 1;
            this.f71441c = i14;
            if (i13 == 0) {
                this.f71442d = j11;
                this.f71443e = i5;
                this.f71444f = 0;
            }
            this.f71444f += i11;
            this.f71445g = i12;
            if (i14 >= 16) {
                a(vVar, uVar);
            }
        }
    }

    public final void c(k kVar) {
        if (this.f71440b) {
            return;
        }
        byte[] bArr = this.f71439a;
        kVar.b(0, 10, bArr);
        kVar.e();
        if (bArr[4] == -8 && bArr[5] == 114 && bArr[6] == 111) {
            byte b11 = bArr[7];
            if ((b11 & 254) == 186) {
                i = 40 << ((bArr[((b11 & 255) == 187 ? 1 : 0) != 0 ? '\t' : '\b'] >> 4) & 7);
            }
        }
        if (i == 0) {
            return;
        }
        this.f71440b = true;
    }
}
