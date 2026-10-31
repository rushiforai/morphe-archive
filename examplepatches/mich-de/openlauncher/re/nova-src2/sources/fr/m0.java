package fr;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f55664a;

    public m0(String str) {
        this.f55664a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m0) && Intrinsics.b(this.f55664a, ((m0) obj).f55664a);
    }

    public final int hashCode() {
        return this.f55664a.hashCode();
    }

    public final String toString() {
        return this.f55664a;
    }
}
