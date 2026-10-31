package w50;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements Continuation, CoroutineStackFrame {

    /* renamed from: a, reason: collision with root package name */
    public int f93790a = Integer.MIN_VALUE;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f93791b;

    public l(m mVar) {
        this.f93791b = mVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [kotlin.coroutines.Continuation[]] */
    /* JADX WARN: Type inference failed for: r2v2 */
    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        k kVar = k.f93789a;
        int i5 = this.f93790a;
        m mVar = this.f93791b;
        if (i5 == Integer.MIN_VALUE) {
            this.f93790a = mVar.f93796f;
        }
        int i11 = this.f93790a;
        if (i11 < 0) {
            this.f93790a = Integer.MIN_VALUE;
            kVar = null;
        } else {
            try {
                ?? r22 = mVar.f93795e[i11];
                if (r22 != 0) {
                    this.f93790a = i11 - 1;
                    kVar = r22;
                }
            } catch (Throwable unused) {
            }
        }
        if (kVar instanceof CoroutineStackFrame) {
            return kVar;
        }
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        m mVar = this.f93791b;
        Continuation[] continuationArr = mVar.f93795e;
        int i5 = mVar.f93796f;
        Continuation continuation = continuationArr[i5];
        if (continuation != this && continuation != null) {
            return continuation.getContext();
        }
        int i11 = i5 - 1;
        while (i11 >= 0) {
            int i12 = i11 - 1;
            Continuation continuation2 = continuationArr[i11];
            if (continuation2 != this && continuation2 != null) {
                return continuation2.getContext();
            }
            i11 = i12;
        }
        throw new IllegalStateException("Not started");
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        int i5 = Result.f71687b;
        boolean z11 = obj instanceof Result.Failure;
        m mVar = this.f93791b;
        if (!z11) {
            mVar.e(false);
            return;
        }
        Throwable thA = Result.a(obj);
        Intrinsics.d(thA);
        mVar.f(ResultKt.a(thA));
    }
}
