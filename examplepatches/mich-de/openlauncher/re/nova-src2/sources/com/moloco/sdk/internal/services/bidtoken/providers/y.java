package com.moloco.sdk.internal.services.bidtoken.providers;

import android.content.Context;
import android.util.Base64;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class y implements j<x> {

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final a f37855f = new a(null);

    /* renamed from: g, reason: collision with root package name */
    public static final int f37856g = 8;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final String f37857h = "TCSignalProvider";

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f37858i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public static final String f37859j = "test_config";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Context f37860b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f37861c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f37862d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public x f37863e;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    static {
        byte[] bArrDecode = Base64.decode(new byte[]{98, 87, 57, 115, 98, 50, 78, 118, 88, 50, 82, 108, 98, 87, 57, 102, 100, 71, 86, 122, 100, 71, 108, 117, 90, 119, 61, 61, 10}, 0);
        Intrinsics.f(bArrDecode, "decode(...)");
        f37858i = r70.j.x0(bArrDecode);
    }

    public y(@NotNull Context context, @NotNull String preferencesName, @NotNull String key) {
        Intrinsics.g(context, "context");
        Intrinsics.g(preferencesName, "preferencesName");
        Intrinsics.g(key, "key");
        this.f37860b = context;
        this.f37861c = preferencesName;
        this.f37862d = key;
        this.f37863e = f();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37863e = f();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        x xVarF = f();
        boolean z11 = !Intrinsics.b(xVarF, this.f37863e);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37857h, "[CBT] TCS needsRefresh: " + z11 + ", current: " + xVarF.b() + ", cached: " + this.f37863e.b(), false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37857h;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public x d() {
        x xVar = this.f37863e;
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37857h, "[CBT] TCS providing: " + xVar.b(), false, 4, null);
        return xVar;
    }

    public final x f() {
        try {
            return new x(this.f37860b.getSharedPreferences(this.f37861c, 0).getString(this.f37862d, null));
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37857h, "[CBT] TCS Error", e3, false, 8, null);
            return new x(null);
        }
    }

    public /* synthetic */ y(Context context, String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i5 & 2) != 0 ? f37858i : str, (i5 & 4) != 0 ? f37859j : str2);
    }
}
