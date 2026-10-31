package ix;

import b.c0;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f68175a;

    /* renamed from: b, reason: collision with root package name */
    public final double[] f68176b;

    public a(String str, double[] dArr) {
        this.f68175a = str;
        this.f68176b = dArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f68175a, aVar.f68175a) && Intrinsics.b(this.f68176b, aVar.f68176b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f68176b) + (this.f68175a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("ColorName(name=", this.f68175a, ", colorLab=", Arrays.toString(this.f68176b), ")");
    }
}
