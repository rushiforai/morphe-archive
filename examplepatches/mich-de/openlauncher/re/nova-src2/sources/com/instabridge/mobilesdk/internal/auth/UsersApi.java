package com.instabridge.mobilesdk.internal.auth;

import com.amplitude.android.TrackingOptions;
import eb0.p0;
import gb0.o;
import gb0.t;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\b`\u0018\u00002\u00020\u0001Jf\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u00022\b\b\u0001\u0010\u0005\u001a\u00020\u00022\b\b\u0001\u0010\u0006\u001a\u00020\u00022\b\b\u0001\u0010\u0007\u001a\u00020\u00022\b\b\u0001\u0010\b\u001a\u00020\u00022\b\b\u0001\u0010\t\u001a\u00020\u00022\b\b\u0001\u0010\n\u001a\u00020\u0002H§@¢\u0006\u0004\b\r\u0010\u000eJ\\\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u000b2\b\b\u0001\u0010\u000f\u001a\u00020\u00022\b\b\u0001\u0010\u0010\u001a\u00020\u00022\b\b\u0001\u0010\u0011\u001a\u00020\u00022\b\b\u0001\u0010\u0007\u001a\u00020\u00022\b\b\u0001\u0010\b\u001a\u00020\u00022\b\b\u0001\u0010\t\u001a\u00020\u00022\b\b\u0001\u0010\n\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/UsersApi;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "acceptedTermOfService", "acceptedTermOfServiceVersion", "deviceToken", "deviceId", "locale", "token", TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "version", "Leb0/p0;", "Lcom/instabridge/mobilesdk/internal/auth/CreateUserResponse;", "createUser", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "googleToken", "acceptedToc", "method", "Lcom/instabridge/mobilesdk/internal/auth/LoginResponse;", "loginWithGoogle", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface UsersApi {
    @o("users")
    @Nullable
    Object createUser(@t("accepted_term_of_service") @NotNull String str, @t("accepted_term_of_service_version") @NotNull String str2, @t("device_token") @NotNull String str3, @t("device_id") @NotNull String str4, @t("locale") @NotNull String str5, @t("token") @NotNull String str6, @t(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM) @NotNull String str7, @t("version") @NotNull String str8, @NotNull Continuation<? super p0<CreateUserResponse>> continuation);

    @o("users/login")
    @Nullable
    Object loginWithGoogle(@t("google_token") @NotNull String str, @t("acceptedToc") @NotNull String str2, @t("_method") @NotNull String str3, @t("locale") @NotNull String str4, @t("token") @NotNull String str5, @t(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM) @NotNull String str6, @t("version") @NotNull String str7, @NotNull Continuation<? super p0<LoginResponse>> continuation);
}
