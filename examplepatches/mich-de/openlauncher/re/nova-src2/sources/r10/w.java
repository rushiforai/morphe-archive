package r10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f85275t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85276u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x f85277v;

    /* renamed from: w, reason: collision with root package name */
    public int f85278w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85277v = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85276u = obj;
        this.f85278w |= Integer.MIN_VALUE;
        return this.f85277v.c(this);
    }
}
