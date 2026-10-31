package ads_mobile_sdk;

import java.util.Collection;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gj3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nj3 f3870a;

    /* renamed from: b, reason: collision with root package name */
    public String f3871b;

    /* renamed from: c, reason: collision with root package name */
    public Collection f3872c;

    /* renamed from: d, reason: collision with root package name */
    public Iterator f3873d;

    /* renamed from: e, reason: collision with root package name */
    public Collection f3874e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f3875f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ nj3 f3876g;

    /* renamed from: h, reason: collision with root package name */
    public int f3877h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gj3(nj3 nj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3876g = nj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3875f = obj;
        this.f3877h |= Integer.MIN_VALUE;
        return this.f3876g.n(this);
    }
}
