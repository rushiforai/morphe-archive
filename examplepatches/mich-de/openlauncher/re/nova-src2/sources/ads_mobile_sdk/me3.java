package ads_mobile_sdk;

import java.util.ArrayList;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class me3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qe3 f7186a;

    /* renamed from: b, reason: collision with root package name */
    public b.a1 f7187b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f7188c;

    /* renamed from: d, reason: collision with root package name */
    public String f7189d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f7190e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f7191f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ qe3 f7192g;

    /* renamed from: h, reason: collision with root package name */
    public int f7193h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public me3(qe3 qe3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7192g = qe3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7191f = obj;
        this.f7193h |= Integer.MIN_VALUE;
        return this.f7192g.a((ArrayList) null, false, (ContinuationImpl) this);
    }
}
