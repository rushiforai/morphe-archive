package x70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.r1;

/* loaded from: classes.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j f95230t;

    /* renamed from: u, reason: collision with root package name */
    public Object f95231u;

    /* renamed from: v, reason: collision with root package name */
    public r1 f95232v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f95233w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ j f95234x;

    /* renamed from: y, reason: collision with root package name */
    public int f95235y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, Continuation continuation) {
        super(continuation);
        this.f95234x = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f95233w = obj;
        this.f95235y |= Integer.MIN_VALUE;
        return this.f95234x.emit(null, this);
    }
}
