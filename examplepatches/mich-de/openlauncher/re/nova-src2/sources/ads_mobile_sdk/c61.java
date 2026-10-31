package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public abstract class c61 {

    /* renamed from: a, reason: collision with root package name */
    public final wv0 f1690a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f1691b;

    public /* synthetic */ c61(wv0 wv0Var, int i5) {
        this((i5 & 1) != 0 ? null : wv0Var, (i5 & 2) != 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006b A[Catch: all -> 0x0042, TRY_LEAVE, TryCatch #1 {all -> 0x0042, blocks: (B:18:0x003e, B:30:0x0065, B:32:0x006b), top: B:81:0x003e }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0085 A[Catch: all -> 0x0091, TryCatch #0 {all -> 0x0091, blocks: (B:39:0x007e, B:41:0x0085, B:43:0x0089, B:45:0x008d, B:48:0x0093, B:50:0x0097, B:52:0x009b, B:54:0x009f, B:55:0x00a0, B:56:0x00a5, B:57:0x00a6, B:58:0x00ad, B:59:0x00ae, B:60:0x00b5, B:61:0x00b6), top: B:80:0x007e, outer: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00b6 A[Catch: all -> 0x0091, TRY_LEAVE, TryCatch #0 {all -> 0x0091, blocks: (B:39:0x007e, B:41:0x0085, B:43:0x0089, B:45:0x008d, B:48:0x0093, B:50:0x0097, B:52:0x009b, B:54:0x009f, B:55:0x00a0, B:56:0x00a5, B:57:0x00a6, B:58:0x00ad, B:59:0x00ae, B:60:0x00b5, B:61:0x00b6), top: B:80:0x007e, outer: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v18, types: [ads_mobile_sdk.c61] */
    /* JADX WARN: Type inference failed for: r0v2, types: [ads_mobile_sdk.b61, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r0v23 */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r6v0, types: [ads_mobile_sdk.c61] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(Continuation continuation) {
        ?? b61Var;
        b.a1 qu0Var;
        c61 c61Var;
        c61 c61Var2;
        th3 th3Var;
        th3 th3Var2;
        TimeoutCancellationException th2;
        if (continuation instanceof b61) {
            b61 b61Var2 = (b61) continuation;
            int i5 = b61Var2.f1286f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b61Var2.f1286f = i5 - Integer.MIN_VALUE;
                b61Var = b61Var2;
            } else {
                b61Var = new b61(this, (ContinuationImpl) continuation);
            }
        }
        Object objH = b61Var.f1284d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b61Var.f1286f;
        try {
            if (i11 == 0) {
                ResultKt.b(objH);
                try {
                    wv0 wv0Var = this.f1690a;
                    if (wv0Var != null) {
                        th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
                        try {
                            b61Var.f1281a = this;
                            b61Var.f1282b = th3VarA;
                            b61Var.f1283c = th3VarA;
                            b61Var.f1286f = 1;
                            Object objH2 = h(b61Var);
                            if (objH2 != coroutineSingletons) {
                                th3Var = th3VarA;
                                th3Var2 = th3Var;
                                objH = objH2;
                                b61Var = this;
                                qu0Var = (b.a1) objH;
                                if (qu0Var instanceof pu0) {
                                }
                                CloseableKt.a(th3Var, null);
                                c61Var = b61Var;
                            }
                        } catch (Throwable th3) {
                            th3Var = th3VarA;
                            th3Var2 = th3Var;
                            th2 = th3;
                            b61Var = this;
                            th3Var2.b(th2);
                            if (!(th2 instanceof b.a4)) {
                            }
                        }
                    } else {
                        b61Var.f1281a = this;
                        b61Var.f1286f = 2;
                        objH = h(b61Var);
                        if (objH != coroutineSingletons) {
                            c61Var2 = this;
                            qu0Var = (b.a1) objH;
                            c61Var = c61Var2;
                        }
                    }
                    return coroutineSingletons;
                } catch (Exception e3) {
                    e = e3;
                    b61Var = this;
                    qu0Var = new qu0(e, null, null, 6);
                    c61Var = b61Var;
                    if (c61Var.f1691b) {
                    }
                }
            } else if (i11 == 1) {
                th3Var = b61Var.f1283c;
                th3Var2 = b61Var.f1282b;
                b61Var = b61Var.f1281a;
                try {
                    ResultKt.b(objH);
                    b61Var = b61Var;
                    qu0Var = (b.a1) objH;
                    if (qu0Var instanceof pu0) {
                        zi3.a((pu0) qu0Var, false);
                    }
                    CloseableKt.a(th3Var, null);
                    c61Var = b61Var;
                } catch (Throwable th4) {
                    th2 = th4;
                    try {
                        th3Var2.b(th2);
                        if (!(th2 instanceof b.a4)) {
                            throw th2;
                        }
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            th3Var2.a(th2);
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
                    } finally {
                    }
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c61 c61Var3 = b61Var.f1281a;
                ResultKt.b(objH);
                c61Var2 = c61Var3;
                qu0Var = (b.a1) objH;
                c61Var = c61Var2;
            }
        } catch (Exception e11) {
            e = e11;
            qu0Var = new qu0(e, null, null, 6);
            c61Var = b61Var;
            if (c61Var.f1691b) {
            }
        }
        return c61Var.f1691b ? qu0Var : new xu0(Unit.f71706a);
    }

    public abstract Object h(Continuation continuation);

    public c61(wv0 wv0Var, boolean z11) {
        this.f1690a = wv0Var;
        this.f1691b = z11;
    }
}
