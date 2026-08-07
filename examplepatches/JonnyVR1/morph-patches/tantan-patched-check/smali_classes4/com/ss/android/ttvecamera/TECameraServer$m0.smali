.class Lcom/ss/android/ttvecamera/TECameraServer$m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/util/Printer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->createHandler(ZLjava/lang/String;)Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private a:J

.field private b:I

.field private c:J

.field final synthetic d:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->a:J

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->b:I

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->c:J

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public println(Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v0, ">>>>> Dispatching to Handler"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->a:J

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v0, "<<<<< Finished to Handler"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-wide v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->a:J

    .line 29
    .line 30
    sub-long/2addr v0, v2

    .line 31
    const-wide/16 v2, 0x3e8

    .line 32
    .line 33
    cmp-long v2, v0, v2

    .line 34
    .line 35
    if-lez v2, :cond_1

    .line 36
    .line 37
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->b:I

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->b:I

    .line 42
    .line 43
    const-string v3, "te_record_camera_task_time_out_count"

    .line 44
    .line 45
    int-to-long v4, v2

    .line 46
    invoke-static {v3, v4, v5}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 47
    .line 48
    .line 49
    iget-wide v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->c:J

    .line 50
    .line 51
    cmp-long v2, v0, v2

    .line 52
    .line 53
    if-lez v2, :cond_1

    .line 54
    .line 55
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$m0;->c:J

    .line 56
    .line 57
    const-string p0, "te_record_camera_max_lag_task_cost"

    .line 58
    .line 59
    invoke-static {p0, v0, v1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v2, "task: "

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ", cost: "

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p1, "ms"

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "TECameraServer"

    .line 90
    .line 91
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    return-void
.end method
