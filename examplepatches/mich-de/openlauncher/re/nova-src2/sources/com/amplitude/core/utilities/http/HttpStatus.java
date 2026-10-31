package com.amplitude.core.utilities.http;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\t\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0012"}, d2 = {"Lcom/amplitude/core/utilities/http/HttpStatus;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, "range", "Lkotlin/ranges/IntRange;", "(Ljava/lang/String;IILkotlin/ranges/IntRange;)V", "getRange", "()Lkotlin/ranges/IntRange;", "statusCode", "getStatusCode", "()I", "SUCCESS", "BAD_REQUEST", "TIMEOUT", "PAYLOAD_TOO_LARGE", "TOO_MANY_REQUESTS", "FAILED", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class HttpStatus {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ HttpStatus[] $VALUES;

    @NotNull
    private final IntRange range;
    public static final HttpStatus SUCCESS = new HttpStatus("SUCCESS", 0, 200, new IntRange(200, 299, 1));
    public static final HttpStatus BAD_REQUEST = new HttpStatus("BAD_REQUEST", 1, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null, 2, null);
    public static final HttpStatus TIMEOUT = new HttpStatus("TIMEOUT", 2, TTAdConstant.DOWNLOAD_URL_CODE, null, 2, null);
    public static final HttpStatus PAYLOAD_TOO_LARGE = new HttpStatus("PAYLOAD_TOO_LARGE", 3, TTAdConstant.VIDEO_INFO_CODE, null, 2, null);
    public static final HttpStatus TOO_MANY_REQUESTS = new HttpStatus("TOO_MANY_REQUESTS", 4, 429, null, 2, null);
    public static final HttpStatus FAILED = new HttpStatus("FAILED", 5, 500, new IntRange(500, 599, 1));

    private static final /* synthetic */ HttpStatus[] $values() {
        return new HttpStatus[]{SUCCESS, BAD_REQUEST, TIMEOUT, PAYLOAD_TOO_LARGE, TOO_MANY_REQUESTS, FAILED};
    }

    static {
        HttpStatus[] httpStatusArr$values = $values();
        $VALUES = httpStatusArr$values;
        $ENTRIES = EnumEntriesKt.a(httpStatusArr$values);
    }

    private HttpStatus(String str, int i5, int i11, IntRange intRange) {
        this.range = intRange;
    }

    @NotNull
    public static EnumEntries<HttpStatus> getEntries() {
        return $ENTRIES;
    }

    public static HttpStatus valueOf(String str) {
        return (HttpStatus) Enum.valueOf(HttpStatus.class, str);
    }

    public static HttpStatus[] values() {
        return (HttpStatus[]) $VALUES.clone();
    }

    @NotNull
    public final IntRange getRange() {
        return this.range;
    }

    public final int getStatusCode() {
        return this.range.f71906a;
    }

    public HttpStatus(String str, int i5, int i11, IntRange intRange, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, i5, i11, (i12 & 2) != 0 ? new IntRange(i11, i11, 1) : intRange);
    }
}
