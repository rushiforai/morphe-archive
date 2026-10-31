package com.instabridge.mobilesdk.internal.auth;

import android.content.Context;
import android.content.SharedPreferences;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0001\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0006\u0010\b\u001a\u00020\tJ\b\u0010\n\u001a\u0004\u0018\u00010\u000bJ\b\u0010\f\u001a\u0004\u0018\u00010\u000bJ\b\u0010\r\u001a\u0004\u0018\u00010\u000bJ\r\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0002\u0010\u0010J7\u0010\u0011\u001a\u00020\u00122\b\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0002\u0010\u0013J\u0006\u0010\u0014\u001a\u00020\u0012R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/SignedInStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", "isSignedIn", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, ActionCategory.EMAIL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "displayName", "token", "userId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()Ljava/lang/Long;", "markSignedIn", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V", "clear", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class SignedInStore {

    @Deprecated
    @NotNull
    public static final String KEY_DISPLAY_NAME = "signed_in_display_name";

    @Deprecated
    @NotNull
    public static final String KEY_EMAIL = "signed_in_email";

    @Deprecated
    @NotNull
    public static final String KEY_SIGNED_IN = "signed_in";

    @Deprecated
    @NotNull
    public static final String KEY_TOKEN = "signed_in_token";

    @Deprecated
    @NotNull
    public static final String KEY_USER_ID = "signed_in_user_id";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_mobile_sdk_auth";

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/SignedInStore$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "PREFS_NAME", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_SIGNED_IN", "KEY_EMAIL", "KEY_DISPLAY_NAME", "KEY_TOKEN", "KEY_USER_ID", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public SignedInStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences("instabridge_mobile_sdk_auth", 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
    }

    public static /* synthetic */ void markSignedIn$default(SignedInStore signedInStore, String str, String str2, String str3, Long l9, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str3 = null;
        }
        if ((i5 & 8) != 0) {
            l9 = null;
        }
        signedInStore.markSignedIn(str, str2, str3, l9);
    }

    public final void clear() {
        this.prefs.edit().remove(KEY_SIGNED_IN).remove(KEY_EMAIL).remove(KEY_DISPLAY_NAME).remove(KEY_TOKEN).remove(KEY_USER_ID).apply();
    }

    @Nullable
    public final String displayName() {
        return this.prefs.getString(KEY_DISPLAY_NAME, null);
    }

    @Nullable
    public final String email() {
        return this.prefs.getString(KEY_EMAIL, null);
    }

    public final boolean isSignedIn() {
        return this.prefs.getBoolean(KEY_SIGNED_IN, false);
    }

    public final void markSignedIn(@Nullable String email, @Nullable String displayName, @Nullable String token, @Nullable Long userId) {
        SharedPreferences.Editor editorPutString = this.prefs.edit().putBoolean(KEY_SIGNED_IN, true).putString(KEY_EMAIL, email).putString(KEY_DISPLAY_NAME, displayName);
        if (token != null) {
            editorPutString.putString(KEY_TOKEN, token);
        } else {
            editorPutString.remove(KEY_TOKEN);
        }
        if (userId != null) {
            editorPutString.putLong(KEY_USER_ID, userId.longValue());
        } else {
            editorPutString.remove(KEY_USER_ID);
        }
        editorPutString.apply();
    }

    @Nullable
    public final String token() {
        String string = this.prefs.getString(KEY_TOKEN, null);
        if (string == null || r70.k.U0(string)) {
            return null;
        }
        return string;
    }

    @Nullable
    public final Long userId() {
        Long lValueOf = Long.valueOf(this.prefs.getLong(KEY_USER_ID, -1L));
        if (lValueOf.longValue() > 0) {
            return lValueOf;
        }
        return null;
    }
}
