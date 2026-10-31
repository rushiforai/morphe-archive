package com.amplitude.core.utilities.http;

import a2.c;
import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0012J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\tHÆ\u0003JD\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001¢\u0006\u0002\u0010\u001cJ\u0013\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\u0006\u0010 \u001a\u00020\u0003J\r\u0010\r\u001a\u00020\u0003H\u0000¢\u0006\u0002\b!J\t\u0010\"\u001a\u00020\u0006HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\fR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0013\u001a\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006$"}, d2 = {"Lcom/amplitude/core/utilities/http/AnalyticsRequest;", b.f42142b, "apiKey", b.f42142b, DatabaseConstants.EVENT_TABLE_NAME, "minIdLength", b.f42142b, "diagnostics", "clientUploadTime", b.f42142b, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;J)V", "getApiKey", "()Ljava/lang/String;", "getClientUploadTime", "()J", "getDiagnostics", "getEvents", "getMinIdLength", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "sdf", "Ljava/text/SimpleDateFormat;", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;J)Lcom/amplitude/core/utilities/http/AnalyticsRequest;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "getBodyStr", "getClientUploadTime$core", "hashCode", "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class AnalyticsRequest {

    @NotNull
    private final String apiKey;
    private final long clientUploadTime;

    @Nullable
    private final String diagnostics;

    @NotNull
    private final String events;

    @Nullable
    private final Integer minIdLength;

    @NotNull
    private final SimpleDateFormat sdf;

    public AnalyticsRequest(@NotNull String apiKey, @NotNull String events, @Nullable Integer num, @Nullable String str, long j11) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(events, "events");
        this.apiKey = apiKey;
        this.events = events;
        this.minIdLength = num;
        this.diagnostics = str;
        this.clientUploadTime = j11;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        this.sdf = simpleDateFormat;
    }

    public static /* synthetic */ AnalyticsRequest copy$default(AnalyticsRequest analyticsRequest, String str, String str2, Integer num, String str3, long j11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = analyticsRequest.apiKey;
        }
        if ((i5 & 2) != 0) {
            str2 = analyticsRequest.events;
        }
        if ((i5 & 4) != 0) {
            num = analyticsRequest.minIdLength;
        }
        if ((i5 & 8) != 0) {
            str3 = analyticsRequest.diagnostics;
        }
        if ((i5 & 16) != 0) {
            j11 = analyticsRequest.clientUploadTime;
        }
        long j12 = j11;
        return analyticsRequest.copy(str, str2, num, str3, j12);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getApiKey() {
        return this.apiKey;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getEvents() {
        return this.events;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Integer getMinIdLength() {
        return this.minIdLength;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getDiagnostics() {
        return this.diagnostics;
    }

    /* renamed from: component5, reason: from getter */
    public final long getClientUploadTime() {
        return this.clientUploadTime;
    }

    @NotNull
    public final AnalyticsRequest copy(@NotNull String apiKey, @NotNull String events, @Nullable Integer minIdLength, @Nullable String diagnostics, long clientUploadTime) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(events, "events");
        return new AnalyticsRequest(apiKey, events, minIdLength, diagnostics, clientUploadTime);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AnalyticsRequest)) {
            return false;
        }
        AnalyticsRequest analyticsRequest = (AnalyticsRequest) other;
        return Intrinsics.b(this.apiKey, analyticsRequest.apiKey) && Intrinsics.b(this.events, analyticsRequest.events) && Intrinsics.b(this.minIdLength, analyticsRequest.minIdLength) && Intrinsics.b(this.diagnostics, analyticsRequest.diagnostics) && this.clientUploadTime == analyticsRequest.clientUploadTime;
    }

    @NotNull
    public final String getApiKey() {
        return this.apiKey;
    }

    @NotNull
    public final String getBodyStr() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append("{\"api_key\":\"" + this.apiKey + "\",\"client_upload_time\":\"" + getClientUploadTime$core() + "\",\"events\":" + this.events);
        if (this.minIdLength != null) {
            sb2.append(",\"options\":{\"min_id_length\":" + this.minIdLength + AbstractJsonLexerKt.END_OBJ);
        }
        if (this.diagnostics != null) {
            sb2.append(",\"request_metadata\":{\"sdk\":" + this.diagnostics + AbstractJsonLexerKt.END_OBJ);
        }
        sb2.append("}");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public final long getClientUploadTime() {
        return this.clientUploadTime;
    }

    @NotNull
    public final String getClientUploadTime$core() {
        String str = this.sdf.format(new Date(this.clientUploadTime));
        Intrinsics.f(str, "format(...)");
        return str;
    }

    @Nullable
    public final String getDiagnostics() {
        return this.diagnostics;
    }

    @NotNull
    public final String getEvents() {
        return this.events;
    }

    @Nullable
    public final Integer getMinIdLength() {
        return this.minIdLength;
    }

    public int hashCode() {
        int iE = c0.e(this.apiKey.hashCode() * 31, 31, this.events);
        Integer num = this.minIdLength;
        int iHashCode = (iE + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.diagnostics;
        return Long.hashCode(this.clientUploadTime) + ((iHashCode + (str != null ? str.hashCode() : 0)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AnalyticsRequest(apiKey=");
        sb2.append(this.apiKey);
        sb2.append(", events=");
        sb2.append(this.events);
        sb2.append(", minIdLength=");
        sb2.append(this.minIdLength);
        sb2.append(", diagnostics=");
        sb2.append(this.diagnostics);
        sb2.append(", clientUploadTime=");
        return c.n(sb2, this.clientUploadTime, ')');
    }

    public /* synthetic */ AnalyticsRequest(String str, String str2, Integer num, String str3, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : num, (i5 & 8) != 0 ? null : str3, (i5 & 16) != 0 ? System.currentTimeMillis() : j11);
    }
}
