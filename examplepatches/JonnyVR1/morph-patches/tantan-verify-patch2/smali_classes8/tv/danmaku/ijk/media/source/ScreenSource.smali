.class public Ltv/danmaku/ijk/media/source/ScreenSource;
.super Ltv/danmaku/ijk/media/source/SourceBase;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;
    }
.end annotation


# instance fields
.field private a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private b:Landroid/hardware/display/VirtualDisplay;

.field private c:Ltv/danmaku/ijk/media/util/helpSurface;

.field public d:Z

.field private e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

.field private f:Ljava/lang/Thread;

.field public g:Z

.field public h:Ljava/lang/Object;

.field public i:I

.field public j:I

.field private k:Landroid/graphics/PointF;

.field protected l:Lcom/immomo/mediacore/strinf/VideoQuality;

.field protected m:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private n:F

.field private o:Lcom/immomo/mediacore/strinf/NotifyCenter;

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Lcom/immomo/mediacore/strinf/NotifyCenter;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/SourceBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->g:Z

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->h:Ljava/lang/Object;

    .line 15
    .line 16
    const/16 v0, 0x1e0

    .line 17
    .line 18
    iput v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->i:I

    .line 19
    .line 20
    const/16 v1, 0x280

    .line 21
    .line 22
    iput v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->j:I

    .line 23
    .line 24
    new-instance v2, Landroid/graphics/PointF;

    .line 25
    .line 26
    const/high16 v3, 0x41800000    # 16.0f

    .line 27
    .line 28
    const/high16 v4, 0x41100000    # 9.0f

    .line 29
    .line 30
    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->k:Landroid/graphics/PointF;

    .line 34
    .line 35
    sget-object v2, Lcom/immomo/mediacore/strinf/VideoQuality;->DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->l:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 48
    .line 49
    const/high16 v2, 0x3f800000    # 1.0f

    .line 50
    .line 51
    iput v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->n:F

    .line 52
    .line 53
    iput v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->p:I

    .line 54
    .line 55
    iput v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->q:I

    .line 56
    .line 57
    const/4 v0, -0x1

    .line 58
    iput v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->r:I

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->s:I

    .line 62
    .line 63
    const/16 v0, 0x160

    .line 64
    .line 65
    iput v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 66
    .line 67
    iput v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 68
    .line 69
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 70
    .line 71
    iput-object p2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->o:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 72
    .line 73
    return-void
.end method

.method private S(I)I
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    const/16 p0, 0xb0

    .line 6
    .line 7
    if-ge p1, p0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    return p1
.end method

.method private T(I)I
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x10

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x10

    .line 4
    .line 5
    const/16 p0, 0xb0

    .line 6
    .line 7
    if-ge p1, p0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    return p1
.end method

.method private U()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->f:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 6
    .line 7
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->h:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->f:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    const-wide/16 v3, 0x32

    .line 19
    .line 20
    :try_start_1
    invoke-virtual {v1, v3, v4}, Ljava/lang/Thread;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :catch_0
    move-exception v1

    .line 27
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 28
    .line 29
    .line 30
    :goto_0
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->f:Ljava/lang/Thread;

    .line 31
    .line 32
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/util/helpSurface;->g()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->b:Landroid/hardware/display/VirtualDisplay;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 46
    .line 47
    .line 48
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->b:Landroid/hardware/display/VirtualDisplay;

    .line 49
    .line 50
    :cond_3
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    throw p0
.end method


