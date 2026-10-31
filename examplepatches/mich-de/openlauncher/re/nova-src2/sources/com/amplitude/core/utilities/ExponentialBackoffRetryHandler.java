package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.t0;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0005\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB#\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\"\u0010\u0016\u001a\u00020\u00172\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00170\u0019H\u0086@¢\u0006\u0002\u0010\u001bJ\b\u0010\u001c\u001a\u00020\u001aH\u0002J\u0006\u0010\u001d\u001a\u00020\u0017R\u001a\u0010\b\u001a\u00020\tX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\rR\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\u000f8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0012\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\u001f"}, d2 = {"Lcom/amplitude/core/utilities/ExponentialBackoffRetryHandler;", b.f42142b, "maxRetryAttempt", b.f42142b, "baseDelayInMs", "factor", b.f42142b, "(IID)V", "attempt", "Ljava/util/concurrent/atomic/AtomicInteger;", "getAttempt$core", "()Ljava/util/concurrent/atomic/AtomicInteger;", "setAttempt$core", "(Ljava/util/concurrent/atomic/AtomicInteger;)V", "exponentialBackOffDelayInMs", b.f42142b, "getExponentialBackOffDelayInMs", "()J", "maxDelayInMs", "getMaxDelayInMs", "getMaxRetryAttempt", "()I", "attemptRetry", b.f42142b, "block", "Lkotlin/Function1;", b.f42142b, "(Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "canRetry", "reset", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ExponentialBackoffRetryHandler {
    private static final int MAX_DELAY_IN_MILLIS = 60000;
    private static final int MAX_RETRY_ATTEMPT = 5;

    @NotNull
    private AtomicInteger attempt;
    private final int baseDelayInMs;
    private final double factor;
    private final int maxRetryAttempt;

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.core.utilities.ExponentialBackoffRetryHandler", f = "ExponentialBackoffRetryHandler.kt", l = {51}, m = "attemptRetry")
    /* renamed from: com.amplitude.core.utilities.ExponentialBackoffRetryHandler$attemptRetry$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ExponentialBackoffRetryHandler.this.attemptRetry(null, this);
        }
    }

    public ExponentialBackoffRetryHandler() {
        this(0, 0, 0.0d, 7, null);
    }

    private final boolean canRetry() {
        return this.attempt.get() < this.maxRetryAttempt;
    }

    private final long getExponentialBackOffDelayInMs() {
        return (long) (Math.pow(this.factor, this.attempt.get()) * this.baseDelayInMs);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object attemptRetry(@NotNull Function1<? super Boolean, Unit> function1, @NotNull Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        ExponentialBackoffRetryHandler exponentialBackoffRetryHandler;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!canRetry()) {
                function1.invoke(Boolean.FALSE);
                return Unit.f71706a;
            }
            long exponentialBackOffDelayInMs = getExponentialBackOffDelayInMs();
            anonymousClass1.L$0 = this;
            anonymousClass1.L$1 = function1;
            anonymousClass1.label = 1;
            if (t0.b(exponentialBackOffDelayInMs, anonymousClass1) == coroutineSingletons) {
                return coroutineSingletons;
            }
            exponentialBackoffRetryHandler = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            function1 = (Function1) anonymousClass1.L$1;
            exponentialBackoffRetryHandler = (ExponentialBackoffRetryHandler) anonymousClass1.L$0;
            ResultKt.b(obj);
        }
        function1.invoke(Boolean.TRUE);
        exponentialBackoffRetryHandler.attempt.incrementAndGet();
        return Unit.f71706a;
    }

    @NotNull
    /* renamed from: getAttempt$core, reason: from getter */
    public final AtomicInteger getAttempt() {
        return this.attempt;
    }

    public final long getMaxDelayInMs() {
        int iPow = this.baseDelayInMs * ((int) Math.pow(this.factor, this.maxRetryAttempt + 1));
        if (MAX_DELAY_IN_MILLIS <= iPow) {
            iPow = MAX_DELAY_IN_MILLIS;
        }
        return iPow;
    }

    public final int getMaxRetryAttempt() {
        return this.maxRetryAttempt;
    }

    public final void reset() {
        this.attempt.set(0);
    }

    public final void setAttempt$core(@NotNull AtomicInteger atomicInteger) {
        Intrinsics.g(atomicInteger, "<set-?>");
        this.attempt = atomicInteger;
    }

    public ExponentialBackoffRetryHandler(int i5, int i11, double d5) {
        this.maxRetryAttempt = i5;
        this.baseDelayInMs = i11;
        this.factor = d5;
        this.attempt = new AtomicInteger(0);
    }

    public /* synthetic */ ExponentialBackoffRetryHandler(int i5, int i11, double d5, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this((i12 & 1) != 0 ? 5 : i5, (i12 & 2) != 0 ? 1000 : i11, (i12 & 4) != 0 ? 2.0d : d5);
    }
}
