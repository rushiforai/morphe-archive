package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class w4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f11022a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f11023b;

    /* renamed from: c, reason: collision with root package name */
    public long f11024c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11025d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ f5 f11026e;

    /* renamed from: f, reason: collision with root package name */
    public int f11027f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11026e = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11025d = obj;
        this.f11027f |= Integer.MIN_VALUE;
        return this.f11026e.g(this);
    }
}
