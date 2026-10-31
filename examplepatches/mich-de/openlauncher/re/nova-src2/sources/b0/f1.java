package b0;

import java.util.LinkedHashMap;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f1 {

    /* renamed from: b, reason: collision with root package name */
    public static final f1 f16125b = new f1(new v1((h1) null, (t1) null, (j0) null, (m1) null, (LinkedHashMap) null, 63));

    /* renamed from: a, reason: collision with root package name */
    public final v1 f16126a;

    public f1(v1 v1Var) {
        this.f16126a = v1Var;
    }

    public final f1 a(f1 f1Var) {
        v1 v1Var = f1Var.f16126a;
        h1 h1Var = v1Var.f16260a;
        if (h1Var == null) {
            h1Var = this.f16126a.f16260a;
        }
        t1 t1Var = v1Var.f16261b;
        if (t1Var == null) {
            t1Var = this.f16126a.f16261b;
        }
        j0 j0Var = v1Var.f16262c;
        if (j0Var == null) {
            j0Var = this.f16126a.f16262c;
        }
        m1 m1Var = v1Var.f16263d;
        if (m1Var == null) {
            m1Var = this.f16126a.f16263d;
        }
        return new f1(new v1(h1Var, t1Var, j0Var, m1Var, MapsKt.m0(this.f16126a.f16265f, v1Var.f16265f), 16));
    }

    public final boolean equals(Object obj) {
        return (obj instanceof f1) && Intrinsics.b(((f1) obj).f16126a, this.f16126a);
    }

    public final int hashCode() {
        return this.f16126a.hashCode();
    }

    public final String toString() {
        if (equals(f16125b)) {
            return "EnterTransition.None";
        }
        StringBuilder sb2 = new StringBuilder("EnterTransition: \nFade - ");
        v1 v1Var = this.f16126a;
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
        return sb2.toString();
    }
}
