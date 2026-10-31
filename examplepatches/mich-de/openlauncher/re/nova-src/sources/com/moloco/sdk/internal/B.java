package com.moloco.sdk.internal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class B {
    @NotNull
    public static final String a(@NotNull String str) throws NoSuchAlgorithmException {
        Intrinsics.g(str, "<this>");
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        byte[] bytes = str.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        messageDigest.update(bytes);
        byte[] bArrDigest = messageDigest.digest();
        Intrinsics.f(bArrDigest, "digest(...)");
        return k.a(bArrDigest);
    }
}
