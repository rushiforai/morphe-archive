package io.branch.search.internal;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.c3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3091c3 {

    /* renamed from: io.branch.search.internal.c3$a */
    public static final class a extends IOException {

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public final String f64093a;

        public a(@Nullable String str) {
            this.f64093a = str;
        }

        @Override // java.lang.Throwable
        @Nullable
        public final String getMessage() {
            return this.f64093a;
        }
    }

    public static Cipher a(String str, int i5, String str2) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Charset charsetForName = Charset.forName("utf-8");
        Intrinsics.f(charsetForName, "forName(TEXT_ENCODING_IN_BRANCH_NETWORK)");
        byte[] bytes = str.getBytes(charsetForName);
        Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(bytes);
        Charset charsetForName2 = Charset.forName("utf-8");
        Intrinsics.f(charsetForName2, "forName(TEXT_ENCODING_IN_BRANCH_NETWORK)");
        byte[] bytes2 = str2.getBytes(charsetForName2);
        Intrinsics.f(bytes2, "this as java.lang.String).getBytes(charset)");
        SecretKeySpec secretKeySpec = new SecretKeySpec(bytes2, "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(i5, secretKeySpec, ivParameterSpec);
        return cipher;
    }
}
