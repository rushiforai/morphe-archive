package i0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.t1;
import w70.u1;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final t1 f61087a = u1.b(0, 16, v70.a.f92142b, 1);

    public final Object a(h hVar, Continuation continuation) throws Throwable {
        Object objEmit = this.f61087a.emit(hVar, continuation);
        return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
    }

    public final boolean b(h hVar) {
        return this.f61087a.c(hVar);
    }
}
