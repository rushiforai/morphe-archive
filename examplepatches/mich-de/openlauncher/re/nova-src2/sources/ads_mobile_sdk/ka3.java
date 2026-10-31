package ads_mobile_sdk;

import java.util.Iterator;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ka3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f5623a;

    /* renamed from: b, reason: collision with root package name */
    public Object f5624b;

    /* renamed from: c, reason: collision with root package name */
    public ti.p f5625c;

    /* renamed from: d, reason: collision with root package name */
    public List f5626d;

    /* renamed from: e, reason: collision with root package name */
    public Iterator f5627e;

    /* renamed from: f, reason: collision with root package name */
    public er f5628f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f5629g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ ti.r f5630h;

    /* renamed from: i, reason: collision with root package name */
    public int f5631i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ka3(ti.r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5630h = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5629g = obj;
        this.f5631i |= Integer.MIN_VALUE;
        return ti.r.b(this.f5630h, this);
    }
}
