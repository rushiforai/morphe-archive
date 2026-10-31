package w50;

import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends e {

    /* renamed from: b, reason: collision with root package name */
    public final List f93770b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f93771c;

    /* renamed from: d, reason: collision with root package name */
    public Object f93772d;

    /* renamed from: e, reason: collision with root package name */
    public int f93773e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(Object context, List interceptors, Object subject, CoroutineContext coroutineContext) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(interceptors, "interceptors");
        Intrinsics.g(subject, "subject");
        this.f93770b = interceptors;
        this.f93771c = coroutineContext;
        this.f93772d = subject;
    }

    @Override // w50.e
    public final Object a(Object obj, ContinuationImpl continuationImpl) {
        this.f93773e = 0;
        Intrinsics.g(obj, "<set-?>");
        this.f93772d = obj;
        return c(continuationImpl);
    }

    @Override // w50.e
    public final Object b() {
        return this.f93772d;
    }

    @Override // w50.e
    public final Object c(Continuation continuation) {
        int i5 = this.f93773e;
        if (i5 < 0) {
            return this.f93772d;
        }
        if (i5 < this.f93770b.size()) {
            return e(continuation);
        }
        this.f93773e = -1;
        return this.f93772d;
    }

    @Override // w50.e
    public final Object d(Object obj, Continuation continuation) {
        Intrinsics.g(obj, "<set-?>");
        this.f93772d = obj;
        return c(continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(Continuation continuation) {
        a aVar;
        Function3 function3;
        Object obj;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f93769v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f93769v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuation);
            }
        }
        Object obj2 = aVar.f93767t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f93769v;
        if (i11 != 0 && i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj2);
        do {
            int i12 = this.f93773e;
            if (i12 != -1) {
                List list = this.f93770b;
                if (i12 >= list.size()) {
                    this.f93773e = -1;
                } else {
                    function3 = (Function3) list.get(i12);
                    this.f93773e = i12 + 1;
                    obj = this.f93772d;
                    aVar.f93769v = 1;
                }
            }
            return this.f93772d;
        } while (function3.invoke(this, obj, aVar) != coroutineSingletons);
        return coroutineSingletons;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f93771c;
    }
}
