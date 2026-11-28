.class public final Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;
.super Lnicoid/network238/kotlin/collections/AbstractCollection;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/text/MatchGroupCollection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/text/MatcherMatchResult;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/text/MatcherMatchResult;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    .line 361
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractCollection;-><init>()V

    return-void
.end method

.method static final iterator$lambda$0(Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;I)Lnicoid/network238/kotlin/text/MatchGroup;
    .registers 2

    .line 365
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->get(I)Lnicoid/network238/kotlin/text/MatchGroup;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 361
    :cond_0
    instance-of v0, p1, Lnicoid/network238/kotlin/text/MatchGroup;

    :goto_0
    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    check-cast p1, Lnicoid/network238/kotlin/text/MatchGroup;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->contains(Lnicoid/network238/kotlin/text/MatchGroup;)Z

    move-result p1

    return p1
.end method

.method public bridge contains(Lnicoid/network238/kotlin/text/MatchGroup;)Z
    .registers 2

    .line 361
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(I)Lnicoid/network238/kotlin/text/MatchGroup;
    .registers 5

    .line 367
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    # invokes: Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v0

    # invokes: Lnicoid/network238/kotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;I)Lnicoid/network238/kotlin/ranges/IntRange;
    invoke-static {v0, p1}, Lnicoid/network238/kotlin/text/RegexKt;->access$range(Ljava/util/regex/MatchResult;I)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    .line 368
    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntRange;->getStart()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_0

    .line 369
    new-instance v1, Lnicoid/network238/kotlin/text/MatchGroup;

    iget-object v2, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    # invokes: Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v2}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, p1, v0}, Lnicoid/network238/kotlin/text/MatchGroup;-><init>(Ljava/lang/String;Lnicoid/network238/kotlin/ranges/IntRange;)V

    return-object v1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 362
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    # invokes: Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3

    .line 365
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->getIndices(Ljava/util/Collection;)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object v0

    new-instance v1, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1$0;

    invoke-direct {v1, p0}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1$0;-><init>(Lnicoid/network238/kotlin/text/MatcherMatchResult$groups$1;)V

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/sequences/SequencesKt;->map(Lnicoid/network238/kotlin/sequences/Sequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
