package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class bv2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f1580a;

    /* renamed from: b, reason: collision with root package name */
    public z1 f1581b;

    /* renamed from: c, reason: collision with root package name */
    public d f1582c;

    /* renamed from: d, reason: collision with root package name */
    public long f1583d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f1584e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ cv2 f1585f;

    /* renamed from: g, reason: collision with root package name */
    public int f1586g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bv2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1585f = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1584e = obj;
        this.f1586g |= Integer.MIN_VALUE;
        return this.f1585f.a(0L, (z1) null, this);
    }
}
