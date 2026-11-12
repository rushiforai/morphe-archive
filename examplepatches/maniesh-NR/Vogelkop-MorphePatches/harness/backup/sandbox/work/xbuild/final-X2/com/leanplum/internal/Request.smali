.class public Lcom/leanplum/internal/Request;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/Request$ErrorCallback;,
        Lcom/leanplum/internal/Request$ResponseCallback;,
        Lcom/leanplum/internal/Request$RequestType;
    }
.end annotation


# instance fields
.field private final apiAction:Ljava/lang/String;

.field error:Lcom/leanplum/internal/Request$ErrorCallback;

.field private final httpMethod:Ljava/lang/String;

.field private final params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private requestId:Ljava/lang/String;

.field response:Lcom/leanplum/internal/Request$ResponseCallback;

.field private type:Lcom/leanplum/internal/Request$RequestType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/Request$RequestType;Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/leanplum/internal/Request$RequestType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/internal/Request;->requestId:Ljava/lang/String;

    iput-object p1, p0, Lcom/leanplum/internal/Request;->httpMethod:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/internal/Request;->apiAction:Ljava/lang/String;

    iput-object p3, p0, Lcom/leanplum/internal/Request;->type:Lcom/leanplum/internal/Request$RequestType;

    if-nez p4, :cond_1a

    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    :cond_1a
    iput-object p4, p0, Lcom/leanplum/internal/Request;->params:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getApiAction()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/Request;->apiAction:Ljava/lang/String;

    return-object p0
.end method

.method public getHttpMethod()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/Request;->httpMethod:Ljava/lang/String;

    return-object p0
.end method

.method public getParams()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/leanplum/internal/Request;->params:Ljava/util/Map;

    return-object p0
.end method

.method public getRequestId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/Request;->requestId:Ljava/lang/String;

    return-object p0
.end method

.method public getType()Lcom/leanplum/internal/Request$RequestType;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/Request;->type:Lcom/leanplum/internal/Request$RequestType;

    return-object p0
.end method

.method public onError(Lcom/leanplum/internal/Request$ErrorCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    return-void
.end method

.method public onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/Request;->response:Lcom/leanplum/internal/Request$ResponseCallback;

    return-void
.end method

.method public setType(Lcom/leanplum/internal/Request$RequestType;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/Request;->type:Lcom/leanplum/internal/Request$RequestType;

    return-void
.end method
