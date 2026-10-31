package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class va2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f10657a;

    /* renamed from: b, reason: collision with root package name */
    public d f10658b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10659c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fb2 f10660d;

    /* renamed from: e, reason: collision with root package name */
    public int f10661e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public va2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10660d = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10659c = obj;
        this.f10661e |= Integer.MIN_VALUE;
        return this.f10660d.a(this);
    }
}
