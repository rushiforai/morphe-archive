.class public final Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;
.super Lnicoid/network238/kotlin/collections/AbstractList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/text/MatcherMatchResult;->getGroupValues()Ljava/util/List;
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

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    .line 384
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 384
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->contains(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public bridge contains(Ljava/lang/String;)Z
    .registers 2

    .line 384
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 384
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->get(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Ljava/lang/String;
    .registers 3

    .line 386
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    # invokes: Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 385
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->this$0:Lnicoid/network238/kotlin/text/MatcherMatchResult;

    # invokes: Lnicoid/network238/kotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/MatcherMatchResult;->access$getMatchResult(Lnicoid/network238/kotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 384
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->indexOf(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge indexOf(Ljava/lang/String;)I
    .registers 2

    .line 384
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 384
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/text/MatcherMatchResult$groupValues$1;->lastIndexOf(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge lastIndexOf(Ljava/lang/String;)I
    .registers 2

    .line 384
    invoke-super {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList;->lastIndexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method
