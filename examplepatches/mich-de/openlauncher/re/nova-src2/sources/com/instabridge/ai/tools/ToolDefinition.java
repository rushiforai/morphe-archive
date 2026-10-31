package com.instabridge.ai.tools;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BO\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\r\u0010\u0019\u001a\u00020\u001aH\u0000¢\u0006\u0002\b\u001bJ\u0014\u0010\u001c\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\u0015\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006HÆ\u0003J\t\u0010 \u001a\u00020\bHÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\"\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0002\u0010\u0017JZ\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001¢\u0006\u0002\u0010$J\u0013\u0010%\u001a\u00020\u000b2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020(HÖ\u0001J\t\u0010)\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u001d\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u000fR\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\n\n\u0002\u0010\u0018\u001a\u0004\b\u0016\u0010\u0017¨\u0006*"}, d2 = {"Lcom/instabridge/ai/tools/ToolDefinition;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolType", "Lcom/instabridge/ai/tools/ToolType;", "category", "requiresConfirmation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/instabridge/ai/tools/ToolType;Ljava/lang/String;Ljava/lang/Boolean;)V", "getName", "()Ljava/lang/String;", "getDescription", "getParameters", "()Ljava/util/Map;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "getCategory", "getRequiresConfirmation", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "toApiFormat", "Lcom/instabridge/ai/tools/ToolDefinitionApi;", "toApiFormat$instabridge_ai_sdk_release", "toAgentRequestFormat", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/instabridge/ai/tools/ToolType;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/instabridge/ai/tools/ToolDefinition;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolDefinition {
    public static final int $stable = 8;

    @Nullable
    private final String category;

    @NotNull
    private final String description;

    @NotNull
    private final String name;

    @NotNull
    private final Map<String, Object> parameters;

    @Nullable
    private final Boolean requiresConfirmation;

    @NotNull
    private final ToolType toolType;

    public ToolDefinition(@NotNull String name, @NotNull String description, @NotNull Map<String, ? extends Object> parameters, @NotNull ToolType toolType, @Nullable String str, @Nullable Boolean bool) {
        Intrinsics.g(name, "name");
        Intrinsics.g(description, "description");
        Intrinsics.g(parameters, "parameters");
        Intrinsics.g(toolType, "toolType");
        this.name = name;
        this.description = description;
        this.parameters = parameters;
        this.toolType = toolType;
        this.category = str;
        this.requiresConfirmation = bool;
    }

    public static /* synthetic */ ToolDefinition copy$default(ToolDefinition toolDefinition, String str, String str2, Map map, ToolType toolType, String str3, Boolean bool, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolDefinition.name;
        }
        if ((i5 & 2) != 0) {
            str2 = toolDefinition.description;
        }
        if ((i5 & 4) != 0) {
            map = toolDefinition.parameters;
        }
        if ((i5 & 8) != 0) {
            toolType = toolDefinition.toolType;
        }
        if ((i5 & 16) != 0) {
            str3 = toolDefinition.category;
        }
        if ((i5 & 32) != 0) {
            bool = toolDefinition.requiresConfirmation;
        }
        String str4 = str3;
        Boolean bool2 = bool;
        return toolDefinition.copy(str, str2, map, toolType, str4, bool2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final Map<String, Object> component3() {
        return this.parameters;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final ToolType getToolType() {
        return this.toolType;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getCategory() {
        return this.category;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Boolean getRequiresConfirmation() {
        return this.requiresConfirmation;
    }

    @NotNull
    public final ToolDefinition copy(@NotNull String name, @NotNull String description, @NotNull Map<String, ? extends Object> parameters, @NotNull ToolType toolType, @Nullable String category, @Nullable Boolean requiresConfirmation) {
        Intrinsics.g(name, "name");
        Intrinsics.g(description, "description");
        Intrinsics.g(parameters, "parameters");
        Intrinsics.g(toolType, "toolType");
        return new ToolDefinition(name, description, parameters, toolType, category, requiresConfirmation);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolDefinition)) {
            return false;
        }
        ToolDefinition toolDefinition = (ToolDefinition) other;
        return Intrinsics.b(this.name, toolDefinition.name) && Intrinsics.b(this.description, toolDefinition.description) && Intrinsics.b(this.parameters, toolDefinition.parameters) && this.toolType == toolDefinition.toolType && Intrinsics.b(this.category, toolDefinition.category) && Intrinsics.b(this.requiresConfirmation, toolDefinition.requiresConfirmation);
    }

    @Nullable
    public final String getCategory() {
        return this.category;
    }

    @NotNull
    public final String getDescription() {
        return this.description;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final Map<String, Object> getParameters() {
        return this.parameters;
    }

    @Nullable
    public final Boolean getRequiresConfirmation() {
        return this.requiresConfirmation;
    }

    @NotNull
    public final ToolType getToolType() {
        return this.toolType;
    }

    public int hashCode() {
        int iHashCode = (this.toolType.hashCode() + h.c(this.parameters, c0.e(this.name.hashCode() * 31, 31, this.description), 31)) * 31;
        String str = this.category;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.requiresConfirmation;
        return iHashCode2 + (bool != null ? bool.hashCode() : 0);
    }

    @NotNull
    public final Map<String, Object> toAgentRequestFormat() {
        return MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, this.name), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, this.description), new Pair("parameters", this.parameters), new Pair("tool_type", this.toolType.getApiValue()), new Pair("location", "frontend"));
    }

    @NotNull
    public final ToolDefinitionApi toApiFormat$instabridge_ai_sdk_release() {
        return new ToolDefinitionApi(this.name, this.description, this.parameters, this.toolType.getApiValue(), this.category, this.requiresConfirmation);
    }

    @NotNull
    public String toString() {
        return "ToolDefinition(name=" + this.name + ", description=" + this.description + ", parameters=" + this.parameters + ", toolType=" + this.toolType + ", category=" + this.category + ", requiresConfirmation=" + this.requiresConfirmation + ')';
    }

    public /* synthetic */ ToolDefinition(String str, String str2, Map map, ToolType toolType, String str3, Boolean bool, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? b70.h.f17594a : map, (i5 & 8) != 0 ? ToolType.INFO_RETRIEVAL : toolType, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : bool);
    }
}
