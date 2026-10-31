package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class aw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bw2 f1171a;

    /* renamed from: b, reason: collision with root package name */
    public String f1172b;

    /* renamed from: c, reason: collision with root package name */
    public d f1173c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1174d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ bw2 f1175e;

    /* renamed from: f, reason: collision with root package name */
    public int f1176f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aw2(bw2 bw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1175e = bw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1174d = obj;
        this.f1176f |= Integer.MIN_VALUE;
        return bw2.c(this.f1175e, null, this);
    }
}
