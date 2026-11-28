.class final Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/internal/-FileSystem;->commonListRecursively(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;",
        "Lnicoid/network238/kotlin/jvm/functions/Function2;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lnicoid/network238/kotlin/sequences/SequenceScope;",
        "Lnicoid/network238/okio/Path;"
    }
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;
    c = "nicoid.network238.okio.internal.-FileSystem$commonListRecursively$1"
    f = "FileSystem.kt"
    l = {
        0x60
    }
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
.field final synthetic $dir:Lnicoid/network238/okio/Path;

.field final synthetic $followSymlinks:Z

.field final synthetic $this_commonListRecursively:Lnicoid/network238/okio/FileSystem;

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;ZLnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Path;",
            "Lnicoid/network238/okio/FileSystem;",
            "Z",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$dir:Lnicoid/network238/okio/Path;

    iput-object p2, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$this_commonListRecursively:Lnicoid/network238/okio/FileSystem;

    iput-boolean p3, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$followSymlinks:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;-><init>(ILnicoid/network238/kotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")",
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation

    new-instance v0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;

    iget-object v1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$dir:Lnicoid/network238/okio/Path;

    iget-object v2, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$this_commonListRecursively:Lnicoid/network238/okio/FileSystem;

    iget-boolean v3, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$followSymlinks:Z

    invoke-direct {v0, v1, v2, v3, p2}, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;-><init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;ZLnicoid/network238/kotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnicoid/network238/kotlin/sequences/SequenceScope;

    check-cast p2, Lnicoid/network238/kotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->invoke(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/sequences/SequenceScope;",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->create(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;

    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    invoke-virtual {p1, p2}, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 92
    iget v1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$2:Ljava/lang/Object;

    check-cast v1, Ljava/util/Iterator;

    iget-object v3, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$1:Ljava/lang/Object;

    check-cast v3, Lnicoid/network238/kotlin/collections/ArrayDeque;

    iget-object v4, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$0:Ljava/lang/Object;

    check-cast v4, Lnicoid/network238/kotlin/sequences/SequenceScope;

    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v5, v3

    move-object v3, v4

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$0:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lnicoid/network238/kotlin/sequences/SequenceScope;

    .line 93
    new-instance v3, Lnicoid/network238/kotlin/collections/ArrayDeque;

    invoke-direct {v3}, Lnicoid/network238/kotlin/collections/ArrayDeque;-><init>()V

    .line 94
    iget-object p1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$dir:Lnicoid/network238/okio/Path;

    invoke-virtual {v3, p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 95
    iget-object p1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$this_commonListRecursively:Lnicoid/network238/okio/FileSystem;

    iget-object v1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$dir:Lnicoid/network238/okio/Path;

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/FileSystem;->list(Lnicoid/network238/okio/Path;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v5, v3

    move-object v3, v4

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    move-object v6, p1

    check-cast v6, Lnicoid/network238/okio/Path;

    .line 97
    iget-object v4, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$this_commonListRecursively:Lnicoid/network238/okio/FileSystem;

    .line 100
    iget-boolean v7, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->$followSymlinks:Z

    .line 96
    iput-object v3, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$0:Ljava/lang/Object;

    iput-object v5, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$1:Ljava/lang/Object;

    iput-object v1, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->L$2:Ljava/lang/Object;

    iput v2, p0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;->label:I

    const/4 v8, 0x0

    move-object v9, p0

    invoke-static/range {v3 .. v9}, Lnicoid/network238/okio/internal/-FileSystem;->collectRecursively(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    .line 104
    :cond_3
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p1
.end method
