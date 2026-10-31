package com.stripe.android.googlepaylauncher;

import com.stripe.android.googlepaylauncher.GooglePayLauncherContract;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j f42826t;

    /* renamed from: u, reason: collision with root package name */
    public GooglePayLauncherContract.Args f42827u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f42828v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ j f42829w;

    /* renamed from: x, reason: collision with root package name */
    public int f42830x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f42829w = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f42828v = obj;
        this.f42830x |= Integer.MIN_VALUE;
        Object objF = this.f42829w.f(null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
