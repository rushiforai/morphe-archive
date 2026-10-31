package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class md2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7144a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f7145b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f7146c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7147d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ nd2 f7148e;

    /* renamed from: f, reason: collision with root package name */
    public int f7149f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public md2(nd2 nd2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7148e = nd2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7147d = obj;
        this.f7149f |= Integer.MIN_VALUE;
        return nd2.b(this.f7148e, this);
    }
}
