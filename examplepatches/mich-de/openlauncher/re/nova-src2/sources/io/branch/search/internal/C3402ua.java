package io.branch.search.internal;

import java.util.Iterator;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {427, 427}, m = "onLocaleChanged")
/* renamed from: io.branch.search.internal.ua, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3402ua extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f66016a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f66017b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f66018c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3250la f66019d;

    /* renamed from: e, reason: collision with root package name */
    public int f66020e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3402ua(C3250la c3250la, Continuation<? super C3402ua> continuation) {
        super(continuation);
        this.f66019d = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f66018c = obj;
        this.f66020e |= Integer.MIN_VALUE;
        return C3250la.a(this.f66019d, this);
    }
}
