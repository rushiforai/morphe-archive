package q1;

import kotlin.jvm.internal.Reflection;
import p1.k2;

/* loaded from: classes.dex */
public abstract class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f83395a;

    /* renamed from: b, reason: collision with root package name */
    public final int f83396b;

    public j0(int i5, int i11) {
        this.f83395a = i5;
        this.f83396b = i11;
    }

    public abstract void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var);

    public p1.a b(l0 l0Var) {
        return null;
    }

    public final String toString() {
        String simpleName = Reflection.f71864a.getOrCreateKotlinClass(getClass()).getSimpleName();
        return simpleName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : simpleName;
    }

    public /* synthetic */ j0(int i5, int i11, int i12) {
        this((i12 & 1) != 0 ? 0 : i5, (i12 & 2) != 0 ? 0 : i11);
    }
}
