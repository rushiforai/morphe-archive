package com.instabridge.ai.chat.model;

import a2.c;
import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B)\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0001\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0003\u0010\u0005\u001a\u00020\u00062\b\b\u0003\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\b2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0006HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/chat/model/SelectableModelsResponse;", b.f42142b, "models", b.f42142b, "Lcom/instabridge/ai/chat/model/SelectableModel;", "currentPlan", b.f42142b, "canSelectModels", b.f42142b, "<init>", "(Ljava/util/List;Ljava/lang/String;Z)V", "getModels", "()Ljava/util/List;", "getCurrentPlan", "()Ljava/lang/String;", "getCanSelectModels", "()Z", "component1", "component2", "component3", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class SelectableModelsResponse {
    public static final int $stable = 8;
    private final boolean canSelectModels;

    @NotNull
    private final String currentPlan;

    @NotNull
    private final List<SelectableModel> models;

    public SelectableModelsResponse(@NotNull List<SelectableModel> models, @o(name = "current_plan") @NotNull String currentPlan, @o(name = "can_select_models") boolean z11) {
        Intrinsics.g(models, "models");
        Intrinsics.g(currentPlan, "currentPlan");
        this.models = models;
        this.currentPlan = currentPlan;
        this.canSelectModels = z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SelectableModelsResponse copy$default(SelectableModelsResponse selectableModelsResponse, List list, String str, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = selectableModelsResponse.models;
        }
        if ((i5 & 2) != 0) {
            str = selectableModelsResponse.currentPlan;
        }
        if ((i5 & 4) != 0) {
            z11 = selectableModelsResponse.canSelectModels;
        }
        return selectableModelsResponse.copy(list, str, z11);
    }

    @NotNull
    public final List<SelectableModel> component1() {
        return this.models;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getCurrentPlan() {
        return this.currentPlan;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getCanSelectModels() {
        return this.canSelectModels;
    }

    @NotNull
    public final SelectableModelsResponse copy(@NotNull List<SelectableModel> models, @o(name = "current_plan") @NotNull String currentPlan, @o(name = "can_select_models") boolean canSelectModels) {
        Intrinsics.g(models, "models");
        Intrinsics.g(currentPlan, "currentPlan");
        return new SelectableModelsResponse(models, currentPlan, canSelectModels);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SelectableModelsResponse)) {
            return false;
        }
        SelectableModelsResponse selectableModelsResponse = (SelectableModelsResponse) other;
        return Intrinsics.b(this.models, selectableModelsResponse.models) && Intrinsics.b(this.currentPlan, selectableModelsResponse.currentPlan) && this.canSelectModels == selectableModelsResponse.canSelectModels;
    }

    public final boolean getCanSelectModels() {
        return this.canSelectModels;
    }

    @NotNull
    public final String getCurrentPlan() {
        return this.currentPlan;
    }

    @NotNull
    public final List<SelectableModel> getModels() {
        return this.models;
    }

    public int hashCode() {
        return Boolean.hashCode(this.canSelectModels) + c0.e(this.models.hashCode() * 31, 31, this.currentPlan);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("SelectableModelsResponse(models=");
        sb2.append(this.models);
        sb2.append(", currentPlan=");
        sb2.append(this.currentPlan);
        sb2.append(", canSelectModels=");
        return c.p(sb2, this.canSelectModels, ')');
    }
}
