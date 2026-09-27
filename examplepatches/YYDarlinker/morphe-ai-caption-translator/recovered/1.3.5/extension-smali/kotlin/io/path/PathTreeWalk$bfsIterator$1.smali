.class final Lkotlin/io/path/PathTreeWalk$bfsIterator$1;
.super Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "PathTreeWalk.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/io/path/PathTreeWalk;->bfsIterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlin/sequences/SequenceScope<",
        "-",
        "Ljava/nio/file/Path;",
        ">;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPathTreeWalk.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk$bfsIterator$1\n+ 2 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk\n*L\n1#1,180:1\n44#2,19:181\n*S KotlinDebug\n*F\n+ 1 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk$bfsIterator$1\n*L\n101#1:181,19\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlin/sequences/SequenceScope;",
        "Ljava/nio/file/Path;"
    }
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "kotlin.io.path.PathTreeWalk$bfsIterator$1"
    f = "PathTreeWalk.kt"
    i = {
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x0,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1
    }
    l = {
        0xbf,
        0xc5
    }
    m = "invokeSuspend"
    n = {
        "$this$iterator",
        "queue",
        "entriesReader",
        "pathNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv",
        "$this$iterator",
        "queue",
        "entriesReader",
        "pathNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv"
    }
    nl = {
        0xc1,
        0xc7
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8"
    }
    v = 0x2
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lkotlin/io/path/PathTreeWalk;


