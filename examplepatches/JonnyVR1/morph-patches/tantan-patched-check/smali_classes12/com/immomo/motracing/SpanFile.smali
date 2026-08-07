.class public final Lcom/immomo/motracing/SpanFile;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/io/Closeable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/immomo/motracing/SpanRecord;",
        ">;",
        "Ljava/io/Closeable;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010(\n\u0002\u0008\t\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003J \u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u0008\u0010\tJ \u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u000bH\u0082 \u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\"\u0010\u0010\u001a\u0004\u0018\u00010\u00022\u0006\u0010\n\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u000bH\u0082 \u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0018\u0010\u0013\u001a\u00020\u00122\u0006\u0010\n\u001a\u00020\u0007H\u0082 \u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0016\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0015H\u0096\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0016\u0010\n\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u001aR\u0017\u0010\u0006\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/immomo/motracing/SpanFile;",
        "",
        "Lcom/immomo/motracing/SpanRecord;",
        "Ljava/io/Closeable;",
        "",
        "fileName",
        "path",
        "",
        "_prepareFile",
        "(Ljava/lang/String;Ljava/lang/String;)J",
        "np",
        "",
        "offset",
        "",
        "_hasNext",
        "(JI)Z",
        "_next",
        "(JI)Lcom/immomo/motracing/SpanRecord;",
        "",
        "_close",
        "(J)V",
        "",
        "iterator",
        "()Ljava/util/Iterator;",
        "close",
        "()V",
        "J",
        "Ljava/lang/String;",
        "getPath",
        "()Ljava/lang/String;",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private np:J

.field private final path:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private final native _close(J)V
.end method

.method private final native _hasNext(JI)Z
.end method

.method private final native _next(JI)Lcom/immomo/motracing/SpanRecord;
.end method

.method private final native _prepareFile(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method public static final synthetic g(Lcom/immomo/motracing/SpanFile;JI)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/motracing/SpanFile;->_hasNext(JI)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic h(Lcom/immomo/motracing/SpanFile;JI)Lcom/immomo/motracing/SpanRecord;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/motracing/SpanFile;->_next(JI)Lcom/immomo/motracing/SpanRecord;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static final synthetic i(Lcom/immomo/motracing/SpanFile;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/motracing/SpanFile;->np:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/immomo/motracing/SpanFile;->np:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/motracing/SpanFile;->_close(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-wide v2, p0, Lcom/immomo/motracing/SpanFile;->np:J

    .line 13
    .line 14
    return-void
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/immomo/motracing/SpanRecord;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/immomo/motracing/SpanFile$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/immomo/motracing/SpanFile$a;-><init>(Lcom/immomo/motracing/SpanFile;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
