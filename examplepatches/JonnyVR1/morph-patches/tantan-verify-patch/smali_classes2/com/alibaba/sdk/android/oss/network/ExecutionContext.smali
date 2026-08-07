.class public Lcom/alibaba/sdk/android/oss/network/ExecutionContext;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Request:",
        "Lcom/alibaba/sdk/android/oss/model/OSSRequest;",
        "Result:",
        "Lcom/alibaba/sdk/android/oss/model/OSSResult;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private cancellationHandler:Lcom/alibaba/sdk/android/oss/network/CancellationHandler;

.field private client:Ll/rg50;

.field private completedCallback:Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;

.field private progressCallback:Lcom/alibaba/sdk/android/oss/callback/OSSProgressCallback;

.field private request:Lcom/alibaba/sdk/android/oss/model/OSSRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TRequest;"
        }
    .end annotation
.end field

.field private retryCallback:Lcom/alibaba/sdk/android/oss/callback/OSSRetryCallback;


# direct methods
.method public constructor <init>(Ll/rg50;Lcom/alibaba/sdk/android/oss/model/OSSRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rg50;",
            "TRequest;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;-><init>(Ll/rg50;Lcom/alibaba/sdk/android/oss/model/OSSRequest;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Ll/rg50;Lcom/alibaba/sdk/android/oss/model/OSSRequest;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rg50;",
            "TRequest;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/alibaba/sdk/android/oss/network/CancellationHandler;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/alibaba/sdk/android/oss/network/CancellationHandler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->cancellationHandler:Lcom/alibaba/sdk/android/oss/network/CancellationHandler;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->setClient(Ll/rg50;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->setRequest(Lcom/alibaba/sdk/android/oss/model/OSSRequest;)V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->applicationContext:Landroid/content/Context;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getApplicationContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCancellationHandler()Lcom/alibaba/sdk/android/oss/network/CancellationHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->cancellationHandler:Lcom/alibaba/sdk/android/oss/network/CancellationHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClient()Ll/rg50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->client:Ll/rg50;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCompletedCallback()Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback<",
            "TRequest;TResult;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->completedCallback:Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProgressCallback()Lcom/alibaba/sdk/android/oss/callback/OSSProgressCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->progressCallback:Lcom/alibaba/sdk/android/oss/callback/OSSProgressCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequest()Lcom/alibaba/sdk/android/oss/model/OSSRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TRequest;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->request:Lcom/alibaba/sdk/android/oss/model/OSSRequest;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRetryCallback()Lcom/alibaba/sdk/android/oss/callback/OSSRetryCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->retryCallback:Lcom/alibaba/sdk/android/oss/callback/OSSRetryCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public setClient(Ll/rg50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->client:Ll/rg50;

    .line 2
    .line 3
    return-void
.end method

.method public setCompletedCallback(Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback<",
            "TRequest;TResult;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->completedCallback:Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setProgressCallback(Lcom/alibaba/sdk/android/oss/callback/OSSProgressCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->progressCallback:Lcom/alibaba/sdk/android/oss/callback/OSSProgressCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setRequest(Lcom/alibaba/sdk/android/oss/model/OSSRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRequest;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->request:Lcom/alibaba/sdk/android/oss/model/OSSRequest;

    .line 2
    .line 3
    return-void
.end method

.method public setRetryCallback(Lcom/alibaba/sdk/android/oss/callback/OSSRetryCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/alibaba/sdk/android/oss/network/ExecutionContext;->retryCallback:Lcom/alibaba/sdk/android/oss/callback/OSSRetryCallback;

    .line 2
    .line 3
    return-void
.end method
