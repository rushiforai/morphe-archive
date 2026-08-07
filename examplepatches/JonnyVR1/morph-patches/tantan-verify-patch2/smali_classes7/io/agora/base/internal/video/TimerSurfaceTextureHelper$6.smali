.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->inputFramerate()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 12
    .line 13
    invoke-static {v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lio/agora/base/internal/video/VideoDecimator;->getTargetFrameRate()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr v0, v1

    .line 22
    int-to-float v0, v0

    .line 23
    const/4 v1, 0x0

    .line 24
    cmpg-float v1, v0, v1

    .line 25
    .line 26
    if-gez v1, :cond_0

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/high16 v2, 0x40400000    # 3.0f

    .line 33
    .line 34
    cmpl-float v1, v1, v2

    .line 35
    .line 36
    if-lez v1, :cond_0

    .line 37
    .line 38
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    float-to-double v0, v0

    .line 43
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 44
    .line 45
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Lio/agora/base/internal/video/VideoDecimator;->getTargetFrameRate()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    int-to-double v2, v2

    .line 54
    const-wide v4, 0x3fb999999999999aL    # 0.1

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    mul-double/2addr v2, v4

    .line 60
    cmpl-double v0, v0, v2

    .line 61
    .line 62
    if-gtz v0, :cond_1

    .line 63
    .line 64
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 69
    .line 70
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1000(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    sub-long/2addr v0, v2

    .line 75
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 76
    .line 77
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    mul-int/lit8 v2, v2, 0x2

    .line 82
    .line 83
    int-to-long v2, v2

    .line 84
    cmp-long v0, v0, v2

    .line 85
    .line 86
    if-lez v0, :cond_2

    .line 87
    .line 88
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 89
    .line 90
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 95
    .line 96
    iget-object v2, v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->supplementRunnable:Ljava/lang/Runnable;

    .line 97
    .line 98
    invoke-static {v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    int-to-long v3, v1

    .line 103
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 107
    .line 108
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 113
    .line 114
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerRunnable:Ljava/lang/Runnable;

    .line 115
    .line 116
    invoke-static {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    int-to-long v2, p0

    .line 121
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 122
    .line 123
    .line 124
    return-void
.end method
