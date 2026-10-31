package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ge2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pe2 f3819a;

    /* renamed from: b, reason: collision with root package name */
    public qw2 f3820b;

    /* renamed from: c, reason: collision with root package name */
    public String f3821c;

    /* renamed from: d, reason: collision with root package name */
    public Object f3822d;

    /* renamed from: e, reason: collision with root package name */
    public Closeable f3823e;

    /* renamed from: f, reason: collision with root package name */
    public String f3824f;

    /* renamed from: g, reason: collision with root package name */
    public Object f3825g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f3826h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ pe2 f3827i;

    /* renamed from: j, reason: collision with root package name */
    public int f3828j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ge2(pe2 pe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3827i = pe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3826h = obj;
        this.f3828j |= Integer.MIN_VALUE;
        return pe2.a(this.f3827i, null, null, null, this);
    }
}
