package com.vungle.ads.internal.downloader;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {
    public static boolean a(c error) {
        Intrinsics.g(error, "error");
        if (error.b() != 1) {
            return false;
        }
        int iC = error.c();
        if (iC != -1 && iC != 408 && iC != 500) {
            switch (iC) {
                case PglCryptUtils.INPUT_INVALID /* 502 */:
                case PglCryptUtils.COMPRESS_FAILED /* 503 */:
                case PglCryptUtils.BASE64_FAILED /* 504 */:
                    break;
                default:
                    return false;
            }
        }
        return true;
    }
}
