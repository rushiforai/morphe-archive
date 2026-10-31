package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class yv2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bw2 f12301a;

    /* renamed from: b, reason: collision with root package name */
    public String f12302b;

    /* renamed from: c, reason: collision with root package name */
    public d f12303c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12304d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ bw2 f12305e;

    /* renamed from: f, reason: collision with root package name */
    public int f12306f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yv2(bw2 bw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12305e = bw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12304d = obj;
        this.f12306f |= Integer.MIN_VALUE;
        return bw2.a(this.f12305e, null, this);
    }
}
