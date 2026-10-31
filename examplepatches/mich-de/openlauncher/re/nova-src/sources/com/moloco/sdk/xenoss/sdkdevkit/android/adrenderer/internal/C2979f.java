package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.f, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2979f {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final char[] f38811a;

    static {
        char[] charArray = "0123456789ABCDEF".toCharArray();
        Intrinsics.f(charArray, "toCharArray(...)");
        f38811a = charArray;
    }

    @NotNull
    public static final String a(@NotNull byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        char[] cArr = new char[bArr.length * 2];
        int length = bArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            byte b11 = bArr[i5];
            int i11 = i5 * 2;
            char[] cArr2 = f38811a;
            cArr[i11] = cArr2[(b11 & 255) >>> 4];
            cArr[i11 + 1] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }
}
