package ads_mobile_sdk;

import b.u1;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ci implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final List f1881a;

    public ci(List grantedPermissionsList) {
        Intrinsics.g(grantedPermissionsList, "grantedPermissionsList");
        this.f1881a = grantedPermissionsList;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.grantedPermissions.addAll(this.f1881a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ci) && Intrinsics.b(this.f1881a, ((ci) obj).f1881a);
    }

    public final int hashCode() {
        return this.f1881a.hashCode();
    }

    public final String toString() {
        return "AppPermissionsSignal(grantedPermissionsList=" + this.f1881a + ")";
    }
}
