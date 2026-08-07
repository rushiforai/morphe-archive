.class Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget p1, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "\u79fb\u52a8move Job , \u5904\u7406\u6d88\u606f, isJobMoveRunning="

    .line 17
    .line 18
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "MotionFilter"

    .line 35
    .line 36
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ll/omw;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ll/omw;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-lez p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_0

    .line 66
    .line 67
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$300(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$400(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-gt p1, v1, :cond_0

    .line 80
    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v1, "\u79fb\u52a8move Job , currentMoveCount="

    .line 84
    .line 85
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 89
    .line 90
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$300(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, ", moCam_Cnt="

    .line 98
    .line 99
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 103
    .line 104
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$400(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 119
    .line 120
    invoke-static {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ll/omw;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {p0, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$500(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Ll/omw;)V

    .line 125
    .line 126
    .line 127
    :cond_0
    return-void
.end method
