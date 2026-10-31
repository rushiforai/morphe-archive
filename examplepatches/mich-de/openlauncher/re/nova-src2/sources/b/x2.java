package b;

import ads_mobile_sdk.cw0;
import ads_mobile_sdk.du0;
import ads_mobile_sdk.dv0;
import ads_mobile_sdk.e83;
import ads_mobile_sdk.iu0;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.lw0;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.u73;
import ads_mobile_sdk.wv0;
import ads_mobile_sdk.zi3;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public interface x2 {
    /* JADX WARN: Removed duplicated region for block: B:32:0x0083 A[Catch: all -> 0x008f, TryCatch #3 {all -> 0x008f, blocks: (B:30:0x007c, B:32:0x0083, B:34:0x0087, B:36:0x008b, B:39:0x0091, B:41:0x0095, B:43:0x0099, B:45:0x009d, B:46:0x009e, B:47:0x00a3, B:48:0x00a4, B:49:0x00ab, B:50:0x00ac, B:51:0x00b3, B:52:0x00b4), top: B:63:0x007c }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00b4 A[Catch: all -> 0x008f, TRY_LEAVE, TryCatch #3 {all -> 0x008f, blocks: (B:30:0x007c, B:32:0x0083, B:34:0x0087, B:36:0x008b, B:39:0x0091, B:41:0x0095, B:43:0x0099, B:45:0x009d, B:46:0x009e, B:47:0x00a3, B:48:0x00a4, B:49:0x00ab, B:50:0x00ac, B:51:0x00b3, B:52:0x00b4), top: B:63:0x007c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static Object b(x2 x2Var, ContinuationImpl continuationImpl) {
        e83 e83Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        if (continuationImpl instanceof e83) {
            e83Var = (e83) continuationImpl;
            int i5 = e83Var.f2785e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e83Var.f2785e = i5 - Integer.MIN_VALUE;
            } else {
                e83Var = new e83(x2Var, continuationImpl);
            }
        }
        Object obj = e83Var.f2783c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = e83Var.f2785e;
        if (i11 == 0) {
            ResultKt.b(obj);
            WeakHashMap weakHashMap = ji3.f5253a;
            th3 th3VarA = ji3.a(wv0.CUI_NAME_SIGNAL, EmptyList.f71733a, true);
            try {
                ji3.a().e().f1804t = new u73(x2Var.a(), 6);
                e83Var.f2781a = th3VarA;
                e83Var.f2782b = th3VarA;
                e83Var.f2785e = 1;
                Object objD = x2Var.d(e83Var);
                if (objD == obj2) {
                    return obj2;
                }
                th3Var = th3VarA;
                obj = objD;
                th3Var2 = th3Var;
            } catch (Throwable th3) {
                th3Var = th3VarA;
                th2 = th3;
                th3Var2 = th3Var;
                th3Var.b(th2);
                if (!(th2 instanceof a4)) {
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
            th3Var2 = e83Var.f2782b;
            th3Var = e83Var.f2781a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th4) {
                th2 = th4;
                try {
                    th3Var.b(th2);
                    if (!(th2 instanceof a4)) {
                    }
                } finally {
                }
            }
        }
        a1 a1Var = (a1) obj;
        if (a1Var instanceof pu0) {
            zi3.a((pu0) a1Var, false);
        }
        CloseableKt.a(th3Var2, null);
        return a1Var;
    }

    cw0 a();

    default Object c(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }

    Object d(Continuation continuation);
}
