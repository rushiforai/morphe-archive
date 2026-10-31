package v5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import m90.c0;
import m90.t;

/* loaded from: classes2.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f92097t;

    /* renamed from: u, reason: collision with root package name */
    public t f92098u;

    /* renamed from: v, reason: collision with root package name */
    public c0 f92099v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f92100w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ j f92101x;

    /* renamed from: y, reason: collision with root package name */
    public int f92102y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92101x = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92100w = obj;
        this.f92102y |= Integer.MIN_VALUE;
        return this.f92101x.b(null, this);
    }
}
