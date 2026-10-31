package com.moloco.sdk.internal.services.bidtoken.providers;

import android.app.ActivityManager;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class s implements j<r> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37831d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37832e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37833f = "MemorySignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final ActivityManager f37834b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public r f37835c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public s(@NotNull ActivityManager activityManager) {
        Intrinsics.g(activityManager, "activityManager");
        this.f37834b = activityManager;
        this.f37835c = e();
    }

    public final boolean a(r rVar, r rVar2) {
        return (Intrinsics.b(rVar.d(), rVar2.d()) && Intrinsics.b(rVar.e(), rVar2.e()) && Intrinsics.b(rVar.f(), rVar2.f())) ? false : true;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        r rVarE = e();
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.debugBuildLog$default(molocoLogger, f37833f, "[CBT] cached lm: " + this.f37835c.d() + ", t: " + this.f37835c.e() + ", tm: " + this.f37835c.f(), false, 4, null);
        MolocoLogger.debugBuildLog$default(molocoLogger, f37833f, "[CBT] current lm: " + rVarE.d() + ", t: " + rVarE.e() + ", tm: " + rVarE.f(), false, 4, null);
        boolean zA = a(rVarE, this.f37835c);
        MolocoLogger.debugBuildLog$default(molocoLogger, f37833f, a2.c.l("[CBT] m needsRefresh: ", zA), false, 4, null);
        return zA;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37833f;
    }

    public final r e() {
        try {
            ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
            this.f37834b.getMemoryInfo(memoryInfo);
            return new r(Boolean.valueOf(memoryInfo.lowMemory), Long.valueOf(memoryInfo.threshold), Long.valueOf(memoryInfo.totalMem));
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37833f, "[CBT] MI Error", e3, false, 8, null);
            return new r(null, null, null, 7, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public r d() {
        r rVar = this.f37835c;
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37833f, "[CBT] lm: " + rVar.d() + ", t: " + rVar.e() + ", tm: " + rVar.f(), false, 4, null);
        return rVar;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37833f, "[CBT] Updating m state", false, 4, null);
        this.f37835c = e();
    }
}
