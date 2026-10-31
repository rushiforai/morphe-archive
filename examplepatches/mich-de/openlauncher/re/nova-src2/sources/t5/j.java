package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class j extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public Object f88614t;

    /* renamed from: u, reason: collision with root package name */
    public Object f88615u;

    /* renamed from: v, reason: collision with root package name */
    public Object f88616v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.ObjectRef f88617w;

    /* renamed from: x, reason: collision with root package name */
    public c0 f88618x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f88619y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ k f88620z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88620z = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88619y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f88620z.a(null, this);
    }
}
