package r8;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n extends f {

    /* renamed from: a, reason: collision with root package name */
    public final o8.k f85645a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85646b;

    /* renamed from: c, reason: collision with root package name */
    public final int f85647c;

    public n(o8.k kVar, String str, int i5) {
        this.f85645a = kVar;
        this.f85646b = str;
        this.f85647c = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f85645a.equals(nVar.f85645a) && Intrinsics.b(this.f85646b, nVar.f85646b) && this.f85647c == nVar.f85647c;
    }

    public final int hashCode() {
        int iHashCode = this.f85645a.hashCode() * 31;
        String str = this.f85646b;
        return c0.F(this.f85647c) + ((iHashCode + (str != null ? str.hashCode() : 0)) * 31);
    }
}
