.class Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/PushImManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RETRY_LEVEL"
.end annotation


# instance fields
.field currentRetryCount:I

.field maxRetryCount:I

.field waitTime:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->waitTime:I

    .line 5
    .line 6
    iput p2, p0, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->maxRetryCount:I

    .line 7
    .line 8
    iput p3, p0, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 9
    .line 10
    return-void
.end method
