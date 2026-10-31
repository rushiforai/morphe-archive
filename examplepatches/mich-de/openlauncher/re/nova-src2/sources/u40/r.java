package u40;

import b.c0;
import b.c9;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final String f90606a;

    /* renamed from: b, reason: collision with root package name */
    public final a f90607b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90608c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90609d;

    /* renamed from: e, reason: collision with root package name */
    public final double f90610e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f90611f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f90612g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f90613h;

    /* renamed from: i, reason: collision with root package name */
    public final double f90614i;

    /* renamed from: j, reason: collision with root package name */
    public final double f90615j;

    /* renamed from: k, reason: collision with root package name */
    public final s f90616k;

    /* renamed from: l, reason: collision with root package name */
    public final s[] f90617l;

    /* renamed from: m, reason: collision with root package name */
    public final u f90618m;

    public r(String groupId, a type, String primaryLabel_plain, String primaryLabel_html, double d5, int[] matchedIndices, int[] typoIndices, boolean z11, double d11, double d12, s openAction, s[] additionalActions, u uVar) {
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(type, "type");
        Intrinsics.g(primaryLabel_plain, "primaryLabel_plain");
        Intrinsics.g(primaryLabel_html, "primaryLabel_html");
        Intrinsics.g(matchedIndices, "matchedIndices");
        Intrinsics.g(typoIndices, "typoIndices");
        Intrinsics.g(openAction, "openAction");
        Intrinsics.g(additionalActions, "additionalActions");
        this.f90606a = groupId;
        this.f90607b = type;
        this.f90608c = primaryLabel_plain;
        this.f90609d = primaryLabel_html;
        this.f90610e = d5;
        this.f90611f = matchedIndices;
        this.f90612g = typoIndices;
        this.f90613h = z11;
        this.f90614i = d11;
        this.f90615j = d12;
        this.f90616k = openAction;
        this.f90617l = additionalActions;
        this.f90618m = uVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Intrinsics.b(this.f90606a, rVar.f90606a) && this.f90607b == rVar.f90607b && Intrinsics.b(this.f90608c, rVar.f90608c) && Intrinsics.b(this.f90609d, rVar.f90609d) && Double.valueOf(this.f90610e).equals(Double.valueOf(rVar.f90610e)) && Intrinsics.b(this.f90611f, rVar.f90611f) && Intrinsics.b(this.f90612g, rVar.f90612g) && this.f90613h == rVar.f90613h && Double.valueOf(this.f90614i).equals(Double.valueOf(rVar.f90614i)) && Double.valueOf(this.f90615j).equals(Double.valueOf(rVar.f90615j)) && Intrinsics.b(this.f90616k, rVar.f90616k) && Intrinsics.b(this.f90617l, rVar.f90617l) && this.f90618m == rVar.f90618m;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (Arrays.hashCode(this.f90612g) + ((Arrays.hashCode(this.f90611f) + c9.c(this.f90610e, c0.e(c0.e((this.f90607b.hashCode() + (this.f90606a.hashCode() * 31)) * 31, 31, this.f90608c), 29791, this.f90609d), 31)) * 31)) * 31;
        boolean z11 = this.f90613h;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iHashCode2 = (Arrays.hashCode(this.f90617l) + ((this.f90616k.hashCode() + c9.c(this.f90615j, c9.c(this.f90614i, (iHashCode + i5) * 31, 31), 31)) * 31)) * 31;
        u uVar = this.f90618m;
        return iHashCode2 + (uVar == null ? 0 : uVar.hashCode());
    }

    public final String toString() {
        return "SesameLiteResult(groupId=" + this.f90606a + ", type=" + this.f90607b + ", primaryLabel_plain=" + this.f90608c + ", primaryLabel_html=" + this.f90609d + ", secondaryLabel_plain=null, secondaryLabel_html=null, matchScore=" + this.f90610e + ", matchedIndices=" + Arrays.toString(this.f90611f) + ", typoIndices=" + Arrays.toString(this.f90612g) + ", isSubstringMatch=" + this.f90613h + ", searchTimesScore=" + this.f90614i + ", usageTimesScore=" + this.f90615j + ", openAction=" + this.f90616k + ", additionalActions=" + Arrays.toString(this.f90617l) + ", algorithm=" + this.f90618m + ')';
    }
}
