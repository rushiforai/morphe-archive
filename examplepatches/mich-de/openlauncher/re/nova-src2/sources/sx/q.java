package sx;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final b f87818a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87819b;

    /* renamed from: c, reason: collision with root package name */
    public final long f87820c;

    public q(b bVar, String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.f87818a = bVar;
        this.f87819b = str;
        this.f87820c = jCurrentTimeMillis;
    }

    public final b a() {
        return this.f87818a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return this.f87818a == qVar.f87818a && Intrinsics.b(this.f87819b, qVar.f87819b) && this.f87820c == qVar.f87820c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f87820c) + c0.e(this.f87818a.hashCode() * 31, 31, this.f87819b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SelectionMetadata(adType=");
        sb2.append(this.f87818a);
        sb2.append(", baseAdUnitId=");
        sb2.append(this.f87819b);
        sb2.append(", timestamp=");
        return a2.c.i(this.f87820c, ")", sb2);
    }
}
