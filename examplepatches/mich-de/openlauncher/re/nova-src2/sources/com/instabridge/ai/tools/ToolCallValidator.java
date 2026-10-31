package com.instabridge.ai.tools;

import b.c0;
import b70.h;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;
import r70.k;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001\rB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J<\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\u00010\t2\u0016\u0010\n\u001a\u0012\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\tJ\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00010\t2\u0006\u0010\f\u001a\u00020\u0005¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/tools/ToolCallValidator;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "validate", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult;", "toolName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "args", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "schema", "formatError", "result", "ValidationResult", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ToolCallValidator {
    public static final int $stable = 0;

    @NotNull
    public static final ToolCallValidator INSTANCE = new ToolCallValidator();

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0003\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Valid", "MissingParameter", "InvalidFormat", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$InvalidFormat;", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$MissingParameter;", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$Valid;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class ValidationResult {
        public static final int $stable = 0;

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$InvalidFormat;", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult;", "toolName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "param", "expected", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getToolName", "()Ljava/lang/String;", "getParam", "getExpected", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class InvalidFormat extends ValidationResult {
            public static final int $stable = 0;

            @NotNull
            private final String expected;

            @NotNull
            private final String param;

            @NotNull
            private final String toolName;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public InvalidFormat(@NotNull String toolName, @NotNull String param, @NotNull String expected) {
                super(null);
                Intrinsics.g(toolName, "toolName");
                Intrinsics.g(param, "param");
                Intrinsics.g(expected, "expected");
                this.toolName = toolName;
                this.param = param;
                this.expected = expected;
            }

            public static /* synthetic */ InvalidFormat copy$default(InvalidFormat invalidFormat, String str, String str2, String str3, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = invalidFormat.toolName;
                }
                if ((i5 & 2) != 0) {
                    str2 = invalidFormat.param;
                }
                if ((i5 & 4) != 0) {
                    str3 = invalidFormat.expected;
                }
                return invalidFormat.copy(str, str2, str3);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getToolName() {
                return this.toolName;
            }

            @NotNull
            /* renamed from: component2, reason: from getter */
            public final String getParam() {
                return this.param;
            }

            @NotNull
            /* renamed from: component3, reason: from getter */
            public final String getExpected() {
                return this.expected;
            }

            @NotNull
            public final InvalidFormat copy(@NotNull String toolName, @NotNull String param, @NotNull String expected) {
                Intrinsics.g(toolName, "toolName");
                Intrinsics.g(param, "param");
                Intrinsics.g(expected, "expected");
                return new InvalidFormat(toolName, param, expected);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof InvalidFormat)) {
                    return false;
                }
                InvalidFormat invalidFormat = (InvalidFormat) other;
                return Intrinsics.b(this.toolName, invalidFormat.toolName) && Intrinsics.b(this.param, invalidFormat.param) && Intrinsics.b(this.expected, invalidFormat.expected);
            }

            @NotNull
            public final String getExpected() {
                return this.expected;
            }

            @NotNull
            public final String getParam() {
                return this.param;
            }

            @NotNull
            public final String getToolName() {
                return this.toolName;
            }

            public int hashCode() {
                return this.expected.hashCode() + c0.e(this.toolName.hashCode() * 31, 31, this.param);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("InvalidFormat(toolName=");
                sb2.append(this.toolName);
                sb2.append(", param=");
                sb2.append(this.param);
                sb2.append(", expected=");
                return c1.t(sb2, this.expected, ')');
            }
        }

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$MissingParameter;", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult;", "toolName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "param", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getToolName", "()Ljava/lang/String;", "getParam", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class MissingParameter extends ValidationResult {
            public static final int $stable = 0;

            @NotNull
            private final String param;

            @NotNull
            private final String toolName;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public MissingParameter(@NotNull String toolName, @NotNull String param) {
                super(null);
                Intrinsics.g(toolName, "toolName");
                Intrinsics.g(param, "param");
                this.toolName = toolName;
                this.param = param;
            }

            public static /* synthetic */ MissingParameter copy$default(MissingParameter missingParameter, String str, String str2, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = missingParameter.toolName;
                }
                if ((i5 & 2) != 0) {
                    str2 = missingParameter.param;
                }
                return missingParameter.copy(str, str2);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getToolName() {
                return this.toolName;
            }

            @NotNull
            /* renamed from: component2, reason: from getter */
            public final String getParam() {
                return this.param;
            }

            @NotNull
            public final MissingParameter copy(@NotNull String toolName, @NotNull String param) {
                Intrinsics.g(toolName, "toolName");
                Intrinsics.g(param, "param");
                return new MissingParameter(toolName, param);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof MissingParameter)) {
                    return false;
                }
                MissingParameter missingParameter = (MissingParameter) other;
                return Intrinsics.b(this.toolName, missingParameter.toolName) && Intrinsics.b(this.param, missingParameter.param);
            }

            @NotNull
            public final String getParam() {
                return this.param;
            }

            @NotNull
            public final String getToolName() {
                return this.toolName;
            }

            public int hashCode() {
                return this.param.hashCode() + (this.toolName.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("MissingParameter(toolName=");
                sb2.append(this.toolName);
                sb2.append(", param=");
                return c1.t(sb2, this.param, ')');
            }
        }

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult$Valid;", "Lcom/instabridge/ai/tools/ToolCallValidator$ValidationResult;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Valid extends ValidationResult {
            public static final int $stable = 0;

            @NotNull
            public static final Valid INSTANCE = new Valid();

            private Valid() {
                super(null);
            }
        }

        public /* synthetic */ ValidationResult(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private ValidationResult() {
        }
    }

    private ToolCallValidator() {
    }

    @NotNull
    public final Map<String, Object> formatError(@NotNull ValidationResult result) {
        Intrinsics.g(result, "result");
        if (result instanceof ValidationResult.MissingParameter) {
            ValidationResult.MissingParameter missingParameter = (ValidationResult.MissingParameter) result;
            return MapsKt.j0(new Pair("error", "missing_parameter"), new Pair("tool", missingParameter.getToolName()), new Pair("parameter", missingParameter.getParam()), new Pair(PglCryptUtils.KEY_MESSAGE, "Required parameter '" + missingParameter.getParam() + "' is missing or empty."));
        }
        if (!(result instanceof ValidationResult.InvalidFormat)) {
            if (result.equals(ValidationResult.Valid.INSTANCE)) {
                return h.f17594a;
            }
            throw new NoWhenBranchMatchedException();
        }
        ValidationResult.InvalidFormat invalidFormat = (ValidationResult.InvalidFormat) result;
        return MapsKt.j0(new Pair("error", "invalid_format"), new Pair("tool", invalidFormat.getToolName()), new Pair("parameter", invalidFormat.getParam()), new Pair(PglCryptUtils.KEY_MESSAGE, "Parameter '" + invalidFormat.getParam() + "' should be " + invalidFormat.getExpected() + '.'));
    }

    @NotNull
    public final ValidationResult validate(@NotNull String toolName, @NotNull Map<String, ? extends Object> args, @Nullable Map<String, ? extends Object> schema) {
        List<String> arrayList;
        Object obj;
        String string;
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(args, "args");
        if (schema == null) {
            return ValidationResult.Valid.INSTANCE;
        }
        Object obj2 = schema.get("properties");
        Map map = obj2 instanceof Map ? (Map) obj2 : null;
        if (map == null) {
            return ValidationResult.Valid.INSTANCE;
        }
        Object obj3 = schema.get("required");
        List list = obj3 instanceof List ? (List) obj3 : null;
        if (list != null) {
            List list2 = list;
            arrayList = new ArrayList(b70.c.u0(list2, 10));
            Iterator it = list2.iterator();
            while (it.hasNext()) {
                arrayList.add(String.valueOf(it.next()));
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        for (String str : arrayList) {
            Object obj4 = args.get(str);
            if (obj4 == null || k.U0(obj4.toString())) {
                return new ValidationResult.MissingParameter(toolName, str);
            }
        }
        for (Map.Entry entry : map.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            String strValueOf = String.valueOf(key);
            Object obj5 = args.get(strValueOf);
            if (obj5 != null) {
                Map map2 = value instanceof Map ? (Map) value : null;
                if (map2 != null && (obj = map2.get(TTConst.TRACK_TYPE)) != null && (string = obj.toString()) != null && (string.equals("number") || string.equals("integer"))) {
                    if (i.r0(obj5.toString()) == null) {
                        return new ValidationResult.InvalidFormat(toolName, strValueOf, string);
                    }
                }
            }
        }
        return ValidationResult.Valid.INSTANCE;
    }
}
