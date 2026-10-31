package cn;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f20145a;

    public e(String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        this.f20145a = sessionId;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f20145a, ((e) obj).f20145a);
    }

    public final int hashCode() {
        return this.f20145a.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("SessionDetails(sessionId="), this.f20145a, ')');
    }
}
