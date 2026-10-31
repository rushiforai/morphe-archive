package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ix0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4995a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f4996b;

    /* renamed from: c, reason: collision with root package name */
    public Object f4997c;

    /* renamed from: d, reason: collision with root package name */
    public t70.s f4998d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4999e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ tx0 f5000f;

    /* renamed from: g, reason: collision with root package name */
    public int f5001g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ix0(tx0 tx0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5000f = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4999e = obj;
        this.f5001g |= Integer.MIN_VALUE;
        return this.f5000f.a((String) null, (String) null, (String) null, (String) null, false, (ContinuationImpl) this);
    }
}
