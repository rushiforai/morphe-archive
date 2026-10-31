package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class zv2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bw2 f12689a;

    /* renamed from: b, reason: collision with root package name */
    public String f12690b;

    /* renamed from: c, reason: collision with root package name */
    public d f12691c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12692d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ bw2 f12693e;

    /* renamed from: f, reason: collision with root package name */
    public int f12694f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zv2(bw2 bw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12693e = bw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12692d = obj;
        this.f12694f |= Integer.MIN_VALUE;
        return bw2.b(this.f12693e, null, this);
    }
}
