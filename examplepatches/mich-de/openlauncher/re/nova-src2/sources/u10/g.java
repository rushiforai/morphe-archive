package u10;

import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes4.dex */
public final class g extends com.teslacoilsw.launcher.search.hero.c {

    /* renamed from: b, reason: collision with root package name */
    public final s10.d f90378b;

    /* renamed from: c, reason: collision with root package name */
    public final j f90379c;

    /* renamed from: d, reason: collision with root package name */
    public final t00.s f90380d;

    public g(s10.d dVar, j jVar, int i5) {
        jVar = (i5 & 2) != 0 ? null : jVar;
        t00.s sVar = new t00.s(9);
        this.f90378b = dVar;
        this.f90379c = jVar;
        this.f90380d = sVar;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return new IdHash((short) 0, 0L, 0L, null);
    }

    public final ga.a d() {
        return this.f90378b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (!this.f90378b.equals(gVar.f90378b) || !Intrinsics.b(this.f90379c, gVar.f90379c) || !this.f90380d.equals(gVar.f90380d)) {
            return false;
        }
        Object obj2 = pp.r.f82773j;
        return obj2.equals(obj2);
    }

    public final int hashCode() {
        int iHashCode = this.f90378b.hashCode() * 31;
        j jVar = this.f90379c;
        return pp.r.f82773j.hashCode() + ((this.f90380d.hashCode() + ((iHashCode + (jVar == null ? 0 : jVar.hashCode())) * 31)) * 31);
    }

    public final String toString() {
        return "AppInfoContent(appInfo=" + this.f90378b + ", appstoreMetadata=" + this.f90379c + ", onClick=" + this.f90380d + ", type=" + pp.r.f82773j + ")";
    }
}
