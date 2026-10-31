package m3;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class q0 implements b {

    /* renamed from: a, reason: collision with root package name */
    public final String f75961a;

    public q0(String str) {
        this.f75961a = str;
    }

    public final String a() {
        return this.f75961a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof q0) {
            return Intrinsics.b(this.f75961a, ((q0) obj).f75961a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f75961a.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("UrlAnnotation(url="), this.f75961a, ')');
    }
}
