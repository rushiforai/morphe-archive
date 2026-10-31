package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.services.model.BranchJob;
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
public final class Q7 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63212a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3164g8 f63213b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Xc f63214c;

    @DebugMetadata(c = "io.branch.search.internal.data.usecases.InitializeBundleCommand", f = "InitializeBundleUseCase.kt", l = {26}, m = "initializeBundle")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Q7 f63215a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f63216b;

        /* renamed from: d, reason: collision with root package name */
        public int f63218d;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63216b = obj;
            this.f63218d |= Integer.MIN_VALUE;
            return Q7.this.a(false, 0L, this);
        }
    }

    public Q7(@NotNull Context context, @NotNull InterfaceC3164g8 jobManager, @NotNull Xc scheduledQueryScheduleJobUseCase) {
        Intrinsics.g(context, "context");
        Intrinsics.g(jobManager, "jobManager");
        Intrinsics.g(scheduledQueryScheduleJobUseCase, "scheduledQueryScheduleJobUseCase");
        this.f63212a = context;
        this.f63213b = jobManager;
        this.f63214c = scheduledQueryScheduleJobUseCase;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, long j11, Continuation<? super Unit> continuation) {
        a aVar;
        Q7 q72;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f63218d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f63218d = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object obj = aVar2.f63216b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f63218d;
        if (i11 == 0) {
            ResultKt.b(obj);
            R7.a(this.f63212a);
            Context context = this.f63212a;
            Intrinsics.g(context, "context");
            InterfaceC3164g8 interfaceC3164g8 = this.f63213b;
            aVar2.f63215a = this;
            aVar2.f63218d = 1;
            if (interfaceC3164g8.a(j11, 0L, z11, aVar2) == coroutineSingletons) {
                return coroutineSingletons;
            }
            q72 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            q72 = aVar2.f63215a;
            ResultKt.b(obj);
        }
        Pc pc2 = q72.f63214c.f63672a.f63602a;
        pc2.getClass();
        BranchJob.ScheduledQueries scheduledQueries = new BranchJob.ScheduledQueries(3600000L, pc2.f63089b.f63057z != y40.m.f96676b);
        pc2.f63092e.a(scheduledQueries, new Vc(scheduledQueries));
        return Unit.f71706a;
    }
}
