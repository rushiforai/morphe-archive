.class public Lcom/leanplum/internal/RequestBatchFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final MAX_EVENTS_PER_API_CALL:I = 0x2710


# instance fields
.field private final uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/leanplum/internal/RequestUuidHelper;

    invoke-direct {v0}, Lcom/leanplum/internal/RequestUuidHelper;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestBatchFactory;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    return-void
.end method


# virtual methods
.method public createErrorBatch(Ljava/util/List;)Lcom/leanplum/internal/RequestBatch;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/leanplum/internal/RequestBatch;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/leanplum/internal/RequestBatchFactory;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    invoke-virtual {v1, p1}, Lcom/leanplum/internal/RequestUuidHelper;->attachNewUuid(Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBatchFactory;->jsonEncodeRequests(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lcom/leanplum/internal/RequestBatch;

    invoke-direct {p1, v0, v0, p0}, Lcom/leanplum/internal/RequestBatch;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-object p1
.end method

.method public createNextBatch()Lcom/leanplum/internal/RequestBatch;
    .registers 3

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/leanplum/internal/RequestBatchFactory;->createNextBatch(D)Lcom/leanplum/internal/RequestBatch;

    move-result-object p0

    return-object p0
.end method

.method public createNextBatch(D)Lcom/leanplum/internal/RequestBatch;
    .registers 7

    const-wide v0, 0x3f847ae147ae147bL    # 0.01

    cmpg-double v0, p1, v0

    if-gez v0, :cond_15

    :try_start_9
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    goto :goto_1d

    :cond_15
    invoke-virtual {p0, p1, p2}, Lcom/leanplum/internal/RequestBatchFactory;->getUnsentRequests(D)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBatchFactory;->removeIrrelevantBackgroundStartRequests(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    :goto_1d
    invoke-virtual {p0, v2}, Lcom/leanplum/internal/RequestBatchFactory;->jsonEncodeRequests(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/leanplum/internal/RequestBatch;

    invoke-direct {v3, v0, v2, v1}, Lcom/leanplum/internal/RequestBatch;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/lang/OutOfMemoryError; {:try_start_9 .. :try_end_26} :catch_27

    return-object v3

    :catch_27
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    mul-double/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/internal/RequestBatchFactory;->createNextBatch(D)Lcom/leanplum/internal/RequestBatch;

    move-result-object p0

    return-object p0
.end method

.method public deleteFinishedBatch(Lcom/leanplum/internal/RequestBatch;)V
    .registers 2
    .param p1    # Lcom/leanplum/internal/RequestBatch;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/leanplum/internal/RequestBatch;->getEventsCount()I

    move-result p0

    if-nez p0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumEventDataManager;->sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/LeanplumEventDataManager;->deleteEvents(I)V

    return-void
.end method

.method public getUnsentRequests(D)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    sget v0, Lcom/leanplum/internal/RequestBatchFactory;->MAX_EVENTS_PER_API_CALL:I

    int-to-double v0, v0

    mul-double/2addr v0, p1

    double-to-int v0, v0

    invoke-static {}, Lcom/leanplum/internal/LeanplumEventDataManager;->sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/LeanplumEventDataManager;->getEvents(I)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestBatchFactory;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    invoke-virtual {v1}, Lcom/leanplum/internal/RequestUuidHelper;->deleteUuid()V

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    cmpg-double p1, p1, v1

    if-gez p1, :cond_1d

    iget-object p0, p0, Lcom/leanplum/internal/RequestBatchFactory;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestUuidHelper;->attachNewUuid(Ljava/util/List;)V

    :cond_1d
    return-object v0
.end method

.method public jsonEncodeRequests(Ljava/util/List;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "data"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public removeIrrelevantBackgroundStartRequests(Ljava/util/List;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4c

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v0, :cond_4c

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    add-int/lit8 v3, v0, -0x1

    if-ge v1, v3, :cond_46

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v4, "action"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v5, "start"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_46

    const-string v3, "background"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "true"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_49

    :cond_46
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_4c
    return-object p0
.end method
