package io.branch.search.internal;

import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.SSML$ssmlInstance$2$1$1", f = "SesameLiteActionDelegateImpl.kt", l = {Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, 141}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.qc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3337qc extends SuspendLambda implements Function2<t70.j0, Continuation<? super u40.h>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public u40.h f65568a;

    /* renamed from: b, reason: collision with root package name */
    public int f65569b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f65570c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3269mc f65571d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3337qc(Context context, C3269mc c3269mc, Continuation<? super C3337qc> continuation) {
        super(2, continuation);
        this.f65570c = context;
        this.f65571d = c3269mc;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3337qc(this.f65570c, this.f65571d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3337qc(this.f65570c, this.f65571d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        u40.h hVar;
        u40.h hVar2;
        Throwable th2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f65569b;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                u40.b bVar = u40.b.f90564c;
                u40.i iVar = new u40.i(this.f65570c, D5.f62339a, this.f65571d.f65156c);
                this.f65569b = 1;
                obj = bVar.a(iVar, this);
                if (obj != coroutineSingletons) {
                }
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                hVar2 = this.f65568a;
                try {
                    ResultKt.b(obj);
                    return hVar2;
                } catch (Throwable th3) {
                    th2 = th3;
                    C3309p1.b(EnumC3131e9.Init, "SSML ERROR", th2);
                    return hVar2;
                }
            }
            ResultKt.b(obj);
            hVar.registerAndroidListeners(this.f65571d.f65155b);
            this.f65568a = hVar;
            this.f65569b = 2;
            return hVar.refreshUsageStats(System.currentTimeMillis(), this) == coroutineSingletons ? coroutineSingletons : hVar;
        } catch (Throwable th4) {
            hVar2 = hVar;
            th2 = th4;
            C3309p1.b(EnumC3131e9.Init, "SSML ERROR", th2);
            return hVar2;
        }
        hVar = (u40.h) obj;
    }
}
