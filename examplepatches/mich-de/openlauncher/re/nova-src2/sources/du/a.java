package du;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f49523a;

    public a(String str) {
        this.f49523a = str;
    }

    public final String a() {
        return c0.k("stripesdk://payment_return_url/", this.f49523a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f49523a, ((a) obj).f49523a);
    }

    public final int hashCode() {
        return this.f49523a.hashCode();
    }

    public final String toString() {
        return c0.l("DefaultReturnUrl(packageName=", this.f49523a, ")");
    }
}
