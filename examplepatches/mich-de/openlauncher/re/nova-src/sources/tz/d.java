package tz;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final v f90098a;

    /* renamed from: b, reason: collision with root package name */
    public final v f90099b;

    /* renamed from: c, reason: collision with root package name */
    public final v f90100c;

    /* renamed from: d, reason: collision with root package name */
    public final v f90101d;

    /* renamed from: e, reason: collision with root package name */
    public final v f90102e;

    /* renamed from: f, reason: collision with root package name */
    public final v f90103f;

    /* renamed from: g, reason: collision with root package name */
    public final v f90104g;

    /* renamed from: h, reason: collision with root package name */
    public final v f90105h;

    /* renamed from: i, reason: collision with root package name */
    public final v f90106i;

    /* renamed from: j, reason: collision with root package name */
    public final v f90107j;

    /* renamed from: k, reason: collision with root package name */
    public final v f90108k;

    /* renamed from: l, reason: collision with root package name */
    public final v f90109l;

    /* renamed from: m, reason: collision with root package name */
    public final v f90110m;
    public final v n;
    public final v o;

    public d(v vVar, v vVar2, v vVar3, v vVar4, v vVar5, v vVar6, v vVar7, v vVar8, v vVar9, v vVar10, v vVar11, v vVar12, v vVar13, v vVar14, v vVar15) {
        this.f90098a = vVar;
        this.f90099b = vVar2;
        this.f90100c = vVar3;
        this.f90101d = vVar4;
        this.f90102e = vVar5;
        this.f90103f = vVar6;
        this.f90104g = vVar7;
        this.f90105h = vVar8;
        this.f90106i = vVar9;
        this.f90107j = vVar10;
        this.f90108k = vVar11;
        this.f90109l = vVar12;
        this.f90110m = vVar13;
        this.n = vVar14;
        this.o = vVar15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f90098a, dVar.f90098a) && Intrinsics.b(this.f90099b, dVar.f90099b) && Intrinsics.b(this.f90100c, dVar.f90100c) && Intrinsics.b(this.f90101d, dVar.f90101d) && Intrinsics.b(this.f90102e, dVar.f90102e) && Intrinsics.b(this.f90103f, dVar.f90103f) && Intrinsics.b(this.f90104g, dVar.f90104g) && Intrinsics.b(this.f90105h, dVar.f90105h) && Intrinsics.b(this.f90106i, dVar.f90106i) && Intrinsics.b(this.f90107j, dVar.f90107j) && Intrinsics.b(this.f90108k, dVar.f90108k) && Intrinsics.b(this.f90109l, dVar.f90109l) && Intrinsics.b(this.f90110m, dVar.f90110m) && Intrinsics.b(this.n, dVar.n) && Intrinsics.b(this.o, dVar.o);
    }

    public final int hashCode() {
        return this.o.hashCode() + ((this.n.hashCode() + ((this.f90110m.hashCode() + ((this.f90109l.hashCode() + ((this.f90108k.hashCode() + ((this.f90107j.hashCode() + ((this.f90106i.hashCode() + ((this.f90105h.hashCode() + ((this.f90104g.hashCode() + ((this.f90103f.hashCode() + ((this.f90102e.hashCode() + ((this.f90101d.hashCode() + ((this.f90100c.hashCode() + ((this.f90099b.hashCode() + (this.f90098a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "NovaColorScheme(desktop=" + this.f90098a + ", drawer=" + this.f90099b + ", dock=" + this.f90100c + ", desktopFolderIcon=" + this.f90101d + ", desktopFolder=" + this.f90102e + ", drawerFolderIcon=" + this.f90103f + ", drawerFolder=" + this.f90104g + ", desktopSearchBar=" + this.f90105h + ", dockSearchBar=" + this.f90106i + ", drawerSearchBar=" + this.f90107j + ", searchWindow=" + this.f90108k + ", popupMenu=" + this.f90109l + ", numericBadge=" + this.f90110m + ", feedPage=" + this.n + ", feedPageSearchBar=" + this.o + ")";
    }
}
