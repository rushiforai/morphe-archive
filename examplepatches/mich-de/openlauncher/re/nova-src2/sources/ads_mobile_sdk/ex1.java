package ads_mobile_sdk;

import java.util.Collection;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ex1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Collection f3084a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f3085b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f3086c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jx1 f3087d;

    /* renamed from: e, reason: collision with root package name */
    public int f3088e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ex1(jx1 jx1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3087d = jx1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3086c = obj;
        this.f3088e |= Integer.MIN_VALUE;
        return this.f3087d.a(null, this);
    }
}
