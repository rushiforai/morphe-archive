.class final Lkotlin/io/path/PathTreeWalk$dfsIterator$1;
.super Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "PathTreeWalk.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/io/path/PathTreeWalk;->dfsIterator()Ljava/util/Iterator;
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
    value = "SMAP\nPathTreeWalk.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk$dfsIterator$1\n+ 2 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk\n*L\n1#1,180:1\n44#2,19:181\n44#2,19:200\n*S KotlinDebug\n*F\n+ 1 PathTreeWalk.kt\nkotlin/io/path/PathTreeWalk$dfsIterator$1\n*L\n70#1:181,19\n81#1:200,19\n*E\n"
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
    c = "kotlin.io.path.PathTreeWalk$dfsIterator$1"
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
        0x1,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3,
        0x3
    }
    l = {
        0xbf,
        0xc5,
        0xd2,
        0xd8
    }
    m = "invokeSuspend"
    n = {
        "$this$iterator",
        "stack",
        "entriesReader",
        "startNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv",
        "$this$iterator",
        "stack",
        "entriesReader",
        "startNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv",
        "$this$iterator",
        "stack",
        "entriesReader",
        "startNode",
        "topNode",
        "topIterator",
        "pathNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv",
        "$this$iterator",
        "stack",
        "entriesReader",
        "startNode",
        "topNode",
        "topIterator",
        "pathNode",
        "this_$iv",
        "$this$yieldIfNeeded$iv",
        "node$iv",
        "entriesReader$iv",
        "path$iv"
    }
    nl = {
        0xc1,
        0xc7,
        0xd4,
        0xda
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
        "L$8",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$9",
        "L$10",
        "L$11",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$9",
        "L$10",
        "L$11"
    }
    v = 0x2
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$10:Ljava/lang/Object;

