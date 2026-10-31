package e20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f52001t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f52002u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d f52003v;

    /* renamed from: w, reason: collision with root package name */
    public int f52004w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52003v = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52002u = obj;
        this.f52004w |= Integer.MIN_VALUE;
        return this.f52003v.a(null, this);
    }
}
