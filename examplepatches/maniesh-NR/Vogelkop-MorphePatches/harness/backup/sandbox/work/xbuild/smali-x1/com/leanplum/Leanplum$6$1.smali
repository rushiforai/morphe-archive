.class Lcom/leanplum/Leanplum$6$1;
.super Lcom/leanplum/callbacks/StartCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum$6;->onResponse(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/Leanplum$6;


# direct methods
.method public constructor <init>(Lcom/leanplum/Leanplum$6;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Leanplum$6$1;->this$0:Lcom/leanplum/Leanplum$6;

    invoke-direct {p0}, Lcom/leanplum/callbacks/StartCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Z)V
    .registers 3

    # getter for: Lcom/leanplum/Leanplum;->registerDeviceFinishedHandler:Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;
    invoke-static {}, Lcom/leanplum/Leanplum;->access$300()Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;

    move-result-object p0

    if-eqz p0, :cond_18

    # getter for: Lcom/leanplum/Leanplum;->registerDeviceFinishedHandler:Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;
    invoke-static {}, Lcom/leanplum/Leanplum;->access$300()Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;->setSuccess(Z)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p0

    # getter for: Lcom/leanplum/Leanplum;->registerDeviceFinishedHandler:Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;
    invoke-static {}, Lcom/leanplum/Leanplum;->access$300()Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    :cond_18
    if-eqz p1, :cond_22

    :try_start_1a
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->onHasStartedAndRegisteredAsDeveloper()V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_1e

    return-void

    :catchall_1e
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_22
    return-void
.end method
