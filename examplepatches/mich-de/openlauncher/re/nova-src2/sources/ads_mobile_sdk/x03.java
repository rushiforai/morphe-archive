package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class x03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public z03 f11526a;

    /* renamed from: b, reason: collision with root package name */
    public d f11527b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11528c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ z03 f11529d;

    /* renamed from: e, reason: collision with root package name */
    public int f11530e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x03(z03 z03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11529d = z03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11528c = obj;
        this.f11530e |= Integer.MIN_VALUE;
        return this.f11529d.c(this);
    }
}
