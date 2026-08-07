.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;
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
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

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
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$600(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 10
    .line 11
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$700(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 18
    .line 19
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 26
    .line 27
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->updateIncomingFramerate()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 35
    .line 36
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->dropFrame()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    const-string v0, "TSurfaceTextureHelper"

    .line 47
    .line 48
    const-string v1, "supplement dropFrame."

    .line 49
    .line 50
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-static {v0, v1, v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1002(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;J)J

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 64
    .line 65
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$900(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 70
    .line 71
    iget-object v1, v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerNotifyRunnable:Ljava/lang/Runnable;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 77
    .line 78
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 83
    .line 84
    iget-object v1, v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->supplementRunnable:Ljava/lang/Runnable;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 90
    .line 91
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->inputFramerate()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 100
    .line 101
    invoke-static {v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Lio/agora/base/internal/video/VideoDecimator;->getTargetFrameRate()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    sub-int/2addr v0, v1

    .line 110
    int-to-float v0, v0

    .line 111
    const/4 v1, 0x0

    .line 112
    cmpg-float v1, v0, v1

    .line 113
    .line 114
    if-gez v1, :cond_1

    .line 115
    .line 116
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    const/high16 v2, 0x40400000    # 3.0f

    .line 121
    .line 122
    cmpl-float v1, v1, v2

    .line 123
    .line 124
    if-lez v1, :cond_1

    .line 125
    .line 126
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    float-to-double v0, v0

    .line 131
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 132
    .line 133
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v2}, Lio/agora/base/internal/video/VideoDecimator;->getTargetFrameRate()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    int-to-double v2, v2

    .line 142
    const-wide v4, 0x3fb999999999999aL    # 0.1

    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    mul-double/2addr v2, v4

    .line 148
    cmpl-double v0, v0, v2

    .line 149
    .line 150
    if-gtz v0, :cond_2

    .line 151
    .line 152
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 153
    .line 154
    .line 155
    move-result-wide v0

    .line 156
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 157
    .line 158
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1000(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)J

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    sub-long/2addr v0, v2

    .line 163
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 164
    .line 165
    invoke-static {v2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    mul-int/lit8 v2, v2, 0x2

    .line 170
    .line 171
    int-to-long v2, v2

    .line 172
    cmp-long v0, v0, v2

    .line 173
    .line 174
    if-lez v0, :cond_3

    .line 175
    .line 176
    :cond_2
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 177
    .line 178
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 183
    .line 184
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->supplementRunnable:Ljava/lang/Runnable;

    .line 185
    .line 186
    invoke-static {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    int-to-long v2, p0

    .line 191
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 192
    .line 193
    .line 194
    :cond_3
    return-void
.end method
