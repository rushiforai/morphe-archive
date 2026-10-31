package io.branch.search.internal;

import io.branch.search.internal.C3094c6;
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

@DebugMetadata(c = "io.branch.search.internal.DirectRequestCancellation$newRequestProcessing$2", f = "InternalRequestCoordinator.kt", l = {368}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.d6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3111d6 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f64245a;

    /* renamed from: b, reason: collision with root package name */
    public C3094c6 f64246b;

    /* renamed from: c, reason: collision with root package name */
    public EnumC3145f6 f64247c;

    /* renamed from: d, reason: collision with root package name */
    public C3094c6.a f64248d;

    /* renamed from: e, reason: collision with root package name */
    public int f64249e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ EnumC3145f6 f64250f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ C3094c6 f64251g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ C3094c6.a f64252h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3111d6(EnumC3145f6 enumC3145f6, C3094c6 c3094c6, C3094c6.a aVar, Continuation<? super C3111d6> continuation) {
        super(2, continuation);
        this.f64250f = enumC3145f6;
        this.f64251g = c3094c6;
        this.f64252h = aVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3111d6(this.f64250f, this.f64251g, this.f64252h, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3111d6) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        EnumC3145f6 enumC3145f6;
        C3094c6 c3094c6;
        C3094c6.a aVar;
        Object obj2;
        Function0<Unit> function0;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64249e;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                enumC3145f6 = this.f64250f;
                if (enumC3145f6.f64478a) {
                    C3094c6 c3094c62 = this.f64251g;
                    c80.a aVar2 = c3094c62.f64095b;
                    C3094c6.a aVar3 = this.f64252h;
                    this.f64245a = aVar2;
                    this.f64246b = c3094c62;
                    this.f64247c = enumC3145f6;
                    this.f64248d = aVar3;
                    this.f64249e = 1;
                    c80.d dVar = (c80.d) aVar2;
                    if (dVar.e(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    c3094c6 = c3094c62;
                    aVar = aVar3;
                    obj2 = dVar;
                }
                return Unit.f71706a;
            }
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = this.f64248d;
            enumC3145f6 = this.f64247c;
            c3094c6 = this.f64246b;
            Object obj3 = this.f64245a;
            ResultKt.b(obj);
            obj2 = obj3;
            C3094c6.a aVar4 = c3094c6.f64094a.get(enumC3145f6);
            if (aVar4 != null && (function0 = aVar4.f64097b) != null) {
                function0.invoke();
            }
            c3094c6.f64094a.put(enumC3145f6, aVar);
            Unit unit = Unit.f71706a;
            ((c80.d) obj2).g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            ((c80.d) obj2).g(null);
            throw th2;
        }
    }
}
