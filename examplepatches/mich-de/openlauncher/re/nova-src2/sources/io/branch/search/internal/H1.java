package io.branch.search.internal;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class H1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final H1 f62552a = new H1();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(H1 h1, t70.j0 j0Var, Function0 function0, Function1 function1, Function0 function02, Continuation continuation) {
        F1 f12;
        h1.getClass();
        if (continuation instanceof F1) {
            f12 = (F1) continuation;
            int i5 = f12.f62434d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f12.f62434d = i5 - Integer.MIN_VALUE;
            } else {
                f12 = new F1(h1, continuation);
            }
        }
        Object obj = f12.f62432b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f12.f62434d;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                t70.k0.e(j0Var);
                Object objInvoke = function0.invoke();
                t70.m0.k(j0Var.getCoroutineContext());
                a80.e eVar = t70.y0.f88884a;
                u70.d dVar = y70.o.f96819a;
                G1 g1 = new G1(function1, objInvoke, null);
                f12.f62431a = function02;
                f12.f62434d = 1;
                if (t70.m0.y(dVar, g1, f12) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                function02 = f12.f62431a;
                ResultKt.b(obj);
            }
        } catch (CancellationException unused) {
            function02.invoke();
        }
        return Unit.f71706a;
    }
}
