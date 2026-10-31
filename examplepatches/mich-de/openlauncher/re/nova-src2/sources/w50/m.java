package w50;

import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

/* loaded from: classes4.dex */
public final class m extends e {

    /* renamed from: b, reason: collision with root package name */
    public final List f93792b;

    /* renamed from: c, reason: collision with root package name */
    public final l f93793c;

    /* renamed from: d, reason: collision with root package name */
    public Object f93794d;

    /* renamed from: e, reason: collision with root package name */
    public final Continuation[] f93795e;

    /* renamed from: f, reason: collision with root package name */
    public int f93796f;

    /* renamed from: g, reason: collision with root package name */
    public int f93797g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(Object initial, Object context, List blocks) {
        super(context);
        Intrinsics.g(initial, "initial");
        Intrinsics.g(context, "context");
        Intrinsics.g(blocks, "blocks");
        this.f93792b = blocks;
        this.f93793c = new l(this);
        this.f93794d = initial;
        this.f93795e = new Continuation[blocks.size()];
        this.f93796f = -1;
    }

    @Override // w50.e
    public final Object a(Object obj, ContinuationImpl continuationImpl) {
        this.f93797g = 0;
        if (this.f93792b.size() == 0) {
            return obj;
        }
        Intrinsics.g(obj, "<set-?>");
        this.f93794d = obj;
        if (this.f93796f < 0) {
            return c(continuationImpl);
        }
        throw new IllegalStateException("Already started");
    }

    @Override // w50.e
    public final Object b() {
        return this.f93794d;
    }

    @Override // w50.e
    public final Object c(Continuation frame) {
        Object obj;
        if (this.f93797g == this.f93792b.size()) {
            obj = this.f93794d;
        } else {
            Continuation continuationB = IntrinsicsKt.b(frame);
            int i5 = this.f93796f + 1;
            this.f93796f = i5;
            Continuation[] continuationArr = this.f93795e;
            continuationArr[i5] = continuationB;
            if (e(true)) {
                int i11 = this.f93796f;
                if (i11 < 0) {
                    throw new IllegalStateException("No more continuations to resume");
                }
                this.f93796f = i11 - 1;
                continuationArr[i11] = null;
                obj = this.f93794d;
            } else {
                obj = CoroutineSingletons.f71806a;
            }
        }
        if (obj == CoroutineSingletons.f71806a) {
            Intrinsics.g(frame, "frame");
        }
        return obj;
    }

    @Override // w50.e
    public final Object d(Object obj, Continuation continuation) {
        Intrinsics.g(obj, "<set-?>");
        this.f93794d = obj;
        return c(continuation);
    }

    public final boolean e(boolean z11) {
        Function3 interceptor;
        Object subject;
        l continuation;
        do {
            int i5 = this.f93797g;
            List list = this.f93792b;
            if (i5 == list.size()) {
                if (z11) {
                    return true;
                }
                int i11 = Result.f71687b;
                f(this.f93794d);
                return false;
            }
            this.f93797g = i5 + 1;
            interceptor = (Function3) list.get(i5);
            try {
                subject = this.f93794d;
                continuation = this.f93793c;
                Intrinsics.g(interceptor, "interceptor");
                Intrinsics.g(subject, "subject");
                Intrinsics.g(continuation, "continuation");
                TypeIntrinsics.e(3, interceptor);
            } catch (Throwable th2) {
                int i12 = Result.f71687b;
                f(ResultKt.a(th2));
                return false;
            }
        } while (interceptor.invoke(this, subject, continuation) != CoroutineSingletons.f71806a);
        return false;
    }

    public final void f(Object obj) {
        int i5 = this.f93796f;
        if (i5 < 0) {
            throw new IllegalStateException("No more continuations to resume");
        }
        Continuation[] continuationArr = this.f93795e;
        Continuation continuation = continuationArr[i5];
        Intrinsics.d(continuation);
        int i11 = this.f93796f;
        this.f93796f = i11 - 1;
        continuationArr[i11] = null;
        int i12 = Result.f71687b;
        if (!(obj instanceof Result.Failure)) {
            continuation.resumeWith(obj);
            return;
        }
        Throwable thA = Result.a(obj);
        Intrinsics.d(thA);
        try {
            thA.getCause();
        } catch (Throwable unused) {
        }
        int i13 = Result.f71687b;
        continuation.resumeWith(ResultKt.a(thA));
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f93793c.getContext();
    }
}
