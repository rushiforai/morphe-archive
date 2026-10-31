package a00;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f70a;

    /* renamed from: b, reason: collision with root package name */
    public final String f71b;

    public c(String str, String str2) {
        this.f70a = str;
        this.f71b = str2;
    }

    public final String a() {
        return this.f70a;
    }

    public final String b() {
        return this.f71b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f70a, cVar.f70a) && Intrinsics.b(this.f71b, cVar.f71b);
    }

    public final int hashCode() {
        String str = this.f70a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f71b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.n("Route(deviceName=", this.f70a, ", drawableUri=", this.f71b, ")");
    }
}
