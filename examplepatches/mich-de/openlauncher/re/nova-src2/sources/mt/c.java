package mt;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Object f76735a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f76736b;

    /* renamed from: c, reason: collision with root package name */
    public final vt.f0 f76737c;

    public c(Object obj, boolean z11, vt.f0 f0Var) {
        this.f76735a = obj;
        this.f76736b = z11;
        this.f76737c = f0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f76735a, cVar.f76735a) && this.f76736b == cVar.f76736b && this.f76737c == cVar.f76737c;
    }

    public final int hashCode() {
        Object obj = this.f76735a;
        int iF = c9.f((obj == null ? 0 : obj.hashCode()) * 31, 31, this.f76736b);
        vt.f0 f0Var = this.f76737c;
        return iF + (f0Var != null ? f0Var.hashCode() : 0);
    }

    public final String toString() {
        return "Launch(launcherArguments=" + this.f76735a + ", receivesResultInProcess=" + this.f76736b + ", deferredIntentConfirmationType=" + this.f76737c + ")";
    }
}
