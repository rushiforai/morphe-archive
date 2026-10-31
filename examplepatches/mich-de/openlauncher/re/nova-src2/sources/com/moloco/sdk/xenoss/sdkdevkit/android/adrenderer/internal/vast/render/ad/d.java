package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d;
import cw.u0;
import kotlin.Deprecated;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import t70.j0;
import w70.g2;
import w70.m1;
import w70.u1;
import w70.y1;

/* loaded from: classes4.dex */
public final class d implements c {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final g2 f40900a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final m1 f40901b;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.AdGoNextActionImpl$1", f = "AdGoNextAction.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<k, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40902a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40903b;

        public a(Continuation<? super a> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(k kVar, Continuation<? super Unit> continuation) {
            return ((a) create(kVar, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            a aVar = new a(continuation);
            aVar.f40903b = obj;
            return aVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40902a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k kVar = (k) this.f40903b;
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.d dVarA = kVar instanceof k.a ? ((k.a) kVar).a() : kVar instanceof k.b ? ((k.b) kVar).a() : null;
            if (dVarA == null) {
                return Unit.f71706a;
            }
            dVarA.reset();
            return Unit.f71706a;
        }
    }

    public d(@NotNull g2 currentPlaylistItem, @NotNull j0 scope) {
        Intrinsics.g(currentPlaylistItem, "currentPlaylistItem");
        Intrinsics.g(scope, "scope");
        this.f40900a = currentPlaylistItem;
        u1.z(new u0(10, currentPlaylistItem, new a(null)), scope, y1.f94086a, null);
        this.f40901b = u1.c(d.a.c.f41613b);
    }

    @Deprecated
    public static /* synthetic */ void f() {
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d
    @NotNull
    public g2 l() {
        k kVar = (k) this.f40900a.getValue();
        if (kVar instanceof k.a) {
            return ((k.a) kVar).a().l();
        }
        if (kVar instanceof k.b) {
            return ((k.b) kVar).a().l();
        }
        if (kVar instanceof k.c) {
            return ((k.c) kVar).a().l();
        }
        if (kVar instanceof k.d) {
            return ((k.d) kVar).a().l();
        }
        if (kVar == null) {
            return this.f40901b;
        }
        throw new NoWhenBranchMatchedException();
    }
}
