package d1;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final m3.g f48780a;

    /* renamed from: b, reason: collision with root package name */
    public m3.g f48781b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f48782c = false;

    /* renamed from: d, reason: collision with root package name */
    public d f48783d = null;

    public h(m3.g gVar, m3.g gVar2) {
        this.f48780a = gVar;
        this.f48781b = gVar2;
    }

    public final d a() {
        return this.f48783d;
    }

    public final m3.g b() {
        return this.f48781b;
    }

    public final boolean c() {
        return this.f48782c;
    }

    public final void d(d dVar) {
        this.f48783d = dVar;
    }

    public final void e(boolean z11) {
        this.f48782c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f48780a, hVar.f48780a) && Intrinsics.b(this.f48781b, hVar.f48781b) && this.f48782c == hVar.f48782c && Intrinsics.b(this.f48783d, hVar.f48783d);
    }

    public final void f(m3.g gVar) {
        this.f48781b = gVar;
    }

    public final int hashCode() {
        int iF = c9.f((this.f48781b.hashCode() + (this.f48780a.hashCode() * 31)) * 31, 31, this.f48782c);
        d dVar = this.f48783d;
        return iF + (dVar == null ? 0 : dVar.hashCode());
    }

    public final String toString() {
        return "TextSubstitutionValue(original=" + ((Object) this.f48780a) + ", substitution=" + ((Object) this.f48781b) + ", isShowingSubstitution=" + this.f48782c + ", layoutCache=" + this.f48783d + ')';
    }
}
