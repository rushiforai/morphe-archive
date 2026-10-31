package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kc2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public mc2 f5670a;

    /* renamed from: b, reason: collision with root package name */
    public d f5671b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5672c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ mc2 f5673d;

    /* renamed from: e, reason: collision with root package name */
    public int f5674e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kc2(mc2 mc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5673d = mc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5672c = obj;
        this.f5674e |= Integer.MIN_VALUE;
        return mc2.c(this.f5673d, this);
    }
}
