package td;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final String f88975a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f88976b;

    /* renamed from: c, reason: collision with root package name */
    public final l f88977c;

    /* renamed from: d, reason: collision with root package name */
    public final long f88978d;

    /* renamed from: e, reason: collision with root package name */
    public final long f88979e;

    /* renamed from: f, reason: collision with root package name */
    public final Map f88980f;

    /* renamed from: g, reason: collision with root package name */
    public final Integer f88981g;

    /* renamed from: h, reason: collision with root package name */
    public final String f88982h;

    /* renamed from: i, reason: collision with root package name */
    public final byte[] f88983i;

    /* renamed from: j, reason: collision with root package name */
    public final byte[] f88984j;

    public h(String str, Integer num, l lVar, long j11, long j12, HashMap map, Integer num2, String str2, byte[] bArr, byte[] bArr2) {
        this.f88975a = str;
        this.f88976b = num;
        this.f88977c = lVar;
        this.f88978d = j11;
        this.f88979e = j12;
        this.f88980f = map;
        this.f88981g = num2;
        this.f88982h = str2;
        this.f88983i = bArr;
        this.f88984j = bArr2;
    }

    public final String a(String str) {
        String str2 = (String) this.f88980f.get(str);
        return str2 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2;
    }

    public final int b(String str) {
        String str2 = (String) this.f88980f.get(str);
        if (str2 == null) {
            return 0;
        }
        return Integer.valueOf(str2).intValue();
    }

    public final ra.f c() {
        ra.f fVar = new ra.f();
        String str = this.f88975a;
        if (str == null) {
            throw new NullPointerException("Null transportName");
        }
        fVar.f85760b = str;
        fVar.f85761c = this.f88976b;
        fVar.f85766h = this.f88981g;
        fVar.f85767i = this.f88982h;
        fVar.f85768j = this.f88983i;
        fVar.f85769k = this.f88984j;
        l lVar = this.f88977c;
        if (lVar == null) {
            throw new NullPointerException("Null encodedPayload");
        }
        fVar.f85762d = lVar;
        fVar.f85763e = Long.valueOf(this.f88978d);
        fVar.f85764f = Long.valueOf(this.f88979e);
        fVar.f85765g = new HashMap(this.f88980f);
        return fVar;
    }

    public final boolean equals(Object obj) {
        Integer num;
        Integer num2;
        String str;
        if (obj == this) {
            return true;
        }
        if (obj instanceof h) {
            h hVar = (h) obj;
            String str2 = hVar.f88982h;
            Integer num3 = hVar.f88981g;
            Integer num4 = hVar.f88976b;
            if (this.f88975a.equals(hVar.f88975a) && ((num = this.f88976b) != null ? num.equals(num4) : num4 == null) && this.f88977c.equals(hVar.f88977c) && this.f88978d == hVar.f88978d && this.f88979e == hVar.f88979e && this.f88980f.equals(hVar.f88980f) && ((num2 = this.f88981g) != null ? num2.equals(num3) : num3 == null) && ((str = this.f88982h) != null ? str.equals(str2) : str2 == null)) {
                boolean z11 = hVar instanceof h;
                if (Arrays.equals(this.f88983i, z11 ? hVar.f88983i : hVar.f88983i)) {
                    if (Arrays.equals(this.f88984j, z11 ? hVar.f88984j : hVar.f88984j)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.f88975a.hashCode() ^ 1000003) * 1000003;
        Integer num = this.f88976b;
        int iHashCode2 = (((iHashCode ^ (num == null ? 0 : num.hashCode())) * 1000003) ^ this.f88977c.hashCode()) * 1000003;
        long j11 = this.f88978d;
        int i5 = (iHashCode2 ^ ((int) (j11 ^ (j11 >>> 32)))) * 1000003;
        long j12 = this.f88979e;
        int iHashCode3 = (((i5 ^ ((int) (j12 ^ (j12 >>> 32)))) * 1000003) ^ this.f88980f.hashCode()) * 1000003;
        Integer num2 = this.f88981g;
        int iHashCode4 = (iHashCode3 ^ (num2 == null ? 0 : num2.hashCode())) * 1000003;
        String str = this.f88982h;
        return ((((iHashCode4 ^ (str != null ? str.hashCode() : 0)) * 1000003) ^ Arrays.hashCode(this.f88983i)) * 1000003) ^ Arrays.hashCode(this.f88984j);
    }

    public final String toString() {
        return "EventInternal{transportName=" + this.f88975a + ", code=" + this.f88976b + ", encodedPayload=" + this.f88977c + ", eventMillis=" + this.f88978d + ", uptimeMillis=" + this.f88979e + ", autoMetadata=" + this.f88980f + ", productId=" + this.f88981g + ", pseudonymousId=" + this.f88982h + ", experimentIdsClear=" + Arrays.toString(this.f88983i) + ", experimentIdsEncrypted=" + Arrays.toString(this.f88984j) + "}";
    }
}
