package ql;

import java.util.Objects;
import l1.a2;

/* loaded from: classes3.dex */
public final class c extends g0 {

    /* renamed from: a, reason: collision with root package name */
    public final b f84128a;

    /* renamed from: b, reason: collision with root package name */
    public final a f84129b;

    /* renamed from: c, reason: collision with root package name */
    public final b f84130c;

    /* renamed from: d, reason: collision with root package name */
    public final b f84131d;

    public c(b bVar, a aVar, b bVar2, b bVar3) {
        this.f84128a = bVar;
        this.f84129b = aVar;
        this.f84130c = bVar2;
        this.f84131d = bVar3;
    }

    public static a2 b() {
        a2 a2Var = new a2();
        a2Var.f73007a = null;
        a2Var.f73008b = null;
        a2Var.f73009c = null;
        a2Var.f73010d = b.f84118k;
        return a2Var;
    }

    @Override // el.g
    public final boolean a() {
        return this.f84131d != b.f84118k;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return cVar.f84128a == this.f84128a && cVar.f84129b == this.f84129b && cVar.f84130c == this.f84130c && cVar.f84131d == this.f84131d;
    }

    public final int hashCode() {
        return Objects.hash(c.class, this.f84128a, this.f84129b, this.f84130c, this.f84131d);
    }

    public final String toString() {
        return "ECDSA Parameters (variant: " + this.f84131d + ", hashType: " + this.f84130c + ", encoding: " + this.f84128a + ", curve: " + this.f84129b + ")";
    }
}
