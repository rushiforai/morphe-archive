.class public abstract Lnicoid/network238/kotlin/text/RegexKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final synthetic access$range(Ljava/util/regex/MatchResult;)Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/kotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$range(Ljava/util/regex/MatchResult;I)Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;I)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method private static final range(Ljava/util/regex/MatchResult;)Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 2

    .line 399
    invoke-interface {p0}, Ljava/util/regex/MatchResult;->start()I

    move-result v0

    invoke-interface {p0}, Ljava/util/regex/MatchResult;->end()I

    move-result p0

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method private static final range(Ljava/util/regex/MatchResult;I)Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 3

    .line 400
    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->start(I)I

    move-result v0

    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->end(I)I

    move-result p0

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method
