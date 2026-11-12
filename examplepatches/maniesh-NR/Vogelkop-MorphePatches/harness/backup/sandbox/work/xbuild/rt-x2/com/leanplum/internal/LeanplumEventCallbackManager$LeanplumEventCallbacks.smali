.class Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/LeanplumEventCallbackManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LeanplumEventCallbacks"
.end annotation


# instance fields
.field private errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;

.field private responseCallback:Lcom/leanplum/internal/Request$ResponseCallback;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/Request$ResponseCallback;Lcom/leanplum/internal/Request$ErrorCallback;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->responseCallback:Lcom/leanplum/internal/Request$ResponseCallback;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ResponseCallback;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->responseCallback:Lcom/leanplum/internal/Request$ResponseCallback;

    return-object p0
.end method

.method public static synthetic access$100(Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;)Lcom/leanplum/internal/Request$ErrorCallback;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventCallbackManager$LeanplumEventCallbacks;->errorCallback:Lcom/leanplum/internal/Request$ErrorCallback;

    return-object p0
.end method
