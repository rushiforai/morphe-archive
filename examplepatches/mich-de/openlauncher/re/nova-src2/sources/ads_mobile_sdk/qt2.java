package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f8805a;

    /* renamed from: b, reason: collision with root package name */
    public d f8806b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f8807c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8808d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f8809e;

    /* renamed from: f, reason: collision with root package name */
    public int f8810f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qt2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8809e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8808d = obj;
        this.f8810f |= Integer.MIN_VALUE;
        return this.f8809e.c(false, this);
    }
}
