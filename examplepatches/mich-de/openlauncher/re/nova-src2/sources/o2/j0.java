package o2;

import b.u4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class j0 extends l0 implements Iterable, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final String f79299a;

    /* renamed from: b, reason: collision with root package name */
    public final float f79300b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79301c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79302d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79303e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79304f;

    /* renamed from: g, reason: collision with root package name */
    public final float f79305g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79306h;

    /* renamed from: i, reason: collision with root package name */
    public final List f79307i;

    /* renamed from: j, reason: collision with root package name */
    public final List f79308j;

    public j0(String str, float f11, float f12, float f13, float f14, float f15, float f16, float f17, List list, ArrayList arrayList) {
        this.f79299a = str;
        this.f79300b = f11;
        this.f79301c = f12;
        this.f79302d = f13;
        this.f79303e = f14;
        this.f79304f = f15;
        this.f79305g = f16;
        this.f79306h = f17;
        this.f79307i = list;
        this.f79308j = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof j0)) {
            j0 j0Var = (j0) obj;
            return Intrinsics.b(this.f79299a, j0Var.f79299a) && this.f79300b == j0Var.f79300b && this.f79301c == j0Var.f79301c && this.f79302d == j0Var.f79302d && this.f79303e == j0Var.f79303e && this.f79304f == j0Var.f79304f && this.f79305g == j0Var.f79305g && this.f79306h == j0Var.f79306h && Intrinsics.b(this.f79307i, j0Var.f79307i) && Intrinsics.b(this.f79308j, j0Var.f79308j);
        }
        return false;
    }

    public final int hashCode() {
        return this.f79308j.hashCode() + u4.c(a80.m.d(this.f79306h, a80.m.d(this.f79305g, a80.m.d(this.f79304f, a80.m.d(this.f79303e, a80.m.d(this.f79302d, a80.m.d(this.f79301c, a80.m.d(this.f79300b, this.f79299a.hashCode() * 31, 31), 31), 31), 31), 31), 31), 31), 31, this.f79307i);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new i0(this);
    }
}
