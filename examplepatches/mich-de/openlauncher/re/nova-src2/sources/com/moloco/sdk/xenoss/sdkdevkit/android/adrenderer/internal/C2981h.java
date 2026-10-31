package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import kotlin.text.RegexOption;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.h, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2981h {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C2981h f38834a = new C2981h();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final Regex f38835b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final Regex f38836c;

    /* renamed from: d, reason: collision with root package name */
    public static final int f38837d;

    static {
        RegexOption[] regexOptionArr = RegexOption.f72028c;
        f38835b = new Regex("<meta\\s+name=[\"']templateName[\"']\\s+content=[\"']([^\"']+)[\"']", 0);
        f38836c = new Regex("<!DOCTYPE\\b[^>]*>|<!--[\\s\\S]*?-->|<!\\[CDATA\\[[\\s\\S]*?]]>|</?[a-z][a-z0-9-]*\\b[^>]*>", 0);
        f38837d = 8;
    }

    public final boolean a(@NotNull String adm) {
        Intrinsics.g(adm, "adm");
        return f38836c.a(adm);
    }

    public final boolean b(@NotNull String adm) {
        Intrinsics.g(adm, "adm");
        return r70.k.K0(adm, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.w.f39244k, true);
    }

    public final boolean c(@NotNull String adm) {
        Intrinsics.g(adm, "adm");
        return r70.k.K0(adm, "<VAST", true);
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j d(@NotNull String adm) {
        Intrinsics.g(adm, "adm");
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j jVarF = f(adm);
        return jVarF == null ? e(adm) : jVarF;
    }

    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j e(String str) {
        return c(str) ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42118a : b(str) ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42119b : com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42120c;
    }

    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j f(String str) {
        String str2;
        kotlin.text.b bVarB = f38835b.b(str);
        if (bVarB == null || (str2 = (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1)) == null) {
            return null;
        }
        if (r70.j.I0(str2, "video", true)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42121d;
        }
        if (str2.equalsIgnoreCase("mraid")) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42122e;
        }
        if (str2.equalsIgnoreCase("static")) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42123f;
        }
        MetricsRecorder.INSTANCE.withNoMediation().recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.Y.c()).withTag("template_name", str2));
        return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j.f42123f;
    }
}
