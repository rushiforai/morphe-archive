package b0;

import java.util.LinkedHashMap;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g1 {

    /* renamed from: b, reason: collision with root package name */
    public static final g1 f16131b;

    /* renamed from: c, reason: collision with root package name */
    public static final g1 f16132c;

    /* renamed from: a, reason: collision with root package name */
    public final v1 f16133a;

    static {
        LinkedHashMap linkedHashMap = null;
        h1 h1Var = null;
        t1 t1Var = null;
        j0 j0Var = null;
        m1 m1Var = null;
        f16131b = new g1(new v1(h1Var, t1Var, j0Var, m1Var, linkedHashMap, 63));
        f16132c = new g1(new v1(h1Var, t1Var, j0Var, m1Var, linkedHashMap, 47));
    }

    public g1(v1 v1Var) {
        this.f16133a = v1Var;
    }

    public final g1 a(g1 g1Var) {
        v1 v1Var = g1Var.f16133a;
        h1 h1Var = v1Var.f16260a;
        if (h1Var == null) {
            h1Var = this.f16133a.f16260a;
        }
        t1 t1Var = v1Var.f16261b;
        if (t1Var == null) {
            t1Var = this.f16133a.f16261b;
        }
        j0 j0Var = v1Var.f16262c;
        if (j0Var == null) {
            j0Var = this.f16133a.f16262c;
        }
        m1 m1Var = v1Var.f16263d;
        if (m1Var == null) {
            m1Var = this.f16133a.f16263d;
        }
        return new g1(new v1(h1Var, t1Var, j0Var, m1Var, v1Var.f16264e || this.f16133a.f16264e, MapsKt.m0(this.f16133a.f16265f, v1Var.f16265f)));
    }

    public final boolean equals(Object obj) {
        return (obj instanceof g1) && Intrinsics.b(((g1) obj).f16133a, this.f16133a);
    }

    public final int hashCode() {
        return this.f16133a.hashCode();
    }

    public final String toString() {
        if (equals(f16131b)) {
            return "ExitTransition.None";
        }
        if (equals(f16132c)) {
            return "ExitTransition.KeepUntilTransitionsFinished";
        }
        StringBuilder sb2 = new StringBuilder("ExitTransition: \nFade - ");
        v1 v1Var = this.f16133a;
        h1 h1Var = v1Var.f16260a;
        sb2.append(h1Var != null ? h1Var.toString() : null);
        sb2.append(",\nSlide - ");
        t1 t1Var = v1Var.f16261b;
        sb2.append(t1Var != null ? t1Var.toString() : null);
        sb2.append(",\nShrink - ");
        j0 j0Var = v1Var.f16262c;
        sb2.append(j0Var != null ? j0Var.toString() : null);
        sb2.append(",\nScale - ");
        m1 m1Var = v1Var.f16263d;
        sb2.append(m1Var != null ? m1Var.toString() : null);
        sb2.append(",\nKeepUntilTransitionsFinished - ");
        sb2.append(v1Var.f16264e);
        return sb2.toString();
    }
}
