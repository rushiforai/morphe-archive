package n0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f77398t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f77399u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d f77400v;

    /* renamed from: w, reason: collision with root package name */
    public int f77401w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77400v = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77399u = obj;
        this.f77401w |= Integer.MIN_VALUE;
        return this.f77400v.a(this);
    }
}
