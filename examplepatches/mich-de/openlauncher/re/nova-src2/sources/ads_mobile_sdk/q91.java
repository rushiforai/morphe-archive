package ads_mobile_sdk;

import com.google.gson.Gson;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class q91 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public s91 f8530a;

    /* renamed from: b, reason: collision with root package name */
    public Gson f8531b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8532c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s91 f8533d;

    /* renamed from: e, reason: collision with root package name */
    public int f8534e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q91(s91 s91Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8533d = s91Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8532c = obj;
        this.f8534e |= Integer.MIN_VALUE;
        return this.f8533d.f(this);
    }
}
