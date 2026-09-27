.class public final Lkotlin/text/RegexKt;
.super Ljava/lang/Object;
.source "Regex.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRegex.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Regex.kt\nkotlin/text/RegexKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,420:1\n2002#2,3:421\n*S KotlinDebug\n*F\n+ 1 Regex.kt\nkotlin/text/RegexKt\n*L\n21#1:421,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0000\n\u0002\u0010\u0008\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0000\n\u0002\u0010\u0010\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0082\u0080\u0004\u001a.\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u00060\u0005\"\u0014\u0008\u0000\u0010\u0006\u0018\u0001*\u00020\u0003*\u0008\u0012\u0004\u0012\u0002H\u00060\u00072\u0006\u0010\u0008\u001a\u00020\u0001H\u0082\u0088\u0004\u001a \u0010\t\u001a\u0004\u0018\u00010\n*\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u00012\u0006\u0010\r\u001a\u00020\u000eH\u0082\u0080\u0004\u001a\u0018\u0010\u000f\u001a\u0004\u0018\u00010\n*\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000eH\u0082\u0080\u0004\u001a\u000e\u0010\u0010\u001a\u00020\u0011*\u00020\u0012H\u0082\u0080\u0004\u001a\u0016\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0001H\u0082\u0080\u0004\u00a8\u0006\u0014"
    }
    d2 = {
        "toInt",
        "",
        "",
        "Lkotlin/text/FlagEnum;",
        "fromInt",
        "",
        "T",
        "",
        "value",
        "findNext",
        "Lkotlin/text/MatchResult;",
        "Ljava/util/regex/Matcher;",
        "from",
        "input",
        "",
        "matchEntire",
        "range",
        "Lkotlin/ranges/IntRange;",
        "Ljava/util/regex/MatchResult;",
        "groupIndex",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$findNext(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lkotlin/text/MatchResult;
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lkotlin/text/RegexKt;->findNext(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$matchEntire(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/text/RegexKt;->matchEntire(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$range(Ljava/util/regex/MatchResult;)Lkotlin/ranges/IntRange;
    .registers 1

    .line 1
    invoke-static {p0}, Lkotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;)Lkotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$range(Ljava/util/regex/MatchResult;I)Lkotlin/ranges/IntRange;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;I)Lkotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$toInt(Ljava/lang/Iterable;)I
    .registers 1

    .line 1
    invoke-static {p0}, Lkotlin/text/RegexKt;->toInt(Ljava/lang/Iterable;)I

    move-result p0

    return p0
.end method

.method private static final findNext(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lkotlin/text/MatchResult;
    .registers 3

    .line 366
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->find(I)Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance p1, Lkotlin/text/MatcherMatchResult;

    invoke-direct {p1, p0, p2}, Lkotlin/text/MatcherMatchResult;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V

    check-cast p1, Lkotlin/text/MatchResult;

    return-object p1
.end method

.method private static final synthetic fromInt(I)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;:",
            "Lkotlin/text/FlagEnum;",
            ">(I)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x4

    .line 24
    const-string v1, "T"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v0, Ljava/lang/Enum;

    move-object v1, v0

    check-cast v1, Ljava/lang/Class;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/util/EnumSet;

    .line 25
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    new-instance v2, Lkotlin/text/RegexKt$fromInt$1$1;

    invoke-direct {v2, p0}, Lkotlin/text/RegexKt$fromInt$1$1;-><init>(I)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->retainAll(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;)Z

    .line 24
    check-cast v0, Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    const-string v0, "unmodifiableSet(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    check-cast v0, Ljava/util/Set;

    return-object p0
.end method

.method private static final matchEntire(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;
    .registers 3

    .line 370
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance v0, Lkotlin/text/MatcherMatchResult;

    invoke-direct {v0, p0, p1}, Lkotlin/text/MatcherMatchResult;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V

    check-cast v0, Lkotlin/text/MatchResult;

    return-object v0
.end method

.method private static final range(Ljava/util/regex/MatchResult;)Lkotlin/ranges/IntRange;
    .registers 2

    .line 418
    invoke-interface {p0}, Ljava/util/regex/MatchResult;->start()I

    move-result v0

    invoke-interface {p0}, Ljava/util/regex/MatchResult;->end()I

    move-result p0

    invoke-static {v0, p0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method private static final range(Ljava/util/regex/MatchResult;I)Lkotlin/ranges/IntRange;
    .registers 3

    .line 419
    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->start(I)I

    move-result v0

    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->end(I)I

    move-result p0

    invoke-static {v0, p0}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object p0

    return-object p0
.end method

.method private static final toInt(Ljava/lang/Iterable;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lkotlin/text/FlagEnum;",
            ">;)I"
        }
    .end annotation

    .line 422
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/text/FlagEnum;

    .line 21
    invoke-interface {v1}, Lkotlin/text/FlagEnum;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    goto :goto_5

    :cond_17
    return v0
.end method
