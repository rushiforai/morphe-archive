package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f10794a;

    /* renamed from: b, reason: collision with root package name */
    public d f10795b;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f10796d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ wj f10797e;

    /* renamed from: f, reason: collision with root package name */
    public int f10798f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10797e = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10796d = obj;
        this.f10798f |= Integer.MIN_VALUE;
        return wj.a(this.f10797e, this);
    }
}
