package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v23 {

    /* renamed from: a, reason: collision with root package name */
    public final ni.q f10559a;

    public v23(ni.q baseRequest) {
        Intrinsics.g(baseRequest, "baseRequest");
        this.f10559a = baseRequest;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v23) && Intrinsics.b(this.f10559a, ((v23) obj).f10559a);
    }

    public final int hashCode() {
        return this.f10559a.hashCode();
    }

    public final String toString() {
        return "ServerRequest(baseRequest=" + this.f10559a + ")";
    }
}
