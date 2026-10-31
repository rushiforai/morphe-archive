package com.instabridge.ai.tools;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0017\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006\u0012\b\b\u0001\u0010\u0007\u001a\u00020\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u0015\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u001c\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u0015JZ\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u00062\b\b\u0003\u0010\u0007\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\nHÆ\u0001¢\u0006\u0002\u0010\u001eJ\u0013\u0010\u001f\u001a\u00020\n2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u001d\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000eR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u000eR\u0015\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u0016\u001a\u0004\b\u0014\u0010\u0015¨\u0006$"}, d2 = {"Lcom/instabridge/ai/tools/ToolDefinitionApi;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolType", "category", "requiresConfirmation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V", "getName", "()Ljava/lang/String;", "getDescription", "getParameters", "()Ljava/util/Map;", "getToolType", "getCategory", "getRequiresConfirmation", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/instabridge/ai/tools/ToolDefinitionApi;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ToolDefinitionApi {
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
    private final String toolType;

    public ToolDefinitionApi(@NotNull String name, @NotNull String description, @NotNull Map<String, ? extends Object> parameters, @o(name = "tool_type") @NotNull String toolType, @Nullable String str, @o(name = "requires_confirmation") @Nullable Boolean bool) {
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

    public static /* synthetic */ ToolDefinitionApi copy$default(ToolDefinitionApi toolDefinitionApi, String str, String str2, Map map, String str3, String str4, Boolean bool, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = toolDefinitionApi.name;
        }
        if ((i5 & 2) != 0) {
            str2 = toolDefinitionApi.description;
        }
        if ((i5 & 4) != 0) {
            map = toolDefinitionApi.parameters;
        }
        if ((i5 & 8) != 0) {
            str3 = toolDefinitionApi.toolType;
        }
        if ((i5 & 16) != 0) {
            str4 = toolDefinitionApi.category;
        }
        if ((i5 & 32) != 0) {
            bool = toolDefinitionApi.requiresConfirmation;
        }
        String str5 = str4;
        Boolean bool2 = bool;
        return toolDefinitionApi.copy(str, str2, map, str3, str5, bool2);
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
    public final String getToolType() {
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
    public final ToolDefinitionApi copy(@NotNull String name, @NotNull String description, @NotNull Map<String, ? extends Object> parameters, @o(name = "tool_type") @NotNull String toolType, @Nullable String category, @o(name = "requires_confirmation") @Nullable Boolean requiresConfirmation) {
        Intrinsics.g(name, "name");
        Intrinsics.g(description, "description");
        Intrinsics.g(parameters, "parameters");
        Intrinsics.g(toolType, "toolType");
        return new ToolDefinitionApi(name, description, parameters, toolType, category, requiresConfirmation);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ToolDefinitionApi)) {
            return false;
        }
        ToolDefinitionApi toolDefinitionApi = (ToolDefinitionApi) other;
        return Intrinsics.b(this.name, toolDefinitionApi.name) && Intrinsics.b(this.description, toolDefinitionApi.description) && Intrinsics.b(this.parameters, toolDefinitionApi.parameters) && Intrinsics.b(this.toolType, toolDefinitionApi.toolType) && Intrinsics.b(this.category, toolDefinitionApi.category) && Intrinsics.b(this.requiresConfirmation, toolDefinitionApi.requiresConfirmation);
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
    public final String getToolType() {
        return this.toolType;
    }

    public int hashCode() {
        int iE = c0.e(h.c(this.parameters, c0.e(this.name.hashCode() * 31, 31, this.description), 31), 31, this.toolType);
        String str = this.category;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.requiresConfirmation;
        return iHashCode + (bool != null ? bool.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "ToolDefinitionApi(name=" + this.name + ", description=" + this.description + ", parameters=" + this.parameters + ", toolType=" + this.toolType + ", category=" + this.category + ", requiresConfirmation=" + this.requiresConfirmation + ')';
    }
}
