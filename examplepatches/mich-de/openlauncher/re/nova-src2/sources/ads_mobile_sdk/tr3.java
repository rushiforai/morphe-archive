package ads_mobile_sdk;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class tr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bs3 f10038a;

    /* renamed from: b, reason: collision with root package name */
    public List f10039b;

    /* renamed from: c, reason: collision with root package name */
    public List f10040c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f10041d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ bs3 f10042e;

    /* renamed from: f, reason: collision with root package name */
    public int f10043f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10042e = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10041d = obj;
        this.f10043f |= Integer.MIN_VALUE;
        return bs3.a(this.f10042e, null, this);
    }
}
