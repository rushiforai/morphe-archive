package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec;

import android.content.Context;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2982i;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2990q;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.f;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.p;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference0Impl;
import kotlin.jvm.internal.Reflection;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.r1;
import w70.g2;
import w70.l1;
import w70.m;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class c implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.a {

    /* renamed from: m, reason: collision with root package name */
    public static final int f41619m = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C2982i f41620a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final r f41621b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final k f41622c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final j0 f41623d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.d f41624e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final d f41625f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final l1 f41626g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final m f41627h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f41628i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f41629j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final C2990q f41630k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final n f41631l;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.DECControllerImpl$onEvent$1", f = "DECControllerImpl.kt", l = {60}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41632a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ b f41634c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(b bVar, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f41634c = bVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return c.this.new a(this.f41634c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41632a;
            if (i5 == 0) {
                ResultKt.b(obj);
                l1 l1Var = c.this.f41626g;
                b bVar = this.f41634c;
                this.f41632a = 1;
                if (l1Var.emit(bVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    public /* synthetic */ c(C2982i c2982i, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.e eVar, int i5, Context context, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, r rVar, k kVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(c2982i, eVar, i5, context, aVar, rVar, kVar);
    }

    public static Object b(c cVar) {
        return Reflection.f71864a.property0(new PropertyReference0Impl(cVar.f41624e, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.d.class, "goNextAction", "getGoNextAction()Lkotlinx/coroutines/flow/StateFlow;", 0));
    }

    public static Object c(c cVar) {
        return Reflection.f71864a.property0(new PropertyReference0Impl(cVar.f41631l, n.class, "vastPrivacyIcon", "getVastPrivacyIcon()Lkotlinx/coroutines/flow/StateFlow;", 0));
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.b
    public boolean N() {
        return this.f41628i;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e
    @NotNull
    public C2990q Q() {
        return this.f41630k;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    @NotNull
    public g2 S() {
        return this.f41631l.S();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        k0.c(this.f41623d, null);
        this.f41631l.destroy();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e
    @Nullable
    public String g() {
        return this.f41629j;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    public void i() {
        this.f41631l.i();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d
    @NotNull
    public g2 l() {
        return this.f41624e.l();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.d
    public void reset() {
        this.f41624e.reset();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.a
    public void w() {
        this.f41625f.b();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    public void x() {
        this.f41631l.x();
    }

    public c(C2982i dec, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.e eVar, int i5, Context context, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, r externalLinkHandler, k linkHandler) {
        Intrinsics.g(dec, "dec");
        Intrinsics.g(context, "context");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(linkHandler, "linkHandler");
        this.f41620a = dec;
        this.f41621b = externalLinkHandler;
        this.f41622c = linkHandler;
        y70.d dVarS = k2.s();
        this.f41623d = dVarS;
        this.f41624e = f.a(i5, dVarS);
        this.f41625f = new d(customUserEventBuilderService, ul.b.R(dec.l()), ul.b.R(dec.q()), ul.b.R(dec.r()), null, null, 48, null);
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f41626g = t1VarB;
        this.f41627h = t1VarB;
        this.f41628i = dec.m() != null;
        this.f41629j = dec.j();
        this.f41630k = new C2990q(dec.k(), dec.o(), dec.n(), dec.p());
        this.f41631l = p.a(eVar != null ? eVar.f() : null, eVar != null ? Integer.valueOf(eVar.h()) : null, eVar != null ? Integer.valueOf(eVar.d()) : null, eVar != null ? eVar.a() : null, dVarS, context, customUserEventBuilderService, externalLinkHandler, null, null);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.a
    @NotNull
    public m a() {
        return this.f41627h;
    }

    public final r1 a(b bVar) {
        return m0.t(this.f41623d, null, null, new a(bVar, null), 3);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.g
    public void a(@NotNull a.AbstractC0299a.c button) {
        Intrinsics.g(button, "button");
        this.f41625f.a(button);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e
    public void b() {
        this.f41625f.a();
        a(b.f41615a);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.g
    public void a(@NotNull a.AbstractC0299a.c.EnumC0301a buttonType) {
        Intrinsics.g(buttonType, "buttonType");
        this.f41625f.a(buttonType);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.b
    public void b(@NotNull a.AbstractC0299a.f position) {
        Intrinsics.g(position, "position");
        String strM = this.f41620a.m();
        if (strM != null) {
            this.f41625f.a(position);
            this.f41622c.a(strM);
            a(b.f41616b);
        }
    }
}
