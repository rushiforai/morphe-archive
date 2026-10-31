package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import java.net.URI;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class J {
    @NotNull
    public static final String a(@NotNull String str) throws NoSuchAlgorithmException {
        Intrinsics.g(str, "<this>");
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        byte[] bytes = str.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        messageDigest.update(bytes);
        byte[] bArrDigest = messageDigest.digest();
        Intrinsics.f(bArrDigest, "digest(...)");
        return C2979f.a(bArrDigest);
    }

    @NotNull
    public static final String b(@NotNull String str) throws NoSuchAlgorithmException {
        Intrinsics.g(str, "<this>");
        URI uri = new URI(str);
        String string = new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), null, uri.getFragment()).toString();
        Intrinsics.f(string, "run(...)");
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        byte[] bytes = string.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        messageDigest.update(bytes);
        byte[] bArrDigest = messageDigest.digest();
        Intrinsics.f(bArrDigest, "digest(...)");
        return C2979f.a(bArrDigest);
    }
}
