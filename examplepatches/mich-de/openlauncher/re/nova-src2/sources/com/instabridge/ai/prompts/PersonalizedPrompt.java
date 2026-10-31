package com.instabridge.ai.prompts;

import a2.c;
import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\bHÆ\u0003J;\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0003\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/prompts/PersonalizedPrompt;", b.f42142b, "id", b.f42142b, "chipText", "fullPrompt", "category", "weight", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V", "getId", "()Ljava/lang/String;", "getChipText", "getFullPrompt", "getCategory", "getWeight", "()I", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class PersonalizedPrompt {
    public static final int $stable = 0;

    @NotNull
    private final String category;

    @NotNull
    private final String chipText;

    @NotNull
    private final String fullPrompt;

    @NotNull
    private final String id;
    private final int weight;

    public PersonalizedPrompt(@NotNull String id2, @o(name = "chip_text") @NotNull String chipText, @o(name = "full_prompt") @NotNull String fullPrompt, @NotNull String category, int i5) {
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

    public static /* synthetic */ PersonalizedPrompt copy$default(PersonalizedPrompt personalizedPrompt, String str, String str2, String str3, String str4, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = personalizedPrompt.id;
        }
        if ((i11 & 2) != 0) {
            str2 = personalizedPrompt.chipText;
        }
        if ((i11 & 4) != 0) {
            str3 = personalizedPrompt.fullPrompt;
        }
        if ((i11 & 8) != 0) {
            str4 = personalizedPrompt.category;
        }
        if ((i11 & 16) != 0) {
            i5 = personalizedPrompt.weight;
        }
        int i12 = i5;
        String str5 = str3;
        return personalizedPrompt.copy(str, str2, str5, str4, i12);
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
    public final String getCategory() {
        return this.category;
    }

    /* renamed from: component5, reason: from getter */
    public final int getWeight() {
        return this.weight;
    }

    @NotNull
    public final PersonalizedPrompt copy(@NotNull String id2, @o(name = "chip_text") @NotNull String chipText, @o(name = "full_prompt") @NotNull String fullPrompt, @NotNull String category, int weight) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(chipText, "chipText");
        Intrinsics.g(fullPrompt, "fullPrompt");
        Intrinsics.g(category, "category");
        return new PersonalizedPrompt(id2, chipText, fullPrompt, category, weight);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PersonalizedPrompt)) {
            return false;
        }
        PersonalizedPrompt personalizedPrompt = (PersonalizedPrompt) other;
        return Intrinsics.b(this.id, personalizedPrompt.id) && Intrinsics.b(this.chipText, personalizedPrompt.chipText) && Intrinsics.b(this.fullPrompt, personalizedPrompt.fullPrompt) && Intrinsics.b(this.category, personalizedPrompt.category) && this.weight == personalizedPrompt.weight;
    }

    @NotNull
    public final String getCategory() {
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
        return Integer.hashCode(this.weight) + c0.e(c0.e(c0.e(this.id.hashCode() * 31, 31, this.chipText), 31, this.fullPrompt), 31, this.category);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PersonalizedPrompt(id=");
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

    public /* synthetic */ PersonalizedPrompt(String str, String str2, String str3, String str4, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, str4, (i11 & 16) != 0 ? 15 : i5);
    }
}
