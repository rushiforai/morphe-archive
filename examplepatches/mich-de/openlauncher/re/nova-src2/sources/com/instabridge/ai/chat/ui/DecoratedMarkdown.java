package com.instabridge.ai.chat.ui;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0081\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0015\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0014\b\u0002\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u001d\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/chat/ui/DecoratedMarkdown;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "markdown", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "codeBlocks", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/util/Map;)V", "getMarkdown", "()Ljava/lang/String;", "getCodeBlocks", "()Ljava/util/Map;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class DecoratedMarkdown {
    public static final int $stable = 8;

    @NotNull
    private final Map<Integer, String> codeBlocks;

    @NotNull
    private final String markdown;

    public DecoratedMarkdown(@NotNull String markdown, @NotNull Map<Integer, String> codeBlocks) {
        Intrinsics.g(markdown, "markdown");
        Intrinsics.g(codeBlocks, "codeBlocks");
        this.markdown = markdown;
        this.codeBlocks = codeBlocks;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DecoratedMarkdown copy$default(DecoratedMarkdown decoratedMarkdown, String str, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = decoratedMarkdown.markdown;
        }
        if ((i5 & 2) != 0) {
            map = decoratedMarkdown.codeBlocks;
        }
        return decoratedMarkdown.copy(str, map);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getMarkdown() {
        return this.markdown;
    }

    @NotNull
    public final Map<Integer, String> component2() {
        return this.codeBlocks;
    }

    @NotNull
    public final DecoratedMarkdown copy(@NotNull String markdown, @NotNull Map<Integer, String> codeBlocks) {
        Intrinsics.g(markdown, "markdown");
        Intrinsics.g(codeBlocks, "codeBlocks");
        return new DecoratedMarkdown(markdown, codeBlocks);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DecoratedMarkdown)) {
            return false;
        }
        DecoratedMarkdown decoratedMarkdown = (DecoratedMarkdown) other;
        return Intrinsics.b(this.markdown, decoratedMarkdown.markdown) && Intrinsics.b(this.codeBlocks, decoratedMarkdown.codeBlocks);
    }

    @NotNull
    public final Map<Integer, String> getCodeBlocks() {
        return this.codeBlocks;
    }

    @NotNull
    public final String getMarkdown() {
        return this.markdown;
    }

    public int hashCode() {
        return this.codeBlocks.hashCode() + (this.markdown.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DecoratedMarkdown(markdown=");
        sb2.append(this.markdown);
        sb2.append(", codeBlocks=");
        return c9.l(sb2, this.codeBlocks, ')');
    }
}
