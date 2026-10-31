package is;

import com.stripe.android.link.LinkPaymentMethod;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f68018t;

    /* renamed from: u, reason: collision with root package name */
    public LinkPaymentMethod f68019u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f68020v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f68021w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g f68022x;

    /* renamed from: y, reason: collision with root package name */
    public int f68023y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68022x = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68021w = obj;
        this.f68023y |= Integer.MIN_VALUE;
        return this.f68022x.a(null, null, null, this);
    }
}
