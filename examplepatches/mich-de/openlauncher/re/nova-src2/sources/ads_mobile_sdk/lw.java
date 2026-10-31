package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f6977a;

    /* renamed from: b, reason: collision with root package name */
    public d f6978b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f6979c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ vw f6980d;

    /* renamed from: e, reason: collision with root package name */
    public int f6981e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6980d = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6979c = obj;
        this.f6981e |= Integer.MIN_VALUE;
        return vw.b(this.f6980d, this);
    }
}
