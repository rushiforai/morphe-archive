package ads_mobile_sdk;

import java.net.URL;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class x01 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11520a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11521b;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11522d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h11 f11523e;

    /* renamed from: f, reason: collision with root package name */
    public int f11524f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x01(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11523e = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11522d = obj;
        this.f11524f |= Integer.MIN_VALUE;
        return this.f11523e.a((URL) null, (bn0) null, this);
    }
}
