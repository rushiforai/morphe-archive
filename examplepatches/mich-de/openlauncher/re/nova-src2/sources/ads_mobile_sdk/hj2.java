package ads_mobile_sdk;

import c80.d;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class hj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4407a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f4408b;

    /* renamed from: c, reason: collision with root package name */
    public d f4409c;

    /* renamed from: d, reason: collision with root package name */
    public long f4410d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4411e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fl2 f4412f;

    /* renamed from: g, reason: collision with root package name */
    public int f4413g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4412f = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4411e = obj;
        this.f4413g |= Integer.MIN_VALUE;
        return fl2.d(this.f4412f, 0L, this);
    }
}
