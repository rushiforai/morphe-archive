package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uj0 extends y77 {
    public final long a;
    public final long b;
    public final sh0 c;
    public final Integer d;
    public final String e;
    public final ArrayList f;
    public final pqa g;

    public uj0(long j, long j2, sh0 sh0Var, Integer num, String str, ArrayList arrayList, pqa pqaVar) {
        this.a = j;
        this.b = j2;
        this.c = sh0Var;
        this.d = num;
        this.e = str;
        this.f = arrayList;
        this.g = pqaVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof y77)) {
            return false;
        }
        uj0 uj0Var = (uj0) ((y77) obj);
        if (this.a != uj0Var.a || this.b != uj0Var.b || !this.c.equals(uj0Var.c)) {
            return false;
        }
        Integer num = uj0Var.d;
        Integer num2 = this.d;
        if (num2 == null) {
            if (num != null) {
                return false;
            }
        } else if (!num2.equals(num)) {
            return false;
        }
        String str = uj0Var.e;
        String str2 = this.e;
        if (str2 == null) {
            if (str != null) {
                return false;
            }
        } else if (!str2.equals(str)) {
            return false;
        }
        if (!this.f.equals(uj0Var.f)) {
            return false;
        }
        pqa pqaVar = uj0Var.g;
        pqa pqaVar2 = this.g;
        return pqaVar2 == null ? pqaVar == null : pqaVar2.equals(pqaVar);
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        int iHashCode = (((((((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003) ^ ((int) (j2 ^ (j2 >>> 32)))) * 1000003) ^ this.c.hashCode()) * 1000003;
        Integer num = this.d;
        int iHashCode2 = (iHashCode ^ (num == null ? 0 : num.hashCode())) * 1000003;
        String str = this.e;
        int iHashCode3 = (((iHashCode2 ^ (str == null ? 0 : str.hashCode())) * 1000003) ^ this.f.hashCode()) * 1000003;
        pqa pqaVar = this.g;
        return iHashCode3 ^ (pqaVar != null ? pqaVar.hashCode() : 0);
    }

    public final String toString() {
        return "LogRequest{requestTimeMs=" + this.a + ", requestUptimeMs=" + this.b + ", clientInfo=" + this.c + ", logSource=" + this.d + ", logSourceName=" + this.e + ", logEvents=" + this.f + ", qosTier=" + this.g + "}";
    }
}
