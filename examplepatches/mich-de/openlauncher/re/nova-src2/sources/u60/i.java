package u60;

import b.c0;

/* loaded from: classes4.dex */
public final class i implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f90658a;

    public i(String str) {
        this.f90658a = str;
    }

    @Override // u60.f
    public final int a() {
        return this.f90658a.length();
    }

    @Override // u60.f
    public final boolean b() {
        return false;
    }

    public final String toString() {
        return c0.q(new StringBuilder("TextImpl{literal='"), this.f90658a, "'}");
    }
}
