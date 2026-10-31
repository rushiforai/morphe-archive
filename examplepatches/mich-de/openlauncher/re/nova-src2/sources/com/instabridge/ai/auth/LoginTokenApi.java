package com.instabridge.ai.auth;

import b90.j;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.ai.auth.AiLoginCredential;
import com.instabridge.ai.auth.TokenGrantOutcome;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import m90.h;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
import r70.i;
import x80.a0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.j0;
import x80.k0;
import x80.m0;
import x80.p0;
import x80.z;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\b\u0001\u0018\u0000 .2\u00020\u0001:\u0002/.B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ!\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ)\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\r2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u001b\u0010\u001a\u001a\u0004\u0018\u00010\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0004H\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u001d\u0010\u001d\u001a\u0004\u0018\u00010\u0004*\u00020\t2\u0006\u0010\u001c\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ\u0019\u0010 \u001a\u0004\u0018\u00010\u001f2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002¢\u0006\u0004\b \u0010!J\u001f\u0010%\u001a\u00020\r2\u0006\u0010#\u001a\u00020\"2\b\u0010$\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b%\u0010&J\u0015\u0010(\u001a\u00020\r2\u0006\u0010'\u001a\u00020\u0004¢\u0006\u0004\b(\u0010)J\u0015\u0010*\u001a\u00020\u000b2\u0006\u0010'\u001a\u00020\u0004¢\u0006\u0004\b*\u0010+R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010,R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010-R\u0014\u0010\u0006\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010-¨\u00060"}, d2 = {"Lcom/instabridge/ai/auth/LoginTokenApi;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lx80/e0;", "client", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "baseUrl", "appId", "<init>", "(Lx80/e0;Ljava/lang/String;Ljava/lang/String;)V", "Lorg/json/JSONObject;", "body", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "oneShot", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "exchange", "(Lorg/json/JSONObject;Z)Lcom/instabridge/ai/auth/TokenGrantOutcome;", "path", "Lx80/h0;", "post", "(Ljava/lang/String;Lorg/json/JSONObject;Z)Lx80/h0;", "Lx80/m0;", "response", "classify", "(Lx80/m0;)Lcom/instabridge/ai/auth/TokenGrantOutcome;", "text", "Lcom/instabridge/ai/auth/LoginSession;", "parseSession", "(Ljava/lang/String;)Lcom/instabridge/ai/auth/LoginSession;", DatabaseConstants.KEY_FIELD, "stringOrNull", "(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "retryAfterSeconds", "(Lx80/m0;)Ljava/lang/Long;", "Lcom/instabridge/ai/auth/AiLoginCredential;", "credential", "currentToken", "login", "(Lcom/instabridge/ai/auth/AiLoginCredential;Ljava/lang/String;)Lcom/instabridge/ai/auth/TokenGrantOutcome;", "refreshToken", "renew", "(Ljava/lang/String;)Lcom/instabridge/ai/auth/TokenGrantOutcome;", "revoke", "(Ljava/lang/String;)Z", "Lx80/e0;", "Ljava/lang/String;", k.O, "OneShotBody", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class LoginTokenApi {

    @Deprecated
    @NotNull
    public static final String GRANT_GOOGLE_ID_TOKEN = "google_id_token";

    @Deprecated
    @NotNull
    public static final String GRANT_JWT_BEARER = "urn:ietf:params:oauth:grant-type:jwt-bearer";

    @Deprecated
    @NotNull
    public static final String GRANT_REFRESH_TOKEN = "refresh_token";

    @NotNull
    private static final a0 JSON;

    @Deprecated
    @NotNull
    public static final String REVOKE_PATH = "api/auth/token/revoke";

    @Deprecated
    public static final long REVOKE_TIMEOUT_SECONDS = 5;

    @Deprecated
    @NotNull
    public static final String TOKEN_PATH = "api/auth/token";

    @NotNull
    private final String appId;

    @NotNull
    private final String baseUrl;

    @NotNull
    private final e0 client;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\n\u001a\u00020\t8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\n\u0010\u000bR\u0014\u0010\f\u001a\u00020\t8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\f\u0010\u000bR\u0014\u0010\r\u001a\u00020\t8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\r\u0010\u000bR\u0014\u0010\u000e\u001a\u00020\t8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u000e\u0010\u000bR\u0014\u0010\u000f\u001a\u00020\t8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u000f\u0010\u000bR\u0014\u0010\u0011\u001a\u00020\u00108\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/auth/LoginTokenApi$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lx80/a0;", "JSON", "Lx80/a0;", "getJSON", "()Lx80/a0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "TOKEN_PATH", "Ljava/lang/String;", "REVOKE_PATH", "GRANT_GOOGLE_ID_TOKEN", "GRANT_JWT_BEARER", "GRANT_REFRESH_TOKEN", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "REVOKE_TIMEOUT_SECONDS", "J", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final a0 getJSON() {
            return LoginTokenApi.JSON;
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001¢\u0006\u0004\b\u0003\u0010\u0004J\u0011\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0016¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0002\u0010\u0013¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/auth/LoginTokenApi$OneShotBody;", "Lx80/k0;", "delegate", "<init>", "(Lx80/k0;)V", "Lx80/a0;", "contentType", "()Lx80/a0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "contentLength", "()J", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isOneShot", "()Z", "Lm90/h;", "sink", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "writeTo", "(Lm90/h;)V", "Lx80/k0;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OneShotBody extends k0 {

        @NotNull
        private final k0 delegate;

        public OneShotBody(@NotNull k0 delegate) {
            Intrinsics.g(delegate, "delegate");
            this.delegate = delegate;
        }

        @Override // x80.k0
        public long contentLength() {
            return this.delegate.contentLength();
        }

        @Override // x80.k0
        @Nullable
        public a0 contentType() {
            return this.delegate.contentType();
        }

        @Override // x80.k0
        public boolean isOneShot() {
            return true;
        }

        @Override // x80.k0
        public void writeTo(@NotNull h sink) {
            Intrinsics.g(sink, "sink");
            this.delegate.writeTo(sink);
        }
    }

    static {
        Pattern pattern = a0.f95396e;
        JSON = z.a("application/json; charset=utf-8");
    }

    public LoginTokenApi(@NotNull e0 client, @NotNull String baseUrl, @NotNull String appId) {
        Intrinsics.g(client, "client");
        Intrinsics.g(baseUrl, "baseUrl");
        Intrinsics.g(appId, "appId");
        this.client = client;
        this.baseUrl = baseUrl;
        this.appId = appId;
    }

    private final TokenGrantOutcome classify(m0 response) {
        p0 p0Var = response.f95559g;
        String strString = p0Var != null ? p0Var.string() : null;
        if (response.c()) {
            LoginSession session = parseSession(strString);
            return session == null ? new TokenGrantOutcome.Unavailable(null) : new TokenGrantOutcome.Granted(session);
        }
        int i5 = response.f95556d;
        return i5 != 400 ? i5 != 401 ? i5 != 409 ? new TokenGrantOutcome.Unavailable(retryAfterSeconds(response)) : TokenGrantOutcome.IdentityConflict.INSTANCE : AccountDeletedDetector.INSTANCE.isAccountDeletedBody(strString) ? TokenGrantOutcome.AccountDeleted.INSTANCE : TokenGrantOutcome.Rejected.INSTANCE : TokenGrantOutcome.Rejected.INSTANCE;
    }

    private final TokenGrantOutcome exchange(JSONObject body, boolean oneShot) {
        try {
            m0 m0VarL = this.client.c(post(TOKEN_PATH, body, oneShot)).l();
            try {
                TokenGrantOutcome tokenGrantOutcomeClassify = classify(m0VarL);
                m0VarL.close();
                return tokenGrantOutcomeClassify;
            } finally {
            }
        } catch (Exception unused) {
            return new TokenGrantOutcome.Unavailable(null);
        }
    }

    public static /* synthetic */ TokenGrantOutcome exchange$default(LoginTokenApi loginTokenApi, JSONObject jSONObject, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return loginTokenApi.exchange(jSONObject, z11);
    }

    private final LoginSession parseSession(String text) {
        String strStringOrNull;
        String strStringOrNull2;
        if (text != null && !r70.k.U0(text)) {
            try {
                JSONObject jSONObject = new JSONObject(text);
                String strStringOrNull3 = stringOrNull(jSONObject, "person_id");
                if (strStringOrNull3 == null || (strStringOrNull = stringOrNull(jSONObject, "token")) == null || (strStringOrNull2 = stringOrNull(jSONObject, GRANT_REFRESH_TOKEN)) == null) {
                    return null;
                }
                Long lValueOf = Long.valueOf(jSONObject.optLong("expires_at", 0L));
                if (lValueOf.longValue() <= 0) {
                    lValueOf = null;
                }
                if (lValueOf != null) {
                    long jLongValue = lValueOf.longValue();
                    long jOptLong = jSONObject.optLong("refresh_expires_at", 0L);
                    return new LoginSession(strStringOrNull3, strStringOrNull, jLongValue, strStringOrNull2, jOptLong >= 0 ? jOptLong : 0L, jSONObject.optBoolean("created", false));
                }
            } catch (Exception unused) {
            }
        }
        return null;
    }

    private final h0 post(String path, JSONObject body, boolean oneShot) {
        j0 j0Var = k0.Companion;
        String string = body.toString();
        Intrinsics.f(string, "toString(...)");
        a0 a0Var = JSON;
        j0Var.getClass();
        k0 k0VarA = j0.a(string, a0Var);
        g0 g0Var = new g0();
        g0Var.k(this.baseUrl + path);
        g0Var.a("Accept", "application/json");
        g0Var.a("X-App-Id", this.appId);
        g0Var.a("X-Client-Platform", "mobile-sdk");
        if (oneShot) {
            k0VarA = new OneShotBody(k0VarA);
        }
        g0Var.h(k0VarA);
        return g0Var.b();
    }

    public static /* synthetic */ h0 post$default(LoginTokenApi loginTokenApi, String str, JSONObject jSONObject, boolean z11, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        return loginTokenApi.post(str, jSONObject, z11);
    }

    private final Long retryAfterSeconds(m0 response) {
        String string;
        Long lV0;
        String strB = response.f95558f.b("Retry-After");
        if (strB == null) {
            strB = null;
        }
        if (strB == null || (string = r70.k.u1(strB).toString()) == null || (lV0 = i.v0(string)) == null || lV0.longValue() < 0) {
            return null;
        }
        return lV0;
    }

    private final String stringOrNull(JSONObject jSONObject, String str) {
        if (jSONObject.has(str) && !jSONObject.isNull(str)) {
            String strOptString = jSONObject.optString(str);
            Intrinsics.d(strOptString);
            if (!r70.k.U0(strOptString)) {
                return strOptString;
            }
        }
        return null;
    }

    @NotNull
    public final TokenGrantOutcome login(@NotNull AiLoginCredential credential, @Nullable String currentToken) throws JSONException {
        Intrinsics.g(credential, "credential");
        if (credential instanceof AiLoginCredential.Google) {
            JSONObject jSONObjectPut = new JSONObject().put("grant_type", GRANT_GOOGLE_ID_TOKEN).put("id_token", ((AiLoginCredential.Google) credential).getIdToken());
            if (currentToken != null) {
                jSONObjectPut.put("current_token", currentToken);
            }
            Intrinsics.f(jSONObjectPut, "apply(...)");
            return exchange$default(this, jSONObjectPut, false, 2, null);
        }
        if (!(credential instanceof AiLoginCredential.AppServerToken)) {
            throw new NoWhenBranchMatchedException();
        }
        JSONObject jSONObjectPut2 = new JSONObject().put("grant_type", GRANT_JWT_BEARER).put("assertion", ((AiLoginCredential.AppServerToken) credential).getToken());
        Intrinsics.f(jSONObjectPut2, "put(...)");
        return exchange(jSONObjectPut2, true);
    }

    @NotNull
    public final TokenGrantOutcome renew(@NotNull String refreshToken) throws JSONException {
        Intrinsics.g(refreshToken, "refreshToken");
        JSONObject jSONObjectPut = new JSONObject().put("grant_type", GRANT_REFRESH_TOKEN).put(GRANT_REFRESH_TOKEN, refreshToken);
        Intrinsics.f(jSONObjectPut, "put(...)");
        return exchange$default(this, jSONObjectPut, false, 2, null);
    }

    public final boolean revoke(@NotNull String refreshToken) {
        Intrinsics.g(refreshToken, "refreshToken");
        try {
            e0 e0Var = this.client;
            JSONObject jSONObjectPut = new JSONObject().put(GRANT_REFRESH_TOKEN, refreshToken);
            Intrinsics.f(jSONObjectPut, "put(...)");
            j jVarC = e0Var.c(post$default(this, REVOKE_PATH, jSONObjectPut, false, 4, null));
            jVarC.f17687d.g(5L, TimeUnit.SECONDS);
            m0 m0VarL = jVarC.l();
            try {
                boolean zC = m0VarL.c();
                m0VarL.close();
                return zC;
            } finally {
            }
        } catch (Exception unused) {
            return false;
        }
    }
}
