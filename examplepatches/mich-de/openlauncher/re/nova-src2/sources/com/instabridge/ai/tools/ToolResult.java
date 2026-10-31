package com.instabridge.ai.tools;

import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0007\b\tB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003J\u0014\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005\u0082\u0001\u0003\n\u000b\f¨\u0006\r"}, d2 = {"Lcom/instabridge/ai/tools/ToolResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "toMap", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Success", k.f40331e, "NeedsUserInput", "Lcom/instabridge/ai/tools/ToolResult$Error;", "Lcom/instabridge/ai/tools/ToolResult$NeedsUserInput;", "Lcom/instabridge/ai/tools/ToolResult$Success;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public abstract class ToolResult {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/tools/ToolResult$Error;", "Lcom/instabridge/ai/tools/ToolResult;", "error", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getError", "()Ljava/lang/String;", "getCode", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Error extends ToolResult {
        public static final int $stable = 0;

        @Nullable
        private final String code;

        @NotNull
        private final String error;

        public /* synthetic */ Error(String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, (i5 & 2) != 0 ? null : str2);
        }

        public static /* synthetic */ Error copy$default(Error error, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = error.error;
            }
            if ((i5 & 2) != 0) {
                str2 = error.code;
            }
            return error.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getError() {
            return this.error;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getCode() {
            return this.code;
        }

        @NotNull
        public final Error copy(@NotNull String error, @Nullable String code) {
            Intrinsics.g(error, "error");
            return new Error(error, code);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Error)) {
                return false;
            }
            Error error = (Error) other;
            return Intrinsics.b(this.error, error.error) && Intrinsics.b(this.code, error.code);
        }

        @Nullable
        public final String getCode() {
            return this.code;
        }

        @NotNull
        public final String getError() {
            return this.error;
        }

        public int hashCode() {
            int iHashCode = this.error.hashCode() * 31;
            String str = this.code;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Error(error=");
            sb2.append(this.error);
            sb2.append(", code=");
            return c1.t(sb2, this.code, ')');
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Error(@NotNull String error, @Nullable String str) {
            super(null);
            Intrinsics.g(error, "error");
            this.error = error;
            this.code = str;
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B)\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0004HÆ\u0003J-\u0010\u000f\u001a\u00020\u00002\u0016\b\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0004HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0004HÖ\u0001R\u001f\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/tools/ToolResult$Success;", "Lcom/instabridge/ai/tools/ToolResult;", "data", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PglCryptUtils.KEY_MESSAGE, "<init>", "(Ljava/util/Map;Ljava/lang/String;)V", "getData", "()Ljava/util/Map;", "getMessage", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success extends ToolResult {
        public static final int $stable = 8;

        @NotNull
        private final Map<String, Object> data;

        @Nullable
        private final String message;

        public /* synthetic */ Success(Map map, String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(map, (i5 & 2) != 0 ? null : str);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Success copy$default(Success success, Map map, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                map = success.data;
            }
            if ((i5 & 2) != 0) {
                str = success.message;
            }
            return success.copy(map, str);
        }

        @NotNull
        public final Map<String, Object> component1() {
            return this.data;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        @NotNull
        public final Success copy(@NotNull Map<String, ? extends Object> data, @Nullable String message) {
            Intrinsics.g(data, "data");
            return new Success(data, message);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Success)) {
                return false;
            }
            Success success = (Success) other;
            return Intrinsics.b(this.data, success.data) && Intrinsics.b(this.message, success.message);
        }

        @NotNull
        public final Map<String, Object> getData() {
            return this.data;
        }

        @Nullable
        public final String getMessage() {
            return this.message;
        }

        public int hashCode() {
            int iHashCode = this.data.hashCode() * 31;
            String str = this.message;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Success(data=");
            sb2.append(this.data);
            sb2.append(", message=");
            return c1.t(sb2, this.message, ')');
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Success(@NotNull Map<String, ? extends Object> data, @Nullable String str) {
            super(null);
            Intrinsics.g(data, "data");
            this.data = data;
            this.message = str;
        }
    }

    public /* synthetic */ ToolResult(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @NotNull
    public final Map<String, Object> toMap() {
        if (this instanceof Success) {
            MapBuilder mapBuilder = new MapBuilder();
            mapBuilder.put("status", "success");
            Success success = (Success) this;
            for (Map.Entry<String, Object> entry : success.getData().entrySet()) {
                mapBuilder.put(entry.getKey(), entry.getValue());
            }
            String message = success.getMessage();
            if (message != null) {
                mapBuilder.put(PglCryptUtils.KEY_MESSAGE, message);
            }
            return mapBuilder.b();
        }
        if (this instanceof Error) {
            MapBuilder mapBuilder2 = new MapBuilder();
            mapBuilder2.put("status", "error");
            Error error = (Error) this;
            mapBuilder2.put("error", error.getError());
            String code = error.getCode();
            if (code != null) {
                mapBuilder2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, code);
            }
            return mapBuilder2.b();
        }
        if (!(this instanceof NeedsUserInput)) {
            throw new NoWhenBranchMatchedException();
        }
        MapBuilder mapBuilder3 = new MapBuilder();
        mapBuilder3.put("status", "needs_input");
        NeedsUserInput needsUserInput = (NeedsUserInput) this;
        mapBuilder3.put("question", needsUserInput.getQuestion());
        mapBuilder3.put("parameter", needsUserInput.getParameter());
        if (!needsUserInput.getResolutionHints().isEmpty()) {
            mapBuilder3.put("resolution_hints", needsUserInput.getResolutionHints());
        }
        return mapBuilder3.b();
    }

    private ToolResult() {
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\f\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J-\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0019"}, d2 = {"Lcom/instabridge/ai/tools/ToolResult$NeedsUserInput;", "Lcom/instabridge/ai/tools/ToolResult;", "question", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "parameter", "resolutionHints", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getQuestion", "()Ljava/lang/String;", "getParameter", "getResolutionHints", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class NeedsUserInput extends ToolResult {
        public static final int $stable = 8;

        @NotNull
        private final String parameter;

        @NotNull
        private final String question;

        @NotNull
        private final List<String> resolutionHints;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public NeedsUserInput(@NotNull String question, @NotNull String parameter, @NotNull List<String> resolutionHints) {
            super(null);
            Intrinsics.g(question, "question");
            Intrinsics.g(parameter, "parameter");
            Intrinsics.g(resolutionHints, "resolutionHints");
            this.question = question;
            this.parameter = parameter;
            this.resolutionHints = resolutionHints;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ NeedsUserInput copy$default(NeedsUserInput needsUserInput, String str, String str2, List list, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = needsUserInput.question;
            }
            if ((i5 & 2) != 0) {
                str2 = needsUserInput.parameter;
            }
            if ((i5 & 4) != 0) {
                list = needsUserInput.resolutionHints;
            }
            return needsUserInput.copy(str, str2, list);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getQuestion() {
            return this.question;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getParameter() {
            return this.parameter;
        }

        @NotNull
        public final List<String> component3() {
            return this.resolutionHints;
        }

        @NotNull
        public final NeedsUserInput copy(@NotNull String question, @NotNull String parameter, @NotNull List<String> resolutionHints) {
            Intrinsics.g(question, "question");
            Intrinsics.g(parameter, "parameter");
            Intrinsics.g(resolutionHints, "resolutionHints");
            return new NeedsUserInput(question, parameter, resolutionHints);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NeedsUserInput)) {
                return false;
            }
            NeedsUserInput needsUserInput = (NeedsUserInput) other;
            return Intrinsics.b(this.question, needsUserInput.question) && Intrinsics.b(this.parameter, needsUserInput.parameter) && Intrinsics.b(this.resolutionHints, needsUserInput.resolutionHints);
        }

        @NotNull
        public final String getParameter() {
            return this.parameter;
        }

        @NotNull
        public final String getQuestion() {
            return this.question;
        }

        @NotNull
        public final List<String> getResolutionHints() {
            return this.resolutionHints;
        }

        public int hashCode() {
            return this.resolutionHints.hashCode() + c0.e(this.question.hashCode() * 31, 31, this.parameter);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("NeedsUserInput(question=");
            sb2.append(this.question);
            sb2.append(", parameter=");
            sb2.append(this.parameter);
            sb2.append(", resolutionHints=");
            return fq.c.e(sb2, this.resolutionHints, ')');
        }

        public NeedsUserInput(String str, String str2, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i5 & 4) != 0 ? EmptyList.f71733a : list);
        }
    }
}
