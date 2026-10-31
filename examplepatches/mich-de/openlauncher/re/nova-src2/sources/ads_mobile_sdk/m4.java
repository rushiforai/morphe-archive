package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class m4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f7002a;

    /* renamed from: b, reason: collision with root package name */
    public d f7003b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7004c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f7005d;

    /* renamed from: e, reason: collision with root package name */
    public int f7006e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7005d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7004c = obj;
        this.f7006e |= Integer.MIN_VALUE;
        return f5.f(this.f7005d, this);
    }
}
