package com.moloco.sdk.internal.services;

import b.c0;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.l1;

/* loaded from: classes.dex */
public final class t implements s {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final a f38127c = new a(null);

    /* renamed from: d, reason: collision with root package name */
    public static final int f38128d = 0;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f38129e = "ClickthroughService";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r f38130a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f38131b;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.ClickthroughServiceImpl", f = "ClickthroughService.kt", l = {73, 77}, m = "runClickThrough")
    /* loaded from: classes4.dex */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f38132a;

        /* renamed from: b, reason: collision with root package name */
        public Object f38133b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f38134c;

        /* renamed from: e, reason: collision with root package name */
        public int f38136e;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f38134c = obj;
            this.f38136e |= Integer.MIN_VALUE;
            return t.this.a(null, null, null, null, this);
        }
    }

    public t(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService) {
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        this.f38130a = externalLinkHandler;
        this.f38131b = customUserEventBuilderService;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x00de, code lost:
    
        if (r1.emit(r3, r8) == r2) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Override // com.moloco.sdk.internal.services.s
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull String str, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model.a aVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h hVar, @Nullable l1 l1Var, @NotNull Continuation<? super Unit> continuation) {
        b bVar;
        l1 l1Var2;
        Object objA;
        t tVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f38136e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f38136e = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        b bVar2 = bVar;
        Object obj = bVar2.f38134c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f38136e;
        if (i11 == 0) {
            ResultKt.b(obj);
            long jCurrentTimeMillis = System.currentTimeMillis();
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.utils.c cVar = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.utils.c.f40110a;
            a.AbstractC0299a.d dVar = new a.AbstractC0299a.d(new a.AbstractC0299a.f(cVar.a(aVar.g()), cVar.a(aVar.h())), new a.AbstractC0299a.f(cVar.a(aVar.i()), cVar.a(aVar.j())), new a.AbstractC0299a.g(cVar.a(aVar.l()), cVar.a(aVar.k())), hVar.q());
            com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar2 = this.f38131b;
            bVar2.f38132a = this;
            l1Var2 = l1Var;
            bVar2.f38133b = l1Var2;
            bVar2.f38136e = 1;
            objA = aVar2.a(jCurrentTimeMillis, dVar, str, bVar2);
            if (objA != coroutineSingletons) {
                tVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        l1 l1Var3 = (l1) bVar2.f38133b;
        tVar = (t) bVar2.f38132a;
        ResultKt.b(obj);
        objA = obj;
        l1Var2 = l1Var3;
        String str2 = (String) objA;
        MolocoLogger.debug$default(MolocoLogger.INSTANCE, f38129e, c0.k("Launching url: ", str2), false, 4, null);
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar = tVar.f38130a;
        if (str2 == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (!rVar.a(str2) || l1Var2 == null) {
            return Unit.f71706a;
        }
        Unit unit = Unit.f71706a;
        bVar2.f38132a = null;
        bVar2.f38133b = null;
        bVar2.f38136e = 2;
    }

    @Override // com.moloco.sdk.internal.services.s
    @Nullable
    public Object a(@NotNull String str, @Nullable l1 l1Var, @NotNull Continuation<? super Unit> continuation) {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar = this.f38130a;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (rVar.a(str) && l1Var != null) {
            Unit unit = Unit.f71706a;
            Object objEmit = l1Var.emit(unit, continuation);
            return objEmit == CoroutineSingletons.f71806a ? objEmit : unit;
        }
        return Unit.f71706a;
    }
}
