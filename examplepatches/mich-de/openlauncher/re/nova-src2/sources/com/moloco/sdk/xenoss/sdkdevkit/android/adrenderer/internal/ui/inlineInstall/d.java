package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import android.net.Uri;
import com.moloco.sdk.internal.MolocoLogger;
import java.util.Locale;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class d implements c {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final a f39826b = new a(null);

    /* renamed from: c, reason: collision with root package name */
    public static final int f39827c = 8;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final String f39828d = "BundleExtractor";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Regex f39829a = new Regex("^[a-z][a-z0-9]*(\\.[a-z][a-z0-9]*)+$");

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.c
    public boolean a(@NotNull String bundleId) {
        Intrinsics.g(bundleId, "bundleId");
        return this.f39829a.f(bundleId);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.c
    @Nullable
    public String b(@NotNull String url) {
        String lowerCase;
        String lowerCase2;
        Intrinsics.g(url, "url");
        try {
            Uri uri = Uri.parse(url);
            Intrinsics.f(uri, "parse(this)");
            String scheme = uri.getScheme();
            if (scheme != null) {
                lowerCase = scheme.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
            } else {
                lowerCase = null;
            }
            String host = uri.getHost();
            if (host != null) {
                lowerCase2 = host.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
            } else {
                lowerCase2 = null;
            }
            if (Intrinsics.b(lowerCase, "market")) {
                return uri.getQueryParameter("id");
            }
            if (lowerCase2 == null || !r70.k.K0(lowerCase2, "play.google.com", false)) {
                return null;
            }
            return uri.getQueryParameter("id");
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f39828d, "Failed to parse URL for bundle ID", e3, false, 8, null);
            return null;
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.c
    public boolean c(@Nullable String str) {
        String lowerCase;
        if (str != null) {
            try {
                Uri uri = Uri.parse(str);
                Intrinsics.f(uri, "parse(this)");
                String scheme = uri.getScheme();
                String lowerCase2 = null;
                if (scheme != null) {
                    lowerCase = scheme.toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                } else {
                    lowerCase = null;
                }
                String host = uri.getHost();
                if (host != null) {
                    lowerCase2 = host.toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                }
                if (!Intrinsics.b(lowerCase, "market")) {
                    if (lowerCase2 != null) {
                        if (r70.k.K0(lowerCase2, "play.google.com", false)) {
                        }
                    }
                }
                return true;
            } catch (Exception e3) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, "Xenoss", "Failed to parse URL for store validation", e3, false, 8, null);
                return false;
            }
        }
        return false;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.c
    @Nullable
    public String d(@NotNull String url) {
        String lowerCase;
        String lowerCase2;
        Intrinsics.g(url, "url");
        try {
            Uri uri = Uri.parse(url);
            Intrinsics.f(uri, "parse(this)");
            String scheme = uri.getScheme();
            if (scheme != null) {
                lowerCase = scheme.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
            } else {
                lowerCase = null;
            }
            String host = uri.getHost();
            if (host != null) {
                lowerCase2 = host.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
            } else {
                lowerCase2 = null;
            }
            if (Intrinsics.b(lowerCase, "market")) {
                return uri.getQueryParameter("referrer");
            }
            if (lowerCase2 == null || !r70.k.K0(lowerCase2, "play.google.com", false)) {
                return null;
            }
            return uri.getQueryParameter("referrer");
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f39828d, "Failed to parse URL for referrer", e3, false, 8, null);
            return null;
        }
    }
}
