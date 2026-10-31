package com.moloco.sdk.internal.services.encryption;

import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public interface a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C0175a f37948a = C0175a.f37949a;

    /* renamed from: com.moloco.sdk.internal.services.encryption.a$a, reason: collision with other inner class name */
    public static final class C0175a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ C0175a f37949a = new C0175a();

        @NotNull
        public final a a() {
            return new com.moloco.sdk.internal.services.encryption.b();
        }
    }

    /* loaded from: classes4.dex */
    public static final class b {
        public static /* synthetic */ void a() {
        }

        public static /* synthetic */ void b() {
        }
    }

    @NotNull
    String a(@NotNull byte[] bArr, @NotNull byte[] bArr2);

    @NotNull
    IvParameterSpec a();

    @NotNull
    byte[] a(@NotNull String str);

    @NotNull
    byte[] a(@NotNull byte[] bArr);

    @NotNull
    byte[] a(@NotNull byte[] bArr, @NotNull String str);

    @NotNull
    String b(@NotNull byte[] bArr);

    @NotNull
    SecretKeySpec b();

    @NotNull
    byte[] b(@NotNull byte[] bArr, @NotNull String str);
}
