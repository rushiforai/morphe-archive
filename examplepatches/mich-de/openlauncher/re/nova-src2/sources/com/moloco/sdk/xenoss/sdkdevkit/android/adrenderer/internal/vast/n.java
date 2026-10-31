package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import com.moloco.sdk.service_locator.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.random.Random;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f40865a = LazyKt.a(new x(8));

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final Regex f40866b = new Regex("\\[ERRORCODE]");

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final Regex f40867c = new Regex("\\[CONTENTPLAYHEAD]");

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final Regex f40868d = new Regex("\\[CACHEBUSTING]");

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final Regex f40869e = new Regex("\\[ASSETURI]");

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final Regex f40870f = new Regex("\\[[^]]*]");

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final Regex f40871g = new Regex("\\[MEDIAPLAYHEAD]");

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final Regex f40872h = new Regex("\\[ADPLAYHEAD]");

    @NotNull
    public static final l b() {
        return e();
    }

    public static final String d() {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        Random.f71890a.getClass();
        return String.format("%08d", Arrays.copyOf(new Object[]{Integer.valueOf(Random.f71891b.g(1, 99999999))}, 1));
    }

    public static final m e() {
        return (m) f40865a.getValue();
    }

    public static final m a() {
        return new m(a.i.f38316a.c());
    }

    public static final String b(String str, Integer num, Integer num2, String str2, String str3) {
        if (num != null) {
            str = f40866b.h(num.toString(), str);
        }
        if (num2 != null) {
            str = f40871g.h(c(num2.intValue()), f40872h.h(a(num2.intValue()), f40867c.h(b(num2.intValue()), str)));
        }
        if (str2 != null) {
            str = f40869e.h(a(str2), str);
        }
        if (str3 != null) {
            str = f40868d.h(str3, str);
        }
        return f40870f.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, str);
    }

    public static final String c(int i5) {
        return "-1";
    }

    public static final String a(int i5) {
        return b(i5);
    }

    public static final String a(String str) {
        try {
            return URLEncoder.encode(str, "UTF-8");
        } catch (Exception unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static final String b(int i5) {
        long j11 = i5;
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        return String.format("%02d:%02d:%02d.%03d", Arrays.copyOf(new Object[]{Long.valueOf(timeUnit.toHours(j11)), Long.valueOf(timeUnit.toMinutes(j11) % TimeUnit.HOURS.toMinutes(1L)), Long.valueOf(timeUnit.toSeconds(j11) % TimeUnit.MINUTES.toSeconds(1L)), Long.valueOf(j11 % 1000)}, 4));
    }
}
