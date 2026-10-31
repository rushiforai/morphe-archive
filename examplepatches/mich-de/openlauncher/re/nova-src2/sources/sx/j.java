package sx;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final o f87792a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87793b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87794c;

    /* renamed from: d, reason: collision with root package name */
    public final q f87795d;

    public j(o oVar, String str, String str2, q qVar) {
        this.f87792a = oVar;
        this.f87793b = str;
        this.f87794c = str2;
        this.f87795d = qVar;
    }

    public final String a() {
        return this.f87794c;
    }

    public final q b() {
        return this.f87795d;
    }

    public final o c() {
        return this.f87792a;
    }

    public final String d() {
        return this.f87793b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return this.f87792a == jVar.f87792a && Intrinsics.b(this.f87793b, jVar.f87793b) && Intrinsics.b(this.f87794c, jVar.f87794c) && Intrinsics.b(this.f87795d, jVar.f87795d);
    }

    public final int hashCode() {
        return this.f87795d.hashCode() + c0.e(c0.e(this.f87792a.hashCode() * 31, 31, this.f87793b), 31, this.f87794c);
    }

    public final String toString() {
        return "AdUnitSelection(network=" + this.f87792a + ", tier=" + this.f87793b + ", adUnitId=" + this.f87794c + ", metadata=" + this.f87795d + ")";
    }
}
