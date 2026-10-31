package com.moloco.sdk.acm.http;

import com.google.android.gms.internal.consent_sdk.e0;
import com.google.protobuf.n0;
import com.moloco.sdk.MetricsRequest;
import f50.h;
import h50.g1;
import h50.h1;
import h50.q;
import java.util.Map;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import kotlin.text.Charsets;
import o50.n;
import o50.s;
import o50.v;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class f implements e {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c50.e f36135a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f36136b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f36137c;

    @DebugMetadata(c = "com.moloco.sdk.acm.http.PostMetricsRequestImpl", f = "PostMetricsRequest.kt", l = {54}, m = "execute-0E7RQCE")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f36138a;

        /* renamed from: c, reason: collision with root package name */
        public int f36140c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            this.f36138a = obj;
            this.f36140c |= Integer.MIN_VALUE;
            Object objA = f.this.a(null, null, this);
            return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.acm.http.PostMetricsRequestImpl", f = "PostMetricsRequest.kt", l = {145, 82}, m = "makeMetricsRequest-BWLJW6A")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f36141a;

        /* renamed from: b, reason: collision with root package name */
        public Object f36142b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f36143c;

        /* renamed from: e, reason: collision with root package name */
        public int f36145e;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            this.f36143c = obj;
            this.f36145e |= Integer.MIN_VALUE;
            Object objA = f.this.a(0L, null, null, this);
            return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
        }
    }

    public f(@NotNull c50.e httpClient, @NotNull String apiUrl) {
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(apiUrl, "apiUrl");
        this.f36135a = httpClient;
        this.f36136b = apiUrl;
        this.f36137c = "PostMetricsRequest";
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // com.moloco.sdk.acm.http.e
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull d dVar, @NotNull Function1<? super n, Unit> function1, @NotNull Continuation<? super Result<String>> continuation) throws Throwable {
        a aVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f36140c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f36140c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object obj = aVar2.f36138a;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = aVar2.f36140c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        aVar2.f36140c = 1;
        Object objA = a(5000L, dVar, function1, aVar2);
        return objA == obj2 ? obj2 : objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x010c A[Catch: Exception -> 0x003d, TryCatch #0 {Exception -> 0x003d, blocks: (B:13:0x0038, B:47:0x0102, B:49:0x010c, B:50:0x0125), top: B:58:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0125 A[Catch: Exception -> 0x003d, TRY_LEAVE, TryCatch #0 {Exception -> 0x003d, blocks: (B:13:0x0038, B:47:0x0102, B:49:0x010c, B:50:0x0125), top: B:58:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, d dVar, Function1<? super n, Unit> function1, Continuation<? super Result<String>> continuation) throws Throwable {
        b bVar;
        f fVar;
        f fVar2;
        v vVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f36145e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f36145e = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objB = bVar.f36143c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f36145e;
        if (i11 == 0) {
            ResultKt.b(objB);
            try {
                c50.e eVar = this.f36135a;
                String str = this.f36136b;
                k50.c cVar = new k50.c();
                cVar.c(s.f79584c);
                k50.e.b(cVar, str);
                h1 h1Var = new h1();
                a(j11, h1Var);
                ((Map) cVar.f71122f.a(h.f54327a, new q(7))).put(g1.f59194a, h1Var);
                u90.b.o(cVar, o50.b.f79542c);
                k50.e.a(cVar, function1);
                byte[] bArrA = a(dVar);
                KType kTypeB = null;
                if (bArrA == null) {
                    cVar.f71120d = r50.a.f85525a;
                    KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(byte[].class);
                    try {
                        kTypeB = Reflection.b(byte[].class);
                    } catch (Throwable unused) {
                    }
                    cVar.b(new x50.a(orCreateKotlinClass, kTypeB));
                } else if (bArrA instanceof r50.c) {
                    cVar.f71120d = bArrA;
                    cVar.b(null);
                } else {
                    cVar.f71120d = bArrA;
                    KClass orCreateKotlinClass2 = Reflection.f71864a.getOrCreateKotlinClass(byte[].class);
                    try {
                        kTypeB = Reflection.b(byte[].class);
                    } catch (Throwable unused2) {
                    }
                    cVar.b(new x50.a(orCreateKotlinClass2, kTypeB));
                }
                cVar.c(s.f79584c);
                l50.h hVar = new l50.h(cVar, eVar);
                bVar.f36141a = this;
                bVar.f36145e = 1;
                objB = hVar.b(bVar);
                if (objB != coroutineSingletons) {
                    fVar = this;
                }
                return coroutineSingletons;
            } catch (Exception e3) {
                e = e3;
                fVar = this;
                fVar2 = fVar;
                Exception exc = e;
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, fVar2.f36137c, "Post Metrics Request Exception", exc, false, 8, null);
                int i12 = Result.f71687b;
                return ResultKt.a(exc);
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            vVar = (v) bVar.f36142b;
            fVar2 = (f) bVar.f36141a;
            try {
                ResultKt.b(objB);
                String str2 = (String) objB;
                if (!Intrinsics.b(vVar, v.f79594c)) {
                    com.moloco.sdk.acm.services.e.b(com.moloco.sdk.acm.services.e.f36170a, fVar2.f36137c, "Post Metrics Request Success: " + str2, false, 4, null);
                    int i13 = Result.f71687b;
                    return str2;
                }
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, fVar2.f36137c, "Post Metrics Request Error: " + str2, null, false, 12, null);
                int i14 = Result.f71687b;
                return ResultKt.a(new Exception("PostMetricsRequest Error: " + vVar));
            } catch (Exception e11) {
                e = e11;
                Exception exc2 = e;
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, fVar2.f36137c, "Post Metrics Request Exception", exc2, false, 8, null);
                int i122 = Result.f71687b;
                return ResultKt.a(exc2);
            }
        }
        fVar = (f) bVar.f36141a;
        try {
            ResultKt.b(objB);
        } catch (Exception e12) {
            e = e12;
            fVar2 = fVar;
            Exception exc22 = e;
            com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, fVar2.f36137c, "Post Metrics Request Exception", exc22, false, 8, null);
            int i1222 = Result.f71687b;
            return ResultKt.a(exc22);
        }
        l50.b bVar2 = (l50.b) objB;
        v vVarF = bVar2.f();
        bVar.f36141a = fVar;
        bVar.f36142b = vVarF;
        bVar.f36145e = 2;
        objB = e0.r(bVar2, Charsets.f72000b, bVar);
        if (objB != coroutineSingletons) {
            fVar2 = fVar;
            vVar = vVarF;
            String str22 = (String) objB;
            if (!Intrinsics.b(vVar, v.f79594c)) {
            }
        }
        return coroutineSingletons;
    }

    public static final Unit a(long j11, h1 timeout) {
        Intrinsics.g(timeout, "$this$timeout");
        Long lValueOf = Long.valueOf(j11);
        h1.a(lValueOf);
        timeout.f59203a = lValueOf;
        return Unit.f71706a;
    }

    public final byte[] a(d dVar) {
        n0 n0VarBuild = MetricsRequest.PostMetricsRequest.newBuilder().addAllCounts(dVar.a()).addAllDurations(dVar.b()).build();
        Intrinsics.f(n0VarBuild, "build(...)");
        byte[] byteArray = ((MetricsRequest.PostMetricsRequest) n0VarBuild).toByteArray();
        Intrinsics.f(byteArray, "toByteArray(...)");
        return byteArray;
    }
}
