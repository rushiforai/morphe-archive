.class final Lkotlin/io/path/ExceptionsCollector;
.super Ljava/lang/Object;
.source "PathRecursiveFunctions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0008\u0002\u0018\u00002\u00020\u0001B\u0013\u0008F\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0011H\u0086\u0080\u0004J\u0012\u0010\u0019\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0011H\u0086\u0080\u0004J\u0016\u0010\u001a\u001a\u00020\u00172\n\u0010\u001b\u001a\u00060\u000cj\u0002`\rH\u0086\u0080\u0004R\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u001f\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0003@BX\u0086\u008e\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u001f\u0010\n\u001a\u000c\u0012\u0008\u0012\u00060\u000cj\u0002`\r0\u000bX\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u001d\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u001c"
    }
    d2 = {
        "Lkotlin/io/path/ExceptionsCollector;",
        "",
        "limit",
        "",
        "<init>",
        "(I)V",
        "value",
        "totalExceptions",
        "getTotalExceptions",
        "()I",
        "collectedExceptions",
        "",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "getCollectedExceptions",
        "()Ljava/util/List;",
        "path",
        "Ljava/nio/file/Path;",
        "getPath",
        "()Ljava/nio/file/Path;",
        "setPath",
        "(Ljava/nio/file/Path;)V",
        "enterEntry",
        "",
        "name",
        "exitEntry",
        "collect",
        "exception",
        "kotlin-stdlib-jdk7"
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
.field private final collectedExceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation
.end field

.field private final limit:I

.field private path:Ljava/nio/file/Path;

.field private totalExceptions:I


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lkotlin/io/path/ExceptionsCollector;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkotlin/io/path/ExceptionsCollector;->limit:I

    .line 327
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lkotlin/io/path/ExceptionsCollector;->collectedExceptions:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    const/16 p1, 0x40

    .line 323
    :cond_6
    invoke-direct {p0, p1}, Lkotlin/io/path/ExceptionsCollector;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final collect(Ljava/lang/Exception;)V
    .registers 4

    const-string v0, "exception"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 341
    iget v0, p0, Lkotlin/io/path/ExceptionsCollector;->totalExceptions:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkotlin/io/path/ExceptionsCollector;->totalExceptions:I

    .line 342
    iget-object v0, p0, Lkotlin/io/path/ExceptionsCollector;->collectedExceptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lkotlin/io/path/ExceptionsCollector;->limit:I

    if-ge v0, v1, :cond_3c

    .line 344
    iget-object v0, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    if-eqz v0, :cond_37

    .line 347
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()V

    iget-object v0, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/nio/file/FileSystemException;

    move-result-object v0

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/FileSystemException;Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type java.nio.file.FileSystemException"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Ljava/nio/file/FileSystemException;

    move-result-object p1

    check-cast p1, Ljava/lang/Exception;

    .line 351
    :cond_37
    iget-object p0, p0, Lkotlin/io/path/ExceptionsCollector;->collectedExceptions:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3c
    return-void
.end method

.method public final enterEntry(Ljava/nio/file/Path;)V
    .registers 3

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 332
    iget-object v0, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    if-eqz v0, :cond_e

    invoke-static {v0, p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object p1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    iput-object p1, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    return-void
.end method

.method public final exitEntry(Ljava/nio/file/Path;)V
    .registers 4

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 336
    iget-object v0, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    invoke-static {v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object v0

    goto :goto_10

    :cond_f
    move-object v0, v1

    :goto_10
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    .line 337
    iget-object p1, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    if-eqz p1, :cond_1e

    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object v1

    :cond_1e
    iput-object v1, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    return-void

    .line 336
    :cond_21
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Failed requirement."

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final getCollectedExceptions()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .line 327
    iget-object p0, p0, Lkotlin/io/path/ExceptionsCollector;->collectedExceptions:Ljava/util/List;

    return-object p0
.end method

.method public final getPath()Ljava/nio/file/Path;
    .registers 1

    .line 329
    iget-object p0, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    return-object p0
.end method

.method public final getTotalExceptions()I
    .registers 1

    .line 324
    iget p0, p0, Lkotlin/io/path/ExceptionsCollector;->totalExceptions:I

    return p0
.end method

.method public final setPath(Ljava/nio/file/Path;)V
    .registers 2

    .line 329
    iput-object p1, p0, Lkotlin/io/path/ExceptionsCollector;->path:Ljava/nio/file/Path;

    return-void
.end method
