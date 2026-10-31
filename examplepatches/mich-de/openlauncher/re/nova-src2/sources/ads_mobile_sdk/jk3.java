package ads_mobile_sdk;

import android.widget.RelativeLayout;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class jk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pk3 f5286a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5287b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ pk3 f5288c;

    /* renamed from: d, reason: collision with root package name */
    public int f5289d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jk3(pk3 pk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5288c = pk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5287b = obj;
        this.f5289d |= Integer.MIN_VALUE;
        return pk3.a(this.f5288c, (RelativeLayout) null, (ContinuationImpl) this);
    }
}
