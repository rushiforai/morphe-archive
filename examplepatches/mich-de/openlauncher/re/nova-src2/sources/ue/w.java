package ue;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91061a;

    /* renamed from: b, reason: collision with root package name */
    public final wf.t f91062b;

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f91063c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f91064d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f91065e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f91066f;

    /* renamed from: g, reason: collision with root package name */
    public long f91067g;

    /* renamed from: h, reason: collision with root package name */
    public long f91068h;

    /* renamed from: i, reason: collision with root package name */
    public long f91069i;

    public w(int i5) {
        this.f91061a = i5;
        switch (i5) {
            case 1:
                this.f91062b = new wf.t(0L);
                this.f91067g = -9223372036854775807L;
                this.f91068h = -9223372036854775807L;
                this.f91069i = -9223372036854775807L;
                this.f91063c = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
                break;
            default:
                this.f91062b = new wf.t(0L);
                this.f91067g = -9223372036854775807L;
                this.f91068h = -9223372036854775807L;
                this.f91069i = -9223372036854775807L;
                this.f91063c = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
                break;
        }
    }

    public static int b(int i5, byte[] bArr) {
        return (bArr[i5 + 3] & 255) | ((bArr[i5] & 255) << 24) | ((bArr[i5 + 1] & 255) << 16) | ((bArr[i5 + 2] & 255) << 8);
    }

    public static long c(com.google.android.gms.internal.consent_sdk.a aVar) {
        int i5 = aVar.f31984b;
        if (aVar.g() < 9) {
            return -9223372036854775807L;
        }
        byte[] bArr = new byte[9];
        aVar.z(0, 9, bArr);
        aVar.Y(i5);
        byte b11 = bArr[0];
        if ((b11 & 196) == 68) {
            byte b12 = bArr[2];
            if ((b12 & 4) == 4) {
                byte b13 = bArr[4];
                if ((b13 & 4) == 4 && (bArr[5] & 1) == 1 && (bArr[8] & 3) == 3) {
                    long j11 = b11;
                    long j12 = b12;
                    return ((j12 & 3) << 13) | ((j11 & 3) << 28) | (((56 & j11) >> 3) << 30) | ((bArr[1] & 255) << 20) | (((j12 & 248) >> 3) << 15) | ((bArr[3] & 255) << 5) | ((b13 & 248) >> 3);
                }
            }
        }
        return -9223372036854775807L;
    }

    public final void a(ke.k kVar) {
        switch (this.f91061a) {
            case 0:
                byte[] bArr = wf.v.f94381f;
                com.google.android.gms.internal.consent_sdk.a aVar = this.f91063c;
                aVar.getClass();
                aVar.V(bArr.length, bArr);
                this.f91064d = true;
                kVar.e();
                break;
            default:
                byte[] bArr2 = wf.v.f94381f;
                com.google.android.gms.internal.consent_sdk.a aVar2 = this.f91063c;
                aVar2.getClass();
                aVar2.V(bArr2.length, bArr2);
                this.f91064d = true;
                kVar.e();
                break;
        }
    }
}
