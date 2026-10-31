package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import android.content.Intent;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f42073a = "START_MUTED";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f42074b = "CLOSE_DELAY_SECONDS";

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final String f42075c = "DEC_DELAY_SECONDS";

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final String f42076d = "SKIP_DELAY_SECONDS";

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f42077e = "SKIP_ENABLED";

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f42078f = "AUTO_STORE_ON_SKIP";

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final String f42079g = "AUTO_STORE_ON_COMPLETE";

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final String f42080h = "ANDROID_INLINE_ENABLED";

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f42081i = "ANDROID_INLINE_URL";

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public static final String f42082j = "BUNDLE_ID";

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public static final String f42083k = "ANDROID_AUTOINLINE_ENABLED";

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public static final String f42084l = "ANDROID_AUTOINLINE_EVENTLINK";

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public static final String f42085m = "ANDROID_AUTOINLINE_SKIP";

    @NotNull
    public static final String n = "ANDROID_AUTOINLINE_CLICKTHROUGH";

    @NotNull
    public static final String o = "ANDROID_AUTOINLINE_FORCE_FULLSCREEN";

    public static final void a(@NotNull Intent intent, int i5) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42074b, i5);
    }

    public static final void b(@NotNull Intent intent, int i5) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42075c, i5);
    }

    public static final void c(@NotNull Intent intent, int i5) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42076d, i5);
    }

    public static final void d(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42080h, z11);
    }

    public static final void e(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42079g, z11);
    }

    public static final void f(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42078f, z11);
    }

    public static final void g(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42073a, z11);
    }

    public static final boolean h(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42079g, false);
    }

    public static final boolean i(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42078f, false);
    }

    @Nullable
    public static final String j(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getStringExtra(f42082j);
    }

    public static final int k(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getIntExtra(f42074b, 0);
    }

    public static final int l(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getIntExtra(f42075c, 0);
    }

    @Nullable
    public static final Boolean m(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        if (intent.hasExtra(f42077e)) {
            return Boolean.valueOf(intent.getBooleanExtra(f42077e, false));
        }
        return null;
    }

    public static final int n(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getIntExtra(f42076d, 0);
    }

    public static final boolean o(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42073a, true);
    }

    public static final void a(@NotNull Intent intent, @Nullable Boolean bool) {
        Intrinsics.g(intent, "<this>");
        if (bool != null) {
            intent.putExtra(f42077e, bool.booleanValue());
        }
    }

    public static final boolean b(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42083k, false);
    }

    public static final void c(@NotNull Intent intent, @NotNull String value) {
        Intrinsics.g(intent, "<this>");
        Intrinsics.g(value, "value");
        intent.putExtra(f42081i, value);
    }

    public static final void d(@NotNull Intent intent, @NotNull String value) {
        Intrinsics.g(intent, "<this>");
        Intrinsics.g(value, "value");
        intent.putExtra(f42082j, value);
    }

    public static final boolean e(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42085m, false);
    }

    public static final boolean f(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(f42080h, false);
    }

    @Nullable
    public static final String g(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getStringExtra(f42081i);
    }

    public static final void a(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42083k, z11);
    }

    public static final void b(@NotNull Intent intent, @NotNull String value) {
        Intrinsics.g(intent, "<this>");
        Intrinsics.g(value, "value");
        intent.putExtra(f42084l, value);
    }

    @Nullable
    public static final String c(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getStringExtra(f42084l);
    }

    public static final boolean d(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getBooleanExtra(o, false);
    }

    @Nullable
    public static final String a(@NotNull Intent intent) {
        Intrinsics.g(intent, "<this>");
        return intent.getStringExtra(n);
    }

    public static final void b(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(o, z11);
    }

    public static final void c(@NotNull Intent intent, boolean z11) {
        Intrinsics.g(intent, "<this>");
        intent.putExtra(f42085m, z11);
    }

    public static final void a(@NotNull Intent intent, @NotNull String value) {
        Intrinsics.g(intent, "<this>");
        Intrinsics.g(value, "value");
        intent.putExtra(n, value);
    }
}
