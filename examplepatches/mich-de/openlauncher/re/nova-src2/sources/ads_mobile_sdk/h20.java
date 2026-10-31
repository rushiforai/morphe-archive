package ads_mobile_sdk;

import java.util.concurrent.atomic.AtomicReference;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.s1;

/* loaded from: classes2.dex */
public final class h20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f4195a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f4196b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4197c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w20 f4198d;

    /* renamed from: e, reason: collision with root package name */
    public int f4199e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4198d = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4197c = obj;
        this.f4199e |= Integer.MIN_VALUE;
        return this.f4198d.a((AtomicReference) null, (s1) null, (Long) null, this);
    }
}
