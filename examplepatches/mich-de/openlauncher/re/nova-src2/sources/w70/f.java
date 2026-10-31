package w70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes5.dex */
public final class f implements d {

    /* renamed from: a, reason: collision with root package name */
    public final e20.i0 f93893a;

    public f(e20.i0 i0Var) {
        this.f93893a = i0Var;
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        Object objCollect = this.f93893a.collect(new cw.x1(nVar, 21), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
