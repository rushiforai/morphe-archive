package ads_mobile_sdk;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ur3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bs3 f10468a;

    /* renamed from: b, reason: collision with root package name */
    public List f10469b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10470c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ bs3 f10471d;

    /* renamed from: e, reason: collision with root package name */
    public int f10472e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ur3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10471d = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10470c = obj;
        this.f10472e |= Integer.MIN_VALUE;
        return this.f10471d.a((List) null, this);
    }
}
