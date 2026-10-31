package ads_mobile_sdk;

import android.net.Uri;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class ym1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zm1 f12198a;

    /* renamed from: b, reason: collision with root package name */
    public Uri f12199b;

    /* renamed from: c, reason: collision with root package name */
    public z1 f12200c;

    /* renamed from: d, reason: collision with root package name */
    public Duration f12201d;

    /* renamed from: e, reason: collision with root package name */
    public String f12202e;

    /* renamed from: f, reason: collision with root package name */
    public String f12203f;

    /* renamed from: g, reason: collision with root package name */
    public String f12204g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f12205h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ zm1 f12206i;

    /* renamed from: j, reason: collision with root package name */
    public int f12207j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ym1(zm1 zm1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12206i = zm1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12205h = obj;
        this.f12207j |= Integer.MIN_VALUE;
        return this.f12206i.a((Uri) null, (d33) null, (z1) null, (Integer) null, (String) null, (Duration) null, (String) null, (eg2) null, (p31) null, (m31) null, this);
    }
}
