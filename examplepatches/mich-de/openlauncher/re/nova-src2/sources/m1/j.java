package m1;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.r1;

/* loaded from: classes2.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f75699t;

    /* renamed from: u, reason: collision with root package name */
    public Object f75700u;

    /* renamed from: v, reason: collision with root package name */
    public r1 f75701v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f75702w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ k f75703x;

    /* renamed from: y, reason: collision with root package name */
    public int f75704y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, Continuation continuation) {
        super(continuation);
        this.f75703x = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75702w = obj;
        this.f75704y |= Integer.MIN_VALUE;
        return this.f75703x.emit(null, this);
    }
}
