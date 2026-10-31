package r20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f85332a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85333b;

    public a(String str, String str2) {
        this.f85332a = str;
        this.f85333b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f85332a, aVar.f85332a) && Intrinsics.b(this.f85333b, aVar.f85333b);
    }

    public final int hashCode() {
        return this.f85333b.hashCode() + (this.f85332a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("StreamData(gameId=", this.f85332a, ", language=", this.f85333b, ")");
    }
}
