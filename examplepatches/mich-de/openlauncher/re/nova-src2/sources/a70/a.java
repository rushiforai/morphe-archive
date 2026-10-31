package a70;

import kotlin.DeepRecursiveScope;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class a extends DeepRecursiveScope implements Continuation {

    /* renamed from: a, reason: collision with root package name */
    public Function3 f443a;

    /* renamed from: b, reason: collision with root package name */
    public Object f444b;

    /* renamed from: c, reason: collision with root package name */
    public Continuation f445c;

    /* renamed from: d, reason: collision with root package name */
    public Object f446d;

    @Override // kotlin.DeepRecursiveScope
    public final void c(Object obj, Continuation continuation) {
        this.f445c = continuation;
        this.f444b = obj;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return EmptyCoroutineContext.f71803a;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        this.f445c = null;
        this.f446d = obj;
    }
}
