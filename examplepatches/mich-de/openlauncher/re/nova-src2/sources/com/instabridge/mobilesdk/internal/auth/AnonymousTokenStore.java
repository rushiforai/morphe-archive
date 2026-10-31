package com.instabridge.mobilesdk.internal.auth;

import a2.c;
import android.content.Context;
import android.content.SharedPreferences;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0001\u0018\u0000 \u000e2\u00020\u0001:\u0001\u000eB\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\b\u0010\b\u001a\u0004\u0018\u00010\tJ\u000e\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\tJ\u0006\u0010\r\u001a\u00020\tR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/AnonymousTokenStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "prefs", "Landroid/content/SharedPreferences;", "readToken", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "writeToken", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "token", "deviceId", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AnonymousTokenStore {

    @Deprecated
    @NotNull
    public static final String KEY_DEVICE_ID = "device_id";

    @Deprecated
    @NotNull
    public static final String KEY_TOKEN = "anonymous_token";

    @Deprecated
    @NotNull
    public static final String PREFS_NAME = "instabridge_mobile_sdk_auth";

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/AnonymousTokenStore$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "PREFS_NAME", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_TOKEN", "KEY_DEVICE_ID", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public AnonymousTokenStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences("instabridge_mobile_sdk_auth", 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
    }

    @NotNull
    public final String deviceId() {
        String string = this.prefs.getString("device_id", null);
        if (string != null) {
            return string;
        }
        String strJ = c0.j("toString(...)");
        c.v(this.prefs, "device_id", strJ);
        return strJ;
    }

    @Nullable
    public final String readToken() {
        String string = this.prefs.getString(KEY_TOKEN, null);
        if (string == null || r70.k.U0(string)) {
            return null;
        }
        return string;
    }

    public final void writeToken(@NotNull String token) {
        Intrinsics.g(token, "token");
        c.v(this.prefs, KEY_TOKEN, token);
    }
}
