package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class av2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f1144a;

    /* renamed from: b, reason: collision with root package name */
    public z1 f1145b;

    /* renamed from: c, reason: collision with root package name */
    public d f1146c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1147d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ cv2 f1148e;

    /* renamed from: f, reason: collision with root package name */
    public int f1149f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1148e = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1147d = obj;
        this.f1149f |= Integer.MIN_VALUE;
        return this.f1148e.a((z1) null, this);
    }
}
