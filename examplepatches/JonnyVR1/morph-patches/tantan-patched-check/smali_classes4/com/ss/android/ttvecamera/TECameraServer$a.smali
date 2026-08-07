.class Lcom/ss/android/ttvecamera/TECameraServer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->close(ZLcom/bytedance/bpea/basics/Cert;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Lcom/bytedance/bpea/basics/Cert;

.field final synthetic d:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;JZLcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->b:Z

    .line 6
    .line 7
    iput-object p5, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->c:Lcom/bytedance/bpea/basics/Cert;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->a:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v3, "Push close task cost: "

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "TECameraServer"

    .line 23
    .line 24
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->b:Z

    .line 30
    .line 31
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->c:Lcom/bytedance/bpea/basics/Cert;

    .line 32
    .line 33
    invoke-static {v2, v3, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1000(Lcom/ss/android/ttvecamera/TECameraServer;ZLcom/bytedance/bpea/basics/Cert;)I

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-static {v2, v3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1102(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z

    .line 40
    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->b:Z

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$900(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/ConditionVariable;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    iget-wide v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$a;->a:J

    .line 60
    .line 61
    sub-long/2addr v2, v4

    .line 62
    const-string p0, "te_record_camera_push_close_task_time"

    .line 63
    .line 64
    invoke-static {p0, v0, v1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 65
    .line 66
    .line 67
    const-string p0, "te_record_camera_close_cost"

    .line 68
    .line 69
    invoke-static {p0, v2, v3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
