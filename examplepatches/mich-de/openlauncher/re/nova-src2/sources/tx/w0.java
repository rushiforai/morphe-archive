package tx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w0 extends y0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f90042a;

    public w0(String str) {
        this.f90042a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w0) && Intrinsics.b(this.f90042a, ((w0) obj).f90042a);
    }

    public final int hashCode() {
        return this.f90042a.hashCode();
    }

    public final String toString() {
        return b.c0.l("Ready(token=", this.f90042a, ")");
    }
}
