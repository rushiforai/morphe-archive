.class public final Lkotlin/text/MatcherMatchResult$groups$1;
.super Lkotlin/collections/AbstractCollection;
.source "Regex.kt"

# interfaces
.implements Lkotlin/text/MatchNamedGroupCollection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/text/MatcherMatchResult;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractCollection<",
        "Lkotlin/text/MatchGroup;",
        ">;",
        "Lkotlin/text/MatchNamedGroupCollection;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000/\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010(\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u00012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002J\n\u0010\u0008\u001a\u00020\tH\u0096\u0080\u0004J\u0012\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u000bH\u0096\u0082\u0004J\u0014\u0010\u000c\u001a\u0004\u0018\u00010\u00032\u0006\u0010\r\u001a\u00020\u0005H\u0096\u0082\u0004J\u0014\u0010\u000c\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000e\u001a\u00020\u000fH\u0096\u0082\u0004R\u0015\u0010\u0004\u001a\u00020\u00058VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "kotlin/text/MatcherMatchResult$groups$1",
        "Lkotlin/text/MatchNamedGroupCollection;",
        "Lkotlin/collections/AbstractCollection;",
        "Lkotlin/text/MatchGroup;",
        "size",
        "",
        "getSize",
        "()I",
        "isEmpty",
        "",
        "iterator",
        "",
        "get",
        "index",
        "name",
        "",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lkotlin/text/MatcherMatchResult;


# direct methods
.method constructor <init>(Lkotlin/text/MatcherMatchResult;)V
    .registers 2

    iput-object p1, p0, Lkotlin/text/MatcherMatchResult$groups$1;->this$0:Lkotlin/text/MatcherMatchResult;

    .line 380
    invoke-direct {p0}, Lkotlin/collections/AbstractCollection;-><init>()V

    return-void
.end method

.method static final iterator$lambda$0(Lkotlin/text/MatcherMatchResult$groups$1;I)Lkotlin/text/MatchGroup;
    .registers 2

    .line 384
    invoke-virtual {p0, p1}, Lkotlin/text/MatcherMatchResult$groups$1;->get(I)Lkotlin/text/MatchGroup;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    if-nez p1, :cond_4

    const/4 v0, 0x1

    goto :goto_6

    .line 380
    :cond_4
    instance-of v0, p1, Lkotlin/text/MatchGroup;

    :goto_6
    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    check-cast p1, Lkotlin/text/MatchGroup;

    invoke-virtual {p0, p1}, Lkotlin/text/MatcherMatchResult$groups$1;->contains(Lkotlin/text/MatchGroup;)Z

    move-result p0

    return p0
.end method

.method public bridge contains(Lkotlin/text/MatchGroup;)Z
    .registers 2

    .line 380
    invoke-super {p0, p1}, Lkotlin/collections/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public get(I)Lkotlin/text/MatchGroup;
    .registers 4

    .line 386
    iget-object v0, p0, Lkotlin/text/MatcherMatchResult$groups$1;->this$0:Lkotlin/text/MatcherMatchResult;

    # invokes: Lkotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {v0}, Lkotlin/text/MatcherMatchResult;->access$getMatchResult(Lkotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object v0

    # invokes: Lkotlin/text/RegexKt;->range(Ljava/util/regex/MatchResult;I)Lkotlin/ranges/IntRange;
    invoke-static {v0, p1}, Lkotlin/text/RegexKt;->access$range(Ljava/util/regex/MatchResult;I)Lkotlin/ranges/IntRange;

    move-result-object v0

    .line 387
    invoke-virtual {v0}, Lkotlin/ranges/IntRange;->getStart()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_29

    .line 388
    new-instance v1, Lkotlin/text/MatchGroup;

    iget-object p0, p0, Lkotlin/text/MatcherMatchResult$groups$1;->this$0:Lkotlin/text/MatcherMatchResult;

    # invokes: Lkotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {p0}, Lkotlin/text/MatcherMatchResult;->access$getMatchResult(Lkotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "group(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, p0, v0}, Lkotlin/text/MatchGroup;-><init>(Ljava/lang/String;Lkotlin/ranges/IntRange;)V

    return-object v1

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public get(Ljava/lang/String;)Lkotlin/text/MatchGroup;
    .registers 3

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 394
    sget-object v0, Lkotlin/internal/PlatformImplementationsKt;->IMPLEMENTATIONS:Lkotlin/internal/PlatformImplementations;

    iget-object p0, p0, Lkotlin/text/MatcherMatchResult$groups$1;->this$0:Lkotlin/text/MatcherMatchResult;

    # invokes: Lkotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {p0}, Lkotlin/text/MatcherMatchResult;->access$getMatchResult(Lkotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lkotlin/internal/PlatformImplementations;->getMatchResultNamedGroup(Ljava/util/regex/MatchResult;Ljava/lang/String;)Lkotlin/text/MatchGroup;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 381
    iget-object p0, p0, Lkotlin/text/MatcherMatchResult$groups$1;->this$0:Lkotlin/text/MatcherMatchResult;

    # invokes: Lkotlin/text/MatcherMatchResult;->getMatchResult()Ljava/util/regex/MatchResult;
    invoke-static {p0}, Lkotlin/text/MatcherMatchResult;->access$getMatchResult(Lkotlin/text/MatcherMatchResult;)Ljava/util/regex/MatchResult;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lkotlin/text/MatchGroup;",
            ">;"
        }
    .end annotation

    .line 384
    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->getIndices(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lkotlin/sequences/Sequence;

    move-result-object v0

    new-instance v1, Lkotlin/text/MatcherMatchResult$groups$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lkotlin/text/MatcherMatchResult$groups$1$$ExternalSyntheticLambda0;-><init>(Lkotlin/text/MatcherMatchResult$groups$1;)V

    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->map(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
