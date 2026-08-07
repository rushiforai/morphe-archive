.class public Ltv/danmaku/ijk/media/streamer/ScreenSurface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/ScreenSurface$FrameRateUpdateListener;,
        Ltv/danmaku/ijk/media/streamer/ScreenSurface$RenderThread;,
        Ltv/danmaku/ijk/media/streamer/ScreenSurface$PostDrawImageCallback;
    }
.end annotation


# instance fields
.field private A:Ljava/lang/Object;

.field private B:Ljava/lang/Object;

.field private C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

.field private D:[I

.field private E:[I

.field private F:I

.field private G:I

.field private H:I

.field private I:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private J:J

.field private K:[I

.field private volatile L:Z

.field private volatile M:Z

.field private volatile N:Z

.field private volatile O:Z

.field private volatile P:Z

.field private volatile Q:I

.field private volatile R:Z

.field private volatile S:Z

.field private T:Landroid/graphics/PointF;

.field public a:I

.field public b:I

.field c:J

.field d:J

.field e:J

.field f:J

.field g:[I

.field h:[I

.field i:[I

.field j:[I

.field k:[Ljavax/microedition/khronos/egl/EGLConfig;

.field l:[I

.field private m:Ljavax/microedition/khronos/egl/EGL10;

.field private n:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private o:Ljavax/microedition/khronos/egl/EGLContext;

.field private p:Ljavax/microedition/khronos/egl/EGLSurface;

.field private q:Ljavax/microedition/khronos/egl/EGLSurface;

.field private r:Ll/dah0;

.field private volatile s:Z

.field private t:Landroid/graphics/SurfaceTexture;

.field private u:Landroid/view/Surface;

.field private v:Landroid/view/Surface;

.field private w:Ll/jt2;

.field private x:Ljava/lang/Object;

.field private y:Ljava/lang/Object;

.field private volatile z:Z


# direct methods
.method public static synthetic A(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->O:Z

    .line 2
    .line 3
    return p0
.end method

.method private B()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->x:Ljava/lang/Object;

    .line 3
    .line 4
    invoke-direct {p0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->G(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->x:Ljava/lang/Object;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->J()V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L:Z

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->I()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L:Z

    .line 22
    .line 23
    :goto_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->N()V

    .line 24
    .line 25
    .line 26
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->M:Z

    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    const-string v1, "ScreenSurface"

    .line 30
    .line 31
    const-string v2, "activiteSurface_l eglSetup exception"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L:Z

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->M(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private C(Landroid/view/Surface;)V
    .locals 5

    .line 1
    const-string v0, "ScreenSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->A:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v1, Ll/dah0;

    .line 14
    .line 15
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x2

    .line 19
    invoke-direct {v1, p1, v4, v2, v3}, Ll/dah0;-><init>(Ljava/lang/Object;ILjavax/microedition/khronos/egl/EGLContext;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->s:Z

    .line 29
    .line 30
    :goto_0
    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->O:Z

    .line 32
    .line 33
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method private D(Ljava/lang/String;)V
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x3000

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ": EGL error: 0x"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "ScreenSurface"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->M(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method private F()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->J()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->I()V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->J:J

    .line 22
    .line 23
    sub-long v2, v0, v2

    .line 24
    .line 25
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->Q:I

    .line 26
    .line 27
    int-to-long v4, v4

    .line 28
    const-wide/16 v6, 0x3e8

    .line 29
    .line 30
    div-long/2addr v6, v4

    .line 31
    cmp-long v2, v2, v6

    .line 32
    .line 33
    const-string v3, "ScreenSurface"

    .line 34
    .line 35
    if-gez v2, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->R:Z

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v4

    .line 45
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->J:J

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->R:Z

    .line 49
    .line 50
    const-string v2, " drawImage codec:"

    .line 51
    .line 52
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :goto_1
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 56
    .line 57
    const-wide/16 v6, 0x1

    .line 58
    .line 59
    add-long/2addr v4, v6

    .line 60
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 61
    .line 62
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L:Z

    .line 63
    .line 64
    if-nez v2, :cond_3

    .line 65
    .line 66
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 67
    .line 68
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t:Landroid/graphics/SurfaceTexture;

    .line 73
    .line 74
    invoke-virtual {v2, v4, v5}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->q(ILandroid/graphics/SurfaceTexture;)V

    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 83
    .line 84
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u()I

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    iget-object v9, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t:Landroid/graphics/SurfaceTexture;

    .line 89
    .line 90
    invoke-virtual {v2, v8, v9}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->q(ILandroid/graphics/SurfaceTexture;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 94
    .line 95
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 96
    .line 97
    iget-object v9, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 98
    .line 99
    invoke-interface {v2, v8, v9}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 100
    .line 101
    .line 102
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 103
    .line 104
    const-wide/16 v10, 0x14

    .line 105
    .line 106
    cmp-long v2, v8, v10

    .line 107
    .line 108
    if-gez v2, :cond_4

    .line 109
    .line 110
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->c:J

    .line 111
    .line 112
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 113
    .line 114
    .line 115
    move-result-wide v10

    .line 116
    add-long/2addr v8, v10

    .line 117
    sub-long/2addr v8, v4

    .line 118
    iput-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->c:J

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 122
    .line 123
    .line 124
    move-result-wide v8

    .line 125
    sub-long/2addr v8, v4

    .line 126
    iput-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->c:J

    .line 127
    .line 128
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 129
    .line 130
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v4, " render to display use:"

    .line 133
    .line 134
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->c:J

    .line 138
    .line 139
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 140
    .line 141
    div-long/2addr v4, v8

    .line 142
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->f:J

    .line 153
    .line 154
    add-long/2addr v4, v6

    .line 155
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->f:J

    .line 156
    .line 157
    :goto_3
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 158
    .line 159
    if-eqz v2, :cond_7

    .line 160
    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 162
    .line 163
    .line 164
    move-result-wide v4

    .line 165
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->R:Z

    .line 166
    .line 167
    if-nez v2, :cond_5

    .line 168
    .line 169
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 170
    .line 171
    invoke-virtual {v2}, Ll/dah0;->c()V

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 175
    .line 176
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->s()V

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 180
    .line 181
    invoke-virtual {v2}, Ll/dah0;->e()V

    .line 182
    .line 183
    .line 184
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v8, " render to codecSurface use:"

    .line 187
    .line 188
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 192
    .line 193
    .line 194
    move-result-wide v9

    .line 195
    sub-long/2addr v9, v4

    .line 196
    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->d:J

    .line 212
    .line 213
    iget-wide v10, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 214
    .line 215
    div-long/2addr v8, v10

    .line 216
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->e:J

    .line 227
    .line 228
    cmp-long v2, v8, v6

    .line 229
    .line 230
    if-nez v2, :cond_6

    .line 231
    .line 232
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 233
    .line 234
    .line 235
    move-result-wide v6

    .line 236
    sub-long/2addr v6, v4

    .line 237
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->d:J

    .line 238
    .line 239
    goto :goto_4

    .line 240
    :cond_6
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->d:J

    .line 241
    .line 242
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 243
    .line 244
    .line 245
    move-result-wide v8

    .line 246
    add-long/2addr v6, v8

    .line 247
    sub-long/2addr v6, v4

    .line 248
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->d:J

    .line 249
    .line 250
    :cond_7
    :goto_4
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->s:Z

    .line 251
    .line 252
    if-eqz v2, :cond_8

    .line 253
    .line 254
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->R:Z

    .line 255
    .line 256
    if-nez v2, :cond_8

    .line 257
    .line 258
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->J()V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 262
    .line 263
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->r()V

    .line 264
    .line 265
    .line 266
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v2, " draw and rend  use:"

    .line 269
    .line 270
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 274
    .line 275
    .line 276
    move-result-wide v4

    .line 277
    sub-long/2addr v4, v0

    .line 278
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {v3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method private G(Ljava/lang/Object;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ljavax/microedition/khronos/egl/EGL10;

    .line 14
    .line 15
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 16
    .line 17
    :cond_0
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 18
    .line 19
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 20
    .line 21
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 22
    .line 23
    if-eq v2, v4, :cond_1

    .line 24
    .line 25
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 26
    .line 27
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    invoke-interface {v5, v6, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 30
    .line 31
    .line 32
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 35
    .line 36
    invoke-interface {v2, v5, v4, v4, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 37
    .line 38
    .line 39
    iput-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 40
    .line 41
    :cond_1
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 42
    .line 43
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    const/4 v7, -0x1

    .line 47
    if-ne v2, v5, :cond_2

    .line 48
    .line 49
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 50
    .line 51
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 52
    .line 53
    invoke-interface {v2, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 58
    .line 59
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 60
    .line 61
    invoke-interface {v5, v2, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->k:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 71
    .line 72
    const/4 v5, 0x1

    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    new-array v2, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 76
    .line 77
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->k:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 78
    .line 79
    :cond_3
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 80
    .line 81
    if-nez v2, :cond_4

    .line 82
    .line 83
    new-array v2, v5, [I

    .line 84
    .line 85
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 86
    .line 87
    :cond_4
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 88
    .line 89
    const-string v2, "No configs match configSpec"

    .line 90
    .line 91
    const/4 v14, 0x0

    .line 92
    if-eqz v1, :cond_7

    .line 93
    .line 94
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 95
    .line 96
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->i:[I

    .line 97
    .line 98
    const/4 v12, 0x0

    .line 99
    iget-object v13, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 100
    .line 101
    const/4 v11, 0x0

    .line 102
    invoke-interface/range {v8 .. v13}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-nez v8, :cond_5

    .line 107
    .line 108
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_5
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 112
    .line 113
    aget v9, v8, v14

    .line 114
    .line 115
    if-lez v9, :cond_6

    .line 116
    .line 117
    new-array v2, v9, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 118
    .line 119
    iget-object v15, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 120
    .line 121
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 122
    .line 123
    iget-object v11, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->i:[I

    .line 124
    .line 125
    move-object/from16 v18, v2

    .line 126
    .line 127
    move-object/from16 v20, v8

    .line 128
    .line 129
    move/from16 v19, v9

    .line 130
    .line 131
    move-object/from16 v16, v10

    .line 132
    .line 133
    move-object/from16 v17, v11

    .line 134
    .line 135
    invoke-interface/range {v15 .. v20}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 136
    .line 137
    .line 138
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 139
    .line 140
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 141
    .line 142
    invoke-virtual {v0, v8, v9, v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->E(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    goto :goto_0

    .line 147
    :cond_6
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_7
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 152
    .line 153
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->h:[I

    .line 154
    .line 155
    const/4 v12, 0x0

    .line 156
    iget-object v13, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 157
    .line 158
    const/4 v11, 0x0

    .line 159
    invoke-interface/range {v8 .. v13}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    if-nez v8, :cond_8

    .line 164
    .line 165
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->l:[I

    .line 169
    .line 170
    aget v9, v8, v14

    .line 171
    .line 172
    if-lez v9, :cond_e

    .line 173
    .line 174
    new-array v2, v9, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 175
    .line 176
    iget-object v15, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 177
    .line 178
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 179
    .line 180
    iget-object v11, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->h:[I

    .line 181
    .line 182
    move-object/from16 v18, v2

    .line 183
    .line 184
    move-object/from16 v20, v8

    .line 185
    .line 186
    move/from16 v19, v9

    .line 187
    .line 188
    move-object/from16 v16, v10

    .line 189
    .line 190
    move-object/from16 v17, v11

    .line 191
    .line 192
    invoke-interface/range {v15 .. v20}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 193
    .line 194
    .line 195
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 196
    .line 197
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 198
    .line 199
    invoke-virtual {v0, v8, v9, v2}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->E(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    :goto_0
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 204
    .line 205
    if-ne v8, v3, :cond_9

    .line 206
    .line 207
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 208
    .line 209
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 210
    .line 211
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->j:[I

    .line 212
    .line 213
    invoke-interface {v8, v9, v2, v3, v10}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    iput-object v3, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 218
    .line 219
    const-string v3, "eglCreateContext"

    .line 220
    .line 221
    invoke-direct {v0, v3}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 225
    .line 226
    if-nez v3, :cond_9

    .line 227
    .line 228
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 229
    .line 230
    return-void

    .line 231
    :cond_9
    const-string v3, "ScreenSurface"

    .line 232
    .line 233
    if-eqz v1, :cond_b

    .line 234
    .line 235
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 236
    .line 237
    if-ne v5, v4, :cond_a

    .line 238
    .line 239
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 240
    .line 241
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 242
    .line 243
    invoke-interface {v4, v5, v2, v1, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iput-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 248
    .line 249
    const-string v1, "eglCreateWindowSurface"

    .line 250
    .line 251
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 255
    .line 256
    if-nez v1, :cond_a

    .line 257
    .line 258
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 259
    .line 260
    return-void

    .line 261
    :cond_a
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 262
    .line 263
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 264
    .line 265
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 266
    .line 267
    const/16 v5, 0x3056

    .line 268
    .line 269
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->E:[I

    .line 270
    .line 271
    invoke-interface {v1, v2, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 272
    .line 273
    .line 274
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 275
    .line 276
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 277
    .line 278
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 279
    .line 280
    const/16 v5, 0x3057

    .line 281
    .line 282
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D:[I

    .line 283
    .line 284
    invoke-interface {v1, v2, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 285
    .line 286
    .line 287
    new-instance v1, Ljava/lang/StringBuilder;

    .line 288
    .line 289
    const-string v2, "mEGLSurface width = "

    .line 290
    .line 291
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D:[I

    .line 295
    .line 296
    aget v2, v2, v14

    .line 297
    .line 298
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    const-string v2, ";mEGLSurface hight ="

    .line 302
    .line 303
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->E:[I

    .line 307
    .line 308
    aget v0, v0, v14

    .line 309
    .line 310
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {v3, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_b
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 322
    .line 323
    if-eq v1, v4, :cond_c

    .line 324
    .line 325
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 326
    .line 327
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 328
    .line 329
    invoke-interface {v6, v8, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 330
    .line 331
    .line 332
    iput-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 333
    .line 334
    :cond_c
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g:[I

    .line 335
    .line 336
    iget v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->G:I

    .line 337
    .line 338
    aput v6, v1, v5

    .line 339
    .line 340
    iget v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H:I

    .line 341
    .line 342
    const/4 v8, 0x3

    .line 343
    aput v6, v1, v8

    .line 344
    .line 345
    new-instance v1, Ljava/lang/StringBuilder;

    .line 346
    .line 347
    const-string v6, "mEGLDumpSurface width = "

    .line 348
    .line 349
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g:[I

    .line 353
    .line 354
    aget v5, v6, v5

    .line 355
    .line 356
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v5, ";mEGLDumpSurface hight ="

    .line 360
    .line 361
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g:[I

    .line 365
    .line 366
    aget v5, v5, v8

    .line 367
    .line 368
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    invoke-static {v3, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    .line 377
    .line 378
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 379
    .line 380
    if-ne v1, v4, :cond_d

    .line 381
    .line 382
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 383
    .line 384
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 385
    .line 386
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->g:[I

    .line 387
    .line 388
    invoke-interface {v1, v3, v2, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    iput-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 393
    .line 394
    const-string v1, "eglCreatePbufferSurface"

    .line 395
    .line 396
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 400
    .line 401
    if-nez v1, :cond_d

    .line 402
    .line 403
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 404
    .line 405
    :cond_d
    return-void

    .line 406
    :cond_e
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    return-void
.end method

.method private H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->K:[I

    .line 2
    .line 3
    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->K:[I

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    return p5
.end method

.method private I()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->E:[I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aget v2, v2, v3

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D:[I

    .line 28
    .line 29
    aget v2, v2, v3

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 34
    .line 35
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 36
    .line 37
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 38
    .line 39
    invoke-interface {v2, v3, v0, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method private J()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeUnCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->D(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 21
    .line 22
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 23
    .line 24
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 25
    .line 26
    invoke-interface {v2, v3, v0, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private K()V
    .locals 2

    .line 1
    const-string v0, "ScreenSurface"

    .line 2
    .line 3
    const-string v1, "removeMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->A:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dah0;->d()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->r:Ll/dah0;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->P:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->s:Z

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method private L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w:Ll/jt2;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->z(Ll/jt2;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->N:Z

    .line 14
    .line 15
    return-void
.end method

.method private N()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 6
    .line 7
    new-instance v1, Ll/qv40;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->I:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;-><init>(Ll/jt2;Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 18
    .line 19
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->B()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->T:Landroid/graphics/PointF;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->A(Landroid/graphics/PointF;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "textureID="

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 37
    .line 38
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->u()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "ScreenSurface"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 55
    .line 56
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->t()Landroid/graphics/SurfaceTexture;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->G:I

    .line 63
    .line 64
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H:I

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Landroid/view/Surface;

    .line 75
    .line 76
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->t:Landroid/graphics/SurfaceTexture;

    .line 77
    .line 78
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->u:Landroid/view/Surface;
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    const/4 v0, -0x1

    .line 85
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->B:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->A:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->v:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C(Landroid/view/Surface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->P:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->y:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->z:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->S:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ll/jt2;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w:Ll/jt2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ll/jt2;)Ll/jt2;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->w:Ll/jt2;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ltv/danmaku/ijk/media/streamer/ScreenRender;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ltv/danmaku/ijk/media/streamer/ScreenRender;)Ltv/danmaku/ijk/media/streamer/ScreenRender;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->C:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic p(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->M:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->q:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->o:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->x:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic t(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->p:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->n:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Ltv/danmaku/ijk/media/streamer/ScreenSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->m:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic y(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z(Ltv/danmaku/ijk/media/streamer/ScreenSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public E(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    .line 1
    array-length v0, p3

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_2

    .line 4
    .line 5
    aget-object v5, p3, v1

    .line 6
    .line 7
    const/16 v6, 0x3025

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    move-object v2, p0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v6, 0x3026

    .line 18
    .line 19
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-ltz p0, :cond_1

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/16 v6, 0x3024

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v6, 0x3023

    .line 36
    .line 37
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/16 v6, 0x3022

    .line 42
    .line 43
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/16 v6, 0x3021

    .line 48
    .line 49
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->H(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    const/16 v7, 0x8

    .line 54
    .line 55
    if-ne p0, v7, :cond_1

    .line 56
    .line 57
    if-ne p1, v7, :cond_1

    .line 58
    .line 59
    if-ne p2, v7, :cond_1

    .line 60
    .line 61
    if-ne v6, v7, :cond_1

    .line 62
    .line 63
    return-object v5

    .line 64
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    move-object p0, v2

    .line 67
    move-object p1, v3

    .line 68
    move-object p2, v4

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method

.method public M(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->F:I

    .line 2
    .line 3
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    const-string p1, "ScreenSurface"

    .line 2
    .line 3
    const-string v0, "new frame available"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->y:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter p1

    .line 11
    const/4 v0, 0x1

    .line 12
    :try_start_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->z:Z

    .line 13
    .line 14
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenSurface;->y:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    monitor-exit p1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method
