package w50;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes.dex */
public abstract class e implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f93783a;

    public e(Object context) {
        Intrinsics.g(context, "context");
        this.f93783a = context;
    }

    public abstract Object a(Object obj, ContinuationImpl continuationImpl);

    public abstract Object b();

    public abstract Object c(Continuation continuation);

    public abstract Object d(Object obj, Continuation continuation);
}
