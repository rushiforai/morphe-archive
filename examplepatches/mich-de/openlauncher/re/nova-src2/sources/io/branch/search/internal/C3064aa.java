package io.branch.search.internal;

import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {160}, m = "search")
/* renamed from: io.branch.search.internal.aa, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3064aa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public V9 f63940a;

    /* renamed from: b, reason: collision with root package name */
    public String f63941b;

    /* renamed from: c, reason: collision with root package name */
    public String f63942c;

    /* renamed from: d, reason: collision with root package name */
    public String f63943d;

    /* renamed from: e, reason: collision with root package name */
    public long f63944e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f63945f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ V9 f63946g;

    /* renamed from: h, reason: collision with root package name */
    public int f63947h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3064aa(V9 v92, Continuation<? super C3064aa> continuation) {
        super(continuation);
        this.f63946g = v92;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63945f = obj;
        this.f63947h |= Integer.MIN_VALUE;
        return this.f63946g.a((String) null, (String) null, (List) null, 0L, (String) null, (String) null, (String) null, this);
    }
}
