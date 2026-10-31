package r20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f85360t;

    /* renamed from: u, reason: collision with root package name */
    public i20.d f85361u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.ObjectRef f85362v;

    /* renamed from: w, reason: collision with root package name */
    public List f85363w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f85364x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ l f85365y;

    /* renamed from: z, reason: collision with root package name */
    public int f85366z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85365y = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85364x = obj;
        this.f85366z |= Integer.MIN_VALUE;
        return l.m(this.f85365y, null, null, this);
    }
}
