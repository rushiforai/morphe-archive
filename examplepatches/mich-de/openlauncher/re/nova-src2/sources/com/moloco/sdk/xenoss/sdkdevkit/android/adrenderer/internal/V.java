package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class V {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final V f38623a = new V();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final Map<Integer, C2977d> f38624b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public static final int f38625c = 8;

    public final void b(int i5) {
        f38624b.remove(Integer.valueOf(i5));
    }

    public final int a(@NotNull C2977d wv2) {
        Intrinsics.g(wv2, "wv");
        int iHashCode = wv2.hashCode();
        f38624b.put(Integer.valueOf(iHashCode), wv2);
        return iHashCode;
    }

    public final /* synthetic */ <T> T a(int i5) {
        f38624b.get(Integer.valueOf(i5));
        Intrinsics.k();
        throw null;
    }
}
