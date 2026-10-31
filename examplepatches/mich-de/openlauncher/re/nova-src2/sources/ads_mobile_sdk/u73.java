package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class u73 {

    /* renamed from: a, reason: collision with root package name */
    public final cw0 f10236a;

    /* renamed from: b, reason: collision with root package name */
    public final uv0 f10237b;

    /* renamed from: c, reason: collision with root package name */
    public final u53 f10238c;

    public /* synthetic */ u73(cw0 cw0Var, int i5) {
        this(cw0Var, (i5 & 2) != 0 ? null : uv0.CACHED, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u73)) {
            return false;
        }
        u73 u73Var = (u73) obj;
        return this.f10236a == u73Var.f10236a && this.f10237b == u73Var.f10237b && Intrinsics.b(this.f10238c, u73Var.f10238c);
    }

    public final int hashCode() {
        int iHashCode = this.f10236a.hashCode() * 31;
        uv0 uv0Var = this.f10237b;
        int iHashCode2 = (iHashCode + (uv0Var == null ? 0 : uv0Var.hashCode())) * 31;
        u53 u53Var = this.f10238c;
        return iHashCode2 + (u53Var != null ? u53Var.hashCode() : 0);
    }

    public final String toString() {
        return "SignalMeta(signalId=" + this.f10236a + ", cacheState=" + this.f10237b + ", signalData=" + this.f10238c + ")";
    }

    public u73(cw0 signalId, uv0 uv0Var, u53 u53Var) {
        Intrinsics.g(signalId, "signalId");
        this.f10236a = signalId;
        this.f10237b = uv0Var;
        this.f10238c = u53Var;
    }
}
