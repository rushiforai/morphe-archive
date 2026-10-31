package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g02 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f3602a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f3603b;

    /* renamed from: c, reason: collision with root package name */
    public Object f3604c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3605d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h02 f3606e;

    /* renamed from: f, reason: collision with root package name */
    public int f3607f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g02(h02 h02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3606e = h02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3605d = obj;
        this.f3607f |= Integer.MIN_VALUE;
        return h02.a(this.f3606e, this);
    }
}
