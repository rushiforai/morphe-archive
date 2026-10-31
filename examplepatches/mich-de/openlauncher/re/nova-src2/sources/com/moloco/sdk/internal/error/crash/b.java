package com.moloco.sdk.internal.error.crash;

import com.moloco.sdk.internal.error.crash.b;
import java.lang.Thread;
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
import t70.j0;
import t70.m0;

/* loaded from: classes.dex */
public final class b implements com.moloco.sdk.internal.error.crash.a {

    /* renamed from: c, reason: collision with root package name */
    public static final int f36385c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c f36386a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public Thread.UncaughtExceptionHandler f36387b;

    @DebugMetadata(c = "com.moloco.sdk.internal.error.crash.CrashDetectorServiceImpl$register$2", f = "CrashDetectorService.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36388a;

        public a(Continuation<? super a> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return b.this.new a(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f36388a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (b.this.f36387b == null) {
                b.this.f36387b = Thread.getDefaultUncaughtExceptionHandler();
                final b bVar = b.this;
                Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.moloco.sdk.internal.error.crash.e
                    @Override // java.lang.Thread.UncaughtExceptionHandler
                    public final void uncaughtException(Thread thread, Throwable th2) {
                        b.a.a(bVar, thread, th2);
                    }
                });
            }
            return Unit.f71706a;
        }

        public static final void a(b bVar, Thread thread, Throwable th2) {
            c cVar = bVar.f36386a;
            Intrinsics.d(th2);
            cVar.a(th2);
            Thread.UncaughtExceptionHandler uncaughtExceptionHandler = bVar.f36387b;
            if (uncaughtExceptionHandler != null) {
                uncaughtExceptionHandler.uncaughtException(thread, th2);
            } else {
                System.exit(2);
                throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
            }
        }
    }

    public b(@NotNull c crashHandler) {
        Intrinsics.g(crashHandler, "crashHandler");
        this.f36386a = crashHandler;
    }

    @Override // com.moloco.sdk.internal.error.crash.a
    @Nullable
    public Object a(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(com.moloco.sdk.internal.scheduling.b.a().getMain(), new a(null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }
}
