package f50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g50.e f54312t;

    /* renamed from: u, reason: collision with root package name */
    public k50.d f54313u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f54314v;

    /* renamed from: w, reason: collision with root package name */
    public int f54315w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f54314v = obj;
        this.f54315w |= Integer.MIN_VALUE;
        return a.a(null, null, this);
    }
}
