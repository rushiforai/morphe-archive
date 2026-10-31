package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class wu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public cv2 f11414a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11415b;

    /* renamed from: c, reason: collision with root package name */
    public long f11416c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11417d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ cv2 f11418e;

    /* renamed from: f, reason: collision with root package name */
    public int f11419f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wu2(cv2 cv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11418e = cv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11417d = obj;
        this.f11419f |= Integer.MIN_VALUE;
        return this.f11418e.a(this);
    }
}
