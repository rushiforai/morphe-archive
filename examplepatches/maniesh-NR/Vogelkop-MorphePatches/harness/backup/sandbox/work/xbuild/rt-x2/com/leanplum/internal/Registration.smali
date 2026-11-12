.class public Lcom/leanplum/internal/Registration;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerDevice(Ljava/lang/String;Lcom/leanplum/callbacks/StartCallback;)V
    .registers 4

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withRegisterForDevelopmentAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "email"

    invoke-virtual {v0, v1, p0}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    new-instance v0, Lcom/leanplum/internal/Registration$1;

    invoke-direct {v0, p1}, Lcom/leanplum/internal/Registration$1;-><init>(Lcom/leanplum/callbacks/StartCallback;)V

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance v0, Lcom/leanplum/internal/Registration$2;

    invoke-direct {v0, p1}, Lcom/leanplum/internal/Registration$2;-><init>(Lcom/leanplum/callbacks/StartCallback;)V

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method