# direct methods
.method constructor <init>(Lkotlin/io/path/PathTreeWalk;Lkotlin/coroutines/Continuation;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/io/path/PathTreeWalk;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/io/path/PathTreeWalk$bfsIterator$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;

    iget-object p0, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    invoke-direct {v0, p0, p2}, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;-><init>(Lkotlin/io/path/PathTreeWalk;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lkotlin/sequences/SequenceScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/SequenceScope<",
            "-",
            "Ljava/nio/file/Path;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/sequences/SequenceScope;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 92
    iget v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->label:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_66

    if-eq v2, v4, :cond_3f

    if-ne v2, v3, :cond_37

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$8:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v2, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v2, Lkotlin/io/path/PathNode;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v2, Lkotlin/sequences/SequenceScope;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v2, Lkotlin/io/path/PathTreeWalk;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v2, Lkotlin/io/path/PathNode;

    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v2, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v5, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v5, Lkotlin/collections/ArrayDeque;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_99

    :cond_37
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3f
    iget-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$8:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    move-result-object v2

    iget-object v5, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v5, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v6, Lkotlin/io/path/PathNode;

    iget-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v7, Lkotlin/sequences/SequenceScope;

    iget-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v7, Lkotlin/io/path/PathTreeWalk;

    iget-object v8, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v8, Lkotlin/io/path/PathNode;

    iget-object v8, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v8, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v9, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v9, Lkotlin/collections/ArrayDeque;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_107

    :cond_66
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 94
    new-instance p1, Lkotlin/collections/ArrayDeque;

    invoke-direct {p1}, Lkotlin/collections/ArrayDeque;-><init>()V

    .line 95
    new-instance v2, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v5, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # invokes: Lkotlin/io/path/PathTreeWalk;->getFollowLinks()Z
    invoke-static {v5}, Lkotlin/io/path/PathTreeWalk;->access$getFollowLinks(Lkotlin/io/path/PathTreeWalk;)Z

    move-result v5

    invoke-direct {v2, v5}, Lkotlin/io/path/DirectoryEntriesReader;-><init>(Z)V

    .line 97
    new-instance v5, Lkotlin/io/path/PathNode;

    iget-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # getter for: Lkotlin/io/path/PathTreeWalk;->start:Ljava/nio/file/Path;
    invoke-static {v6}, Lkotlin/io/path/PathTreeWalk;->access$getStart$p(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    move-result-object v6

    iget-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # getter for: Lkotlin/io/path/PathTreeWalk;->start:Ljava/nio/file/Path;
    invoke-static {v7}, Lkotlin/io/path/PathTreeWalk;->access$getStart$p(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    move-result-object v7

    iget-object v8, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v8}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v8

    # invokes: Lkotlin/io/path/PathTreeWalkKt;->keyOf(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Ljava/lang/Object;
    invoke-static {v7, v8}, Lkotlin/io/path/PathTreeWalkKt;->access$keyOf(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Ljava/lang/Object;

    move-result-object v7

    const/4 v8, 0x0

    invoke-direct {v5, v6, v7, v8}, Lkotlin/io/path/PathNode;-><init>(Ljava/nio/file/Path;Ljava/lang/Object;Lkotlin/io/path/PathNode;)V

    invoke-virtual {p1, v5}, Lkotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    move-object v5, p1

    .line 99
    :cond_99
    :goto_99
    move-object p1, v5

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_18a

    .line 100
    invoke-virtual {v5}, Lkotlin/collections/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    move-object v6, p1

    check-cast v6, Lkotlin/io/path/PathNode;

    .line 101
    iget-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 181
    invoke-virtual {v6}, Lkotlin/io/path/PathNode;->getPath()Ljava/nio/file/Path;

    move-result-object p1

    .line 182
    invoke-virtual {v6}, Lkotlin/io/path/PathNode;->getParent()Lkotlin/io/path/PathNode;

    move-result-object v8

    if-eqz v8, :cond_b8

    .line 184
    invoke-static {p1}, Lkotlin/io/path/PathsKt;->checkFileName(Ljava/nio/file/Path;)V

    .line 186
    :cond_b8
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v7}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v8

    array-length v9, v8

    invoke-static {v8, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/nio/file/LinkOption;

    array-length v9, v8

    invoke-static {v8, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/nio/file/LinkOption;

    invoke-static {p1, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v8

    if-eqz v8, :cond_13b

    .line 187
    # invokes: Lkotlin/io/path/PathTreeWalkKt;->createsCycle(Lkotlin/io/path/PathNode;)Z
    invoke-static {v6}, Lkotlin/io/path/PathTreeWalkKt;->access$createsCycle(Lkotlin/io/path/PathNode;)Z

    move-result v8

    if-nez v8, :cond_12f

    .line 190
    # invokes: Lkotlin/io/path/PathTreeWalk;->getIncludeDirectories()Z
    invoke-static {v7}, Lkotlin/io/path/PathTreeWalk;->access$getIncludeDirectories(Lkotlin/io/path/PathTreeWalk;)Z

    move-result v8

    if-eqz v8, :cond_10b

    .line 191
    move-object v8, p0

    check-cast v8, Lkotlin/coroutines/Continuation;

    iput-object v0, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v5, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$2:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$3:Ljava/lang/Object;

    iput-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$5:Ljava/lang/Object;

    iput-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$6:Ljava/lang/Object;

    iput-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$7:Ljava/lang/Object;

    iput-object p1, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$8:Ljava/lang/Object;

    iput v4, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->label:I

    invoke-virtual {v0, p1, v8}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v1, :cond_103

    goto/16 :goto_185

    :cond_103
    move-object v8, v2

    move-object v9, v5

    move-object v2, p1

    move-object v5, v8

    :goto_107
    move-object p1, v2

    move-object v2, v5

    move-object v5, v9

    goto :goto_10c

    :cond_10b
    move-object v8, v2

    .line 193
    :goto_10c
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v7}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v7

    array-length v9, v7

    invoke-static {v7, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/nio/file/LinkOption;

    array-length v9, v7

    invoke-static {v7, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/nio/file/LinkOption;

    invoke-static {p1, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result p1

    if-eqz p1, :cond_12d

    .line 194
    invoke-virtual {v2, v6}, Lkotlin/io/path/DirectoryEntriesReader;->readEntries(Lkotlin/io/path/PathNode;)Ljava/util/List;

    move-result-object p1

    .line 102
    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v5, p1}, Lkotlin/collections/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    :cond_12d
    move-object v2, v8

    goto :goto_186

    .line 188
    :cond_12f
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/nio/file/FileSystemLoopException;

    move-result-object p0

    throw p0

    .line 196
    :cond_13b
    new-array v8, v4, [Ljava/nio/file/LinkOption;

    const/4 v9, 0x0

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/LinkOption;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v8, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/nio/file/LinkOption;

    invoke-static {p1, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v8

    if-eqz v8, :cond_186

    .line 197
    move-object v8, p0

    check-cast v8, Lkotlin/coroutines/Continuation;

    iput-object v0, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v5, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v2, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$2:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$3:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$5:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$6:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$7:Ljava/lang/Object;

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->L$8:Ljava/lang/Object;

    iput v3, p0, Lkotlin/io/path/PathTreeWalk$bfsIterator$1;->label:I

    invoke-virtual {v0, p1, v8}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_99

    :goto_185
    return-object v1

    .line 199
    :cond_186
    :goto_186
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto/16 :goto_99

    .line 105
    :cond_18a
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
