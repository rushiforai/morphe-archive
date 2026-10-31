package ads_mobile_sdk;

import android.view.View;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qo0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ro0 f8749a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8750b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ro0 f8751c;

    /* renamed from: d, reason: collision with root package name */
    public int f8752d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qo0(ro0 ro0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8751c = ro0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8750b = obj;
        this.f8752d |= Integer.MIN_VALUE;
        return this.f8751c.a((View) null, this);
    }
}
