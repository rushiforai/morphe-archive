package tx;

import b.c9;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p0 {

    /* renamed from: g, reason: collision with root package name */
    public static final Set f89935g = kotlin.collections.c.f1(new String[]{"plus", "pro", "pro_lifetime"});

    /* renamed from: a, reason: collision with root package name */
    public final String f89936a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89937b;

    /* renamed from: c, reason: collision with root package name */
    public final String f89938c;

    /* renamed from: d, reason: collision with root package name */
    public final long f89939d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f89940e;

    /* renamed from: f, reason: collision with root package name */
    public final long f89941f;

    public /* synthetic */ p0() {
        this(null, null, 0L, null, 0L, false);
    }

    public static p0 a(p0 p0Var, boolean z11, long j11, int i5) {
        String str = p0Var.f89936a;
        String str2 = p0Var.f89937b;
        String str3 = p0Var.f89938c;
        long j12 = p0Var.f89939d;
        if ((i5 & 16) != 0) {
            z11 = p0Var.f89940e;
        }
        boolean z12 = z11;
        if ((i5 & 32) != 0) {
            j11 = p0Var.f89941f;
        }
        return new p0(str, str2, j12, str3, j11, z12);
    }

    public final boolean b() {
        return Intrinsics.b(this.f89937b, "active") && b70.g.O0(f89935g, this.f89936a);
    }

    public final String c() {
        return this.f89936a;
    }

    public final String d() {
        return this.f89937b;
    }

    public final long e() {
        return this.f89939d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p0)) {
            return false;
        }
        p0 p0Var = (p0) obj;
        return Intrinsics.b(this.f89936a, p0Var.f89936a) && Intrinsics.b(this.f89937b, p0Var.f89937b) && Intrinsics.b(this.f89938c, p0Var.f89938c) && this.f89939d == p0Var.f89939d && this.f89940e == p0Var.f89940e && this.f89941f == p0Var.f89941f;
    }

    public final int hashCode() {
        String str = this.f89936a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f89937b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f89938c;
        return Long.hashCode(this.f89941f) + c9.f(b.c0.d((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31, 31, this.f89939d), 31, this.f89940e);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("NovaAiEntitlementSnapshot(plan=", this.f89936a, ", status=", this.f89937b, ", provider=");
        sbW.append(this.f89938c);
        sbW.append(", syncedAtMs=");
        sbW.append(this.f89939d);
        sbW.append(", pendingProvisioning=");
        sbW.append(this.f89940e);
        sbW.append(", localFallbackActivatedAt=");
        return a2.c.i(this.f89941f, ")", sbW);
    }

    public p0(String str, String str2, long j11, String str3, long j12, boolean z11) {
        this.f89936a = str;
        this.f89937b = str2;
        this.f89938c = str3;
        this.f89939d = j11;
        this.f89940e = z11;
        this.f89941f = j12;
    }
}
