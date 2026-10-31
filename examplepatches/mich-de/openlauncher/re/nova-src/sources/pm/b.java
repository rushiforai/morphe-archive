package pm;

import b.c0;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f82664h = 0;

    /* renamed from: a, reason: collision with root package name */
    public final String f82665a;

    /* renamed from: b, reason: collision with root package name */
    public final int f82666b;

    /* renamed from: c, reason: collision with root package name */
    public final String f82667c;

    /* renamed from: d, reason: collision with root package name */
    public final String f82668d;

    /* renamed from: e, reason: collision with root package name */
    public final long f82669e;

    /* renamed from: f, reason: collision with root package name */
    public final long f82670f;

    /* renamed from: g, reason: collision with root package name */
    public final String f82671g;

    static {
        byte b11 = (byte) (((byte) (0 | 2)) | 1);
        if (b11 == 3) {
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        if ((b11 & 1) == 0) {
            sb2.append(" expiresInSecs");
        }
        if ((b11 & 2) == 0) {
            sb2.append(" tokenCreationEpochInSecs");
        }
        throw new IllegalStateException(a2.c.k("Missing required properties:", sb2));
    }

    public b(String str, int i5, String str2, String str3, long j11, long j12, String str4) {
        this.f82665a = str;
        this.f82666b = i5;
        this.f82667c = str2;
        this.f82668d = str3;
        this.f82669e = j11;
        this.f82670f = j12;
        this.f82671g = str4;
    }

    public final boolean a() {
        return this.f82666b == 4;
    }

    public final a b() {
        a aVar = new a();
        aVar.f82656a = this.f82665a;
        aVar.f82657b = this.f82666b;
        aVar.f82658c = this.f82667c;
        aVar.f82659d = this.f82668d;
        aVar.f82660e = this.f82669e;
        aVar.f82661f = this.f82670f;
        aVar.f82662g = this.f82671g;
        aVar.f82663h = (byte) 3;
        return aVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        String str = this.f82665a;
        if (str == null) {
            if (bVar.f82665a != null) {
                return false;
            }
        } else if (!str.equals(bVar.f82665a)) {
            return false;
        }
        String str2 = bVar.f82671g;
        String str3 = bVar.f82668d;
        String str4 = bVar.f82667c;
        if (!c0.b(this.f82666b, bVar.f82666b)) {
            return false;
        }
        String str5 = this.f82667c;
        if (str5 == null) {
            if (str4 != null) {
                return false;
            }
        } else if (!str5.equals(str4)) {
            return false;
        }
        String str6 = this.f82668d;
        if (str6 == null) {
            if (str3 != null) {
                return false;
            }
        } else if (!str6.equals(str3)) {
            return false;
        }
        if (this.f82669e != bVar.f82669e || this.f82670f != bVar.f82670f) {
            return false;
        }
        String str7 = this.f82671g;
        return str7 == null ? str2 == null : str7.equals(str2);
    }

    public final int hashCode() {
        String str = this.f82665a;
        int iHashCode = ((((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003) ^ c0.F(this.f82666b)) * 1000003;
        String str2 = this.f82667c;
        int iHashCode2 = (iHashCode ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.f82668d;
        int iHashCode3 = (iHashCode2 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        long j11 = this.f82669e;
        int i5 = (iHashCode3 ^ ((int) (j11 ^ (j11 >>> 32)))) * 1000003;
        long j12 = this.f82670f;
        int i11 = (i5 ^ ((int) (j12 ^ (j12 >>> 32)))) * 1000003;
        String str4 = this.f82671g;
        return (str4 != null ? str4.hashCode() : 0) ^ i11;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PersistedInstallationEntry{firebaseInstallationId=");
        sb2.append(this.f82665a);
        sb2.append(", registrationStatus=");
        sb2.append(fq.c.B(this.f82666b));
        sb2.append(", authToken=");
        sb2.append(this.f82667c);
        sb2.append(", refreshToken=");
        sb2.append(this.f82668d);
        sb2.append(", expiresInSecs=");
        sb2.append(this.f82669e);
        sb2.append(", tokenCreationEpochInSecs=");
        sb2.append(this.f82670f);
        sb2.append(", fisError=");
        return c0.q(sb2, this.f82671g, "}");
    }
}
