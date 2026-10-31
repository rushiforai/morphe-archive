package ads_mobile_sdk;

import b.c0;
import b.k9;
import java.util.Map;

/* loaded from: classes2.dex */
public final class ug2 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f10327a;

    /* renamed from: b, reason: collision with root package name */
    public final String f10328b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f10329c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f10330d;

    /* renamed from: e, reason: collision with root package name */
    public final String f10331e;

    /* renamed from: f, reason: collision with root package name */
    public final int f10332f;

    /* renamed from: g, reason: collision with root package name */
    public final String f10333g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f10334h;

    public ug2(boolean z11, String str, boolean z12, boolean z13, String str2, int i5, String str3, Map map) {
        this.f10327a = z11;
        this.f10328b = str;
        this.f10329c = z12;
        this.f10330d = z13;
        this.f10331e = str2;
        this.f10332f = i5;
        this.f10333g = str3;
        this.f10334h = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ug2)) {
            return false;
        }
        ug2 ug2Var = (ug2) obj;
        return this.f10327a == ug2Var.f10327a && this.f10328b.equals(ug2Var.f10328b) && this.f10329c == ug2Var.f10329c && this.f10330d == ug2Var.f10330d && this.f10331e.equals(ug2Var.f10331e) && this.f10332f == ug2Var.f10332f && this.f10333g.equals(ug2Var.f10333g) && this.f10334h.equals(ug2Var.f10334h);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [int] */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r3v1, types: [boolean] */
    public final int hashCode() {
        boolean z11 = this.f10327a;
        ?? r12 = z11;
        if (z11) {
            r12 = 1;
        }
        int iE = c0.e(r12 * 31, 31, this.f10328b);
        ?? r32 = this.f10329c;
        int i5 = r32;
        if (r32 != 0) {
            i5 = 1;
        }
        int i11 = (iE + i5) * 31;
        boolean z12 = this.f10330d;
        return this.f10334h.hashCode() + c0.e(k9.b(this.f10332f, c0.e((i11 + (z12 ? 1 : z12 ? 1 : 0)) * 31, 31, this.f10331e)), 31, this.f10333g);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PlayPrewarmOptions(enablePrewarming=");
        sb2.append(this.f10327a);
        sb2.append(", prefetchUrl=");
        sb2.append(this.f10328b);
        sb2.append(", skipOfflineNotificationFlow=");
        a80.m.s(sb2, this.f10329c, ", enableHsdpService=", this.f10330d, ", hsdpServiceTargetAppPackageName=");
        sb2.append(this.f10331e);
        sb2.append(", hsdpInvocationCallbackBitmask=");
        sb2.append(this.f10332f);
        sb2.append(", hsdpServiceReferrer=");
        sb2.append(this.f10333g);
        sb2.append(", hsdpServiceExtraQueryParams=");
        sb2.append(this.f10334h);
        sb2.append(")");
        return sb2.toString();
    }
}
