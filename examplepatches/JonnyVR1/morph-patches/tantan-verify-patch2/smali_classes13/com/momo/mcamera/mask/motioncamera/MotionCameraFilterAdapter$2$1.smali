.class Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

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
    .locals 5

    .line 1
    const-string v0, "\u8fd0\u52a8\u4e0a\u7ebf\u65f6\u95f4\u5230\u4e86\uff0c\u5173\u95ed\u8fd0\u52a8."

    .line 2
    .line 3
    const-string v1, "MotionFilter"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v0, v2}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$802(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Z)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ljava/util/LinkedList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->isRunning()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->cancel()V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    const v3, 0x3f7d70a4    # 0.99f

    .line 71
    .line 72
    .line 73
    cmpg-float v0, v0, v3

    .line 74
    .line 75
    if-gtz v0, :cond_1

    .line 76
    .line 77
    const-string v0, "\u8fd0\u52a8\u4e0a\u7ebf\u65f6\u95f4\u5230\u4e86\uff0c\u5173\u95ed\u8fd0\u52a8.\u5f3a\u5236\u505a\u4e00\u4e2a\u6536\u955c\u52a8\u4f5c"

    .line 78
    .line 79
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ll/omw;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1302(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Ll/omw;)Ll/omw;

    .line 91
    .line 92
    .line 93
    new-instance v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 98
    .line 99
    invoke-static {v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1400(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget-object v3, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 104
    .line 105
    iget-object v3, v3, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 106
    .line 107
    invoke-static {v3}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1500(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    const/high16 v4, 0x3f800000    # 1.0f

    .line 112
    .line 113
    invoke-direct {v0, v1, v3, v4}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;-><init>(FFF)V

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->setMotionFilterJobListener(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->start()V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2$1;->this$1:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 129
    .line 130
    invoke-static {p0, v2}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->access$1602(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Z)Z

    .line 131
    .line 132
    .line 133
    :cond_1
    return-void
.end method
