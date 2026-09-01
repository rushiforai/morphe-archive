package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jk0 {
    public final String a;
    public final long b;
    public final rnd c;

    public jk0(String str, long j, rnd rndVar) {
        this.a = str;
        this.b = j;
        this.c = rndVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof jk0) {
            jk0 jk0Var = (jk0) obj;
            String str = jk0Var.a;
            String str2 = this.a;
            if (str2 != null ? str2.equals(str) : str == null) {
                if (this.b == jk0Var.b) {
                    rnd rndVar = jk0Var.c;
                    rnd rndVar2 = this.c;
                    if (rndVar2 != null ? rndVar2.equals(rndVar) : rndVar == null) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = str == null ? 0 : str.hashCode();
        long j = this.b;
        int i = (((iHashCode ^ 1000003) * 1000003) ^ ((int) (j ^ (j >>> 32)))) * 1000003;
        rnd rndVar = this.c;
        return i ^ (rndVar != null ? rndVar.hashCode() : 0);
    }

    public final String toString() {
        return "TokenResult{token=" + this.a + ", tokenExpirationTimestamp=" + this.b + ", responseCode=" + this.c + "}";
    }
}
