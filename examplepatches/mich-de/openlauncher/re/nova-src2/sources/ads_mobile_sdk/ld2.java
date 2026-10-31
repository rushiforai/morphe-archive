package ads_mobile_sdk;

import java.util.LinkedHashSet;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ld2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nd2 f6206a;

    /* renamed from: b, reason: collision with root package name */
    public LinkedHashSet f6207b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f6208c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ nd2 f6209d;

    /* renamed from: e, reason: collision with root package name */
    public int f6210e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ld2(nd2 nd2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6209d = nd2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6208c = obj;
        this.f6210e |= Integer.MIN_VALUE;
        return nd2.a(this.f6209d, this);
    }
}
