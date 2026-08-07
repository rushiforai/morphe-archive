.class Lcom/ss/android/ttvecamera/TECameraServer$v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/ss/android/ttvecamera/d;

.field final synthetic c:Lcom/ss/android/ttvecamera/TECameraSettings;

.field final synthetic d:Lcom/bytedance/bpea/basics/Cert;

.field final synthetic e:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;JLcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->e:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->b:Lcom/ss/android/ttvecamera/d;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->d:Lcom/bytedance/bpea/basics/Cert;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Push open task cost: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->a:J

    .line 13
    .line 14
    sub-long/2addr v1, v3

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "TECameraServer"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iget-wide v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->a:J

    .line 32
    .line 33
    sub-long/2addr v2, v4

    .line 34
    const-string v0, "te_record_camera_push_open_task_time"

    .line 35
    .line 36
    invoke-static {v0, v2, v3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->e:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->b:Lcom/ss/android/ttvecamera/d;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->d:Lcom/bytedance/bpea/basics/Cert;

    .line 46
    .line 47
    invoke-static {v0, v2, v3, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$000(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "Camera open cost: "

    .line 53
    .line 54
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v2

    .line 61
    iget-wide v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$v;->a:J

    .line 62
    .line 63
    sub-long/2addr v2, v4

    .line 64
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p0, "ms"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
