package com.instabridge.ai.chat.ui;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.LinkedHashMap;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.GeneratorSequence$iterator$1;
import kotlin.text.MatchResult;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0007J\u0010\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0012H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/ui/CodeBlockCopyDecorator;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "fencedCodeRegex", "Lkotlin/text/Regex;", "TOKEN_PREFIX", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "TOKEN_SUFFIX", "tokenPattern", "Ljava/util/regex/Pattern;", "getTokenPattern", "()Ljava/util/regex/Pattern;", "decorate", "Lcom/instabridge/ai/chat/ui/DecoratedMarkdown;", "markdown", "tokenFor", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CodeBlockCopyDecorator {
    public static final int $stable;

    @NotNull
    private static final String TOKEN_PREFIX = "{{AI_COPY_CODE_";

    @NotNull
    private static final String TOKEN_SUFFIX = "}}";

    @NotNull
    private static final Pattern tokenPattern;

    @NotNull
    public static final CodeBlockCopyDecorator INSTANCE = new CodeBlockCopyDecorator();

    @NotNull
    private static final Regex fencedCodeRegex = new Regex("(?s)```[^\\n]*\\n(.*?)\\n?```");

    static {
        Pattern patternCompile = Pattern.compile("\\{\\{AI_COPY_CODE_(\\d+)\\}\\}");
        Intrinsics.f(patternCompile, "compile(...)");
        tokenPattern = patternCompile;
        $stable = 8;
    }

    private CodeBlockCopyDecorator() {
    }

    private final String tokenFor(int index) {
        return b.c0.i(index, TOKEN_PREFIX, TOKEN_SUFFIX);
    }

    @NotNull
    public final DecoratedMarkdown decorate(@NotNull String markdown) {
        Intrinsics.g(markdown, "markdown");
        int i5 = 0;
        boolean zK0 = r70.k.K0(markdown, "```", false);
        b70.h hVar = b70.h.f17594a;
        if (!zK0) {
            return new DecoratedMarkdown(markdown, hVar);
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        StringBuilder sb2 = new StringBuilder(markdown.length() + 64);
        GeneratorSequence$iterator$1 generatorSequence$iterator$1 = new GeneratorSequence$iterator$1(Regex.d(fencedCodeRegex, markdown));
        int i11 = 1;
        while (generatorSequence$iterator$1.hasNext()) {
            MatchResult matchResult = (MatchResult) generatorSequence$iterator$1.next();
            int i12 = matchResult.b().f71906a;
            int i13 = matchResult.b().f71907b + 1;
            if (i5 < i12) {
                sb2.append((CharSequence) markdown, i5, i12);
            }
            sb2.append((CharSequence) markdown, i12, i13);
            String str = (String) b70.g.Z0(1, matchResult.a());
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            linkedHashMap.put(Integer.valueOf(i11), str);
            sb2.append('\n');
            sb2.append(tokenFor(i11));
            sb2.append('\n');
            i11++;
            i5 = i13;
        }
        if (linkedHashMap.isEmpty()) {
            return new DecoratedMarkdown(markdown, hVar);
        }
        if (i5 < markdown.length()) {
            sb2.append((CharSequence) markdown, i5, markdown.length());
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return new DecoratedMarkdown(string, linkedHashMap);
    }

    @NotNull
    public final Pattern getTokenPattern() {
        return tokenPattern;
    }
}
