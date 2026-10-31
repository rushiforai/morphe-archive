package ads_mobile_sdk;

import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x80.e0;

/* loaded from: classes.dex */
public final class e11 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h11 f2694a;

    /* renamed from: b, reason: collision with root package name */
    public Object f2695b;

    /* renamed from: c, reason: collision with root package name */
    public Object f2696c;

    /* renamed from: d, reason: collision with root package name */
    public Object f2697d;

    /* renamed from: e, reason: collision with root package name */
    public UUID f2698e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f2699f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f2700g;

    /* renamed from: h, reason: collision with root package name */
    public int f2701h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f2702i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ h11 f2703j;

    /* renamed from: k, reason: collision with root package name */
    public int f2704k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e11(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2703j = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2702i = obj;
        this.f2704k |= Integer.MIN_VALUE;
        return this.f2703j.a((x80.h0) null, (e0) null, false, (y11) null, false, (ContinuationImpl) this);
    }
}
