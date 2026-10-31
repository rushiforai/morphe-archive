package com.instabridge.ai.chat.util;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.chat.model.ChatMessage;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/chat/util/CitationPreparedMarkdown;", b.f42142b, "content", b.f42142b, "normalizedSources", b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "getContent", "()Ljava/lang/String;", "getNormalizedSources", "()Ljava/util/List;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class CitationPreparedMarkdown {
    public static final int $stable = 8;

    @NotNull
    private final String content;

    @NotNull
    private final List<ChatMessage.Source> normalizedSources;

    public CitationPreparedMarkdown(@NotNull String content, @NotNull List<ChatMessage.Source> normalizedSources) {
        Intrinsics.g(content, "content");
        Intrinsics.g(normalizedSources, "normalizedSources");
        this.content = content;
        this.normalizedSources = normalizedSources;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ CitationPreparedMarkdown copy$default(CitationPreparedMarkdown citationPreparedMarkdown, String str, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = citationPreparedMarkdown.content;
        }
        if ((i5 & 2) != 0) {
            list = citationPreparedMarkdown.normalizedSources;
        }
        return citationPreparedMarkdown.copy(str, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getContent() {
        return this.content;
    }

    @NotNull
    public final List<ChatMessage.Source> component2() {
        return this.normalizedSources;
    }

    @NotNull
    public final CitationPreparedMarkdown copy(@NotNull String content, @NotNull List<ChatMessage.Source> normalizedSources) {
        Intrinsics.g(content, "content");
        Intrinsics.g(normalizedSources, "normalizedSources");
        return new CitationPreparedMarkdown(content, normalizedSources);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CitationPreparedMarkdown)) {
            return false;
        }
        CitationPreparedMarkdown citationPreparedMarkdown = (CitationPreparedMarkdown) other;
        return Intrinsics.b(this.content, citationPreparedMarkdown.content) && Intrinsics.b(this.normalizedSources, citationPreparedMarkdown.normalizedSources);
    }

    @NotNull
    public final String getContent() {
        return this.content;
    }

    @NotNull
    public final List<ChatMessage.Source> getNormalizedSources() {
        return this.normalizedSources;
    }

    public int hashCode() {
        return this.normalizedSources.hashCode() + (this.content.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("CitationPreparedMarkdown(content=");
        sb2.append(this.content);
        sb2.append(", normalizedSources=");
        return c.e(sb2, this.normalizedSources, ')');
    }
}
