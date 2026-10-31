package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mx0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7357a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f7358b;

    /* renamed from: c, reason: collision with root package name */
    public Object f7359c;

    /* renamed from: d, reason: collision with root package name */
    public t70.s f7360d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f7361e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ tx0 f7362f;

    /* renamed from: g, reason: collision with root package name */
    public int f7363g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mx0(tx0 tx0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7362f = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7361e = obj;
        this.f7363g |= Integer.MIN_VALUE;
        return this.f7362f.b(null, this);
    }
}
