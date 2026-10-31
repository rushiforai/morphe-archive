package com.moloco.sdk.internal.services.bidtoken;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37720d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f37721a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f37722b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final f f37723c;

    public k(@NotNull String bidToken, @NotNull String publicKey, @NotNull f bidTokenConfig) {
        Intrinsics.g(bidToken, "bidToken");
        Intrinsics.g(publicKey, "publicKey");
        Intrinsics.g(bidTokenConfig, "bidTokenConfig");
        this.f37721a = bidToken;
        this.f37722b = publicKey;
        this.f37723c = bidTokenConfig;
    }

    @NotNull
    public final String a() {
        return this.f37721a;
    }

    @NotNull
    public final String b() {
        return this.f37722b;
    }

    @NotNull
    public final f c() {
        return this.f37723c;
    }

    @NotNull
    public final String d() {
        return this.f37721a;
    }

    @NotNull
    public final f e() {
        return this.f37723c;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f37721a, kVar.f37721a) && Intrinsics.b(this.f37722b, kVar.f37722b) && Intrinsics.b(this.f37723c, kVar.f37723c);
    }

    @NotNull
    public final String f() {
        return this.f37722b;
    }

    public int hashCode() {
        return this.f37723c.hashCode() + c0.e(this.f37721a.hashCode() * 31, 31, this.f37722b);
    }

    @NotNull
    public String toString() {
        return "BidTokenResponseComponents(bidToken=" + this.f37721a + ", publicKey=" + this.f37722b + ", bidTokenConfig=" + this.f37723c + ')';
    }

    @NotNull
    public final k a(@NotNull String bidToken, @NotNull String publicKey, @NotNull f bidTokenConfig) {
        Intrinsics.g(bidToken, "bidToken");
        Intrinsics.g(publicKey, "publicKey");
        Intrinsics.g(bidTokenConfig, "bidTokenConfig");
        return new k(bidToken, publicKey, bidTokenConfig);
    }

    public static /* synthetic */ k a(k kVar, String str, String str2, f fVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = kVar.f37721a;
        }
        if ((i5 & 2) != 0) {
            str2 = kVar.f37722b;
        }
        if ((i5 & 4) != 0) {
            fVar = kVar.f37723c;
        }
        return kVar.a(str, str2, fVar);
    }
}
