package io.branch.search.internal;

import io.branch.search.internal.C3091c3;
import java.io.IOException;
import java.security.GeneralSecurityException;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.p5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public class C3313p5 implements x80.y {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F2 f65473a;

    public C3313p5(@NotNull F2 configManager) {
        Intrinsics.g(configManager, "configManager");
        this.f65473a = configManager;
    }

    @NotNull
    public static byte[] a(@NotNull x80.p0 responseBody, boolean z11, boolean z12, boolean z13, @Nullable String str, @Nullable String str2) throws BadPaddingException, IllegalBlockSizeException, IOException {
        Intrinsics.g(responseBody, "responseBody");
        byte[] originalBody = responseBody.bytes();
        if ((!z13 && !z11 && !z12) || str == null || str2 == null) {
            Intrinsics.f(originalBody, "originalBody");
            return originalBody;
        }
        Intrinsics.f(originalBody, "originalBody");
        byte[] bArrDoFinal = C3091c3.a(str, 2, str2).doFinal(originalBody);
        Intrinsics.f(bArrDoFinal, "cipher.doFinal(bytes)");
        return bArrDoFinal;
    }

    @Override // x80.y
    @NotNull
    public final x80.m0 intercept(@NotNull x80.x chain) {
        Intrinsics.g(chain, "chain");
        c90.f fVar = (c90.f) chain;
        x80.h0 h0Var = fVar.f19892e;
        String str = this.f65473a.a().f65348a;
        x80.g0 g0VarB = h0Var.b();
        g0VarB.e("X-Branch-Encryption", this.f65473a.a().f65350b);
        g0VarB.e("Accept-Encoding", "bncencv2,bncencv3,bncencv3z");
        x80.m0 m0VarB = fVar.b(g0VarB.b());
        x80.u uVar = m0VarB.f95558f;
        String strB = uVar.b("X-Branch-IV");
        if (strB == null) {
            strB = null;
        }
        String strB2 = uVar.b("Content-Encoding");
        return a(m0VarB, strB2 != null ? strB2 : null, strB, str);
    }

    @NotNull
    public x80.m0 a(@NotNull x80.m0 response, @Nullable String str, @Nullable String str2, @NotNull String encryptionKey) {
        Intrinsics.g(response, "response");
        Intrinsics.g(encryptionKey, "encryptionKey");
        x80.p0 p0Var = response.f95559g;
        if (p0Var != null) {
            try {
                x80.l0 l0VarD = response.d();
                x80.a0 a0Var = C3329q4.f65531b;
                if (str == null) {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                l0VarD.f95528g = x80.p0.create(a0Var, a(p0Var, str, str2, encryptionKey));
                response = l0VarD.a();
            } finally {
            }
        }
        CloseableKt.a(p0Var, null);
        return response;
    }

    public static byte[] a(x80.p0 p0Var, String str, String str2, String str3) throws C3091c3.a {
        boolean zEquals = "bncencv2".equals(str);
        boolean zEquals2 = "bncencv3z".equals(str);
        try {
            byte[] bArrA = a(p0Var, zEquals, zEquals2, "bncencv3".equals(str), str2, str3);
            if (zEquals) {
                return C3108d3.b(bArrA);
            }
            return zEquals2 ? C3108d3.a(bArrA) : bArrA;
        } catch (IOException e3) {
            throw new C3091c3.a(e3.getMessage());
        } catch (GeneralSecurityException e11) {
            throw new C3091c3.a(e11.getMessage());
        }
    }
}
