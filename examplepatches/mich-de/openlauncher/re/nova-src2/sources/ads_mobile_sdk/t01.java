package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class t01 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Map f9743a;

    /* renamed from: b, reason: collision with root package name */
    public Map f9744b;

    /* renamed from: c, reason: collision with root package name */
    public x11 f9745c;

    /* renamed from: d, reason: collision with root package name */
    public String f9746d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9747e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ h11 f9748f;

    /* renamed from: g, reason: collision with root package name */
    public int f9749g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t01(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9748f = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9747e = obj;
        this.f9749g |= Integer.MIN_VALUE;
        return this.f9748f.a((y11) null, (Map) null, this);
    }
}
