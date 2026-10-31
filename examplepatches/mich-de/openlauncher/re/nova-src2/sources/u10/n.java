package u10;

import android.net.Uri;
import b.u4;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes4.dex */
public final class n extends com.teslacoilsw.launcher.search.hero.c {

    /* renamed from: b, reason: collision with root package name */
    public final s10.d f90399b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90400c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f90401d;

    /* renamed from: e, reason: collision with root package name */
    public final List f90402e;

    /* renamed from: f, reason: collision with root package name */
    public final t00.s f90403f;

    public n(s10.d dVar, String str, Uri uri) {
        EmptyList emptyList = EmptyList.f71733a;
        t00.s sVar = new t00.s(10);
        this.f90399b = dVar;
        this.f90400c = str;
        this.f90401d = uri;
        this.f90402e = emptyList;
        this.f90403f = sVar;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return new IdHash((short) 0, 0L, 0L, null);
    }

    public final ga.a d() {
        return this.f90399b;
    }

    public final String e() {
        return this.f90400c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return Intrinsics.b(this.f90399b, nVar.f90399b) && Intrinsics.b(this.f90400c, nVar.f90400c) && Intrinsics.b(this.f90401d, nVar.f90401d) && Intrinsics.b(this.f90402e, nVar.f90402e) && Intrinsics.b(this.f90403f, nVar.f90403f);
    }

    public final int hashCode() {
        return this.f90403f.hashCode() + u4.c((this.f90401d.hashCode() + b.c0.e(this.f90399b.hashCode() * 31, 31, this.f90400c)) * 31, 31, this.f90402e);
    }

    public final String toString() {
        return "BranchHeroContent(appInfo=" + this.f90399b + ", description=" + this.f90400c + ", iconUri=" + this.f90401d + ", actions=" + this.f90402e + ", onClick=" + this.f90403f + ")";
    }
}
