package com.instabridge.ai.auth;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b`\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0004\u001a\u00020\u0003H&J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0003H&¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/auth/SecretCipher;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seal", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "plain", "open", "Lcom/instabridge/ai/auth/Unsealed;", "sealed", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface SecretCipher {
    @NotNull
    Unsealed open(@NotNull String sealed);

    @Nullable
    String seal(@NotNull String plain);
}