# virtual methods
.method public B(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->p:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->q:I

    .line 4
    .line 5
    return-void
.end method

.method public K(Landroid/app/Activity;IILandroid/media/projection/MediaProjection;I)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v4, p2

    .line 4
    .line 5
    move/from16 v5, p3

    .line 6
    .line 7
    move/from16 v11, p5

    .line 8
    .line 9
    const-string v12, "switch to screen success, cost time: "

    .line 10
    .line 11
    const-string v0, "width="

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v13

    .line 17
    iget-boolean v2, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->g:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    const-string v2, "ScreenStream"

    .line 22
    .line 23
    const-string v3, "screen capture: last release"

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    invoke-direct {v1}, Ltv/danmaku/ijk/media/source/ScreenSource;->U()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v15, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->h:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter v15

    .line 34
    :try_start_0
    new-instance v2, Ltv/danmaku/ijk/media/util/helpSurface;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-direct {v2, v3, v4, v5}, Ltv/danmaku/ijk/media/util/helpSurface;-><init>(Landroid/view/SurfaceHolder;II)V

    .line 38
    .line 39
    .line 40
    iput-object v2, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->c:Ltv/danmaku/ijk/media/util/helpSurface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    move-object v6, v3

    .line 43
    :try_start_1
    const-string v3, "MainScreen"

    .line 44
    .line 45
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/util/helpSurface;->c()Landroid/view/Surface;

    .line 46
    .line 47
    .line 48
    move-result-object v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    const/4 v9, 0x0

    .line 50
    const/4 v10, 0x0

    .line 51
    move-object v2, v6

    .line 52
    const/4 v6, 0x1

    .line 53
    const/16 v7, 0x13

    .line 54
    .line 55
    move-wide/from16 v16, v13

    .line 56
    .line 57
    move-object v13, v2

    .line 58
    move-object/from16 v2, p4

    .line 59
    .line 60
    :try_start_2
    invoke-virtual/range {v2 .. v10}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->b:Landroid/hardware/display/VirtualDisplay;

    .line 65
    .line 66
    const-string v2, "ScreenStream"

    .line 67
    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, ",height="

    .line 77
    .line 78
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, ",angle="

    .line 85
    .line 86
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v0, ",cost time: "

    .line 93
    .line 94
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 98
    .line 99
    .line 100
    move-result-wide v6

    .line 101
    sub-long v6, v6, v16

    .line 102
    .line 103
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v2, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :catchall_0
    move-exception v0

    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :catch_0
    move-exception v0

    .line 118
    goto :goto_0

    .line 119
    :catch_1
    move-exception v0

    .line 120
    move-wide/from16 v16, v13

    .line 121
    .line 122
    move-object v13, v6

    .line 123
    :goto_0
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 124
    .line 125
    .line 126
    :goto_1
    iget v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->s:I

    .line 127
    .line 128
    const/4 v2, 0x1

    .line 129
    if-eq v0, v2, :cond_3

    .line 130
    .line 131
    const/4 v3, 0x2

    .line 132
    if-eq v0, v3, :cond_1

    .line 133
    .line 134
    iput v4, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 135
    .line 136
    iput v5, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 137
    .line 138
    const/4 v0, 0x3

    .line 139
    iput v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->s:I

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_1
    if-le v4, v5, :cond_2

    .line 143
    .line 144
    iput v4, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 145
    .line 146
    iput v5, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_2
    iput v5, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 150
    .line 151
    iput v4, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_3
    if-le v4, v5, :cond_4

    .line 155
    .line 156
    iput v5, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 157
    .line 158
    iput v4, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_4
    iput v4, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 162
    .line 163
    iput v5, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 164
    .line 165
    :goto_2
    iput v11, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->r:I

    .line 166
    .line 167
    invoke-virtual {v1, v4, v5}, Ltv/danmaku/ijk/media/source/ScreenSource;->B(II)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/source/ScreenSource;->V()V

    .line 171
    .line 172
    .line 173
    iget-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 174
    .line 175
    iget-object v3, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 176
    .line 177
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/util/helpSurface;->h(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 181
    .line 182
    invoke-direct {v0, v1, v13}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;-><init>(Ltv/danmaku/ijk/media/source/ScreenSource;Ltv/danmaku/ijk/media/source/ScreenSource$1;)V

    .line 183
    .line 184
    .line 185
    iput-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 186
    .line 187
    new-instance v0, Ljava/lang/Thread;

    .line 188
    .line 189
    iget-object v3, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 190
    .line 191
    const-string v6, "live-media-ScreenSource"

    .line 192
    .line 193
    invoke-direct {v0, v3, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iput-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->f:Ljava/lang/Thread;

    .line 197
    .line 198
    iget-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 199
    .line 200
    invoke-virtual {v0, v4, v5}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->d(II)V

    .line 201
    .line 202
    .line 203
    iget-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 204
    .line 205
    iget-object v3, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->c:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 206
    .line 207
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->b(Ltv/danmaku/ijk/media/util/helpSurface;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->e:Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;

    .line 211
    .line 212
    iget-object v3, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 213
    .line 214
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/source/ScreenSource$ScreenRunnable;->c(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 215
    .line 216
    .line 217
    iput-boolean v2, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->g:Z

    .line 218
    .line 219
    iget-object v0, v1, Ltv/danmaku/ijk/media/source/ScreenSource;->f:Ljava/lang/Thread;

    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 222
    .line 223
    .line 224
    const-string v0, "ScreenStream"

    .line 225
    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v1, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 232
    .line 233
    .line 234
    move-result-wide v2

    .line 235
    sub-long v2, v2, v16

    .line 236
    .line 237
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    monitor-exit v15

    .line 248
    return-void

    .line 249
    :goto_3
    monitor-exit v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 250
    throw v0
.end method

.method public M()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/ScreenSource;->U()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->g:Z

    .line 6
    .line 7
    const-string p0, "ScreenStream"

    .line 8
    .line 9
    const-string v0, "screen capture stop success"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V()V
    .locals 14

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 6
    .line 7
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/source/ScreenSource;->T(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iput v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 12
    .line 13
    iget v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 14
    .line 15
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/source/ScreenSource;->S(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iput v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 20
    .line 21
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 22
    .line 23
    iget v4, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 24
    .line 25
    iput v4, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 26
    .line 27
    iput v2, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 28
    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "input:["

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v3, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->p:I

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, ","

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v4, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->q:I

    .line 47
    .line 48
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v4, "]; output:["

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v4, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 57
    .line 58
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget v4, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 65
    .line 66
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v4, "]"

    .line 70
    .line 71
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const-string v4, "ScreenStream"

    .line 79
    .line 80
    invoke-static {v4, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 84
    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 88
    .line 89
    invoke-virtual {v2, v5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 93
    .line 94
    iget v5, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->r:I

    .line 95
    .line 96
    invoke-virtual {v2, v5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->R0(I)V

    .line 97
    .line 98
    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    const-string v5, "----!!!!"

    .line 102
    .line 103
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget v5, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 107
    .line 108
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget v3, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-static {v4, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    iget v6, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->p:I

    .line 127
    .line 128
    iget v7, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->q:I

    .line 129
    .line 130
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 131
    .line 132
    if-le v6, v7, :cond_0

    .line 133
    .line 134
    iget v10, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->s:I

    .line 135
    .line 136
    iget v12, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 137
    .line 138
    iget v13, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 139
    .line 140
    const/4 v8, 0x0

    .line 141
    const/16 v9, 0x5a

    .line 142
    .line 143
    const/4 v11, 0x1

    .line 144
    invoke-virtual/range {v5 .. v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_0
    iget v10, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->s:I

    .line 149
    .line 150
    iget v12, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->t:I

    .line 151
    .line 152
    iget v13, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->u:I

    .line 153
    .line 154
    const/4 v8, 0x0

    .line 155
    const/4 v9, 0x0

    .line 156
    const/4 v11, 0x1

    .line 157
    invoke-virtual/range {v5 .. v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 158
    .line 159
    .line 160
    :cond_1
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->o:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 161
    .line 162
    if-eqz v2, :cond_2

    .line 163
    .line 164
    invoke-interface {v2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyUpdateResolution()V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->o:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 168
    .line 169
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyResumeRecording()V

    .line 170
    .line 171
    .line 172
    new-instance p0, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v2, "updateResolution, <NotifyResumeRecording> cost time:"

    .line 175
    .line 176
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 180
    .line 181
    .line 182
    move-result-wide v2

    .line 183
    sub-long/2addr v2, v0

    .line 184
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {v4, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    :cond_2
    return-void
.end method

.method public n()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getVideoQuality: width"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";heigh:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ScreenStream"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ScreenSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    return-object p0
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/ScreenSource;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
