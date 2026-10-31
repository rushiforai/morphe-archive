package x70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import t70.h2;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Continuation[] f95215a = new Continuation[0];

    /* renamed from: b, reason: collision with root package name */
    public static final w50.g f95216b = new w50.g("NULL", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final w50.g f95217c = new w50.g("UNINITIALIZED", 1);

    /* renamed from: d, reason: collision with root package name */
    public static final w50.g f95218d = new w50.g("DONE", 1);

    public static final Object a(Continuation continuation, Function0 function0, Function3 function3, w70.n nVar, w70.m[] mVarArr) {
        q qVar = new q(null, function0, function3, nVar, mVarArr);
        h2 h2Var = new h2(continuation.getContext(), continuation, 1);
        Object objR = w20.e.r(h2Var, true, h2Var, qVar);
        return objR == CoroutineSingletons.f71806a ? objR : Unit.f71706a;
    }

    public static /* synthetic */ w70.m b(s sVar, CoroutineContext coroutineContext, int i5, v70.a aVar, int i11) {
        if ((i11 & 1) != 0) {
            coroutineContext = EmptyCoroutineContext.f71803a;
        }
        if ((i11 & 2) != 0) {
            i5 = -3;
        }
        if ((i11 & 4) != 0) {
            aVar = v70.a.f92141a;
        }
        return sVar.a(coroutineContext, i5, aVar);
    }
}
