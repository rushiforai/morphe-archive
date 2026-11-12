.class public Lcom/leanplum/internal/RequestBatch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field jsonEncoded:Ljava/lang/String;

.field requests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field requestsToSend:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .registers 4
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/internal/RequestBatch;->requests:Ljava/util/List;

    iput-object p2, p0, Lcom/leanplum/internal/RequestBatch;->requestsToSend:Ljava/util/List;

    iput-object p3, p0, Lcom/leanplum/internal/RequestBatch;->jsonEncoded:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getEventsCount()I
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBatch;->requests:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public getJson()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBatch;->jsonEncoded:Ljava/lang/String;

    return-object p0
.end method

.method public isEmpty()Z
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBatch;->requestsToSend:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public isFull()Z
    .registers 2

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBatch;->getEventsCount()I

    move-result p0

    sget v0, Lcom/leanplum/internal/RequestBatchFactory;->MAX_EVENTS_PER_API_CALL:I

    if-ne p0, v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
