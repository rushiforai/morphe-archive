package no;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class d extends e {

    /* renamed from: d, reason: collision with root package name */
    public final String f78373d;

    public d(String str) {
        this.f78373d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f78373d, ((d) obj).f78373d);
    }

    public final int hashCode() {
        return this.f78373d.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("NotInstalled(identifier="), this.f78373d, ')');
    }
}
