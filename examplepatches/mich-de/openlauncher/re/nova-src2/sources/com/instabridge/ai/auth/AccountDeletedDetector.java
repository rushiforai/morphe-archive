package com.instabridge.ai.auth;

import android.util.Log;
import aq.e0;
import aq.h0;
import aq.m0;
import aq.r;
import bq.e;
import fo.d;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0005\u0010\u0003J\u0015\u0010\b\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u0017\u0010\r\u001a\u00020\f2\b\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\n8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\n8\u0000X\u0080T¢\u0006\u0006\n\u0004\b\u0011\u0010\u0010R\u0014\u0010\u0012\u001a\u00020\n8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0012\u0010\u0010R\u0014\u0010\u0014\u001a\u00020\u00138\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0014\u0010\u0015R(\u0010\u0018\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00170\u00168\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010\u0019R(\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00040\u001a8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 ¨\u0006!"}, d2 = {"Lcom/instabridge/ai/auth/AccountDeletedDetector;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "invalidateSdkSession", "Lx80/m0;", "response", "inspect", "(Lx80/m0;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "body", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isAccountDeletedBody", "(Ljava/lang/String;)Z", "TAG", "Ljava/lang/String;", "REASON_ACCOUNT_DELETED", "KEY_UNAUTHORIZED_REASON", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MAX_PEEK_BYTES", "J", "Laq/r;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mapAdapter", "Laq/r;", "Lkotlin/Function0;", "onAccountDeleted", "Lkotlin/jvm/functions/Function0;", "getOnAccountDeleted$instabridge_ai_sdk_release", "()Lkotlin/jvm/functions/Function0;", "setOnAccountDeleted$instabridge_ai_sdk_release", "(Lkotlin/jvm/functions/Function0;)V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AccountDeletedDetector {
    public static final int $stable;

    @NotNull
    public static final AccountDeletedDetector INSTANCE;

    @NotNull
    private static final String KEY_UNAUTHORIZED_REASON = "unauthorized_reason";
    private static final long MAX_PEEK_BYTES = 65536;

    @NotNull
    public static final String REASON_ACCOUNT_DELETED = "account_deleted";

    @NotNull
    private static final String TAG = "AiAccountDeleted";

    @NotNull
    private static final r mapAdapter;

    @NotNull
    private static volatile Function0<Unit> onAccountDeleted;

    static {
        AccountDeletedDetector accountDeletedDetector = new AccountDeletedDetector();
        INSTANCE = accountDeletedDetector;
        mapAdapter = new h0(new e0(0)).b(m0.f(Map.class, String.class, Object.class), e.f18422a, null);
        onAccountDeleted = new AccountDeletedDetector$onAccountDeleted$1(accountDeletedDetector);
        $stable = 8;
    }

    private AccountDeletedDetector() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void invalidateSdkSession() {
        if (d.j()) {
            d.a().invalidateSessionForAccountDeletion();
        }
    }

    @NotNull
    public final Function0<Unit> getOnAccountDeleted$instabridge_ai_sdk_release() {
        return onAccountDeleted;
    }

    public final void inspect(@NotNull x80.m0 response) {
        Intrinsics.g(response, "response");
        try {
            if (response.f95556d == 401 && isAccountDeletedBody(response.e(MAX_PEEK_BYTES).string())) {
                Log.w(TAG, "HTTP 401 unauthorized_reason=account_deleted from " + response.f95553a.f95509a.c() + " — invalidating cached session");
                onAccountDeleted.invoke();
            }
        } catch (Throwable th2) {
            Log.w(TAG, "Account-deleted detection failed: " + th2.getMessage());
        }
    }

    public final boolean isAccountDeletedBody(@Nullable String body) {
        Map map;
        if (body == null || k.U0(body)) {
            return false;
        }
        try {
            map = (Map) mapAdapter.b(body);
        } catch (Exception unused) {
            map = null;
        }
        return Intrinsics.b(map != null ? map.get(KEY_UNAUTHORIZED_REASON) : null, REASON_ACCOUNT_DELETED);
    }

    public final void setOnAccountDeleted$instabridge_ai_sdk_release(@NotNull Function0<Unit> function0) {
        Intrinsics.g(function0, "<set-?>");
        onAccountDeleted = function0;
    }
}
