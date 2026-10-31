package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ar extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dr f1068a;

    /* renamed from: b, reason: collision with root package name */
    public d f1069b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1070c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dr f1071d;

    /* renamed from: e, reason: collision with root package name */
    public int f1072e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ar(dr drVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1071d = drVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1070c = obj;
        this.f1072e |= Integer.MIN_VALUE;
        return dr.b(this.f1071d, (ContinuationImpl) this);
    }
}
