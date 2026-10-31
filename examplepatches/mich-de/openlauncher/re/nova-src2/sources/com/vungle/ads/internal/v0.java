package com.vungle.ads.internal;

import com.vungle.ads.internal.model.j3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public final com.vungle.ads.internal.model.i0 f47720a;

    /* renamed from: b, reason: collision with root package name */
    public final j3 f47721b;

    /* renamed from: c, reason: collision with root package name */
    public final com.vungle.ads.internal.presenter.z f47722c;

    public v0(com.vungle.ads.internal.model.i0 adPayload, j3 placement, com.vungle.ads.internal.presenter.z zVar) {
        Intrinsics.g(adPayload, "adPayload");
        Intrinsics.g(placement, "placement");
        this.f47720a = adPayload;
        this.f47721b = placement;
        this.f47722c = zVar;
    }

    public final com.vungle.ads.internal.model.i0 a() {
        return this.f47720a;
    }

    public final j3 b() {
        return this.f47721b;
    }

    public final com.vungle.ads.internal.presenter.z c() {
        return this.f47722c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        return Intrinsics.b(this.f47720a, v0Var.f47720a) && Intrinsics.b(this.f47721b, v0Var.f47721b) && Intrinsics.b(this.f47722c, v0Var.f47722c);
    }

    public final int hashCode() {
        int iHashCode = (this.f47721b.hashCode() + (this.f47720a.hashCode() * 31)) * 31;
        com.vungle.ads.internal.presenter.z zVar = this.f47722c;
        return iHashCode + (zVar == null ? 0 : zVar.hashCode());
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("PendingData(adPayload=");
        sbA.append(this.f47720a);
        sbA.append(", placement=");
        sbA.append(this.f47721b);
        sbA.append(", presenterDelegate=");
        sbA.append(this.f47722c);
        sbA.append(')');
        return sbA.toString();
    }
}
