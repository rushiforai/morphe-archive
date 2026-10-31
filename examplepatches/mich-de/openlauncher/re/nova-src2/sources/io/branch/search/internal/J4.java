package io.branch.search.internal;

import io.branch.search.internal.util.CorosKt;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class J4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.c0 f62718a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62719b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Integer, t70.r1> f62720c;

    @DebugMetadata(c = "io.branch.search.internal.services.CoroutinesJobManager", f = "RunningJobMonitor.kt", l = {69}, m = "cancelJob")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public J4 f62721a;

        /* renamed from: b, reason: collision with root package name */
        public int f62722b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f62723c;

        /* renamed from: e, reason: collision with root package name */
        public int f62725e;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f62723c = obj;
            this.f62725e |= Integer.MIN_VALUE;
            return J4.this.a(0, this);
        }
    }

    public J4(@NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f62718a = ioDispatcher;
        this.f62719b = t70.k0.a(new t70.i0("JobServiceWithMonitorScope").plus(t70.y0.f88884a).plus(t70.m0.d()).plus(CorosKt.a()));
        this.f62720c = new ConcurrentHashMap<>();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(J4 j42, int i5, t70.r1 r1Var, Continuation continuation) {
        H4 h42;
        j42.getClass();
        if (continuation instanceof H4) {
            h42 = (H4) continuation;
            int i11 = h42.f62578f;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                h42.f62578f = i11 - Integer.MIN_VALUE;
            } else {
                h42 = new H4(j42, continuation);
            }
        }
        Object obj = h42.f62576d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = h42.f62578f;
        if (i12 == 0) {
            ResultKt.b(obj);
            if (j42.f62720c.containsKey(new Integer(i5))) {
                h42.f62573a = j42;
                h42.f62574b = r1Var;
                h42.f62575c = i5;
                h42.f62578f = 1;
                if (j42.a(i5, h42) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = h42.f62575c;
            r1Var = h42.f62574b;
            j42 = h42.f62573a;
            ResultKt.b(obj);
        }
        j42.f62720c.put(new Integer(i5), r1Var);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(int i5, Continuation<? super Unit> continuation) {
        a aVar;
        J4 j42;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i11 = aVar.f62725e;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                aVar.f62725e = i11 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f62723c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = aVar.f62725e;
        if (i12 == 0) {
            ResultKt.b(obj);
            t70.r1 r1Var = this.f62720c.get(new Integer(i5));
            if (r1Var != null) {
                aVar.f62721a = this;
                aVar.f62722b = i5;
                aVar.f62725e = 1;
                if (t70.m0.i(r1Var, aVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            j42 = this;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = aVar.f62722b;
            j42 = aVar.f62721a;
            ResultKt.b(obj);
        }
        j42.f62720c.remove(new Integer(i5));
        return Unit.f71706a;
    }
}
