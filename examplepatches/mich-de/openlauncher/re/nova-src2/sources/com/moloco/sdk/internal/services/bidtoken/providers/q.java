package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class q implements j<p> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37822d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37823e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37824f = "IlrdSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<com.moloco.sdk.internal.ilrd.e> f37825b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public p f37826c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public q(@NotNull Function0<com.moloco.sdk.internal.ilrd.e> _ilrdService) {
        Intrinsics.g(_ilrdService, "_ilrdService");
        this.f37825b = _ilrdService;
        this.f37826c = f();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37826c = f();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        p pVarF = f();
        boolean z11 = !Intrinsics.b(pVarF, this.f37826c);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37824f, "[Ilrd] needsRefresh: " + z11 + ", with current: " + pVarF + ", cached: " + this.f37826c, false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37824f;
    }

    public final p e() {
        return new p(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L, -1L, -1, -1, -1, -1, -1);
    }

    public final p f() {
        p pVarB;
        try {
            com.moloco.sdk.internal.ilrd.e eVar = (com.moloco.sdk.internal.ilrd.e) this.f37825b.invoke();
            if (eVar != null && (pVarB = eVar.b()) != null) {
                return pVarB;
            }
            return e();
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37824f, "Error retrieving ILRD signal", e3, false, 8, null);
            return e();
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public p d() {
        return this.f37826c;
    }
}
