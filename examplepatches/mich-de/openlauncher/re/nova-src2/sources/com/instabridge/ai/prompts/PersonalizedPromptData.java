package com.instabridge.ai.prompts;

import a2.c;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0006HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/prompts/PersonalizedPromptData;", b.f42142b, "prompts", b.f42142b, "Lcom/instabridge/ai/prompts/PersonalizedPrompt;", "fetchedAt", b.f42142b, "<init>", "(Ljava/util/List;J)V", "getPrompts", "()Ljava/util/List;", "getFetchedAt", "()J", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class PersonalizedPromptData {
    public static final int $stable = 8;
    private final long fetchedAt;

    @NotNull
    private final List<PersonalizedPrompt> prompts;

    public PersonalizedPromptData(@NotNull List<PersonalizedPrompt> prompts, long j11) {
        Intrinsics.g(prompts, "prompts");
        this.prompts = prompts;
        this.fetchedAt = j11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PersonalizedPromptData copy$default(PersonalizedPromptData personalizedPromptData, List list, long j11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = personalizedPromptData.prompts;
        }
        if ((i5 & 2) != 0) {
            j11 = personalizedPromptData.fetchedAt;
        }
        return personalizedPromptData.copy(list, j11);
    }

    @NotNull
    public final List<PersonalizedPrompt> component1() {
        return this.prompts;
    }

    /* renamed from: component2, reason: from getter */
    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    @NotNull
    public final PersonalizedPromptData copy(@NotNull List<PersonalizedPrompt> prompts, long fetchedAt) {
        Intrinsics.g(prompts, "prompts");
        return new PersonalizedPromptData(prompts, fetchedAt);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PersonalizedPromptData)) {
            return false;
        }
        PersonalizedPromptData personalizedPromptData = (PersonalizedPromptData) other;
        return Intrinsics.b(this.prompts, personalizedPromptData.prompts) && this.fetchedAt == personalizedPromptData.fetchedAt;
    }

    public final long getFetchedAt() {
        return this.fetchedAt;
    }

    @NotNull
    public final List<PersonalizedPrompt> getPrompts() {
        return this.prompts;
    }

    public int hashCode() {
        return Long.hashCode(this.fetchedAt) + (this.prompts.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PersonalizedPromptData(prompts=");
        sb2.append(this.prompts);
        sb2.append(", fetchedAt=");
        return c.n(sb2, this.fetchedAt, ')');
    }

    public /* synthetic */ PersonalizedPromptData(List list, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, (i5 & 2) != 0 ? System.currentTimeMillis() : j11);
    }
}
