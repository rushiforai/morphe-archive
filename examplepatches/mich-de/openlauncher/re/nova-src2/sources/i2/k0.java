package i2;

import e10.z2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k0 extends r0 {

    /* renamed from: b, reason: collision with root package name */
    public final h2.d f61126b;

    /* renamed from: c, reason: collision with root package name */
    public final h f61127c;

    public k0(h2.d dVar) {
        h hVarA;
        this.f61126b = dVar;
        if (z2.j0(dVar)) {
            hVarA = null;
        } else {
            hVarA = k.a();
            n0.a(hVarA, dVar);
        }
        this.f61127c = hVarA;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof k0) {
            return Intrinsics.b(this.f61126b, ((k0) obj).f61126b);
        }
        return false;
    }

    public final int hashCode() {
        return this.f61126b.hashCode();
    }

    @Override // i2.r0
    public final h2.c j() {
        h2.d dVar = this.f61126b;
        return new h2.c(dVar.f59022a, dVar.f59023b, dVar.f59024c, dVar.f59025d);
    }
}
