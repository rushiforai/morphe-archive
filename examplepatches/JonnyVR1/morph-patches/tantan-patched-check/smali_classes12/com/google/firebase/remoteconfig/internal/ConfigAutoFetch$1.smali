.class Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;->autoFetch(IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;

.field final synthetic val$remainingAttempts:I

.field final synthetic val$targetVersion:J


# direct methods
.method public constructor <init>(Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->this$0:Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->val$remainingAttempts:I

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->val$targetVersion:J

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->this$0:Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->val$remainingAttempts:I

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch$1;->val$targetVersion:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/firebase/remoteconfig/internal/ConfigAutoFetch;->fetchLatestConfig(IJ)Lcom/google/android/gms/tasks/Task;

    .line 8
    .line 9
    .line 10
    return-void
.end method
