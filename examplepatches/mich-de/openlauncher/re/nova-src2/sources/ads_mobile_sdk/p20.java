package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class p20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w20 f8051a;

    /* renamed from: b, reason: collision with root package name */
    public x11 f8052b;

    /* renamed from: c, reason: collision with root package name */
    public x11 f8053c;

    /* renamed from: d, reason: collision with root package name */
    public String f8054d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f8055e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ w20 f8056f;

    /* renamed from: g, reason: collision with root package name */
    public int f8057g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8056f = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8055e = obj;
        this.f8057g |= Integer.MIN_VALUE;
        return this.f8056f.a((String) null, (Map) null, this);
    }
}
