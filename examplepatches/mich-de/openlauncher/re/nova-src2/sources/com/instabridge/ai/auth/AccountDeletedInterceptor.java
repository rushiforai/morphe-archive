package com.instabridge.ai.auth;

import c90.f;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import x80.m0;
import x80.x;
import x80.y;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/auth/AccountDeletedInterceptor;", "Lx80/y;", "<init>", "()V", "Lx80/x;", "chain", "Lx80/m0;", "intercept", "(Lx80/x;)Lx80/m0;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AccountDeletedInterceptor implements y {
    public static final int $stable = 0;

    @NotNull
    public static final AccountDeletedInterceptor INSTANCE = new AccountDeletedInterceptor();

    private AccountDeletedInterceptor() {
    }

    @Override // x80.y
    @NotNull
    public m0 intercept(@NotNull x chain) {
        Intrinsics.g(chain, "chain");
        f fVar = (f) chain;
        m0 m0VarB = fVar.b(fVar.f19892e);
        AccountDeletedDetector.INSTANCE.inspect(m0VarB);
        return m0VarB;
    }
}
