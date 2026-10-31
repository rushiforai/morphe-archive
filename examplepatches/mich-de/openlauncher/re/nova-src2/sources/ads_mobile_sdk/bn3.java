package ads_mobile_sdk;

import android.net.Uri;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bn3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dn3 f1472a;

    /* renamed from: b, reason: collision with root package name */
    public Uri f1473b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1474c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dn3 f1475d;

    /* renamed from: e, reason: collision with root package name */
    public int f1476e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bn3(dn3 dn3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1475d = dn3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1474c = obj;
        this.f1476e |= Integer.MIN_VALUE;
        this.f1475d.k(this);
        return CoroutineSingletons.f71806a;
    }
}
