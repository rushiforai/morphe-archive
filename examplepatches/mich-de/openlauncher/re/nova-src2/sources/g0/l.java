package g0;

import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class l implements b2 {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f56613a;

    /* renamed from: b, reason: collision with root package name */
    public final k f56614b = new k(this);

    /* renamed from: c, reason: collision with root package name */
    public final e0.j1 f56615c = new e0.j1();

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f56616d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f56617e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f56618f;

    public l(Function1 function1) {
        this.f56613a = function1;
        Boolean bool = Boolean.FALSE;
        this.f56616d = androidx.compose.runtime.d.k(bool);
        this.f56617e = androidx.compose.runtime.d.k(bool);
        this.f56618f = androidx.compose.runtime.d.k(bool);
    }

    @Override // g0.b2
    public final float a(float f11) {
        return ((Number) this.f56613a.invoke(Float.valueOf(f11))).floatValue();
    }

    @Override // g0.b2
    public final boolean b() {
        return ((Boolean) ((p1.s2) this.f56616d).getValue()).booleanValue();
    }

    @Override // g0.b2
    public final Object d(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        Object objD = t70.k0.d(new dm.c(this, f1Var, function2, null, 14), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }
}
