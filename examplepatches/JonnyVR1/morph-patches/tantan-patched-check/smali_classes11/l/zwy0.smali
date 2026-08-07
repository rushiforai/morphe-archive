.class public final Ll/zwy0;
.super Ll/tzy0;
.source "SourceFile"


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>(Ll/w1z0;Lcom/google/android/gms/common/api/GoogleApiClient;JLandroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-wide p3, p0, Ll/zwy0;->a:J

    .line 2
    .line 3
    iput-object p5, p0, Ll/zwy0;->b:Landroid/app/PendingIntent;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/tzy0;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/yxv0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/zwy0;->a:J

    .line 4
    .line 5
    iget-object v2, p0, Ll/zwy0;->b:Landroid/app/PendingIntent;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    cmp-long v3, v0, v3

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-ltz v3, :cond_0

    .line 16
    .line 17
    move v3, v4

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v3, 0x0

    .line 20
    :goto_0
    const-string v5, "detectionIntervalMillis must be >= 0"

    .line 21
    .line 22
    invoke-static {v3, v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/oky0;

    .line 30
    .line 31
    invoke-interface {p1, v0, v1, v4, v2}, Ll/oky0;->B5(JZLandroid/app/PendingIntent;)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/google/android/gms/common/api/Status;->RESULT_SUCCESS:Lcom/google/android/gms/common/api/Status;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
