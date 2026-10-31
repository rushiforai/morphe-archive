package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f4081a;

    /* renamed from: b, reason: collision with root package name */
    public d f4082b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4083c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ lu2 f4084d;

    /* renamed from: e, reason: collision with root package name */
    public int f4085e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gu2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4084d = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4083c = obj;
        this.f4085e |= Integer.MIN_VALUE;
        return this.f4084d.d(this);
    }
}
