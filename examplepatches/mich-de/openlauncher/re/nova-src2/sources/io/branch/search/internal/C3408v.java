package io.branch.search.internal;

import java.util.LinkedHashMap;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.datasource.AdsDataSource", f = "AdsDataSource.kt", l = {63}, m = "getAdResults")
/* renamed from: io.branch.search.internal.v, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3408v extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public AbstractC3324q f66064a;

    /* renamed from: b, reason: collision with root package name */
    public String f66065b;

    /* renamed from: c, reason: collision with root package name */
    public EnumC3285nb f66066c;

    /* renamed from: d, reason: collision with root package name */
    public String f66067d;

    /* renamed from: e, reason: collision with root package name */
    public String f66068e;

    /* renamed from: f, reason: collision with root package name */
    public long f66069f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f66070g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ AbstractC3324q f66071h;

    /* renamed from: i, reason: collision with root package name */
    public int f66072i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3408v(AbstractC3324q abstractC3324q, Continuation<? super C3408v> continuation) {
        super(continuation);
        this.f66071h = abstractC3324q;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f66070g = obj;
        this.f66072i |= Integer.MIN_VALUE;
        return this.f66071h.a((String) null, (EnumC3285nb) null, (LinkedHashMap) null, (Boolean) null, (List) null, (Boolean) null, (Long) null, (String) null, (String) null, this);
    }
}
