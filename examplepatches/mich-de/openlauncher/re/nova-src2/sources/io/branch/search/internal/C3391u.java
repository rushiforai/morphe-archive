package io.branch.search.internal;

import io.branch.search.internal.C3222k;
import java.util.List;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.AdsDataSource", f = "AdsDataSource.kt", l = {148}, m = "executeExplicitQuery")
/* renamed from: io.branch.search.internal.u, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3391u<T, R> extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public AbstractC3324q f65932a;

    /* renamed from: b, reason: collision with root package name */
    public String f65933b;

    /* renamed from: c, reason: collision with root package name */
    public String f65934c;

    /* renamed from: d, reason: collision with root package name */
    public String f65935d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f65936e;

    /* renamed from: f, reason: collision with root package name */
    public long f65937f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f65938g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ AbstractC3324q f65939h;

    /* renamed from: i, reason: collision with root package name */
    public int f65940i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3391u(AbstractC3324q abstractC3324q, Continuation<? super C3391u> continuation) {
        super(continuation);
        this.f65939h = abstractC3324q;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f65938g = obj;
        this.f65940i |= Integer.MIN_VALUE;
        return this.f65939h.a((String) null, (String) null, (String) null, (Map) null, (Boolean) null, (List) null, (String) null, (Map) null, (C3222k.a) null, this);
    }
}
