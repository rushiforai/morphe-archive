package y8;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: c, reason: collision with root package name */
    public static final f f96844c;

    /* renamed from: a, reason: collision with root package name */
    public final v4.a f96845a;

    /* renamed from: b, reason: collision with root package name */
    public final v4.a f96846b;

    static {
        b bVar = b.f96840d;
        f96844c = new f(bVar, bVar);
    }

    public f(v4.a aVar, v4.a aVar2) {
        this.f96845a = aVar;
        this.f96846b = aVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f96845a, fVar.f96845a) && Intrinsics.b(this.f96846b, fVar.f96846b);
    }

    public final int hashCode() {
        return this.f96846b.hashCode() + (this.f96845a.hashCode() * 31);
    }

    public final String toString() {
        return "Size(width=" + this.f96845a + ", height=" + this.f96846b + ')';
    }
}
