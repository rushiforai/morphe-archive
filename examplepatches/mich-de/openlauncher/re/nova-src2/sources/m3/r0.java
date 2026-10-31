package m3;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class r0 implements b {

    /* renamed from: a, reason: collision with root package name */
    public final String f75969a;

    public r0(String str) {
        this.f75969a = str;
    }

    public final String a() {
        return this.f75969a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof r0) {
            return Intrinsics.b(this.f75969a, ((r0) obj).f75969a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f75969a.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("VerbatimTtsAnnotation(verbatim="), this.f75969a, ')');
    }
}
