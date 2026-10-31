package ads_mobile_sdk;

import android.view.WindowManager;
import b.r1;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gp0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jp0 f4015a;

    /* renamed from: b, reason: collision with root package name */
    public WindowManager f4016b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4017c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jp0 f4018d;

    /* renamed from: e, reason: collision with root package name */
    public int f4019e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gp0(jp0 jp0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4018d = jp0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4017c = obj;
        this.f4019e |= Integer.MIN_VALUE;
        return jp0.a(this.f4018d, (r1) null, this);
    }
}
