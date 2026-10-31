package com.instabridge.ai.auth;

import android.content.SharedPreferences;
import com.instabridge.ai.auth.StoredRefreshToken;
import com.instabridge.ai.auth.Unsealed;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\b\u0001\u0018\u0000 \u00162\u00020\u0001:\u0001\u0016B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0006\u0010\b\u001a\u00020\tJ\b\u0010\n\u001a\u0004\u0018\u00010\u000bJ\u0006\u0010\f\u001a\u00020\rJ\u001e\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u0014J\u000e\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/auth/RefreshTokenStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "prefs", "Landroid/content/SharedPreferences;", "cipher", "Lcom/instabridge/ai/auth/SecretCipher;", "<init>", "(Landroid/content/SharedPreferences;Lcom/instabridge/ai/auth/SecretCipher;)V", "hasEntry", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "read", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "load", "Lcom/instabridge/ai/auth/StoredRefreshToken;", "put", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "editor", "Landroid/content/SharedPreferences$Editor;", "refreshToken", "refreshExpiresAt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "remove", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class RefreshTokenStore {

    @NotNull
    public static final String KEY_REFRESH_EXPIRES_AT = "ai_refresh_expires_at";

    @NotNull
    public static final String KEY_REFRESH_TOKEN = "ai_refresh_token";

    @NotNull
    private static final String PLAIN_PREFIX = "p1:";

    @NotNull
    private static final String SEALED_PREFIX = "k1:";

    @NotNull
    private final SecretCipher cipher;

    @NotNull
    private final SharedPreferences prefs;
    public static final int $stable = 8;

    public RefreshTokenStore(@NotNull SharedPreferences prefs, @NotNull SecretCipher cipher) {
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(cipher, "cipher");
        this.prefs = prefs;
        this.cipher = cipher;
    }

    public final boolean hasEntry() {
        return this.prefs.contains(KEY_REFRESH_TOKEN);
    }

    @NotNull
    public final StoredRefreshToken load() {
        String string = this.prefs.getString(KEY_REFRESH_TOKEN, null);
        if (string == null) {
            return StoredRefreshToken.Missing.INSTANCE;
        }
        if (!j.I0(string, SEALED_PREFIX, false)) {
            if (!j.I0(string, PLAIN_PREFIX, false)) {
                return StoredRefreshToken.Unreadable.INSTANCE;
            }
            String strA1 = r70.k.a1(string, PLAIN_PREFIX);
            String str = strA1.length() > 0 ? strA1 : null;
            return str != null ? new StoredRefreshToken.Present(str) : StoredRefreshToken.Unreadable.INSTANCE;
        }
        Unsealed unsealedOpen = this.cipher.open(r70.k.a1(string, SEALED_PREFIX));
        if (unsealedOpen instanceof Unsealed.Plain) {
            return new StoredRefreshToken.Present(((Unsealed.Plain) unsealedOpen).getText());
        }
        if (Intrinsics.b(unsealedOpen, Unsealed.Unreadable.INSTANCE)) {
            return StoredRefreshToken.Unreadable.INSTANCE;
        }
        if (Intrinsics.b(unsealedOpen, Unsealed.Unavailable.INSTANCE)) {
            return StoredRefreshToken.Unavailable.INSTANCE;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final void put(@NotNull SharedPreferences.Editor editor, @NotNull String refreshToken, long refreshExpiresAt) {
        Intrinsics.g(editor, "editor");
        Intrinsics.g(refreshToken, "refreshToken");
        String strSeal = this.cipher.seal(refreshToken);
        editor.putString(KEY_REFRESH_TOKEN, strSeal != null ? SEALED_PREFIX.concat(strSeal) : PLAIN_PREFIX.concat(refreshToken));
        if (refreshExpiresAt > 0) {
            editor.putLong(KEY_REFRESH_EXPIRES_AT, refreshExpiresAt);
        } else {
            editor.remove(KEY_REFRESH_EXPIRES_AT);
        }
    }

    @Nullable
    public final String read() {
        StoredRefreshToken storedRefreshTokenLoad = load();
        StoredRefreshToken.Present present = storedRefreshTokenLoad instanceof StoredRefreshToken.Present ? (StoredRefreshToken.Present) storedRefreshTokenLoad : null;
        if (present != null) {
            return present.getToken();
        }
        return null;
    }

    public final void remove(@NotNull SharedPreferences.Editor editor) {
        Intrinsics.g(editor, "editor");
        editor.remove(KEY_REFRESH_TOKEN);
        editor.remove(KEY_REFRESH_EXPIRES_AT);
    }
}
