package sd;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class x extends j0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f87226a;

    /* renamed from: b, reason: collision with root package name */
    public final long f87227b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f87228c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f87229d;

    /* renamed from: e, reason: collision with root package name */
    public final String f87230e;

    /* renamed from: f, reason: collision with root package name */
    public final List f87231f;

    /* renamed from: g, reason: collision with root package name */
    public final n0 f87232g;

    public x(long j11, long j12, p pVar, Integer num, String str, ArrayList arrayList, n0 n0Var) {
        this.f87226a = j11;
        this.f87227b = j12;
        this.f87228c = pVar;
        this.f87229d = num;
        this.f87230e = str;
        this.f87231f = arrayList;
        this.f87232g = n0Var;
    }

    public final boolean equals(Object obj) {
        c0 c0Var;
        Integer num;
        String str;
        List list;
        n0 n0Var;
        if (obj == this) {
            return true;
        }
        if (obj instanceof j0) {
            x xVar = (x) ((j0) obj);
            n0 n0Var2 = xVar.f87232g;
            List list2 = xVar.f87231f;
            String str2 = xVar.f87230e;
            Integer num2 = xVar.f87229d;
            c0 c0Var2 = xVar.f87228c;
            if (this.f87226a == xVar.f87226a && this.f87227b == xVar.f87227b && ((c0Var = this.f87228c) != null ? c0Var.equals(c0Var2) : c0Var2 == null) && ((num = this.f87229d) != null ? num.equals(num2) : num2 == null) && ((str = this.f87230e) != null ? str.equals(str2) : str2 == null) && ((list = this.f87231f) != null ? list.equals(list2) : list2 == null) && ((n0Var = this.f87232g) != null ? n0Var.equals(n0Var2) : n0Var2 == null)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f87226a;
        long j12 = this.f87227b;
        int i5 = (((((int) (j11 ^ (j11 >>> 32))) ^ 1000003) * 1000003) ^ ((int) ((j12 >>> 32) ^ j12))) * 1000003;
        c0 c0Var = this.f87228c;
        int iHashCode = (i5 ^ (c0Var == null ? 0 : c0Var.hashCode())) * 1000003;
        Integer num = this.f87229d;
        int iHashCode2 = (iHashCode ^ (num == null ? 0 : num.hashCode())) * 1000003;
        String str = this.f87230e;
        int iHashCode3 = (iHashCode2 ^ (str == null ? 0 : str.hashCode())) * 1000003;
        List list = this.f87231f;
        int iHashCode4 = (iHashCode3 ^ (list == null ? 0 : list.hashCode())) * 1000003;
        n0 n0Var = this.f87232g;
        return iHashCode4 ^ (n0Var != null ? n0Var.hashCode() : 0);
    }

    public final String toString() {
        return "LogRequest{requestTimeMs=" + this.f87226a + ", requestUptimeMs=" + this.f87227b + ", clientInfo=" + this.f87228c + ", logSource=" + this.f87229d + ", logSourceName=" + this.f87230e + ", logEvents=" + this.f87231f + ", qosTier=" + this.f87232g + "}";
    }
}
