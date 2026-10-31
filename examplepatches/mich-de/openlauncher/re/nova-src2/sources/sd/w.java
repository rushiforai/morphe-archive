package sd;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class w extends i0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f87217a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f87218b;

    /* renamed from: c, reason: collision with root package name */
    public final e0 f87219c;

    /* renamed from: d, reason: collision with root package name */
    public final long f87220d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f87221e;

    /* renamed from: f, reason: collision with root package name */
    public final String f87222f;

    /* renamed from: g, reason: collision with root package name */
    public final long f87223g;

    /* renamed from: h, reason: collision with root package name */
    public final m0 f87224h;

    /* renamed from: i, reason: collision with root package name */
    public final f0 f87225i;

    public w(long j11, Integer num, q qVar, long j12, byte[] bArr, String str, long j13, z zVar, s sVar) {
        this.f87217a = j11;
        this.f87218b = num;
        this.f87219c = qVar;
        this.f87220d = j12;
        this.f87221e = bArr;
        this.f87222f = str;
        this.f87223g = j13;
        this.f87224h = zVar;
        this.f87225i = sVar;
    }

    public final boolean equals(Object obj) {
        Integer num;
        e0 e0Var;
        String str;
        m0 m0Var;
        f0 f0Var;
        if (obj == this) {
            return true;
        }
        if (obj instanceof i0) {
            i0 i0Var = (i0) obj;
            w wVar = (w) i0Var;
            f0 f0Var2 = wVar.f87225i;
            m0 m0Var2 = wVar.f87224h;
            String str2 = wVar.f87222f;
            e0 e0Var2 = wVar.f87219c;
            Integer num2 = wVar.f87218b;
            if (this.f87217a == wVar.f87217a && ((num = this.f87218b) != null ? num.equals(num2) : num2 == null) && ((e0Var = this.f87219c) != null ? e0Var.equals(e0Var2) : e0Var2 == null) && this.f87220d == wVar.f87220d) {
                if (Arrays.equals(this.f87221e, i0Var instanceof w ? ((w) i0Var).f87221e : wVar.f87221e) && ((str = this.f87222f) != null ? str.equals(str2) : str2 == null) && this.f87223g == wVar.f87223g && ((m0Var = this.f87224h) != null ? m0Var.equals(m0Var2) : m0Var2 == null) && ((f0Var = this.f87225i) != null ? f0Var.equals(f0Var2) : f0Var2 == null)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f87217a;
        int i5 = (((int) (j11 ^ (j11 >>> 32))) ^ 1000003) * 1000003;
        Integer num = this.f87218b;
        int iHashCode = (i5 ^ (num == null ? 0 : num.hashCode())) * 1000003;
        e0 e0Var = this.f87219c;
        int iHashCode2 = (iHashCode ^ (e0Var == null ? 0 : e0Var.hashCode())) * 1000003;
        long j12 = this.f87220d;
        int iHashCode3 = (((iHashCode2 ^ ((int) (j12 ^ (j12 >>> 32)))) * 1000003) ^ Arrays.hashCode(this.f87221e)) * 1000003;
        String str = this.f87222f;
        int iHashCode4 = (iHashCode3 ^ (str == null ? 0 : str.hashCode())) * 1000003;
        long j13 = this.f87223g;
        int i11 = (iHashCode4 ^ ((int) (j13 ^ (j13 >>> 32)))) * 1000003;
        m0 m0Var = this.f87224h;
        int iHashCode5 = (i11 ^ (m0Var == null ? 0 : m0Var.hashCode())) * 1000003;
        f0 f0Var = this.f87225i;
        return iHashCode5 ^ (f0Var != null ? f0Var.hashCode() : 0);
    }

    public final String toString() {
        return "LogEvent{eventTimeMs=" + this.f87217a + ", eventCode=" + this.f87218b + ", complianceData=" + this.f87219c + ", eventUptimeMs=" + this.f87220d + ", sourceExtension=" + Arrays.toString(this.f87221e) + ", sourceExtensionJsonProto3=" + this.f87222f + ", timezoneOffsetSeconds=" + this.f87223g + ", networkConnectionInfo=" + this.f87224h + ", experimentIds=" + this.f87225i + "}";
    }
}
