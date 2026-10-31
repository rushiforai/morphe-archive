package ads_mobile_sdk;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class xm1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zm1 f11768a;

    /* renamed from: b, reason: collision with root package name */
    public d33 f11769b;

    /* renamed from: c, reason: collision with root package name */
    public z1 f11770c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f11771d;

    /* renamed from: e, reason: collision with root package name */
    public String f11772e;

    /* renamed from: f, reason: collision with root package name */
    public Duration f11773f;

    /* renamed from: g, reason: collision with root package name */
    public String f11774g;

    /* renamed from: h, reason: collision with root package name */
    public eg2 f11775h;

    /* renamed from: i, reason: collision with root package name */
    public p31 f11776i;

    /* renamed from: j, reason: collision with root package name */
    public m31 f11777j;

    /* renamed from: k, reason: collision with root package name */
    public Collection f11778k;

    /* renamed from: l, reason: collision with root package name */
    public Iterator f11779l;

    /* renamed from: m, reason: collision with root package name */
    public Collection f11780m;
    public /* synthetic */ Object n;
    public final /* synthetic */ zm1 o;

    /* renamed from: p, reason: collision with root package name */
    public int f11781p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xm1(zm1 zm1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.o = zm1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.n = obj;
        this.f11781p |= Integer.MIN_VALUE;
        return this.o.a((List) null, (d33) null, (z1) null, (Integer) null, (String) null, (Duration) null, (String) null, (eg2) null, (p31) null, (m31) null, this);
    }
}
