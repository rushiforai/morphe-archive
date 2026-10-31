package com.instabridge.ai.auth;

import aq.o;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\b\u0019\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001Be\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0001\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0001\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\u0016\b\u0001\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0012J\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0012J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u001f\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u000bHÆ\u0003Jn\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u00032\u0016\b\u0003\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u000bHÆ\u0001¢\u0006\u0002\u0010!J\u0013\u0010\"\u001a\u00020\u00062\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020%HÖ\u0001J\t\u0010&\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0013\u001a\u0004\b\u0011\u0010\u0012R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0013\u001a\u0004\b\u0014\u0010\u0012R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u000fR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000fR\u001f\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018¨\u0006'"}, d2 = {"Lcom/instabridge/ai/auth/ConsentResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "personId", "contextConsentAsked", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "contextConsentEnabled", "contextConsentGrantedAt", "contextConsentRevokedAt", "contextConsentTypes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "getStatus", "()Ljava/lang/String;", "getPersonId", "getContextConsentAsked", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getContextConsentEnabled", "getContextConsentGrantedAt", "getContextConsentRevokedAt", "getContextConsentTypes", "()Ljava/util/Map;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/instabridge/ai/auth/ConsentResponse;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ConsentResponse {

    @Nullable
    private final Boolean contextConsentAsked;

    @Nullable
    private final Boolean contextConsentEnabled;

    @Nullable
    private final String contextConsentGrantedAt;

    @Nullable
    private final String contextConsentRevokedAt;

    @Nullable
    private final Map<String, Boolean> contextConsentTypes;

    @Nullable
    private final String personId;

    @Nullable
    private final String status;

    public ConsentResponse(@Nullable String str, @o(name = "person_id") @Nullable String str2, @o(name = "context_consent_asked") @Nullable Boolean bool, @o(name = "context_consent_enabled") @Nullable Boolean bool2, @o(name = "context_consent_granted_at") @Nullable String str3, @o(name = "context_consent_revoked_at") @Nullable String str4, @o(name = "context_consent_types") @Nullable Map<String, Boolean> map) {
        this.status = str;
        this.personId = str2;
        this.contextConsentAsked = bool;
        this.contextConsentEnabled = bool2;
        this.contextConsentGrantedAt = str3;
        this.contextConsentRevokedAt = str4;
        this.contextConsentTypes = map;
    }

    public static /* synthetic */ ConsentResponse copy$default(ConsentResponse consentResponse, String str, String str2, Boolean bool, Boolean bool2, String str3, String str4, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = consentResponse.status;
        }
        if ((i5 & 2) != 0) {
            str2 = consentResponse.personId;
        }
        if ((i5 & 4) != 0) {
            bool = consentResponse.contextConsentAsked;
        }
        if ((i5 & 8) != 0) {
            bool2 = consentResponse.contextConsentEnabled;
        }
        if ((i5 & 16) != 0) {
            str3 = consentResponse.contextConsentGrantedAt;
        }
        if ((i5 & 32) != 0) {
            str4 = consentResponse.contextConsentRevokedAt;
        }
        if ((i5 & 64) != 0) {
            map = consentResponse.contextConsentTypes;
        }
        String str5 = str4;
        Map map2 = map;
        String str6 = str3;
        Boolean bool3 = bool;
        return consentResponse.copy(str, str2, bool3, bool2, str6, str5, map2);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getPersonId() {
        return this.personId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Boolean getContextConsentAsked() {
        return this.contextConsentAsked;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Boolean getContextConsentEnabled() {
        return this.contextConsentEnabled;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getContextConsentGrantedAt() {
        return this.contextConsentGrantedAt;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getContextConsentRevokedAt() {
        return this.contextConsentRevokedAt;
    }

    @Nullable
    public final Map<String, Boolean> component7() {
        return this.contextConsentTypes;
    }

    @NotNull
    public final ConsentResponse copy(@Nullable String status, @o(name = "person_id") @Nullable String personId, @o(name = "context_consent_asked") @Nullable Boolean contextConsentAsked, @o(name = "context_consent_enabled") @Nullable Boolean contextConsentEnabled, @o(name = "context_consent_granted_at") @Nullable String contextConsentGrantedAt, @o(name = "context_consent_revoked_at") @Nullable String contextConsentRevokedAt, @o(name = "context_consent_types") @Nullable Map<String, Boolean> contextConsentTypes) {
        return new ConsentResponse(status, personId, contextConsentAsked, contextConsentEnabled, contextConsentGrantedAt, contextConsentRevokedAt, contextConsentTypes);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ConsentResponse)) {
            return false;
        }
        ConsentResponse consentResponse = (ConsentResponse) other;
        return Intrinsics.b(this.status, consentResponse.status) && Intrinsics.b(this.personId, consentResponse.personId) && Intrinsics.b(this.contextConsentAsked, consentResponse.contextConsentAsked) && Intrinsics.b(this.contextConsentEnabled, consentResponse.contextConsentEnabled) && Intrinsics.b(this.contextConsentGrantedAt, consentResponse.contextConsentGrantedAt) && Intrinsics.b(this.contextConsentRevokedAt, consentResponse.contextConsentRevokedAt) && Intrinsics.b(this.contextConsentTypes, consentResponse.contextConsentTypes);
    }

    @Nullable
    public final Boolean getContextConsentAsked() {
        return this.contextConsentAsked;
    }

    @Nullable
    public final Boolean getContextConsentEnabled() {
        return this.contextConsentEnabled;
    }

    @Nullable
    public final String getContextConsentGrantedAt() {
        return this.contextConsentGrantedAt;
    }

    @Nullable
    public final String getContextConsentRevokedAt() {
        return this.contextConsentRevokedAt;
    }

    @Nullable
    public final Map<String, Boolean> getContextConsentTypes() {
        return this.contextConsentTypes;
    }

    @Nullable
    public final String getPersonId() {
        return this.personId;
    }

    @Nullable
    public final String getStatus() {
        return this.status;
    }

    public int hashCode() {
        String str = this.status;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.personId;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Boolean bool = this.contextConsentAsked;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.contextConsentEnabled;
        int iHashCode4 = (iHashCode3 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        String str3 = this.contextConsentGrantedAt;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.contextConsentRevokedAt;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Map<String, Boolean> map = this.contextConsentTypes;
        return iHashCode6 + (map != null ? map.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ConsentResponse(status=");
        sb2.append(this.status);
        sb2.append(", personId=");
        sb2.append(this.personId);
        sb2.append(", contextConsentAsked=");
        sb2.append(this.contextConsentAsked);
        sb2.append(", contextConsentEnabled=");
        sb2.append(this.contextConsentEnabled);
        sb2.append(", contextConsentGrantedAt=");
        sb2.append(this.contextConsentGrantedAt);
        sb2.append(", contextConsentRevokedAt=");
        sb2.append(this.contextConsentRevokedAt);
        sb2.append(", contextConsentTypes=");
        return c9.l(sb2, this.contextConsentTypes, ')');
    }
}
