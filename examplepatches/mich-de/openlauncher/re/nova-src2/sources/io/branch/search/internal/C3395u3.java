package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController", f = "BundleUpdateController.kt", l = {Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 230, 235}, m = "onStartJobInternal")
/* renamed from: io.branch.search.internal.u3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3395u3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3378t3 f65983a;

    /* renamed from: b, reason: collision with root package name */
    public C3429w3 f65984b;

    /* renamed from: c, reason: collision with root package name */
    public String f65985c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f65986d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ C3378t3 f65987e;

    /* renamed from: f, reason: collision with root package name */
    public int f65988f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3395u3(C3378t3 c3378t3, Continuation<? super C3395u3> continuation) {
        super(continuation);
        this.f65987e = c3378t3;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f65986d = obj;
        this.f65988f |= Integer.MIN_VALUE;
        return this.f65987e.a((C3429w3) null, this);
    }
}
