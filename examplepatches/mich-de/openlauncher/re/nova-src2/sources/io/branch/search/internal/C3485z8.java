package io.branch.search.internal;

import io.branch.search.internal.multiprocess.LifecycleNotifier;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.LifecycleNotifier$onStart$1", f = "LifecycleNotifier.kt", l = {49}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.z8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3485z8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f66362a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LifecycleNotifier f66363b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3485z8(LifecycleNotifier lifecycleNotifier, Continuation<? super C3485z8> continuation) {
        super(2, continuation);
        this.f66363b = lifecycleNotifier;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3485z8(this.f66363b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3485z8(this.f66363b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66362a;
        if (i5 == 0) {
            ResultKt.b(obj);
            LifecycleNotifier lifecycleNotifier = this.f66363b;
            InterfaceC3227k4 interfaceC3227k4 = lifecycleNotifier.f65287a;
            String packageName = lifecycleNotifier.f65291e.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            this.f66362a = 1;
            if (interfaceC3227k4.e(packageName, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        C3158g2 c3158g2 = this.f66363b.f65288b;
        c3158g2.f64547d.clear();
        Iterator it = c3158g2.f64544a.values().iterator();
        while (it.hasNext()) {
            ((Af) it.next()).c();
        }
        return Unit.f71706a;
    }
}
