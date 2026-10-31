package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$1", f = "PackageSyncManager.kt", l = {327, 329}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ja, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3216ja extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public v70.n f64890a;

    /* renamed from: b, reason: collision with root package name */
    public int f64891b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C3250la f64892c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3216ja(C3250la c3250la, Continuation<? super C3216ja> continuation) {
        super(2, continuation);
        this.f64892c = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3216ja(this.f64892c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3216ja(this.f64892c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0059  */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v4, types: [v70.b, v70.n] */
    /* JADX WARN: Type inference failed for: r1v8, types: [v70.n] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0052 -> B:15:0x002d). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x0055 -> B:15:0x002d). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
        ?? r12;
        Object obj2;
        v70.n it;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64891b;
        if (i5 == 0) {
            ResultKt.b(obj);
            it = this.f64892c.f64972i.iterator();
        } else {
            if (i5 == 1) {
                Object obj3 = this.f64890a;
                ResultKt.b(obj);
                obj2 = obj3;
                if (((Boolean) obj).booleanValue()) {
                    return Unit.f71706a;
                }
                r12 = (v70.b) obj2;
                t70.r1 r1Var = (t70.r1) r12.b();
                this.f64890a = r12;
                this.f64891b = 2;
                it = r12;
                if (r1Var.K(this) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r12 = this.f64890a;
            try {
                ResultKt.b(obj);
                it = r12;
            } catch (Throwable th2) {
                th2.printStackTrace();
                it = r12;
            }
        }
        this.f64890a = it;
        this.f64891b = 1;
        v70.b bVar = (v70.b) it;
        obj = bVar.a(this);
        obj2 = bVar;
        if (obj != coroutineSingletons) {
            if (((Boolean) obj).booleanValue()) {
            }
        }
        return coroutineSingletons;
    }
}
