package t5;

import java.io.FileInputStream;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f88572t;

    /* renamed from: u, reason: collision with root package name */
    public FileInputStream f88573u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88574v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ f0 f88575w;

    /* renamed from: x, reason: collision with root package name */
    public int f88576x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88575w = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88574v = obj;
        this.f88576x |= Integer.MIN_VALUE;
        return f0.f(this.f88575w, this);
    }
}
