package com.instabridge.ai.protocol;

import a2.c;
import b.c0;
import b.c9;
import b.u4;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u000e\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u000e\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f¨\u0006 "}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent;", b.f42142b, "<init>", "()V", "TextContent", "TextEnd", "ToolCallStart", "ToolCallArgs", "ToolCallEnd", "StateSnapshot", "RunStarted", "RunFinished", k.f40331e, "QuotaExceeded", "DebugInfo", "ReasoningStart", "ReasoningContent", "ReasoningEnd", "Lcom/instabridge/ai/protocol/AGUIEvent$DebugInfo;", "Lcom/instabridge/ai/protocol/AGUIEvent$Error;", "Lcom/instabridge/ai/protocol/AGUIEvent$QuotaExceeded;", "Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningContent;", "Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningStart;", "Lcom/instabridge/ai/protocol/AGUIEvent$RunFinished;", "Lcom/instabridge/ai/protocol/AGUIEvent$RunStarted;", "Lcom/instabridge/ai/protocol/AGUIEvent$StateSnapshot;", "Lcom/instabridge/ai/protocol/AGUIEvent$TextContent;", "Lcom/instabridge/ai/protocol/AGUIEvent$TextEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallArgs;", "Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallStart;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AGUIEvent {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003HÆ\u0003J!\u0010\u000b\u001a\u00020\u00002\u0016\b\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÖ\u0003J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001J\t\u0010\u0011\u001a\u00020\u0004HÖ\u0001R\u001f\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\t¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$DebugInfo;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "data", b.f42142b, b.f42142b, b.f42142b, "<init>", "(Ljava/util/Map;)V", "getData", "()Ljava/util/Map;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DebugInfo extends AGUIEvent {
        public static final int $stable = 8;

        @NotNull
        private final Map<String, Object> data;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public DebugInfo(@NotNull Map<String, ? extends Object> data) {
            super(null);
            Intrinsics.g(data, "data");
            this.data = data;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ DebugInfo copy$default(DebugInfo debugInfo, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                map = debugInfo.data;
            }
            return debugInfo.copy(map);
        }

        @NotNull
        public final Map<String, Object> component1() {
            return this.data;
        }

        @NotNull
        public final DebugInfo copy(@NotNull Map<String, ? extends Object> data) {
            Intrinsics.g(data, "data");
            return new DebugInfo(data);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof DebugInfo) && Intrinsics.b(this.data, ((DebugInfo) other).data);
        }

        @NotNull
        public final Map<String, Object> getData() {
            return this.data;
        }

        public int hashCode() {
            return this.data.hashCode();
        }

        @NotNull
        public String toString() {
            return c9.l(new StringBuilder("DebugInfo(data="), this.data, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$Error;", "Lcom/instabridge/ai/protocol/AGUIEvent;", PglCryptUtils.KEY_MESSAGE, b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "getCode", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Error extends AGUIEvent {
        public static final int $stable = 0;

        @Nullable
        private final String code;

        @NotNull
        private final String message;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Error(@NotNull String message, @Nullable String str) {
            super(null);
            Intrinsics.g(message, "message");
            this.message = message;
            this.code = str;
        }

        public static /* synthetic */ Error copy$default(Error error, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = error.message;
            }
            if ((i5 & 2) != 0) {
                str2 = error.code;
            }
            return error.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getCode() {
            return this.code;
        }

        @NotNull
        public final Error copy(@NotNull String message, @Nullable String code) {
            Intrinsics.g(message, "message");
            return new Error(message, code);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Error)) {
                return false;
            }
            Error error = (Error) other;
            return Intrinsics.b(this.message, error.message) && Intrinsics.b(this.code, error.code);
        }

        @Nullable
        public final String getCode() {
            return this.code;
        }

        @NotNull
        public final String getMessage() {
            return this.message;
        }

        public int hashCode() {
            int iHashCode = this.message.hashCode() * 31;
            String str = this.code;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Error(message=");
            sb2.append(this.message);
            sb2.append(", code=");
            return c1.t(sb2, this.code, ')');
        }

        public /* synthetic */ Error(String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, (i5 & 2) != 0 ? null : str2);
        }
    }

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0006HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003JK\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001eHÖ\u0003J\t\u0010\u001f\u001a\u00020\u0006HÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\rR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\r¨\u0006!"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$QuotaExceeded;", "Lcom/instabridge/ai/protocol/AGUIEvent;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "resetIn", "used", b.f42142b, "limit", "plan", "upgradeUrl", "<init>", "(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "getResetIn", "getUsed", "()I", "getLimit", "getPlan", "getUpgradeUrl", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class QuotaExceeded extends AGUIEvent {
        public static final int $stable = 0;
        private final int limit;

        @NotNull
        private final String message;

        @Nullable
        private final String plan;

        @Nullable
        private final String resetIn;

        @Nullable
        private final String upgradeUrl;
        private final int used;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public QuotaExceeded(@NotNull String message, @Nullable String str, int i5, int i11, @Nullable String str2, @Nullable String str3) {
            super(null);
            Intrinsics.g(message, "message");
            this.message = message;
            this.resetIn = str;
            this.used = i5;
            this.limit = i11;
            this.plan = str2;
            this.upgradeUrl = str3;
        }

        public static /* synthetic */ QuotaExceeded copy$default(QuotaExceeded quotaExceeded, String str, String str2, int i5, int i11, String str3, String str4, int i12, Object obj) {
            if ((i12 & 1) != 0) {
                str = quotaExceeded.message;
            }
            if ((i12 & 2) != 0) {
                str2 = quotaExceeded.resetIn;
            }
            if ((i12 & 4) != 0) {
                i5 = quotaExceeded.used;
            }
            if ((i12 & 8) != 0) {
                i11 = quotaExceeded.limit;
            }
            if ((i12 & 16) != 0) {
                str3 = quotaExceeded.plan;
            }
            if ((i12 & 32) != 0) {
                str4 = quotaExceeded.upgradeUrl;
            }
            String str5 = str3;
            String str6 = str4;
            return quotaExceeded.copy(str, str2, i5, i11, str5, str6);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getResetIn() {
            return this.resetIn;
        }

        /* renamed from: component3, reason: from getter */
        public final int getUsed() {
            return this.used;
        }

        /* renamed from: component4, reason: from getter */
        public final int getLimit() {
            return this.limit;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final String getPlan() {
            return this.plan;
        }

        @Nullable
        /* renamed from: component6, reason: from getter */
        public final String getUpgradeUrl() {
            return this.upgradeUrl;
        }

        @NotNull
        public final QuotaExceeded copy(@NotNull String message, @Nullable String resetIn, int used, int limit, @Nullable String plan, @Nullable String upgradeUrl) {
            Intrinsics.g(message, "message");
            return new QuotaExceeded(message, resetIn, used, limit, plan, upgradeUrl);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof QuotaExceeded)) {
                return false;
            }
            QuotaExceeded quotaExceeded = (QuotaExceeded) other;
            return Intrinsics.b(this.message, quotaExceeded.message) && Intrinsics.b(this.resetIn, quotaExceeded.resetIn) && this.used == quotaExceeded.used && this.limit == quotaExceeded.limit && Intrinsics.b(this.plan, quotaExceeded.plan) && Intrinsics.b(this.upgradeUrl, quotaExceeded.upgradeUrl);
        }

        public final int getLimit() {
            return this.limit;
        }

        @NotNull
        public final String getMessage() {
            return this.message;
        }

        @Nullable
        public final String getPlan() {
            return this.plan;
        }

        @Nullable
        public final String getResetIn() {
            return this.resetIn;
        }

        @Nullable
        public final String getUpgradeUrl() {
            return this.upgradeUrl;
        }

        public final int getUsed() {
            return this.used;
        }

        public int hashCode() {
            int iHashCode = this.message.hashCode() * 31;
            String str = this.resetIn;
            int iA = u4.a(this.limit, u4.a(this.used, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31), 31);
            String str2 = this.plan;
            int iHashCode2 = (iA + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.upgradeUrl;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("QuotaExceeded(message=");
            sb2.append(this.message);
            sb2.append(", resetIn=");
            sb2.append(this.resetIn);
            sb2.append(", used=");
            sb2.append(this.used);
            sb2.append(", limit=");
            sb2.append(this.limit);
            sb2.append(", plan=");
            sb2.append(this.plan);
            sb2.append(", upgradeUrl=");
            return c1.t(sb2, this.upgradeUrl, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningContent;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "messageId", b.f42142b, "delta", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getMessageId", "()Ljava/lang/String;", "getDelta", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ReasoningContent extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String delta;

        @NotNull
        private final String messageId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ReasoningContent(@NotNull String messageId, @NotNull String delta) {
            super(null);
            Intrinsics.g(messageId, "messageId");
            Intrinsics.g(delta, "delta");
            this.messageId = messageId;
            this.delta = delta;
        }

        public static /* synthetic */ ReasoningContent copy$default(ReasoningContent reasoningContent, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = reasoningContent.messageId;
            }
            if ((i5 & 2) != 0) {
                str2 = reasoningContent.delta;
            }
            return reasoningContent.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessageId() {
            return this.messageId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getDelta() {
            return this.delta;
        }

        @NotNull
        public final ReasoningContent copy(@NotNull String messageId, @NotNull String delta) {
            Intrinsics.g(messageId, "messageId");
            Intrinsics.g(delta, "delta");
            return new ReasoningContent(messageId, delta);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ReasoningContent)) {
                return false;
            }
            ReasoningContent reasoningContent = (ReasoningContent) other;
            return Intrinsics.b(this.messageId, reasoningContent.messageId) && Intrinsics.b(this.delta, reasoningContent.delta);
        }

        @NotNull
        public final String getDelta() {
            return this.delta;
        }

        @NotNull
        public final String getMessageId() {
            return this.messageId;
        }

        public int hashCode() {
            return this.delta.hashCode() + (this.messageId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ReasoningContent(messageId=");
            sb2.append(this.messageId);
            sb2.append(", delta=");
            return c1.t(sb2, this.delta, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "messageId", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessageId", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ReasoningEnd extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String messageId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ReasoningEnd(@NotNull String messageId) {
            super(null);
            Intrinsics.g(messageId, "messageId");
            this.messageId = messageId;
        }

        public static /* synthetic */ ReasoningEnd copy$default(ReasoningEnd reasoningEnd, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = reasoningEnd.messageId;
            }
            return reasoningEnd.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessageId() {
            return this.messageId;
        }

        @NotNull
        public final ReasoningEnd copy(@NotNull String messageId) {
            Intrinsics.g(messageId, "messageId");
            return new ReasoningEnd(messageId);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof ReasoningEnd) && Intrinsics.b(this.messageId, ((ReasoningEnd) other).messageId);
        }

        @NotNull
        public final String getMessageId() {
            return this.messageId;
        }

        public int hashCode() {
            return this.messageId.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("ReasoningEnd(messageId="), this.messageId, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ReasoningStart;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "messageId", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessageId", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ReasoningStart extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String messageId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ReasoningStart(@NotNull String messageId) {
            super(null);
            Intrinsics.g(messageId, "messageId");
            this.messageId = messageId;
        }

        public static /* synthetic */ ReasoningStart copy$default(ReasoningStart reasoningStart, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = reasoningStart.messageId;
            }
            return reasoningStart.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessageId() {
            return this.messageId;
        }

        @NotNull
        public final ReasoningStart copy(@NotNull String messageId) {
            Intrinsics.g(messageId, "messageId");
            return new ReasoningStart(messageId);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof ReasoningStart) && Intrinsics.b(this.messageId, ((ReasoningStart) other).messageId);
        }

        @NotNull
        public final String getMessageId() {
            return this.messageId;
        }

        public int hashCode() {
            return this.messageId.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("ReasoningStart(messageId="), this.messageId, ')');
        }
    }

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ2\u0010\u0012\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$RunFinished;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "threadId", b.f42142b, "runId", "assistantMessageIndex", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V", "getThreadId", "()Ljava/lang/String;", "getRunId", "getAssistantMessageIndex", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lcom/instabridge/ai/protocol/AGUIEvent$RunFinished;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class RunFinished extends AGUIEvent {
        public static final int $stable = 0;

        @Nullable
        private final Integer assistantMessageIndex;

        @Nullable
        private final String runId;

        @Nullable
        private final String threadId;

        public /* synthetic */ RunFinished(String str, String str2, Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i5 & 4) != 0 ? null : num);
        }

        public static /* synthetic */ RunFinished copy$default(RunFinished runFinished, String str, String str2, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = runFinished.threadId;
            }
            if ((i5 & 2) != 0) {
                str2 = runFinished.runId;
            }
            if ((i5 & 4) != 0) {
                num = runFinished.assistantMessageIndex;
            }
            return runFinished.copy(str, str2, num);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final String getThreadId() {
            return this.threadId;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getRunId() {
            return this.runId;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final Integer getAssistantMessageIndex() {
            return this.assistantMessageIndex;
        }

        @NotNull
        public final RunFinished copy(@Nullable String threadId, @Nullable String runId, @Nullable Integer assistantMessageIndex) {
            return new RunFinished(threadId, runId, assistantMessageIndex);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RunFinished)) {
                return false;
            }
            RunFinished runFinished = (RunFinished) other;
            return Intrinsics.b(this.threadId, runFinished.threadId) && Intrinsics.b(this.runId, runFinished.runId) && Intrinsics.b(this.assistantMessageIndex, runFinished.assistantMessageIndex);
        }

        @Nullable
        public final Integer getAssistantMessageIndex() {
            return this.assistantMessageIndex;
        }

        @Nullable
        public final String getRunId() {
            return this.runId;
        }

        @Nullable
        public final String getThreadId() {
            return this.threadId;
        }

        public int hashCode() {
            String str = this.threadId;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.runId;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            Integer num = this.assistantMessageIndex;
            return iHashCode2 + (num != null ? num.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("RunFinished(threadId=");
            sb2.append(this.threadId);
            sb2.append(", runId=");
            sb2.append(this.runId);
            sb2.append(", assistantMessageIndex=");
            return c.o(sb2, this.assistantMessageIndex, ')');
        }

        public RunFinished(@Nullable String str, @Nullable String str2, @Nullable Integer num) {
            super(null);
            this.threadId = str;
            this.runId = str2;
            this.assistantMessageIndex = num;
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000b\u0010\n\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J!\u0010\f\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$RunStarted;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "threadId", b.f42142b, "runId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getThreadId", "()Ljava/lang/String;", "getRunId", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class RunStarted extends AGUIEvent {
        public static final int $stable = 0;

        @Nullable
        private final String runId;

        @Nullable
        private final String threadId;

        public RunStarted(@Nullable String str, @Nullable String str2) {
            super(null);
            this.threadId = str;
            this.runId = str2;
        }

        public static /* synthetic */ RunStarted copy$default(RunStarted runStarted, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = runStarted.threadId;
            }
            if ((i5 & 2) != 0) {
                str2 = runStarted.runId;
            }
            return runStarted.copy(str, str2);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final String getThreadId() {
            return this.threadId;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getRunId() {
            return this.runId;
        }

        @NotNull
        public final RunStarted copy(@Nullable String threadId, @Nullable String runId) {
            return new RunStarted(threadId, runId);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RunStarted)) {
                return false;
            }
            RunStarted runStarted = (RunStarted) other;
            return Intrinsics.b(this.threadId, runStarted.threadId) && Intrinsics.b(this.runId, runStarted.runId);
        }

        @Nullable
        public final String getRunId() {
            return this.runId;
        }

        @Nullable
        public final String getThreadId() {
            return this.threadId;
        }

        public int hashCode() {
            String str = this.threadId;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.runId;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("RunStarted(threadId=");
            sb2.append(this.threadId);
            sb2.append(", runId=");
            return c1.t(sb2, this.runId, ')');
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BC\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\t0\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u000bHÆ\u0003JM\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001fHÖ\u0003J\t\u0010 \u001a\u00020!HÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000fR\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006#"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$StateSnapshot;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "title", b.f42142b, "suggestions", b.f42142b, "Lcom/instabridge/ai/protocol/Suggestion;", "status", "pendingToolCalls", "Lcom/instabridge/ai/protocol/PendingToolCall;", "progress", "Lcom/instabridge/ai/protocol/ProgressUpdate;", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lcom/instabridge/ai/protocol/ProgressUpdate;)V", "getTitle", "()Ljava/lang/String;", "getSuggestions", "()Ljava/util/List;", "getStatus", "getPendingToolCalls", "getProgress", "()Lcom/instabridge/ai/protocol/ProgressUpdate;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class StateSnapshot extends AGUIEvent {
        public static final int $stable = 8;

        @NotNull
        private final List<PendingToolCall> pendingToolCalls;

        @Nullable
        private final ProgressUpdate progress;

        @Nullable
        private final String status;

        @NotNull
        private final List<Suggestion> suggestions;

        @Nullable
        private final String title;

        public /* synthetic */ StateSnapshot(String str, List list, String str2, List list2, ProgressUpdate progressUpdate, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, list, str2, list2, (i5 & 16) != 0 ? null : progressUpdate);
        }

        public static /* synthetic */ StateSnapshot copy$default(StateSnapshot stateSnapshot, String str, List list, String str2, List list2, ProgressUpdate progressUpdate, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = stateSnapshot.title;
            }
            if ((i5 & 2) != 0) {
                list = stateSnapshot.suggestions;
            }
            if ((i5 & 4) != 0) {
                str2 = stateSnapshot.status;
            }
            if ((i5 & 8) != 0) {
                list2 = stateSnapshot.pendingToolCalls;
            }
            if ((i5 & 16) != 0) {
                progressUpdate = stateSnapshot.progress;
            }
            ProgressUpdate progressUpdate2 = progressUpdate;
            String str3 = str2;
            return stateSnapshot.copy(str, list, str3, list2, progressUpdate2);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final List<Suggestion> component2() {
            return this.suggestions;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final String getStatus() {
            return this.status;
        }

        @NotNull
        public final List<PendingToolCall> component4() {
            return this.pendingToolCalls;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final ProgressUpdate getProgress() {
            return this.progress;
        }

        @NotNull
        public final StateSnapshot copy(@Nullable String title, @NotNull List<Suggestion> suggestions, @Nullable String status, @NotNull List<PendingToolCall> pendingToolCalls, @Nullable ProgressUpdate progress) {
            Intrinsics.g(suggestions, "suggestions");
            Intrinsics.g(pendingToolCalls, "pendingToolCalls");
            return new StateSnapshot(title, suggestions, status, pendingToolCalls, progress);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof StateSnapshot)) {
                return false;
            }
            StateSnapshot stateSnapshot = (StateSnapshot) other;
            return Intrinsics.b(this.title, stateSnapshot.title) && Intrinsics.b(this.suggestions, stateSnapshot.suggestions) && Intrinsics.b(this.status, stateSnapshot.status) && Intrinsics.b(this.pendingToolCalls, stateSnapshot.pendingToolCalls) && Intrinsics.b(this.progress, stateSnapshot.progress);
        }

        @NotNull
        public final List<PendingToolCall> getPendingToolCalls() {
            return this.pendingToolCalls;
        }

        @Nullable
        public final ProgressUpdate getProgress() {
            return this.progress;
        }

        @Nullable
        public final String getStatus() {
            return this.status;
        }

        @NotNull
        public final List<Suggestion> getSuggestions() {
            return this.suggestions;
        }

        @Nullable
        public final String getTitle() {
            return this.title;
        }

        public int hashCode() {
            String str = this.title;
            int iC = u4.c((str == null ? 0 : str.hashCode()) * 31, 31, this.suggestions);
            String str2 = this.status;
            int iC2 = u4.c((iC + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.pendingToolCalls);
            ProgressUpdate progressUpdate = this.progress;
            return iC2 + (progressUpdate != null ? progressUpdate.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            return "StateSnapshot(title=" + this.title + ", suggestions=" + this.suggestions + ", status=" + this.status + ", pendingToolCalls=" + this.pendingToolCalls + ", progress=" + this.progress + ')';
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public StateSnapshot(@Nullable String str, @NotNull List<Suggestion> suggestions, @Nullable String str2, @NotNull List<PendingToolCall> pendingToolCalls, @Nullable ProgressUpdate progressUpdate) {
            super(null);
            Intrinsics.g(suggestions, "suggestions");
            Intrinsics.g(pendingToolCalls, "pendingToolCalls");
            this.title = str;
            this.suggestions = suggestions;
            this.status = str2;
            this.pendingToolCalls = pendingToolCalls;
            this.progress = progressUpdate;
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$TextContent;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "messageId", b.f42142b, "delta", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getMessageId", "()Ljava/lang/String;", "getDelta", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class TextContent extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String delta;

        @NotNull
        private final String messageId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public TextContent(@NotNull String messageId, @NotNull String delta) {
            super(null);
            Intrinsics.g(messageId, "messageId");
            Intrinsics.g(delta, "delta");
            this.messageId = messageId;
            this.delta = delta;
        }

        public static /* synthetic */ TextContent copy$default(TextContent textContent, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = textContent.messageId;
            }
            if ((i5 & 2) != 0) {
                str2 = textContent.delta;
            }
            return textContent.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessageId() {
            return this.messageId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getDelta() {
            return this.delta;
        }

        @NotNull
        public final TextContent copy(@NotNull String messageId, @NotNull String delta) {
            Intrinsics.g(messageId, "messageId");
            Intrinsics.g(delta, "delta");
            return new TextContent(messageId, delta);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TextContent)) {
                return false;
            }
            TextContent textContent = (TextContent) other;
            return Intrinsics.b(this.messageId, textContent.messageId) && Intrinsics.b(this.delta, textContent.delta);
        }

        @NotNull
        public final String getDelta() {
            return this.delta;
        }

        @NotNull
        public final String getMessageId() {
            return this.messageId;
        }

        public int hashCode() {
            return this.delta.hashCode() + (this.messageId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("TextContent(messageId=");
            sb2.append(this.messageId);
            sb2.append(", delta=");
            return c1.t(sb2, this.delta, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$TextEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "messageId", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessageId", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class TextEnd extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String messageId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public TextEnd(@NotNull String messageId) {
            super(null);
            Intrinsics.g(messageId, "messageId");
            this.messageId = messageId;
        }

        public static /* synthetic */ TextEnd copy$default(TextEnd textEnd, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = textEnd.messageId;
            }
            return textEnd.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessageId() {
            return this.messageId;
        }

        @NotNull
        public final TextEnd copy(@NotNull String messageId) {
            Intrinsics.g(messageId, "messageId");
            return new TextEnd(messageId);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof TextEnd) && Intrinsics.b(this.messageId, ((TextEnd) other).messageId);
        }

        @NotNull
        public final String getMessageId() {
            return this.messageId;
        }

        public int hashCode() {
            return this.messageId.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("TextEnd(messageId="), this.messageId, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallArgs;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "toolCallId", b.f42142b, "args", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getToolCallId", "()Ljava/lang/String;", "getArgs", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ToolCallArgs extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String args;

        @NotNull
        private final String toolCallId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ToolCallArgs(@NotNull String toolCallId, @NotNull String args) {
            super(null);
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(args, "args");
            this.toolCallId = toolCallId;
            this.args = args;
        }

        public static /* synthetic */ ToolCallArgs copy$default(ToolCallArgs toolCallArgs, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = toolCallArgs.toolCallId;
            }
            if ((i5 & 2) != 0) {
                str2 = toolCallArgs.args;
            }
            return toolCallArgs.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getToolCallId() {
            return this.toolCallId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getArgs() {
            return this.args;
        }

        @NotNull
        public final ToolCallArgs copy(@NotNull String toolCallId, @NotNull String args) {
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(args, "args");
            return new ToolCallArgs(toolCallId, args);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ToolCallArgs)) {
                return false;
            }
            ToolCallArgs toolCallArgs = (ToolCallArgs) other;
            return Intrinsics.b(this.toolCallId, toolCallArgs.toolCallId) && Intrinsics.b(this.args, toolCallArgs.args);
        }

        @NotNull
        public final String getArgs() {
            return this.args;
        }

        @NotNull
        public final String getToolCallId() {
            return this.toolCallId;
        }

        public int hashCode() {
            return this.args.hashCode() + (this.toolCallId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ToolCallArgs(toolCallId=");
            sb2.append(this.toolCallId);
            sb2.append(", args=");
            return c1.t(sb2, this.args, ')');
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0016\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u0019\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003JC\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0018\b\u0002\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR!\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\f¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallEnd;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "toolCallId", b.f42142b, "toolName", "result", b.f42142b, b.f42142b, "error", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V", "getToolCallId", "()Ljava/lang/String;", "getToolName", "getResult", "()Ljava/util/Map;", "getError", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ToolCallEnd extends AGUIEvent {
        public static final int $stable = 8;

        @Nullable
        private final String error;

        @Nullable
        private final Map<String, Object> result;

        @NotNull
        private final String toolCallId;

        @NotNull
        private final String toolName;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ToolCallEnd(@NotNull String toolCallId, @NotNull String toolName, @Nullable Map<String, ? extends Object> map, @Nullable String str) {
            super(null);
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(toolName, "toolName");
            this.toolCallId = toolCallId;
            this.toolName = toolName;
            this.result = map;
            this.error = str;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ToolCallEnd copy$default(ToolCallEnd toolCallEnd, String str, String str2, Map map, String str3, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = toolCallEnd.toolCallId;
            }
            if ((i5 & 2) != 0) {
                str2 = toolCallEnd.toolName;
            }
            if ((i5 & 4) != 0) {
                map = toolCallEnd.result;
            }
            if ((i5 & 8) != 0) {
                str3 = toolCallEnd.error;
            }
            return toolCallEnd.copy(str, str2, map, str3);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getToolCallId() {
            return this.toolCallId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getToolName() {
            return this.toolName;
        }

        @Nullable
        public final Map<String, Object> component3() {
            return this.result;
        }

        @Nullable
        /* renamed from: component4, reason: from getter */
        public final String getError() {
            return this.error;
        }

        @NotNull
        public final ToolCallEnd copy(@NotNull String toolCallId, @NotNull String toolName, @Nullable Map<String, ? extends Object> result, @Nullable String error) {
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(toolName, "toolName");
            return new ToolCallEnd(toolCallId, toolName, result, error);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ToolCallEnd)) {
                return false;
            }
            ToolCallEnd toolCallEnd = (ToolCallEnd) other;
            return Intrinsics.b(this.toolCallId, toolCallEnd.toolCallId) && Intrinsics.b(this.toolName, toolCallEnd.toolName) && Intrinsics.b(this.result, toolCallEnd.result) && Intrinsics.b(this.error, toolCallEnd.error);
        }

        @Nullable
        public final String getError() {
            return this.error;
        }

        @Nullable
        public final Map<String, Object> getResult() {
            return this.result;
        }

        @NotNull
        public final String getToolCallId() {
            return this.toolCallId;
        }

        @NotNull
        public final String getToolName() {
            return this.toolName;
        }

        public int hashCode() {
            int iE = c0.e(this.toolCallId.hashCode() * 31, 31, this.toolName);
            Map<String, Object> map = this.result;
            int iHashCode = (iE + (map == null ? 0 : map.hashCode())) * 31;
            String str = this.error;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ToolCallEnd(toolCallId=");
            sb2.append(this.toolCallId);
            sb2.append(", toolName=");
            sb2.append(this.toolName);
            sb2.append(", result=");
            sb2.append(this.result);
            sb2.append(", error=");
            return c1.t(sb2, this.error, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/protocol/AGUIEvent$ToolCallStart;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "toolCallId", b.f42142b, "toolName", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getToolCallId", "()Ljava/lang/String;", "getToolName", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ToolCallStart extends AGUIEvent {
        public static final int $stable = 0;

        @NotNull
        private final String toolCallId;

        @NotNull
        private final String toolName;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ToolCallStart(@NotNull String toolCallId, @NotNull String toolName) {
            super(null);
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(toolName, "toolName");
            this.toolCallId = toolCallId;
            this.toolName = toolName;
        }

        public static /* synthetic */ ToolCallStart copy$default(ToolCallStart toolCallStart, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = toolCallStart.toolCallId;
            }
            if ((i5 & 2) != 0) {
                str2 = toolCallStart.toolName;
            }
            return toolCallStart.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getToolCallId() {
            return this.toolCallId;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getToolName() {
            return this.toolName;
        }

        @NotNull
        public final ToolCallStart copy(@NotNull String toolCallId, @NotNull String toolName) {
            Intrinsics.g(toolCallId, "toolCallId");
            Intrinsics.g(toolName, "toolName");
            return new ToolCallStart(toolCallId, toolName);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ToolCallStart)) {
                return false;
            }
            ToolCallStart toolCallStart = (ToolCallStart) other;
            return Intrinsics.b(this.toolCallId, toolCallStart.toolCallId) && Intrinsics.b(this.toolName, toolCallStart.toolName);
        }

        @NotNull
        public final String getToolCallId() {
            return this.toolCallId;
        }

        @NotNull
        public final String getToolName() {
            return this.toolName;
        }

        public int hashCode() {
            return this.toolName.hashCode() + (this.toolCallId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ToolCallStart(toolCallId=");
            sb2.append(this.toolCallId);
            sb2.append(", toolName=");
            return c1.t(sb2, this.toolName, ')');
        }
    }

    public /* synthetic */ AGUIEvent(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AGUIEvent() {
    }
}
