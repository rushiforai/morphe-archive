package io.branch.search.internal;

import android.content.ContentProviderClient;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.C3251lb;
import io.branch.search.internal.C3430w4;
import java.io.Closeable;
import java.util.HashMap;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class S3 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c80.a f63318a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final HashMap<String, C3085be> f63319b = new HashMap<>();

    /* renamed from: c, reason: collision with root package name */
    public long f63320c;

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.CancellationStrategy", f = "QueryPlanner.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE}, m = "getLatestSignalForQuery")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public S3 f63321a;

        /* renamed from: b, reason: collision with root package name */
        public String f63322b;

        /* renamed from: c, reason: collision with root package name */
        public c80.a f63323c;

        /* renamed from: d, reason: collision with root package name */
        public long f63324d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f63325e;

        /* renamed from: g, reason: collision with root package name */
        public int f63327g;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63325e = obj;
            this.f63327g |= Integer.MIN_VALUE;
            return S3.this.a(null, 0L, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.CancellationStrategy", f = "QueryPlanner.kt", l = {Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE}, m = "markQueryCompleted")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public S3 f63328a;

        /* renamed from: b, reason: collision with root package name */
        public C3102ce f63329b;

        /* renamed from: c, reason: collision with root package name */
        public c80.a f63330c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f63331d;

        /* renamed from: f, reason: collision with root package name */
        public int f63333f;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63331d = obj;
            this.f63333f |= Integer.MIN_VALUE;
            return S3.this.a(null, this);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@Nullable String str, long j11, @NotNull Continuation<? super C3085be> continuation) {
        a aVar;
        S3 s32;
        String str2;
        c80.a aVar2;
        long j12;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f63327g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f63327g = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f63325e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f63327g;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (str == null) {
                return null;
            }
            c80.a aVar3 = this.f63318a;
            aVar.f63321a = this;
            aVar.f63322b = str;
            aVar.f63323c = aVar3;
            aVar.f63324d = j11;
            aVar.f63327g = 1;
            c80.d dVar = (c80.d) aVar3;
            if (dVar.e(aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            s32 = this;
            str2 = str;
            aVar2 = dVar;
            j12 = j11;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j13 = aVar.f63324d;
            aVar2 = aVar.f63323c;
            String str3 = aVar.f63322b;
            s32 = aVar.f63321a;
            ResultKt.b(obj);
            j12 = j13;
            str2 = str3;
        }
        try {
            C3085be c3085be = s32.f63319b.get(str2);
            if (c3085be != null) {
                C3309p1.c(EnumC3131e9.ContentProviderRequests, "Send cancellation signal to previous query for " + str2);
                long j14 = j12 - c3085be.f64036a.f64189c;
                if (j14 > 0) {
                    c3085be.f64037b.cancel();
                } else if (j14 < 0) {
                    z11 = false;
                }
            }
            long j15 = 1 + s32.f63320c;
            s32.f63320c = j15;
            C3102ce c3102ce = new C3102ce(j15, j12, str2);
            CancellationSignal cancellationSignal = new CancellationSignal();
            C3085be c3085be2 = new C3085be(c3102ce, cancellationSignal);
            if (z11) {
                s32.f63319b.put(str2, c3085be2);
            } else {
                cancellationSignal.cancel();
            }
            ((c80.d) aVar2).g(null);
            return c3085be2;
        } catch (Throwable th2) {
            ((c80.d) aVar2).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v7, types: [c80.a] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@Nullable C3102ce c3102ce, @NotNull Continuation<? super Unit> continuation) {
        b bVar;
        c80.d dVar;
        S3 s32;
        C3102ce c3102ce2;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f63333f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f63333f = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f63331d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f63333f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (c3102ce != null) {
                    c80.a aVar = this.f63318a;
                    bVar.f63328a = this;
                    bVar.f63329b = c3102ce;
                    bVar.f63330c = aVar;
                    bVar.f63333f = 1;
                    dVar = (c80.d) aVar;
                    if (dVar.e(bVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    s32 = this;
                }
                return Unit.f71706a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r72 = bVar.f63330c;
            C3102ce c3102ce3 = bVar.f63329b;
            s32 = bVar.f63328a;
            ResultKt.b(obj);
            dVar = r72;
            c3102ce = c3102ce3;
            C3085be c3085be = s32.f63319b.get(c3102ce.f64187a);
            if (c3085be != null && (c3102ce2 = c3085be.f64036a) != null && c3102ce2.f64188b == c3102ce.f64188b) {
                s32.f63319b.remove(c3102ce.f64187a);
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Context context, long j11, @NotNull Uri uri, @NotNull C3430w4.a aVar, @NotNull Continuation continuation) {
        T3 t32;
        Uri uri2;
        Function2 function2;
        S3 s32;
        Ref.ObjectRef objectRef;
        S3 s33;
        C3085be c3085be;
        Pair pair;
        Closeable closeable;
        Closeable closeable2;
        S3 s34;
        Ref.ObjectRef objectRef2;
        Throwable th2;
        C3102ce c3102ce;
        Object obj;
        Ref.ObjectRef objectRef3;
        ContentProviderClient contentProviderClient;
        if (continuation instanceof T3) {
            t32 = (T3) continuation;
            int i5 = t32.f63377g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t32.f63377g = i5 - Integer.MIN_VALUE;
            } else {
                t32 = new T3(this, continuation);
            }
        }
        Object objA = t32.f63375e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t32.f63377g;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                String path = uri.getPath();
                t32.f63371a = this;
                t32.f63372b = context;
                uri2 = uri;
                t32.f63373c = uri2;
                function2 = aVar;
                t32.f63374d = function2;
                t32.f63377g = 1;
                objA = a(path, j11, t32);
                if (objA != coroutineSingletons) {
                    s32 = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 == 3) {
                        obj = t32.f63372b;
                        objectRef3 = (Ref.ObjectRef) t32.f63371a;
                        ResultKt.b(objA);
                        contentProviderClient = (ContentProviderClient) objectRef3.f71863a;
                        if (contentProviderClient != null) {
                            contentProviderClient.close();
                        }
                        return obj;
                    }
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                closeable2 = (Closeable) t32.f63374d;
                objectRef2 = (Ref.ObjectRef) t32.f63373c;
                c3085be = (C3085be) t32.f63372b;
                s34 = (S3) t32.f63371a;
                try {
                    ResultKt.b(objA);
                    CloseableKt.a(closeable2, null);
                    c3102ce = c3085be == null ? c3085be.f64036a : null;
                    t32.f63371a = objectRef2;
                    t32.f63372b = objA;
                    t32.f63373c = null;
                    t32.f63374d = null;
                    t32.f63377g = 3;
                    if (s34.a(c3102ce, t32) != coroutineSingletons) {
                        obj = objA;
                        objectRef3 = objectRef2;
                        contentProviderClient = (ContentProviderClient) objectRef3.f71863a;
                        if (contentProviderClient != null) {
                        }
                        return obj;
                    }
                    return coroutineSingletons;
                } catch (Throwable th3) {
                    th = th3;
                    th2 = th;
                    try {
                        throw th2;
                    } catch (Throwable th4) {
                        CloseableKt.a(closeable2, th2);
                        throw th4;
                    }
                }
            }
            Function2 function22 = (Function2) t32.f63374d;
            uri2 = (Uri) t32.f63373c;
            Context context2 = (Context) t32.f63372b;
            S3 s35 = (S3) t32.f63371a;
            ResultKt.b(objA);
            function2 = function22;
            context = context2;
            s32 = s35;
            Cursor it = (Cursor) closeable;
            Intrinsics.f(it, "it");
            t32.f63371a = s33;
            t32.f63372b = c3085be;
            t32.f63373c = objectRef;
            t32.f63374d = closeable;
            t32.f63377g = 2;
            Object objInvoke = function2.invoke(it, t32);
            if (objInvoke != coroutineSingletons) {
                s34 = s33;
                closeable2 = closeable;
                objectRef2 = objectRef;
                objA = objInvoke;
                CloseableKt.a(closeable2, null);
                if (c3085be == null) {
                }
                t32.f63371a = objectRef2;
                t32.f63372b = objA;
                t32.f63373c = null;
                t32.f63374d = null;
                t32.f63377g = 3;
                if (s34.a(c3102ce, t32) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            th = th5;
            closeable2 = closeable;
            th2 = th;
            throw th2;
        }
        C3085be c3085be2 = (C3085be) objA;
        objectRef = new Ref.ObjectRef();
        C3251lb.a aVar2 = C3251lb.Companion;
        s33 = s32;
        U3 u32 = new U3(objectRef, context, uri2, c3085be2, s33);
        c3085be = c3085be2;
        aVar2.getClass();
        int i12 = 2;
        while (true) {
            pair = (Pair) u32.invoke();
            int i13 = i12 - 1;
            if (i12 <= 0 || !((Boolean) pair.f71684b).booleanValue()) {
                break;
            }
            i12 = i13;
        }
        closeable = (Closeable) pair.f71683a;
    }
}
