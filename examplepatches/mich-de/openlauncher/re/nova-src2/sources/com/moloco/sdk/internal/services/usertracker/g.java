package com.moloco.sdk.internal.services.usertracker;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class g implements f {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38141d = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final e f38142a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.usertracker.b f38143b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final c80.a f38144c;

    @DebugMetadata(c = "com.moloco.sdk.internal.services.usertracker.UserTrackerServiceImpl", f = "UserTrackerService.kt", l = {48, 29}, m = "clear")
    /* loaded from: classes4.dex */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f38145a;

        /* renamed from: b, reason: collision with root package name */
        public Object f38146b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f38147c;

        /* renamed from: e, reason: collision with root package name */
        public int f38149e;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f38147c = obj;
            this.f38149e |= Integer.MIN_VALUE;
            return g.this.a(this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.usertracker.UserTrackerServiceImpl", f = "UserTrackerService.kt", l = {48, 33, 36}, m = "getIdentifier")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f38150a;

        /* renamed from: b, reason: collision with root package name */
        public Object f38151b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f38152c;

        /* renamed from: e, reason: collision with root package name */
        public int f38154e;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f38152c = obj;
            this.f38154e |= Integer.MIN_VALUE;
            return g.this.b(this);
        }
    }

    public g(@NotNull e idGenerator, @NotNull com.moloco.sdk.internal.services.usertracker.b idRepository) {
        Intrinsics.g(idGenerator, "idGenerator");
        Intrinsics.g(idRepository, "idRepository");
        this.f38142a = idGenerator;
        this.f38143b = idRepository;
        this.f38144c = new c80.d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v13, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r2v4, types: [c80.a] */
    @Override // com.moloco.sdk.internal.services.usertracker.f
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        a aVar;
        c80.d dVar;
        g gVar;
        ?? r02;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f38149e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f38149e = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f38147c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f38149e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                c80.a aVar2 = this.f38144c;
                aVar.f38145a = this;
                aVar.f38146b = aVar2;
                aVar.f38149e = 1;
                dVar = (c80.d) aVar2;
                if (dVar.e(aVar) != coroutineSingletons) {
                    gVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r02 = (c80.a) aVar.f38145a;
                try {
                    ResultKt.b(obj);
                    r02 = r02;
                    Unit unit = Unit.f71706a;
                    ((c80.d) r02).g(null);
                    return unit;
                } catch (Throwable th2) {
                    c80.d dVar2 = r02;
                    th = th2;
                    dVar = dVar2;
                    dVar.g(null);
                    throw th;
                }
            }
            ?? r22 = (c80.a) aVar.f38146b;
            gVar = (g) aVar.f38145a;
            ResultKt.b(obj);
            dVar = r22;
            com.moloco.sdk.internal.services.usertracker.b bVar = gVar.f38143b;
            aVar.f38145a = dVar;
            aVar.f38146b = null;
            aVar.f38149e = 2;
            if (bVar.a(aVar) != coroutineSingletons) {
                r02 = dVar;
                Unit unit2 = Unit.f71706a;
                ((c80.d) r02).g(null);
                return unit2;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x009c, code lost:
    
        if (r4.a(r9, r0) == r1) goto L38;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:36:0x008a A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #2 {all -> 0x004e, blocks: (B:21:0x004a, B:34:0x0086, B:36:0x008a), top: B:51:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v11, types: [c80.a] */
    @Override // com.moloco.sdk.internal.services.usertracker.f
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object b(@NotNull Continuation<? super String> continuation) throws Throwable {
        b bVar;
        c80.d dVar;
        g gVar;
        c80.a aVar;
        Throwable th2;
        c80.a aVar2;
        g gVar2;
        String strA;
        String str;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f38154e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f38154e = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f38152c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f38154e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                c80.a aVar3 = this.f38144c;
                bVar.f38150a = this;
                bVar.f38151b = aVar3;
                bVar.f38154e = 1;
                dVar = (c80.d) aVar3;
                if (dVar.e(bVar) != coroutineSingletons) {
                    gVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    str = (String) bVar.f38151b;
                    aVar = (c80.a) bVar.f38150a;
                    try {
                        ResultKt.b(obj);
                        ((c80.d) aVar).g(null);
                        return str;
                    } catch (Throwable th3) {
                        th2 = th3;
                        aVar2 = aVar;
                        ((c80.d) aVar2).g(null);
                        throw th2;
                    }
                }
                aVar2 = (c80.a) bVar.f38151b;
                gVar2 = (g) bVar.f38150a;
                try {
                    ResultKt.b(obj);
                    strA = (String) obj;
                    if (strA == null) {
                        strA = gVar2.f38142a.a();
                        com.moloco.sdk.internal.services.usertracker.b bVar2 = gVar2.f38143b;
                        bVar.f38150a = aVar2;
                        bVar.f38151b = strA;
                        bVar.f38154e = 3;
                    }
                    str = strA;
                    aVar = aVar2;
                    ((c80.d) aVar).g(null);
                    return str;
                } catch (Throwable th4) {
                    th2 = th4;
                    ((c80.d) aVar2).g(null);
                    throw th2;
                }
            }
            ?? r22 = (c80.a) bVar.f38151b;
            gVar = (g) bVar.f38150a;
            ResultKt.b(obj);
            dVar = r22;
            com.moloco.sdk.internal.services.usertracker.b bVar3 = gVar.f38143b;
            bVar.f38150a = gVar;
            bVar.f38151b = dVar;
            bVar.f38154e = 2;
            Object objB = bVar3.b(bVar);
            if (objB != coroutineSingletons) {
                aVar2 = dVar;
                obj = objB;
                gVar2 = gVar;
                strA = (String) obj;
                if (strA == null) {
                }
                str = strA;
                aVar = aVar2;
                ((c80.d) aVar).g(null);
                return str;
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            aVar = dVar;
            th2 = th5;
            aVar2 = aVar;
            ((c80.d) aVar2).g(null);
            throw th2;
        }
    }
}
