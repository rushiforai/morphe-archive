package io.branch.search.internal;

import java.io.Serializable;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {483, 484, 609, 610}, m = "onPackageAdded")
/* renamed from: io.branch.search.internal.xa, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3453xa extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f66270a;

    /* renamed from: b, reason: collision with root package name */
    public Serializable f66271b;

    /* renamed from: c, reason: collision with root package name */
    public Object f66272c;

    /* renamed from: d, reason: collision with root package name */
    public List f66273d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f66274e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3250la f66275f;

    /* renamed from: g, reason: collision with root package name */
    public int f66276g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3453xa(C3250la c3250la, Continuation<? super C3453xa> continuation) {
        super(continuation);
        this.f66275f = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f66274e = obj;
        this.f66276g |= Integer.MIN_VALUE;
        return C3250la.a(this.f66275f, null, null, this);
    }
}
