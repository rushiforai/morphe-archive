package io.branch.search.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue", f = "Coros.kt", l = {479, 396, 489, 489}, m = "uncork")
/* loaded from: classes4.dex */
public final class Z3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public X3 f63808a;

    /* renamed from: b, reason: collision with root package name */
    public Object f63809b;

    /* renamed from: c, reason: collision with root package name */
    public c80.a f63810c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f63811d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ X3<Object> f63812e;

    /* renamed from: f, reason: collision with root package name */
    public int f63813f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Z3(X3<Object> x32, Continuation<? super Z3> continuation) {
        super(continuation);
        this.f63812e = x32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63811d = obj;
        this.f63813f |= Integer.MIN_VALUE;
        return this.f63812e.a((C3411v2) null, this);
    }
}
