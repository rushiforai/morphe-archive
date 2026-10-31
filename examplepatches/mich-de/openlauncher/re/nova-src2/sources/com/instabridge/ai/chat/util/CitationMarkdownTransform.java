package com.instabridge.ai.chat.util;

import b.c0;
import b00.m0;
import b70.g;
import com.instabridge.ai.chat.model.ChatMessage;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.GeneratorSequence$iterator$1;
import kotlin.text.MatchResult;
import kotlin.text.Regex;
import kotlin.text.RegexOption;
import org.jetbrains.annotations.NotNull;
import r70.i;
import r70.k;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014J\u001a\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00150\u00142\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014J\u000e\u0010\u0017\u001a\u00020\u00122\u0006\u0010\u0018\u001a\u00020\u0019J\u001e\u0010\u001a\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00122\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014H\u0002J,\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u001c\u001a\u00020\u00052\u0012\u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00120\u001eH\u0002J\u001e\u0010\u001f\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00122\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014H\u0002J\u0010\u0010 \u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u0012H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006!"}, d2 = {"Lcom/instabridge/ai/chat/util/CitationMarkdownTransform;", b.f42142b, "<init>", "()V", "citationRegex", "Lkotlin/text/Regex;", "malformedBracketRegex", "malformedParenRegex", "blockedStatusRegex", "fencedCodeBlockRegex", "inlineCodeRegex", "tokenPattern", "Ljava/util/regex/Pattern;", "getTokenPattern", "()Ljava/util/regex/Pattern;", "prepare", "Lcom/instabridge/ai/chat/util/CitationPreparedMarkdown;", "content", b.f42142b, "sources", b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "normalizeSources", "tokenFor", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "rewriteCitations", "rewriteOutside", "protectedRegex", "rewrite", "Lkotlin/Function1;", "rewriteCitationSegment", "normalizeMalformedMarkers", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CitationMarkdownTransform {
    public static final int $stable;

    @NotNull
    private static final Regex blockedStatusRegex;

    @NotNull
    private static final Regex fencedCodeBlockRegex;

    @NotNull
    private static final Regex inlineCodeRegex;

    @NotNull
    private static final Pattern tokenPattern;

    @NotNull
    public static final CitationMarkdownTransform INSTANCE = new CitationMarkdownTransform();

    @NotNull
    private static final Regex citationRegex = new Regex("\\[(\\d+)](?!\\()");

    @NotNull
    private static final Regex malformedBracketRegex = new Regex("\\[(\\d+)\\s*\\[[^\\]]*]]");

    @NotNull
    private static final Regex malformedParenRegex = new Regex("\\[(\\d+)\\s*\\([^)]*\\)]");

    static {
        RegexOption[] regexOptionArr = RegexOption.f72028c;
        blockedStatusRegex = new Regex("\\[(blocked|failed)]", 0);
        fencedCodeBlockRegex = new Regex("(?s)```.*?```");
        inlineCodeRegex = new Regex("`[^`\\n]+`");
        Pattern patternCompile = Pattern.compile("\\{\\{AI_CITATION_(\\d+)\\}\\}");
        Intrinsics.f(patternCompile, "compile(...)");
        tokenPattern = patternCompile;
        $stable = 8;
    }

    private CitationMarkdownTransform() {
    }

    private final String normalizeMalformedMarkers(String content) {
        return blockedStatusRegex.h(b.f42142b, malformedParenRegex.h("[$1]", malformedBracketRegex.h("[$1]", content)));
    }

    private final String rewriteCitationSegment(String content, List<ChatMessage.Source> sources) {
        return citationRegex.g(normalizeMalformedMarkers(content), new m0(3, sources));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence rewriteCitationSegment$lambda$2(List list, MatchResult match) {
        Intrinsics.g(match, "match");
        String str = (String) g.Z0(1, match.a());
        Integer numU0 = str != null ? i.u0(str) : null;
        return (numU0 == null || g.Z0(numU0.intValue() - 1, list) == null) ? b.f42142b : INSTANCE.tokenFor(numU0.intValue());
    }

    private final String rewriteCitations(String content, List<ChatMessage.Source> sources) {
        return rewriteOutside(content, fencedCodeBlockRegex, new m0(1, sources));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String rewriteCitations$lambda$1(List list, String segment) {
        Intrinsics.g(segment, "segment");
        return INSTANCE.rewriteOutside(segment, inlineCodeRegex, new m0(2, list));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String rewriteCitations$lambda$1$lambda$0(List list, String inner) {
        Intrinsics.g(inner, "inner");
        return INSTANCE.rewriteCitationSegment(inner, list);
    }

    private final String rewriteOutside(String content, Regex protectedRegex, Function1<? super String, String> rewrite) {
        StringBuilder sb2 = new StringBuilder(content.length());
        GeneratorSequence$iterator$1 generatorSequence$iterator$1 = new GeneratorSequence$iterator$1(Regex.d(protectedRegex, content));
        int i5 = 0;
        while (generatorSequence$iterator$1.hasNext()) {
            MatchResult matchResult = (MatchResult) generatorSequence$iterator$1.next();
            int i11 = matchResult.b().f71906a;
            int i12 = matchResult.b().f71907b + 1;
            if (i5 < i11) {
                String strSubstring = content.substring(i5, i11);
                Intrinsics.f(strSubstring, "substring(...)");
                sb2.append((String) rewrite.invoke(strSubstring));
            }
            sb2.append(matchResult.getValue());
            i5 = i12;
        }
        if (i5 < content.length()) {
            String strSubstring2 = content.substring(i5);
            Intrinsics.f(strSubstring2, "substring(...)");
            sb2.append((String) rewrite.invoke(strSubstring2));
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @NotNull
    public final Pattern getTokenPattern() {
        return tokenPattern;
    }

    @NotNull
    public final List<ChatMessage.Source> normalizeSources(@NotNull List<ChatMessage.Source> sources) {
        Intrinsics.g(sources, "sources");
        if (sources.isEmpty()) {
            return EmptyList.f71733a;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ArrayList arrayList = new ArrayList();
        for (ChatMessage.Source source : sources) {
            String string = k.u1(source.getUrl()).toString();
            if (string.length() != 0) {
                String string2 = k.u1(source.getTitle()).toString();
                if (linkedHashSet.add(new Pair(string, string2))) {
                    arrayList.add(new ChatMessage.Source(string, string2));
                }
            }
        }
        return arrayList;
    }

    @NotNull
    public final CitationPreparedMarkdown prepare(@NotNull String content, @NotNull List<ChatMessage.Source> sources) {
        Intrinsics.g(content, "content");
        Intrinsics.g(sources, "sources");
        List<ChatMessage.Source> listNormalizeSources = normalizeSources(sources);
        return new CitationPreparedMarkdown(rewriteCitations(content, listNormalizeSources), listNormalizeSources);
    }

    @NotNull
    public final String tokenFor(int index) {
        return c0.i(index, "{{AI_CITATION_", "}}");
    }
}
