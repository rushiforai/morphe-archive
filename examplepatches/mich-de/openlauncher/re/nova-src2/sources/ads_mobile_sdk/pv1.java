package ads_mobile_sdk;

import java.util.ArrayList;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.i0;

/* loaded from: classes.dex */
public final class pv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b90.p f8390a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f8391b;

    /* renamed from: c, reason: collision with root package name */
    public ArrayList f8392c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f8393d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f8394e;

    /* renamed from: f, reason: collision with root package name */
    public String f8395f;

    /* renamed from: g, reason: collision with root package name */
    public Boolean f8396g;

    /* renamed from: h, reason: collision with root package name */
    public List f8397h;

    /* renamed from: i, reason: collision with root package name */
    public Boolean f8398i;

    /* renamed from: j, reason: collision with root package name */
    public Integer f8399j;

    /* renamed from: k, reason: collision with root package name */
    public Boolean f8400k;

    /* renamed from: l, reason: collision with root package name */
    public i0 f8401l;

    /* renamed from: m, reason: collision with root package name */
    public /* synthetic */ Object f8402m;
    public final /* synthetic */ b90.p n;
    public int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pv1(b90.p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.n = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8402m = obj;
        this.o |= Integer.MIN_VALUE;
        return this.n.d(this);
    }
}
