package com.instabridge.ai.prompts;

import a2.c;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0018\u001a\u00020\tHÆ\u0003J;\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\tHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/prompts/AiPrompt;", b.f42142b, "id", b.f42142b, "chipText", "fullPrompt", "category", "Lcom/instabridge/ai/prompts/PromptCategory;", "weight", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/ai/prompts/PromptCategory;I)V", "getId", "()Ljava/lang/String;", "getChipText", "getFullPrompt", "getCategory", "()Lcom/instabridge/ai/prompts/PromptCategory;", "getWeight", "()I", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AiPrompt {
    public static final int $stable = 0;

    @NotNull
    private final PromptCategory category;

    @NotNull
    private final String chipText;

    @NotNull
    private final String fullPrompt;

    @NotNull
    private final String id;
    private final int weight;

    public AiPrompt(@NotNull String id2, @NotNull String chipText, @NotNull String fullPrompt, @NotNull PromptCategory category, int i5) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(chipText, "chipText");
        Intrinsics.g(fullPrompt, "fullPrompt");
        Intrinsics.g(category, "category");
        this.id = id2;
        this.chipText = chipText;
        this.fullPrompt = fullPrompt;
        this.category = category;
        this.weight = i5;
    }

    public static /* synthetic */ AiPrompt copy$default(AiPrompt aiPrompt, String str, String str2, String str3, PromptCategory promptCategory, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = aiPrompt.id;
        }
        if ((i11 & 2) != 0) {
            str2 = aiPrompt.chipText;
        }
        if ((i11 & 4) != 0) {
            str3 = aiPrompt.fullPrompt;
        }
        if ((i11 & 8) != 0) {
            promptCategory = aiPrompt.category;
        }
        if ((i11 & 16) != 0) {
            i5 = aiPrompt.weight;
        }
        int i12 = i5;
        String str4 = str3;
        return aiPrompt.copy(str, str2, str4, promptCategory, i12);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getChipText() {
        return this.chipText;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getFullPrompt() {
        return this.fullPrompt;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final PromptCategory getCategory() {
        return this.category;
    }

    /* renamed from: component5, reason: from getter */
    public final int getWeight() {
        return this.weight;
    }

    @NotNull
    public final AiPrompt copy(@NotNull String id2, @NotNull String chipText, @NotNull String fullPrompt, @NotNull PromptCategory category, int weight) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(chipText, "chipText");
        Intrinsics.g(fullPrompt, "fullPrompt");
        Intrinsics.g(category, "category");
        return new AiPrompt(id2, chipText, fullPrompt, category, weight);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AiPrompt)) {
            return false;
        }
        AiPrompt aiPrompt = (AiPrompt) other;
        return Intrinsics.b(this.id, aiPrompt.id) && Intrinsics.b(this.chipText, aiPrompt.chipText) && Intrinsics.b(this.fullPrompt, aiPrompt.fullPrompt) && this.category == aiPrompt.category && this.weight == aiPrompt.weight;
    }

    @NotNull
    public final PromptCategory getCategory() {
        return this.category;
    }

    @NotNull
    public final String getChipText() {
        return this.chipText;
    }

    @NotNull
    public final String getFullPrompt() {
        return this.fullPrompt;
    }

    @NotNull
    public final String getId() {
        return this.id;
    }

    public final int getWeight() {
        return this.weight;
    }

    public int hashCode() {
        return Integer.hashCode(this.weight) + ((this.category.hashCode() + c0.e(c0.e(this.id.hashCode() * 31, 31, this.chipText), 31, this.fullPrompt)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AiPrompt(id=");
        sb2.append(this.id);
        sb2.append(", chipText=");
        sb2.append(this.chipText);
        sb2.append(", fullPrompt=");
        sb2.append(this.fullPrompt);
        sb2.append(", category=");
        sb2.append(this.category);
        sb2.append(", weight=");
        return c.m(sb2, this.weight, ')');
    }

    public /* synthetic */ AiPrompt(String str, String str2, String str3, PromptCategory promptCategory, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, promptCategory, (i11 & 16) != 0 ? 10 : i5);
    }
}
