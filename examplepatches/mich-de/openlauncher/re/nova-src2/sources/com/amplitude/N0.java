package com.amplitude;

import java.security.MessageDigest;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public abstract class N0 {
    public static O0 a(String imageData) {
        Intrinsics.g(imageData, "imageData");
        P0 p02 = P0.f20355a;
        byte[] bytes = imageData.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        byte[] bArrDigest = ((MessageDigest) Q0.f20371a.getValue()).digest(bytes);
        Intrinsics.d(bArrDigest);
        StringBuilder sb2 = new StringBuilder(bArrDigest.length * 2);
        for (byte b11 : bArrDigest) {
            sb2.append("0123456789abcdef".charAt((b11 >> 4) & 15));
            sb2.append("0123456789abcdef".charAt(b11 & 15));
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return new O0(string, imageData);
    }
}
