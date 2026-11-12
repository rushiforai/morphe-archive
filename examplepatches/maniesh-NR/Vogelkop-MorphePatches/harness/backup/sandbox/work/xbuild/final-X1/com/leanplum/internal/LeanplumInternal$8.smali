.class Lcom/leanplum/internal/LeanplumInternal$8;
.super Lcom/leanplum/callbacks/StartCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal;->setUserLocationAttribute(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;

.field final synthetic val$location:Landroid/location/Location;

.field final synthetic val$locationAccuracyType:Lcom/leanplum/LeanplumLocationAccuracyType;


# direct methods
.method public constructor <init>(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$8;->val$location:Landroid/location/Location;

    iput-object p2, p0, Lcom/leanplum/internal/LeanplumInternal$8;->val$locationAccuracyType:Lcom/leanplum/LeanplumLocationAccuracyType;

    iput-object p3, p0, Lcom/leanplum/internal/LeanplumInternal$8;->val$callback:Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;

    invoke-direct {p0}, Lcom/leanplum/callbacks/StartCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Z)V
    .registers 4

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    new-instance v1, Lcom/leanplum/internal/LeanplumInternal$8$1;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/internal/LeanplumInternal$8$1;-><init>(Lcom/leanplum/internal/LeanplumInternal$8;Z)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    return-void
.end method
