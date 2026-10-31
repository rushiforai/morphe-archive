package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.d0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0422d0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public v70.n f20520a;

    /* renamed from: b, reason: collision with root package name */
    public int f20521b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C0428e0 f20522c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0422d0(C0428e0 c0428e0, Continuation continuation) {
        super(2, continuation);
        this.f20522c = c0428e0;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C0422d0(this.f20522c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C0422d0(this.f20522c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0069  */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v4, types: [v70.b, v70.n] */
    /* JADX WARN: Type inference failed for: r1v8, types: [v70.n] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x005c -> B:15:0x002d). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x005f -> B:15:0x002d). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) throws Throwable {
        ?? r12;
        Object obj2;
        v70.n it;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20521b;
        if (i5 == 0) {
            ResultKt.b(obj);
            it = this.f20522c.f20551b.iterator();
        } else {
            if (i5 == 1) {
                Object obj3 = this.f20520a;
                ResultKt.b(obj);
                obj2 = obj3;
                if (((Boolean) obj).booleanValue()) {
                    return Unit.f71706a;
                }
                r12 = (v70.b) obj2;
                ((Function0) r12.b()).invoke();
                this.f20522c.getClass();
                this.f20520a = r12;
                this.f20521b = 2;
                it = r12;
                if (t70.t0.b(100L, this) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r12 = this.f20520a;
            try {
                ResultKt.b(obj);
                it = r12;
            } catch (Throwable th2) {
                this.f20522c.f20550a.a(th2, C0392c0.f20506a);
                it = r12;
            }
        }
        this.f20520a = it;
        this.f20521b = 1;
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
