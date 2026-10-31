package ls;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f75088a;

    public b(String str) {
        this.f75088a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f75088a, ((b) obj).f75088a);
    }

    public final int hashCode() {
        String str = this.f75088a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return c0.l("NeedsVerification(webviewOpenUrl=", this.f75088a, ")");
    }
}
