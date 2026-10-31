package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class h0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66589t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.LongRef f66590u;

    /* renamed from: v, reason: collision with root package name */
    public Function1 f66591v;

    /* renamed from: w, reason: collision with root package name */
    public t f66592w;

    /* renamed from: x, reason: collision with root package name */
    public long f66593x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f66594y;

    /* renamed from: z, reason: collision with root package name */
    public int f66595z;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66594y = obj;
        this.f66595z |= Integer.MIN_VALUE;
        return i0.a(null, null, 0L, this);
    }
}
