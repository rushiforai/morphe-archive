package lv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final String f75117a;

    public f(String clientSecret) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f75117a = clientSecret;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f75117a, ((f) obj).f75117a);
    }

    public final int hashCode() {
        return this.f75117a.hashCode();
    }

    public final String toString() {
        return c0.l("Config(clientSecret=", this.f75117a, ")");
    }
}
