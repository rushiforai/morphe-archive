package io.branch.search.internal;

import io.branch.search.internal.util.CorosKt;
import java.io.PrintWriter;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.s5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3363s5 implements Q4 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65725a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.c0 f65726b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3141f2 f65727c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final c80.a f65728d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final c80.a f65729e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f65730f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AtomicInteger f65731g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final AtomicLong f65732h;

    /* renamed from: io.branch.search.internal.s5$a */
    public static final class a {
    }

    /* renamed from: io.branch.search.internal.s5$b */
    public static final class b {

        @NotNull
        public static final a Companion = new a();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f65733a;

        /* renamed from: b, reason: collision with root package name */
        public final int f65734b;

        /* renamed from: c, reason: collision with root package name */
        public final long f65735c;

        /* renamed from: io.branch.search.internal.s5$b$a */
        public static final class a {
        }

        public b(boolean z11, int i5, long j11) {
            this.f65733a = z11;
            this.f65734b = i5;
            this.f65735c = j11;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return this.f65733a == bVar.f65733a && this.f65734b == bVar.f65734b && this.f65735c == bVar.f65735c;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v1, types: [int] */
        /* JADX WARN: Type inference failed for: r0v4 */
        /* JADX WARN: Type inference failed for: r0v5 */
        public final int hashCode() {
            boolean z11 = this.f65733a;
            ?? r02 = z11;
            if (z11) {
                r02 = 1;
            }
            return Long.hashCode(this.f65735c) + C3214j8.a(this.f65734b, r02 * 31, 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ConfigValues(handlerEnabled=");
            sb2.append(this.f65733a);
            sb2.append(", detectionCap=");
            sb2.append(this.f65734b);
            sb2.append(", hindsight=");
            return C3380t5.a(sb2, this.f65735c, ')');
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.analytics.DefaultCrashLoopHandler", f = "CrashLoopHandler.kt", l = {179}, m = "saveCrashTimestampForLoopCheck")
    /* renamed from: io.branch.search.internal.s5$c */
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3363s5 f65736a;

        /* renamed from: b, reason: collision with root package name */
        public c80.a f65737b;

        /* renamed from: c, reason: collision with root package name */
        public long f65738c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f65739d;

        /* renamed from: f, reason: collision with root package name */
        public int f65741f;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65739d = obj;
            this.f65741f |= Integer.MIN_VALUE;
            return C3363s5.this.a(0L, this);
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public C3363s5(@NotNull F4 contextDelegate, @NotNull String processName, @Nullable Eb eb2, @NotNull t70.c0 dispatcher) {
        this(processName, eb2, dispatcher, new C3141f2(contextDelegate, "bnc_persisted_crashes"));
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(processName, "processName");
        Intrinsics.g(dispatcher, "dispatcher");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // io.branch.search.internal.Q4
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
        c cVar;
        C3363s5 c3363s5;
        c80.a aVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f65741f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f65741f = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        Object obj = cVar.f65739d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f65741f;
        if (i11 == 0) {
            ResultKt.b(obj);
            c80.a aVar2 = this.f65729e;
            cVar.f65736a = this;
            cVar.f65737b = aVar2;
            cVar.f65738c = j11;
            cVar.f65741f = 1;
            c80.d dVar = (c80.d) aVar2;
            if (dVar.e(cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3363s5 = this;
            aVar = dVar;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = cVar.f65738c;
            aVar = cVar.f65737b;
            c3363s5 = cVar.f65736a;
            ResultKt.b(obj);
        }
        try {
            PrintWriter printWriter = new PrintWriter(c3363s5.f65727c.b("loop_data_" + c3363s5.f65725a));
            try {
                printWriter.println(String.valueOf(j11));
                Unit unit = Unit.f71706a;
                printWriter.close();
                return unit;
            } finally {
            }
        } finally {
            ((c80.d) aVar).g(null);
        }
    }

    public C3363s5(@NotNull String processName, @Nullable Eb eb2, @NotNull t70.c0 dispatcher, @NotNull C3141f2 fileManager) {
        Intrinsics.g(processName, "processName");
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(fileManager, "fileManager");
        this.f65725a = processName;
        this.f65726b = dispatcher;
        this.f65727c = fileManager;
        this.f65728d = new c80.d();
        this.f65729e = new c80.d();
        this.f65730f = new AtomicBoolean();
        this.f65731g = new AtomicInteger();
        this.f65732h = new AtomicLong();
    }

    @Override // io.branch.search.internal.Q4
    public final void a(@NotNull String sessionId, @NotNull C3282n8 remoteConfiguration) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        t70.m0.t(CorosKt.getBNCScope(), this.f65726b, null, new C3397u5(this, remoteConfiguration, false, sessionId, null), 2);
    }
}
