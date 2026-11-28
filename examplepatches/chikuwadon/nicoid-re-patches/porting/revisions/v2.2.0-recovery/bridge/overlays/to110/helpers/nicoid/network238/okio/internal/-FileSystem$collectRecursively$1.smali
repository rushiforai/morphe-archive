.class final Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/internal/-FileSystem;->collectRecursively(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;
    c = "nicoid.network238.okio.internal.-FileSystem"
    f = "FileSystem.kt"
    l = {
        0x74,
        0x87,
        0x91
    }
    m = "collectRecursively"
    v = 0x1
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field Z$0:Z

.field Z$1:Z

.field label:I

.field synthetic result:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iput-object p1, p0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->result:Ljava/lang/Object;

    iget p1, p0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okio/internal/-FileSystem;->collectRecursively(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
