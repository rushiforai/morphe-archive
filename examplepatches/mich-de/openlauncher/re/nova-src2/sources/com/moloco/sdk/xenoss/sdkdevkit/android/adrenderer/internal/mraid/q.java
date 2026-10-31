package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class q {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f39179a;

        static {
            int[] iArr = new int[p.values().length];
            try {
                iArr[p.f39174b.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[p.f39175c.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[p.f39176d.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            f39179a = iArr;
        }
    }

    @NotNull
    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.a a(@NotNull p pVar) {
        Intrinsics.g(pVar, "<this>");
        int i5 = a.f39179a[pVar.ordinal()];
        if (i5 == 1) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.a.f39381b;
        }
        if (i5 == 2) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.a.f39382c;
        }
        if (i5 == 3) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.a.f39383d;
        }
        throw new NoWhenBranchMatchedException();
    }
}
