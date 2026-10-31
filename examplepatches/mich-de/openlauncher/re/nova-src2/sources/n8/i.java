package n8;

import kotlin.Function;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.AdaptedFunctionReference;
import kotlin.jvm.internal.FunctionAdapter;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements w70.n, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f77984a;

    public i(l lVar) {
        this.f77984a = lVar;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return new AdaptedFunctionReference(2, 4, l.class, this.f77984a, "updateState", "updateState(Lcoil/compose/AsyncImagePainter$State;)V");
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        this.f77984a.k((h) obj);
        Unit unit = Unit.f71706a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return unit;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof w70.n) && (obj instanceof FunctionAdapter)) {
            return b().equals(((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return b().hashCode();
    }
}