.field L$11:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field L$9:Ljava/lang/Object;

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
            "Lkotlin/io/path/PathTreeWalk$dfsIterator$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

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

    new-instance v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;

    iget-object p0, p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    invoke-direct {v0, p0, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;-><init>(Lkotlin/io/path/PathTreeWalk;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lkotlin/sequences/SequenceScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlin/sequences/SequenceScope;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 64
    iget v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eqz v3, :cond_d9

    if-eq v3, v8, :cond_b2

    if-eq v3, v7, :cond_8c

    if-eq v3, v6, :cond_57

    if-ne v3, v5, :cond_4f

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    check-cast v3, Lkotlin/sequences/SequenceScope;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathTreeWalk;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v3, Ljava/util/Iterator;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v7, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v9, Lkotlin/collections/ArrayDeque;

    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move/from16 v16, v4

    goto/16 :goto_32e

    :cond_4f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_57
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    move-result-object v3

    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    check-cast v7, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    check-cast v9, Lkotlin/io/path/PathNode;

    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    check-cast v10, Lkotlin/sequences/SequenceScope;

    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v10, Lkotlin/io/path/PathTreeWalk;

    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v11, Lkotlin/io/path/PathNode;

    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v12, Ljava/util/Iterator;

    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v12, Lkotlin/io/path/PathNode;

    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v12, Lkotlin/io/path/PathNode;

    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v13, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v14, Lkotlin/collections/ArrayDeque;

    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move/from16 v16, v4

    goto/16 :goto_28b

    :cond_8c
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v3, Lkotlin/sequences/SequenceScope;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathTreeWalk;

    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v3, Lkotlin/io/path/PathNode;

    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v7, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v9, Lkotlin/collections/ArrayDeque;

    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_1f8

    :cond_b2
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/Path;

    move-result-object v3

    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    check-cast v7, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    check-cast v9, Lkotlin/io/path/PathNode;

    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    check-cast v10, Lkotlin/sequences/SequenceScope;

    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    check-cast v10, Lkotlin/io/path/PathTreeWalk;

    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    check-cast v11, Lkotlin/io/path/PathNode;

    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    check-cast v12, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    check-cast v13, Lkotlin/collections/ArrayDeque;

    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_165

    :cond_d9
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 66
    new-instance v9, Lkotlin/collections/ArrayDeque;

    invoke-direct {v9}, Lkotlin/collections/ArrayDeque;-><init>()V

    .line 67
    new-instance v3, Lkotlin/io/path/DirectoryEntriesReader;

    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # invokes: Lkotlin/io/path/PathTreeWalk;->getFollowLinks()Z
    invoke-static {v10}, Lkotlin/io/path/PathTreeWalk;->access$getFollowLinks(Lkotlin/io/path/PathTreeWalk;)Z

    move-result v10

    invoke-direct {v3, v10}, Lkotlin/io/path/DirectoryEntriesReader;-><init>(Z)V

    .line 69
    new-instance v10, Lkotlin/io/path/PathNode;

    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # getter for: Lkotlin/io/path/PathTreeWalk;->start:Ljava/nio/file/Path;
    invoke-static {v11}, Lkotlin/io/path/PathTreeWalk;->access$getStart$p(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    move-result-object v11

    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # getter for: Lkotlin/io/path/PathTreeWalk;->start:Ljava/nio/file/Path;
    invoke-static {v12}, Lkotlin/io/path/PathTreeWalk;->access$getStart$p(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    move-result-object v12

    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v13

    # invokes: Lkotlin/io/path/PathTreeWalkKt;->keyOf(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Ljava/lang/Object;
    invoke-static {v12, v13}, Lkotlin/io/path/PathTreeWalkKt;->access$keyOf(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Ljava/lang/Object;

    move-result-object v12

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lkotlin/io/path/PathNode;-><init>(Ljava/nio/file/Path;Ljava/lang/Object;Lkotlin/io/path/PathNode;)V

    .line 70
    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 181
    invoke-virtual {v10}, Lkotlin/io/path/PathNode;->getPath()Ljava/nio/file/Path;

    move-result-object v12

    .line 182
    invoke-virtual {v10}, Lkotlin/io/path/PathNode;->getParent()Lkotlin/io/path/PathNode;

    move-result-object v13

    if-eqz v13, :cond_117

    .line 184
    invoke-static {v12}, Lkotlin/io/path/PathsKt;->checkFileName(Ljava/nio/file/Path;)V

    .line 186
    :cond_117
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v11}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v13

    array-length v14, v13

    invoke-static {v13, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/nio/file/LinkOption;

    array-length v14, v13

    invoke-static {v13, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/nio/file/LinkOption;

    invoke-static {v12, v13}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v13

    if-eqz v13, :cond_1a7

    .line 187
    # invokes: Lkotlin/io/path/PathTreeWalkKt;->createsCycle(Lkotlin/io/path/PathNode;)Z
    invoke-static {v10}, Lkotlin/io/path/PathTreeWalkKt;->access$createsCycle(Lkotlin/io/path/PathNode;)Z

    move-result v7

    if-nez v7, :cond_19b

    .line 190
    # invokes: Lkotlin/io/path/PathTreeWalk;->getIncludeDirectories()Z
    invoke-static {v11}, Lkotlin/io/path/PathTreeWalk;->access$getIncludeDirectories(Lkotlin/io/path/PathTreeWalk;)Z

    move-result v7

    if-eqz v7, :cond_16e

    .line 191
    move-object v7, v0

    check-cast v7, Lkotlin/coroutines/Continuation;

    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    iput-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    iput-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    iput v8, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    invoke-virtual {v1, v12, v7}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v2, :cond_15e

    goto/16 :goto_325

    :cond_15e
    move-object v7, v3

    move-object v13, v9

    move-object v9, v10

    move-object v10, v11

    move-object v3, v12

    move-object v12, v7

    move-object v11, v9

    :goto_165
    move-object/from16 v17, v13

    move-object v13, v3

    move-object v3, v7

    move-object v7, v10

    move-object v10, v9

    move-object/from16 v9, v17

    goto :goto_172

    :cond_16e
    move-object v7, v11

    move-object v13, v12

    move-object v12, v3

    move-object v11, v10

    .line 193
    :goto_172
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v7}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v7

    array-length v14, v7

    invoke-static {v7, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/nio/file/LinkOption;

    array-length v14, v7

    invoke-static {v7, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/nio/file/LinkOption;

    invoke-static {v13, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v7

    if-eqz v7, :cond_198

    .line 194
    invoke-virtual {v3, v10}, Lkotlin/io/path/DirectoryEntriesReader;->readEntries(Lkotlin/io/path/PathNode;)Ljava/util/List;

    move-result-object v3

    .line 71
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-virtual {v11, v3}, Lkotlin/io/path/PathNode;->setContentIterator(Ljava/util/Iterator;)V

    .line 72
    invoke-virtual {v9, v11}, Lkotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_198
    move-object v10, v11

    move-object v3, v12

    goto :goto_1f5

    .line 188
    :cond_19b
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1()V

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/nio/file/FileSystemLoopException;

    move-result-object v0

    throw v0

    .line 196
    :cond_1a7
    new-array v13, v8, [Ljava/nio/file/LinkOption;

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/LinkOption;

    move-result-object v14

    aput-object v14, v13, v4

    invoke-static {v13, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/nio/file/LinkOption;

    invoke-static {v12, v13}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v13

    if-eqz v13, :cond_1f5

    .line 197
    move-object v13, v0

    check-cast v13, Lkotlin/coroutines/Continuation;

    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    iput v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    invoke-virtual {v1, v12, v13}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v2, :cond_1f2

    goto/16 :goto_325

    :cond_1f2
    :goto_1f2
    move-object v7, v3

    move-object v3, v10

    goto :goto_1f8

    .line 199
    :cond_1f5
    :goto_1f5
    sget-object v7, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_1f2

    .line 75
    :goto_1f8
    move-object v10, v9

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_332

    .line 76
    invoke-virtual {v9}, Lkotlin/collections/ArrayDeque;->last()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lkotlin/io/path/PathNode;

    .line 77
    invoke-virtual {v10}, Lkotlin/io/path/PathNode;->getContentIterator()Ljava/util/Iterator;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 79
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_329

    .line 80
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lkotlin/io/path/PathNode;

    .line 81
    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 200
    invoke-virtual {v12}, Lkotlin/io/path/PathNode;->getPath()Ljava/nio/file/Path;

    move-result-object v14

    .line 201
    invoke-virtual {v12}, Lkotlin/io/path/PathNode;->getParent()Lkotlin/io/path/PathNode;

    move-result-object v15

    if-eqz v15, :cond_229

    .line 203
    invoke-static {v14}, Lkotlin/io/path/PathsKt;->checkFileName(Ljava/nio/file/Path;)V

    .line 205
    :cond_229
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v15

    move/from16 v16, v4

    array-length v4, v15

    invoke-static {v15, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/nio/file/LinkOption;

    array-length v15, v4

    invoke-static {v4, v15}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/nio/file/LinkOption;

    invoke-static {v14, v4}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v4

    if-eqz v4, :cond_2ca

    .line 206
    # invokes: Lkotlin/io/path/PathTreeWalkKt;->createsCycle(Lkotlin/io/path/PathNode;)Z
    invoke-static {v12}, Lkotlin/io/path/PathTreeWalkKt;->access$createsCycle(Lkotlin/io/path/PathNode;)Z

    move-result v4

    if-nez v4, :cond_2be

    .line 209
    # invokes: Lkotlin/io/path/PathTreeWalk;->getIncludeDirectories()Z
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->access$getIncludeDirectories(Lkotlin/io/path/PathTreeWalk;)Z

    move-result v4

    if-eqz v4, :cond_293

    .line 210
    move-object v4, v0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    iput-object v15, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    iput-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    iput-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    iput v6, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    invoke-virtual {v1, v14, v4}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_284

    goto/16 :goto_325

    :cond_284
    move-object v11, v12

    move-object v10, v13

    move-object v12, v3

    move-object v13, v7

    move-object v3, v14

    move-object v14, v9

    move-object v9, v11

    :goto_28b
    move-object/from16 v17, v14

    move-object v14, v3

    move-object v3, v12

    move-object v12, v9

    move-object/from16 v9, v17

    goto :goto_296

    :cond_293
    move-object v11, v12

    move-object v10, v13

    move-object v13, v7

    .line 212
    :goto_296
    # invokes: Lkotlin/io/path/PathTreeWalk;->getLinkOptions()[Ljava/nio/file/LinkOption;
    invoke-static {v10}, Lkotlin/io/path/PathTreeWalk;->access$getLinkOptions(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    move-result-object v4

    array-length v10, v4

    invoke-static {v4, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/nio/file/LinkOption;

    array-length v10, v4

    invoke-static {v4, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/nio/file/LinkOption;

    invoke-static {v14, v4}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v4

    if-eqz v4, :cond_2bc

    .line 213
    invoke-virtual {v7, v12}, Lkotlin/io/path/DirectoryEntriesReader;->readEntries(Lkotlin/io/path/PathNode;)Ljava/util/List;

    move-result-object v4

    .line 82
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-virtual {v11, v4}, Lkotlin/io/path/PathNode;->setContentIterator(Ljava/util/Iterator;)V

    .line 83
    invoke-virtual {v9, v11}, Lkotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_2bc
    move-object v7, v13

    goto :goto_326

    .line 207
    :cond_2be
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1()V

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/nio/file/FileSystemLoopException;

    move-result-object v0

    throw v0

    .line 215
    :cond_2ca
    new-array v4, v8, [Ljava/nio/file/LinkOption;

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/LinkOption;

    move-result-object v15

    aput-object v15, v4, v16

    invoke-static {v4, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/nio/file/LinkOption;

    invoke-static {v14, v4}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v4

    if-eqz v4, :cond_326

    .line 216
    move-object v4, v0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    iput-object v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    iput-object v15, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    invoke-static {v14}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    iput v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    invoke-virtual {v1, v14, v4}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_32e

    :goto_325
    return-object v2

    .line 218
    :cond_326
    :goto_326
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_32e

    :cond_329
    move/from16 v16, v4

    .line 87
    invoke-virtual {v9}, Lkotlin/collections/ArrayDeque;->removeLast()Ljava/lang/Object;

    :cond_32e
    :goto_32e
    move/from16 v4, v16

    goto/16 :goto_1f8

    .line 90
    :cond_332
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
