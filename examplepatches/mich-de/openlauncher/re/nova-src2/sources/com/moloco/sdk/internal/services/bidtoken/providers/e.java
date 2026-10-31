package com.moloco.sdk.internal.services.bidtoken.providers;

import android.content.Context;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class e implements j<d> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37762d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37763e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37764f = "ADISignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Context f37765b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public d f37766c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public e(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f37765b = context;
        this.f37766c = new d(e());
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37766c = new d(e());
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        d dVar = new d(e());
        boolean z11 = !dVar.equals(this.f37766c);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37764f, "[CBT] ADI needsRefresh: " + z11 + ", with adi: " + dVar.b(), false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37764f;
    }

    public final Long e() {
        try {
            return Long.valueOf(this.f37765b.getFilesDir().getTotalSpace());
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37764f, "ADI Error", e3, false, 8, null);
            return null;
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public d d() {
        d dVar = this.f37766c;
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37764f, "[CBT] ADI providing " + dVar.b(), false, 4, null);
        return dVar;
    }
}
