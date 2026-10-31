package io.branch.search.internal;

import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {190}, m = "doSearch")
/* loaded from: classes4.dex */
public final class W9 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public V9 f63586a;

    /* renamed from: b, reason: collision with root package name */
    public String f63587b;

    /* renamed from: c, reason: collision with root package name */
    public List f63588c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f63589d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ V9 f63590e;

    /* renamed from: f, reason: collision with root package name */
    public int f63591f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public W9(V9 v92, Continuation<? super W9> continuation) {
        super(continuation);
        this.f63590e = v92;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f63589d = obj;
        this.f63591f |= Integer.MIN_VALUE;
        return this.f63590e.a((String) null, (String) null, (List) null, false, 0, 0L, 0, (Continuation) this);
    }
}
