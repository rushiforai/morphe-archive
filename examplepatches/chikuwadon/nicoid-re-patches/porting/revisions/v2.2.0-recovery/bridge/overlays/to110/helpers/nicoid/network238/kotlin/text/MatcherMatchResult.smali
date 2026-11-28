.class final Lnicoid/network238/kotlin/text/MatcherMatchResult;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/text/MatchResult;


# instance fields
.field private groupValues_:Ljava/util/List;

.field private final groups:Lnicoid/network238/kotlin/text/MatchGroupCollection;

.field private final input:Ljava/lang/CharSequence;

.field private final matcher:Ljava/util/regex/Matcher;


# direct methods
.method public constructor <init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->matcher:Ljava/util/regex/Matcher;

    iput-object p2, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->input:Ljava/lang/CharSequence;

    .line 361
    new-instance p1, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;

    invoke-direct {p1, p0}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;-><init>(Lnicoid/network238/kotlin/text/MatcherMatchResult;)V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->groups:Lnicoid/network238/kotlin/text/MatchGroupCollection;

    return-void
.end method

.method public static final synthetic access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;
    .registers 1

    .line 354
    invoke-direct {p0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method private final getMatchResult()Ljava/util/regex/MatchResult;
    .registers 2

    .line 355
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->matcher:Ljava/util/regex/Matcher;

    return-object v0
.end method


# virtual methods
.method public getGroupValues()Ljava/util/List;
    .registers 2

    .line 383
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->groupValues_:Ljava/util/List;

    if-nez v0, :cond_0

    .line 384
    new-instance v0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;-><init>(Lnicoid/network238/kotlin/text/MatcherMatchResult;)V

    iput-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->groupValues_:Ljava/util/List;

    .line 389
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->groupValues_:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public getGroups()Lnicoid/network238/kotlin/text/MatchGroupCollection;
    .registers 2

    .line 361
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult;->groups:Lnicoid/network238/kotlin/text/MatchGroupCollection;

    return-object v0
.end method

.method public getRange()Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 2

    .line 357
    invoke-direct {p0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;

    move-result-object v0

    # invokes: Lnicoid/network238/kotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;)Lnicoid/network238/kotlin/ranges/IntRange;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/RegexKt;->access$range(Ljava/util/regex/MatchResult;)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    return-object v0
.end method
