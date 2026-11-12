.class public Lcom/leanplum/internal/RequestFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static defaultFactory:Lcom/leanplum/internal/RequestFactory;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/leanplum/internal/RequestFactory;
    .registers 2

    const-class v0, Lcom/leanplum/internal/RequestFactory;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/leanplum/internal/RequestFactory;->defaultFactory:Lcom/leanplum/internal/RequestFactory;

    if-nez v1, :cond_e

    new-instance v1, Lcom/leanplum/internal/RequestFactory;

    invoke-direct {v1}, Lcom/leanplum/internal/RequestFactory;-><init>()V

    sput-object v1, Lcom/leanplum/internal/RequestFactory;->defaultFactory:Lcom/leanplum/internal/RequestFactory;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_12

    :cond_e
    monitor-exit v0

    return-object v1

    :goto_10
    :try_start_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_12

    throw v1

    :catchall_12
    move-exception v1

    goto :goto_10
.end method


# virtual methods
.method public createRequest(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/Request$RequestType;Ljava/util/Map;)Lcom/leanplum/internal/Request;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/leanplum/internal/Request$RequestType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/leanplum/internal/Request;"
        }
    .end annotation

    new-instance p0, Lcom/leanplum/internal/Request;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/leanplum/internal/Request;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/Request$RequestType;Ljava/util/Map;)V

    return-object p0
.end method
