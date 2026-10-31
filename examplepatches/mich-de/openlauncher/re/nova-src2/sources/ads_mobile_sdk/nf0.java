package ads_mobile_sdk;

import android.app.Activity;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class nf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rf0 f7549a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7550b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ rf0 f7551c;

    /* renamed from: d, reason: collision with root package name */
    public int f7552d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nf0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7551c = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7550b = obj;
        this.f7552d |= Integer.MIN_VALUE;
        return this.f7551c.a(false, (String) null, (Activity) null, false, (ContinuationImpl) this);
    }
}
