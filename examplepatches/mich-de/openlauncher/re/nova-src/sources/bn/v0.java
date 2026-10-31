package bn;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f18296a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18297b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18298c;

    /* renamed from: d, reason: collision with root package name */
    public final long f18299d;

    /* renamed from: e, reason: collision with root package name */
    public final l f18300e;

    /* renamed from: f, reason: collision with root package name */
    public final String f18301f;

    /* renamed from: g, reason: collision with root package name */
    public final String f18302g;

    public v0(String sessionId, String firstSessionId, int i5, long j11, l lVar, String str, String firebaseAuthenticationToken) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(firstSessionId, "firstSessionId");
        Intrinsics.g(firebaseAuthenticationToken, "firebaseAuthenticationToken");
        this.f18296a = sessionId;
        this.f18297b = firstSessionId;
        this.f18298c = i5;
        this.f18299d = j11;
        this.f18300e = lVar;
        this.f18301f = str;
        this.f18302g = firebaseAuthenticationToken;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        return Intrinsics.b(this.f18296a, v0Var.f18296a) && Intrinsics.b(this.f18297b, v0Var.f18297b) && this.f18298c == v0Var.f18298c && this.f18299d == v0Var.f18299d && Intrinsics.b(this.f18300e, v0Var.f18300e) && Intrinsics.b(this.f18301f, v0Var.f18301f) && Intrinsics.b(this.f18302g, v0Var.f18302g);
    }

    public final int hashCode() {
        return this.f18302g.hashCode() + b.c0.e((this.f18300e.hashCode() + b.c0.d(u4.a(this.f18298c, b.c0.e(this.f18296a.hashCode() * 31, 31, this.f18297b), 31), 31, this.f18299d)) * 31, 31, this.f18301f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SessionInfo(sessionId=");
        sb2.append(this.f18296a);
        sb2.append(", firstSessionId=");
        sb2.append(this.f18297b);
        sb2.append(", sessionIndex=");
        sb2.append(this.f18298c);
        sb2.append(", eventTimestampUs=");
        sb2.append(this.f18299d);
        sb2.append(", dataCollectionStatus=");
        sb2.append(this.f18300e);
        sb2.append(", firebaseInstallationId=");
        sb2.append(this.f18301f);
        sb2.append(", firebaseAuthenticationToken=");
        return h6.c1.t(sb2, this.f18302g, ')');
    }
}
