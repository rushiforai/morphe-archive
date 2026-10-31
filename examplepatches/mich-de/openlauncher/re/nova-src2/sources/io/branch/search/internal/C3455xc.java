package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.SampledQueue$add$1", f = "Coros.kt", l = {479, 353}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.xc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3455xc extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f66287a;

    /* renamed from: b, reason: collision with root package name */
    public C3472yc f66288b;

    /* renamed from: c, reason: collision with root package name */
    public Function0 f66289c;

    /* renamed from: d, reason: collision with root package name */
    public int f66290d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ C3472yc f66291e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function0<Unit> f66292f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3455xc(C3472yc c3472yc, Function0<Unit> function0, Continuation<? super C3455xc> continuation) {
        super(2, continuation);
        this.f66291e = c3472yc;
        this.f66292f = function0;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3455xc(this.f66291e, this.f66292f, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3455xc(this.f66291e, this.f66292f, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v6, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r5v2, types: [c80.a] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
        Function0<Unit> function0;
        c80.d dVar;
        C3472yc c3472yc;
        ?? r02;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66290d;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                C3472yc c3472yc2 = this.f66291e;
                c80.a aVar = c3472yc2.f66331a;
                function0 = this.f66292f;
                this.f66287a = aVar;
                this.f66288b = c3472yc2;
                this.f66289c = function0;
                this.f66290d = 1;
                dVar = (c80.d) aVar;
                if (dVar.e(this) != coroutineSingletons) {
                    c3472yc = c3472yc2;
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r02 = this.f66287a;
                try {
                    ResultKt.b(obj);
                    r02 = r02;
                    Unit unit = Unit.f71706a;
                    ((c80.d) r02).g(null);
                    return unit;
                } catch (Throwable th2) {
                    th = th2;
                    dVar = r02;
                    dVar.g(null);
                    throw th;
                }
            }
            Function0<Unit> function02 = this.f66289c;
            c3472yc = this.f66288b;
            ?? r52 = this.f66287a;
            ResultKt.b(obj);
            function0 = function02;
            dVar = r52;
            if (!c3472yc.f66333c) {
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                return unit2;
            }
            w70.l1 l1Var = c3472yc.f66332b;
            this.f66287a = dVar;
            this.f66288b = null;
            this.f66289c = null;
            this.f66290d = 2;
            if (l1Var.emit(function0, this) != coroutineSingletons) {
                r02 = dVar;
                Unit unit3 = Unit.f71706a;
                ((c80.d) r02).g(null);
                return unit3;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }
}
