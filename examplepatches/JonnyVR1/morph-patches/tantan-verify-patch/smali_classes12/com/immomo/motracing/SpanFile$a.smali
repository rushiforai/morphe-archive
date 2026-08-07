.class public final Lcom/immomo/motracing/SpanFile$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/motracing/SpanFile;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/immomo/motracing/SpanRecord;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0010\u0010\u0004\u001a\u00020\u0003H\u0096\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002H\u0096\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0016\u0010\n\u001a\u00020\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0006\u0010\t\u00a8\u0006\u000b"
    }
    d2 = {
        "com/immomo/motracing/SpanFile$a",
        "",
        "Lcom/immomo/motracing/SpanRecord;",
        "",
        "hasNext",
        "()Z",
        "a",
        "()Lcom/immomo/motracing/SpanRecord;",
        "",
        "I",
        "offset",
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
.field private a:I

.field final synthetic b:Lcom/immomo/motracing/SpanFile;


# direct methods
.method public constructor <init>(Lcom/immomo/motracing/SpanFile;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/motracing/SpanFile$a;->b:Lcom/immomo/motracing/SpanFile;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/immomo/motracing/SpanRecord;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/motracing/SpanFile$a;->b:Lcom/immomo/motracing/SpanFile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/motracing/SpanFile;->i(Lcom/immomo/motracing/SpanFile;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget p0, p0, Lcom/immomo/motracing/SpanFile$a;->a:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/immomo/motracing/SpanFile;->h(Lcom/immomo/motracing/SpanFile;JI)Lcom/immomo/motracing/SpanRecord;

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 13
    .line 14
    const-string v0, "span record not found"

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public hasNext()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/motracing/SpanFile$a;->b:Lcom/immomo/motracing/SpanFile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/motracing/SpanFile;->i(Lcom/immomo/motracing/SpanFile;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget p0, p0, Lcom/immomo/motracing/SpanFile$a;->a:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/immomo/motracing/SpanFile;->g(Lcom/immomo/motracing/SpanFile;JI)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/motracing/SpanFile$a;->a()Lcom/immomo/motracing/SpanRecord;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public remove()V
    .locals 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
