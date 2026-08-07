.class Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u5927\u5468\u671f\u65f6\u95f4\u5230\u4e86\uff0c\u72b6\u6001\u91cd\u7f6e\uff0c\u5f00\u542f\u8fd0\u52a8. moveLoopInterval="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$600(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", moCam_moveT="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$700(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "MotionFilter"

    .line 36
    .line 37
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$302(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;I)I

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$802(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Z)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$600(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$700(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ge v0, v1, :cond_0

    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$900(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ljava/util/Timer;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$900(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ljava/util/Timer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$600(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    mul-int/lit16 p0, p0, 0x3e8

    .line 93
    .line 94
    int-to-long v2, p0

    .line 95
    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method
