package l50;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.j0;

/* loaded from: classes.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j0 f74740t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f74741u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f74742v;

    /* renamed from: w, reason: collision with root package name */
    public int f74743w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, Continuation continuation) {
        super(continuation);
        this.f74742v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f74741u = obj;
        this.f74743w |= Integer.MIN_VALUE;
        return this.f74742v.b(this);
    }
}
