package p8;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import m90.h0;
import m90.j0;
import m90.m;
import m90.t;
import m90.z;

/* loaded from: classes2.dex */
public final class c extends m {

    /* renamed from: b, reason: collision with root package name */
    public final m f82432b;

    public c(m delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f82432b = delegate;
    }

    @Override // m90.m
    public final h0 a(z file) {
        Intrinsics.g(file, "file");
        return this.f82432b.a(file);
    }

    @Override // m90.m
    public final void b(z source, z target) {
        Intrinsics.g(source, "source");
        Intrinsics.g(target, "target");
        this.f82432b.b(source, target);
    }

    @Override // m90.m
    public final void d(z zVar) {
        this.f82432b.d(zVar);
    }

    @Override // m90.m
    public final void e(z path) {
        Intrinsics.g(path, "path");
        this.f82432b.e(path);
    }

    @Override // m90.m
    public final List h(z zVar) {
        List<z> listH = this.f82432b.h(zVar);
        ArrayList arrayList = new ArrayList();
        for (z path : listH) {
            Intrinsics.g(path, "path");
            arrayList.add(path);
        }
        b70.c.x0(arrayList);
        return arrayList;
    }

    @Override // m90.m
    public final h4.e j(z path) {
        Intrinsics.g(path, "path");
        h4.e eVarJ = this.f82432b.j(path);
        if (eVarJ == null) {
            return null;
        }
        z zVar = (z) eVarJ.f59101d;
        if (zVar == null) {
            return eVarJ;
        }
        boolean z11 = eVarJ.f59099b;
        boolean z12 = eVarJ.f59100c;
        Long l9 = (Long) eVarJ.f59102e;
        Long l11 = (Long) eVarJ.f59103f;
        Long l12 = (Long) eVarJ.f59104g;
        Long l13 = (Long) eVarJ.f59105h;
        Map extras = (Map) eVarJ.f59106i;
        Intrinsics.g(extras, "extras");
        return new h4.e(z11, z12, zVar, l9, l11, l12, l13, extras);
    }

    @Override // m90.m
    public final t k(z zVar) {
        return this.f82432b.k(zVar);
    }

    @Override // m90.m
    public final t l(z file) {
        Intrinsics.g(file, "file");
        return this.f82432b.l(file);
    }

    @Override // m90.m
    public final h0 m(z zVar) {
        z zVarC = zVar.c();
        if (zVarC != null) {
            c(zVarC);
        }
        return this.f82432b.m(zVar);
    }

    @Override // m90.m
    public final j0 n(z file) {
        Intrinsics.g(file, "file");
        return this.f82432b.n(file);
    }

    public final String toString() {
        return Reflection.f71864a.getOrCreateKotlinClass(c.class).getSimpleName() + '(' + this.f82432b + ')';
    }
}
