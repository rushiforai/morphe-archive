package r20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f85367t;

    /* renamed from: u, reason: collision with root package name */
    public i20.d f85368u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.ObjectRef f85369v;

    /* renamed from: w, reason: collision with root package name */
    public List f85370w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f85371x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ l f85372y;

    /* renamed from: z, reason: collision with root package name */
    public int f85373z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85372y = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85371x = obj;
        this.f85373z |= Integer.MIN_VALUE;
        return l.n(this.f85372y, null, null, this);
    }
}
