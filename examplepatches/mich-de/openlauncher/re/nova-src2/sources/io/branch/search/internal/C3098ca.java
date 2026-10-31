package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.C3081ba;
import java.util.Set;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.requesthandler.zerostate.repository.OrganicsZeroStateRepository", f = "OrganicsZeroStateRepository.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE}, m = "doZeroState")
/* renamed from: io.branch.search.internal.ca, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3098ca extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3081ba f64101a;

    /* renamed from: b, reason: collision with root package name */
    public Set f64102b;

    /* renamed from: c, reason: collision with root package name */
    public Je f64103c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f64104d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f64105e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3081ba f64106f;

    /* renamed from: g, reason: collision with root package name */
    public int f64107g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3098ca(C3081ba c3081ba, Continuation<? super C3098ca> continuation) {
        super(continuation);
        this.f64106f = c3081ba;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f64105e = obj;
        this.f64107g |= Integer.MIN_VALUE;
        C3081ba c3081ba = this.f64106f;
        C3081ba.a aVar = C3081ba.Companion;
        return c3081ba.a(null, 0, 0L, 0, 0, 0, false, null, this);
    }
}
