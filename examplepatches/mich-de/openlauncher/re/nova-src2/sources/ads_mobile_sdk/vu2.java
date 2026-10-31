package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class vu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f10900a;

    /* renamed from: b, reason: collision with root package name */
    public d f10901b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10902c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ cv2 f10903d;

    /* renamed from: e, reason: collision with root package name */
    public int f10904e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vu2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10903d = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10902c = obj;
        this.f10904e |= Integer.MIN_VALUE;
        return cv2.a(this.f10903d, this);
    }
}
