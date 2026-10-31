package qw;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements i {

    /* renamed from: a, reason: collision with root package name */
    public final String f84349a;

    public h(String str) {
        this.f84349a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h) && Intrinsics.b(this.f84349a, ((h) obj).f84349a);
    }

    @Override // qw.i
    public final String getValue() {
        return this.f84349a;
    }

    public final int hashCode() {
        return this.f84349a.hashCode();
    }

    public final String toString() {
        return c0.l("Unknown(value=", this.f84349a, ")");
    }
}
