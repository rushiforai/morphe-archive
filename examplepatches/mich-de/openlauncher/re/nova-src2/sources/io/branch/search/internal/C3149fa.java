package io.branch.search.internal;

import io.branch.search.internal.C3081ba;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.zerostate.repository.OrganicsZeroStateRepository", f = "OrganicsZeroStateRepository.kt", l = {89}, m = "zeroState")
/* renamed from: io.branch.search.internal.fa, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3149fa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3081ba f64480a;

    /* renamed from: b, reason: collision with root package name */
    public String f64481b;

    /* renamed from: c, reason: collision with root package name */
    public String f64482c;

    /* renamed from: d, reason: collision with root package name */
    public String f64483d;

    /* renamed from: e, reason: collision with root package name */
    public long f64484e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f64485f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ C3081ba f64486g;

    /* renamed from: h, reason: collision with root package name */
    public int f64487h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3149fa(C3081ba c3081ba, Continuation<? super C3149fa> continuation) {
        super(continuation);
        this.f64486g = c3081ba;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f64485f = obj;
        this.f64487h |= Integer.MIN_VALUE;
        C3081ba c3081ba = this.f64486g;
        C3081ba.a aVar = C3081ba.Companion;
        return c3081ba.a(null, null, 0L, null, null, null, null, null, null, null, this);
    }
}
