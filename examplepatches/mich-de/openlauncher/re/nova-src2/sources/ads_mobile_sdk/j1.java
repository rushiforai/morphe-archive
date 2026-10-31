package ads_mobile_sdk;

import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class j1 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f5080a;

    public j1(b.w4 dataStore) {
        Intrinsics.g(dataStore, "dataStore");
        this.f5080a = dataStore;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0074 A[Catch: all -> 0x0080, TryCatch #0 {all -> 0x0080, blocks: (B:28:0x006d, B:30:0x0074, B:32:0x0078, B:34:0x007c, B:37:0x0082, B:39:0x0086, B:41:0x008a, B:43:0x008e, B:44:0x008f, B:45:0x0094, B:46:0x0095, B:47:0x009c, B:48:0x009d, B:49:0x00a4, B:50:0x00a5), top: B:55:0x006d }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00a5 A[Catch: all -> 0x0080, TRY_LEAVE, TryCatch #0 {all -> 0x0080, blocks: (B:28:0x006d, B:30:0x0074, B:32:0x0078, B:34:0x007c, B:37:0x0082, B:39:0x0086, B:41:0x008a, B:43:0x008e, B:44:0x008f, B:45:0x0094, B:46:0x0095, B:47:0x009c, B:48:0x009d, B:49:0x00a4, B:50:0x00a5), top: B:55:0x006d }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Function1 function1, ContinuationImpl continuationImpl) {
        h1 h1Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        if (continuationImpl instanceof h1) {
            h1Var = (h1) continuationImpl;
            int i5 = h1Var.f4180e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h1Var.f4180e = i5 - Integer.MIN_VALUE;
            } else {
                h1Var = new h1(this, continuationImpl);
            }
        }
        Object obj = h1Var.f4178c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h1Var.f4180e;
        int i12 = 0;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            WeakHashMap weakHashMap = ji3.f5253a;
            th3 th3VarA = ji3.a(wv0.CUI_NAME_PERSISTENT_CACHE_METADATA_WRITE, EmptyList.f71733a, true);
            try {
                t5.g gVar = (t5.g) this.f5080a.get();
                i1 i1Var = new i1(function1, continuation, i12);
                h1Var.f4176a = th3VarA;
                h1Var.f4177b = th3VarA;
                h1Var.f4180e = 1;
                Object objA = gVar.a(i1Var, h1Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                th3Var = th3VarA;
                obj = objA;
                th3Var2 = th3Var;
            } catch (Throwable th3) {
                th3Var = th3VarA;
                th2 = th3;
                th3Var2 = th3Var;
                th3Var.b(th2);
                if (!(th2 instanceof b.a4)) {
                    throw th2;
                }
                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                    th3Var.a(th2);
                }
                if (th2 instanceof TimeoutCancellationException) {
                    throw new lw0(th2);
                }
                if (th2 instanceof CancellationException) {
                    throw new du0(th2);
                }
                if (th2 instanceof dv0) {
                    throw th2;
                }
                throw new iu0(th2);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var2 = h1Var.f4177b;
            th3Var = h1Var.f4176a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th4) {
                th2 = th4;
                try {
                    th3Var.b(th2);
                    if (!(th2 instanceof b.a4)) {
                    }
                } finally {
                }
            }
        }
        CloseableKt.a(th3Var2, null);
        return Unit.f71706a;
    }
}
