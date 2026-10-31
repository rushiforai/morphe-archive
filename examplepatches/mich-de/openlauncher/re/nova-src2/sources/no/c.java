package no;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class c extends e {

    /* renamed from: d, reason: collision with root package name */
    public final String f78372d;

    public c(String str) {
        this.f78372d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f78372d, ((c) obj).f78372d);
    }

    public final int hashCode() {
        return this.f78372d.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("Installed(packageName="), this.f78372d, ')');
    }
}
