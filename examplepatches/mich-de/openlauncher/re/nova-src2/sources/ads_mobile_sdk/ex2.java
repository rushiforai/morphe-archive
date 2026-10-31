package ads_mobile_sdk;

import android.net.Uri;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ex2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jx2 f3089a;

    /* renamed from: b, reason: collision with root package name */
    public Uri f3090b;

    /* renamed from: c, reason: collision with root package name */
    public v22 f3091c;

    /* renamed from: d, reason: collision with root package name */
    public String f3092d;

    /* renamed from: e, reason: collision with root package name */
    public Map f3093e;

    /* renamed from: f, reason: collision with root package name */
    public y2 f3094f;

    /* renamed from: g, reason: collision with root package name */
    public z1 f3095g;

    /* renamed from: h, reason: collision with root package name */
    public Boolean f3096h;

    /* renamed from: j, reason: collision with root package name */
    public int f3097j;

    /* renamed from: k, reason: collision with root package name */
    public long f3098k;

    /* renamed from: l, reason: collision with root package name */
    public /* synthetic */ Object f3099l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ jx2 f3100m;
    public int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ex2(jx2 jx2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3100m = jx2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3099l = obj;
        this.n |= Integer.MIN_VALUE;
        return this.f3100m.a(null, null, 0, 0L, null, null, null, null, null, this);
    }
}
