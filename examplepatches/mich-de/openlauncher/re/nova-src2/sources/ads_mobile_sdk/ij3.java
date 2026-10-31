package ads_mobile_sdk;

import java.util.Collection;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ij3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nj3 f4801a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4802b;

    /* renamed from: c, reason: collision with root package name */
    public Collection f4803c;

    /* renamed from: d, reason: collision with root package name */
    public Object f4804d;

    /* renamed from: e, reason: collision with root package name */
    public Object f4805e;

    /* renamed from: f, reason: collision with root package name */
    public Integer f4806f;

    /* renamed from: g, reason: collision with root package name */
    public String f4807g;

    /* renamed from: h, reason: collision with root package name */
    public eg2 f4808h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f4809i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ nj3 f4810j;

    /* renamed from: k, reason: collision with root package name */
    public int f4811k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ij3(nj3 nj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4810j = nj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4809i = obj;
        this.f4811k |= Integer.MIN_VALUE;
        return this.f4810j.q(this);
    }
}
