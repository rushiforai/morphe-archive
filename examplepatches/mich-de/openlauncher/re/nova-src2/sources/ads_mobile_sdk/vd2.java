package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vd2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f10738a;

    /* renamed from: b, reason: collision with root package name */
    public Object f10739b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f10740c;

    /* renamed from: d, reason: collision with root package name */
    public int f10741d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10742e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ pe2 f10743f;

    /* renamed from: g, reason: collision with root package name */
    public int f10744g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vd2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10743f = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10742e = obj;
        this.f10744g |= Integer.MIN_VALUE;
        return pe2.a(this.f10743f, (qc2) null, false, (ContinuationImpl) this);
    }
}
