package b0;

import b.c9;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v1 {

    /* renamed from: a, reason: collision with root package name */
    public final h1 f16260a;

    /* renamed from: b, reason: collision with root package name */
    public final t1 f16261b;

    /* renamed from: c, reason: collision with root package name */
    public final j0 f16262c;

    /* renamed from: d, reason: collision with root package name */
    public final m1 f16263d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f16264e;

    /* renamed from: f, reason: collision with root package name */
    public final Map f16265f;

    public v1(h1 h1Var, t1 t1Var, j0 j0Var, m1 m1Var, boolean z11, Map map) {
        this.f16260a = h1Var;
        this.f16261b = t1Var;
        this.f16262c = j0Var;
        this.f16263d = m1Var;
        this.f16264e = z11;
        this.f16265f = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v1)) {
            return false;
        }
        v1 v1Var = (v1) obj;
        return Intrinsics.b(this.f16260a, v1Var.f16260a) && Intrinsics.b(this.f16261b, v1Var.f16261b) && Intrinsics.b(this.f16262c, v1Var.f16262c) && Intrinsics.b(this.f16263d, v1Var.f16263d) && this.f16264e == v1Var.f16264e && Intrinsics.b(this.f16265f, v1Var.f16265f);
    }

    public final int hashCode() {
        h1 h1Var = this.f16260a;
        int iHashCode = (h1Var == null ? 0 : h1Var.hashCode()) * 31;
        t1 t1Var = this.f16261b;
        int iHashCode2 = (iHashCode + (t1Var == null ? 0 : t1Var.hashCode())) * 31;
        j0 j0Var = this.f16262c;
        int iHashCode3 = (iHashCode2 + (j0Var == null ? 0 : j0Var.hashCode())) * 31;
        m1 m1Var = this.f16263d;
        return this.f16265f.hashCode() + c9.f((iHashCode3 + (m1Var != null ? m1Var.hashCode() : 0)) * 31, 31, this.f16264e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TransitionData(fade=");
        sb2.append(this.f16260a);
        sb2.append(", slide=");
        sb2.append(this.f16261b);
        sb2.append(", changeSize=");
        sb2.append(this.f16262c);
        sb2.append(", scale=");
        sb2.append(this.f16263d);
        sb2.append(", hold=");
        sb2.append(this.f16264e);
        sb2.append(", effectsMap=");
        return c9.l(sb2, this.f16265f, ')');
    }

    public /* synthetic */ v1(h1 h1Var, t1 t1Var, j0 j0Var, m1 m1Var, LinkedHashMap linkedHashMap, int i5) {
        this((i5 & 1) != 0 ? null : h1Var, (i5 & 2) != 0 ? null : t1Var, (i5 & 4) != 0 ? null : j0Var, (i5 & 8) != 0 ? null : m1Var, (i5 & 16) == 0, (i5 & 32) != 0 ? b70.h.f17594a : linkedHashMap);
    }
}
