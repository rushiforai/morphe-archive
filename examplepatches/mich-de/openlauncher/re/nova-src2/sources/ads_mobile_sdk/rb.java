package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class rb extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f8995a;

    /* renamed from: b, reason: collision with root package name */
    public d f8996b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8997c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ sb f8998d;

    /* renamed from: e, reason: collision with root package name */
    public int f8999e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rb(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8998d = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8997c = obj;
        this.f8999e |= Integer.MIN_VALUE;
        return this.f8998d.b(this);
    }
}
