package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uy0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b.u7 f10523a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f10524b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10525c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dz1 f10526d;

    /* renamed from: e, reason: collision with root package name */
    public int f10527e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uy0(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10526d = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10525c = obj;
        this.f10527e |= Integer.MIN_VALUE;
        return this.f10526d.a((b.u7) null, this);
    }
}
