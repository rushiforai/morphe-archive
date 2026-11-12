.class Lcom/leanplum/Leanplum$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$attributeName:Ljava/lang/String;

.field final synthetic val$registrationId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/Leanplum$12;->val$attributeName:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/Leanplum$12;->val$registrationId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withSetDeviceAttributesAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/Leanplum$12;->val$attributeName:Ljava/lang/String;

    iget-object p0, p0, Lcom/leanplum/Leanplum$12;->val$registrationId:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_25

    return-void

    :catchall_25
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
