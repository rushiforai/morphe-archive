.class public Lcom/momo/mcamera/videoencoder/ProcessSurface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;,
        Lcom/momo/mcamera/videoencoder/ProcessSurface$FrameRefreshSoonListener;
    }
.end annotation


# static fields
.field private static final EGL_OPENGL_ES2_BIT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "ProcessSurface"


# instance fields
.field attrib_list:[I

.field public frameRefreshSoonListener:Lcom/momo/mcamera/videoencoder/ProcessSurface$FrameRefreshSoonListener;

.field public isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mActiviteSyncObject:Ljava/lang/Object;

.field private volatile mAddCodecSurface:Z

.field mAttribList:[I

.field private volatile mBitrateAdapt:Z

.field private mCodecSurfaceManager:Ll/dah0;

.field mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

.field private volatile mDropFrame:Z

.field private mEGL:Ljavax/microedition/khronos/egl/EGL10;

.field private mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private volatile mEncoderFrameRate:I

.field private mFilterWrap:Ll/jt2;

.field private volatile mFrameAvailable:Z

.field private mFrameSyncObject:Ljava/lang/Object;

.field private mLastError:I

.field private mMediaCodecSurface:Landroid/view/Surface;

.field private mMonitorHandler:Landroid/os/Handler;

.field private mMonitorTread:Landroid/os/HandlerThread;

.field private volatile mNeedActiveSurface:Z

.field private volatile mNeedRending:Z

.field private volatile mNeedSetFilter:Z

.field mNumConfigs:[I

.field private mOutImgH:I

.field private mOutImgW:I

.field mPbAttribListbAttribList:[I

.field private mProcessParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

.field private volatile mRemoveCodecSurface:Z

.field public mRenderFRate:I

.field private volatile mRenderShouldExit:Z

.field private mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

.field public mRenderTime:I

.field private mScreenHight:[I

.field private mScreenSurface:Ljava/lang/Object;

.field private mScreenWidth:[I

.field private mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

.field private mSurface:Landroid/view/Surface;

.field mSurfaceAttribs:[I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

.field private final mThreadSyn:Ljava/util/concurrent/locks/Lock;

.field private mThreadSyncObject:Ljava/lang/Object;

.field private mValue:[I

.field private playIngTime:J

.field private playStartTime:J

.field private processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

.field private processParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

.field renderLoop:J

.field renderToCT:J

.field renderToDT:J

.field public shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoencoder/ProcessParam;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 6
    .line 7
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 10
    .line 11
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 14
    .line 15
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFilterWrap:Ll/jt2;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 26
    .line 27
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mThreadSyn:Ljava/util/concurrent/locks/Lock;

    .line 33
    .line 34
    new-instance v1, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/Object;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/Object;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    new-array v2, v1, [I

    .line 59
    .line 60
    iput-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenWidth:[I

    .line 61
    .line 62
    new-array v2, v1, [I

    .line 63
    .line 64
    iput-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenHight:[I

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    iput v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 68
    .line 69
    const/16 v3, 0x160

    .line 70
    .line 71
    iput v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mOutImgW:I

    .line 72
    .line 73
    const/16 v3, 0x280

    .line 74
    .line 75
    iput v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mOutImgH:I

    .line 76
    .line 77
    const-wide/16 v3, 0x0

    .line 78
    .line 79
    iput-wide v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playStartTime:J

    .line 80
    .line 81
    iput-wide v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playIngTime:J

    .line 82
    .line 83
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 84
    .line 85
    invoke-direct {v5, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 86
    .line 87
    .line 88
    iput-object v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 89
    .line 90
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 91
    .line 92
    invoke-direct {v5, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 93
    .line 94
    .line 95
    iput-object v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 96
    .line 97
    const/16 v5, 0x14

    .line 98
    .line 99
    iput v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderFRate:I

    .line 100
    .line 101
    const/16 v5, 0x1e

    .line 102
    .line 103
    iput v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderTime:I

    .line 104
    .line 105
    iput-wide v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToDT:J

    .line 106
    .line 107
    iput-wide v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToCT:J

    .line 108
    .line 109
    iput-wide v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 110
    .line 111
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorTread:Landroid/os/HandlerThread;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorHandler:Landroid/os/Handler;

    .line 114
    .line 115
    const/16 v5, 0x3057

    .line 116
    .line 117
    const/16 v6, 0xc0

    .line 118
    .line 119
    const/16 v7, 0x3056

    .line 120
    .line 121
    const/16 v8, 0x140

    .line 122
    .line 123
    const/16 v9, 0x3038

    .line 124
    .line 125
    filled-new-array {v5, v6, v7, v8, v9}, [I

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    iput-object v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurfaceAttribs:[I

    .line 130
    .line 131
    const/16 v5, 0xb

    .line 132
    .line 133
    new-array v6, v5, [I

    .line 134
    .line 135
    fill-array-data v6, :array_0

    .line 136
    .line 137
    .line 138
    iput-object v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mPbAttribListbAttribList:[I

    .line 139
    .line 140
    new-array v5, v5, [I

    .line 141
    .line 142
    fill-array-data v5, :array_1

    .line 143
    .line 144
    .line 145
    iput-object v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAttribList:[I

    .line 146
    .line 147
    const/16 v5, 0x3098

    .line 148
    .line 149
    const/4 v6, 0x2

    .line 150
    filled-new-array {v5, v6, v9}, [I

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    iput-object v5, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->attrib_list:[I

    .line 155
    .line 156
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

    .line 159
    .line 160
    new-array v0, v1, [I

    .line 161
    .line 162
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mValue:[I

    .line 163
    .line 164
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 165
    .line 166
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedActiveSurface:Z

    .line 167
    .line 168
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedSetFilter:Z

    .line 169
    .line 170
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAddCodecSurface:Z

    .line 171
    .line 172
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRemoveCodecSurface:Z

    .line 173
    .line 174
    const/16 v0, 0x19

    .line 175
    .line 176
    iput v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEncoderFrameRate:I

    .line 177
    .line 178
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mDropFrame:Z

    .line 179
    .line 180
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mBitrateAdapt:Z

    .line 181
    .line 182
    new-instance v0, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 183
    .line 184
    const-string v1, "ijkStrRender"

    .line 185
    .line 186
    invoke-direct {v0, p0, p0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;-><init>(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 190
    .line 191
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderShouldExit:Z

    .line 192
    .line 193
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playStartTime:J

    .line 194
    .line 195
    cmp-long v0, v0, v3

    .line 196
    .line 197
    if-nez v0, :cond_0

    .line 198
    .line 199
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 200
    .line 201
    .line 202
    move-result-wide v0

    .line 203
    iput-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playStartTime:J

    .line 204
    .line 205
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 206
    .line 207
    monitor-enter v0

    .line 208
    :try_start_0
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mProcessParam:Lcom/momo/mcamera/videoencoder/ProcessParam;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 209
    .line 210
    :try_start_1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 211
    .line 212
    if-eqz p1, :cond_1

    .line 213
    .line 214
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 215
    .line 216
    .line 217
    goto :goto_0

    .line 218
    :catchall_0
    move-exception p0

    .line 219
    goto :goto_1

    .line 220
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 221
    .line 222
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :goto_1
    :try_start_2
    throw p0

    .line 227
    :catchall_1
    move-exception p0

    .line 228
    goto :goto_3

    .line 229
    :catch_0
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 230
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 231
    .line 232
    return-void

    .line 233
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 234
    throw p0

    .line 235
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3033
        0x1
        0x3040
        0x4
        0x3038
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :array_1
    .array-data 4
        0x3022
        0x8
        0x3023
        0x8
        0x3024
        0x8
        0x3033
        0x4
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method private MonitorTask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mDropFrame:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAddCodecSurface:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMediaCodecSurface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->addMediaCodecSurface_l(Landroid/view/Surface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRemoveCodecSurface:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->removeMediaCodecSurface_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameAvailable:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1602(Lcom/momo/mcamera/videoencoder/ProcessSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameAvailable:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->drawImage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderShouldExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1900(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ll/jt2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFilterWrap:Ll/jt2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1902(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ll/jt2;)Ll/jt2;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFilterWrap:Ll/jt2;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/mask/StickerGroupFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2002(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/mask/StickerGroupFilter;)Lcom/momo/mcamera/mask/StickerGroupFilter;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2100(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Lcom/momo/mcamera/videoencoder/ProcessRender;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2102(Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoencoder/ProcessRender;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2200(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2402(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->MonitorTask()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedActiveSurface:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->activiteSurface_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/momo/mcamera/videoencoder/ProcessSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Lcom/momo/mcamera/videoencoder/ProcessSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedSetFilter:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$900(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->selectFilter_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private activiteSurface_l()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 3
    .line 4
    invoke-direct {p0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->eglSetup(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->makeUnCurrent()V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->makeCurrent()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 22
    .line 23
    :goto_0
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->setup()V

    .line 24
    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedActiveSurface:Z

    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 30
    .line 31
    const/4 v0, -0x1

    .line 32
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->setLastErr(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private addMediaCodecSurface_l(Landroid/view/Surface;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    new-instance v1, Ll/dah0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x2

    .line 12
    invoke-direct {v1, p1, v4, v2, v3}, Ll/dah0;-><init>(Ljava/lang/Object;ILjavax/microedition/khronos/egl/EGLContext;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAddCodecSurface:Z

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 1

    .line 1
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/16 v0, 0x3000

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->setLastErr(I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method private drawImage()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->makeUnCurrent()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->makeCurrent()V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto/16 :goto_4

    .line 17
    .line 18
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 22
    .line 23
    const-wide/16 v2, 0x1

    .line 24
    .line 25
    add-long/2addr v0, v2

    .line 26
    iput-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->drawFrame(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->drawFrame(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 49
    .line 50
    iget-object v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 51
    .line 52
    iget-object v7, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 53
    .line 54
    invoke-interface {v0, v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 55
    .line 56
    .line 57
    iget-wide v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 58
    .line 59
    const-wide/16 v8, 0x14

    .line 60
    .line 61
    cmp-long v0, v6, v8

    .line 62
    .line 63
    if-gez v0, :cond_3

    .line 64
    .line 65
    iget-wide v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToDT:J

    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v8

    .line 71
    add-long/2addr v6, v8

    .line 72
    sub-long/2addr v6, v4

    .line 73
    iput-wide v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToDT:J

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v6

    .line 80
    sub-long/2addr v6, v4

    .line 81
    iput-wide v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToDT:J

    .line 82
    .line 83
    iput-wide v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 84
    .line 85
    :goto_1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 86
    .line 87
    if-eqz v0, :cond_7

    .line 88
    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v4

    .line 93
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mDropFrame:Z

    .line 94
    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/dah0;->c()V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->drawScreenFrame()V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/dah0;->e()V

    .line 118
    .line 119
    .line 120
    :cond_4
    iget-wide v6, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderLoop:J

    .line 121
    .line 122
    cmp-long v0, v6, v2

    .line 123
    .line 124
    if-nez v0, :cond_5

    .line 125
    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 127
    .line 128
    .line 129
    move-result-wide v2

    .line 130
    sub-long/2addr v2, v4

    .line 131
    iput-wide v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToCT:J

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_5
    iget-wide v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToCT:J

    .line 135
    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 137
    .line 138
    .line 139
    move-result-wide v6

    .line 140
    add-long/2addr v2, v6

    .line 141
    sub-long/2addr v2, v4

    .line 142
    iput-wide v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->renderToCT:J

    .line 143
    .line 144
    :goto_2
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mBitrateAdapt:Z

    .line 145
    .line 146
    const/4 v2, 0x1

    .line 147
    if-ne v0, v2, :cond_6

    .line 148
    .line 149
    iput-boolean v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mDropFrame:Z

    .line 150
    .line 151
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorHandler:Landroid/os/Handler;

    .line 152
    .line 153
    if-eqz v0, :cond_7

    .line 154
    .line 155
    new-instance v1, Lcom/momo/mcamera/videoencoder/ProcessSurface$2;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface$2;-><init>(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 158
    .line 159
    .line 160
    const/16 v2, 0x3e8

    .line 161
    .line 162
    iget v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEncoderFrameRate:I

    .line 163
    .line 164
    div-int/2addr v2, v3

    .line 165
    int-to-long v2, v2

    .line 166
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 167
    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_6
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mDropFrame:Z

    .line 171
    .line 172
    :cond_7
    :goto_3
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->frameRefreshSoonListener:Lcom/momo/mcamera/videoencoder/ProcessSurface$FrameRefreshSoonListener;

    .line 173
    .line 174
    if-eqz p0, :cond_8

    .line 175
    .line 176
    invoke-interface {p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface$FrameRefreshSoonListener;->frameRefresh()V

    .line 177
    .line 178
    .line 179
    :cond_8
    :goto_4
    return-void
.end method

.method private eglSetup(Ljava/lang/Object;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

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
    iput-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 16
    .line 17
    :cond_0
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

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
    iget-object v5, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 26
    .line 27
    iget-object v6, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    invoke-interface {v5, v6, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 30
    .line 31
    .line 32
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iget-object v5, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 35
    .line 36
    invoke-interface {v2, v5, v4, v4, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 37
    .line 38
    .line 39
    iput-object v4, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 40
    .line 41
    :cond_1
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

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
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

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
    iput-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 58
    .line 59
    iget-object v5, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

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
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

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
    iput-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 78
    .line 79
    :cond_3
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

    .line 80
    .line 81
    if-nez v2, :cond_4

    .line 82
    .line 83
    new-array v2, v5, [I

    .line 84
    .line 85
    iput-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

    .line 86
    .line 87
    :cond_4
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

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
    iget-object v9, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 95
    .line 96
    iget-object v10, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAttribList:[I

    .line 97
    .line 98
    const/4 v12, 0x0

    .line 99
    iget-object v13, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

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
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_5
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

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
    iget-object v15, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 120
    .line 121
    iget-object v10, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 122
    .line 123
    iget-object v11, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAttribList:[I

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
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 139
    .line 140
    iget-object v9, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 141
    .line 142
    invoke-virtual {v0, v8, v9, v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

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
    iget-object v9, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 152
    .line 153
    iget-object v10, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mPbAttribListbAttribList:[I

    .line 154
    .line 155
    const/4 v12, 0x0

    .line 156
    iget-object v13, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

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
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNumConfigs:[I

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
    iget-object v15, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 177
    .line 178
    iget-object v10, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 179
    .line 180
    iget-object v11, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mPbAttribListbAttribList:[I

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
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 196
    .line 197
    iget-object v9, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 198
    .line 199
    invoke-virtual {v0, v8, v9, v2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    :goto_0
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 204
    .line 205
    if-ne v8, v3, :cond_9

    .line 206
    .line 207
    iget-object v8, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 208
    .line 209
    iget-object v9, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 210
    .line 211
    iget-object v10, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->attrib_list:[I

    .line 212
    .line 213
    invoke-interface {v8, v9, v2, v3, v10}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    iput-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 218
    .line 219
    const-string v3, "eglCreateContext"

    .line 220
    .line 221
    invoke-direct {v0, v3}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->checkEglError(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 225
    .line 226
    if-nez v3, :cond_9

    .line 227
    .line 228
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 229
    .line 230
    return-void

    .line 231
    :cond_9
    if-eqz v1, :cond_b

    .line 232
    .line 233
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 234
    .line 235
    if-ne v3, v4, :cond_a

    .line 236
    .line 237
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 238
    .line 239
    iget-object v4, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 240
    .line 241
    invoke-interface {v3, v4, v2, v1, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    iput-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 246
    .line 247
    const-string v1, "eglCreateWindowSurface"

    .line 248
    .line 249
    invoke-direct {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->checkEglError(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 253
    .line 254
    if-nez v1, :cond_a

    .line 255
    .line 256
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 257
    .line 258
    return-void

    .line 259
    :cond_a
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 260
    .line 261
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 262
    .line 263
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 264
    .line 265
    const/16 v4, 0x3056

    .line 266
    .line 267
    iget-object v5, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenHight:[I

    .line 268
    .line 269
    invoke-interface {v1, v2, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 270
    .line 271
    .line 272
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 273
    .line 274
    iget-object v2, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 275
    .line 276
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 277
    .line 278
    const/16 v4, 0x3057

    .line 279
    .line 280
    iget-object v0, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenWidth:[I

    .line 281
    .line 282
    invoke-interface {v1, v2, v3, v4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :cond_b
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 287
    .line 288
    if-eq v1, v4, :cond_c

    .line 289
    .line 290
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 291
    .line 292
    iget-object v6, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 293
    .line 294
    invoke-interface {v3, v6, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 295
    .line 296
    .line 297
    iput-object v4, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 298
    .line 299
    :cond_c
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurfaceAttribs:[I

    .line 300
    .line 301
    iget v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mOutImgW:I

    .line 302
    .line 303
    aput v3, v1, v5

    .line 304
    .line 305
    const/4 v3, 0x3

    .line 306
    iget v5, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mOutImgH:I

    .line 307
    .line 308
    aput v5, v1, v3

    .line 309
    .line 310
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 311
    .line 312
    if-ne v3, v4, :cond_d

    .line 313
    .line 314
    iget-object v3, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 315
    .line 316
    iget-object v4, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 317
    .line 318
    invoke-interface {v3, v4, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    iput-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 323
    .line 324
    const-string v1, "eglCreatePbufferSurface"

    .line 325
    .line 326
    invoke-direct {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->checkEglError(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iget-object v1, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 330
    .line 331
    if-nez v1, :cond_d

    .line 332
    .line 333
    iput v7, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 334
    .line 335
    :cond_d
    return-void

    .line 336
    :cond_e
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mValue:[I

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
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mValue:[I

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

.method private makeCurrent()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->checkEglError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenHight:[I

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
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenWidth:[I

    .line 28
    .line 29
    aget v2, v2, v3

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 36
    .line 37
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

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
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method private makeUnCurrent()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeUnCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->checkEglError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 23
    .line 24
    iget-object v4, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

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
    iput v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private removeMediaCodecSurface_l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/dah0;->d()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mCodecSurfaceManager:Ll/dah0;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRemoveCodecSurface:Z

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method private selectFilter_l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFilterWrap:Ll/jt2;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->selectFilter(Ll/jt2;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedSetFilter:Z

    .line 14
    .line 15
    return-void
.end method

.method private setup()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 6
    .line 7
    new-instance v1, Ll/qv40;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mProcessParam:Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 13
    .line 14
    invoke-direct {v0, v1, p0, v2}, Lcom/momo/mcamera/videoencoder/ProcessRender;-><init>(Ll/jt2;Lcom/momo/mcamera/videoencoder/ProcessSurface;Lcom/momo/mcamera/videoencoder/ProcessParam;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 18
    .line 19
    iget v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEncoderFrameRate:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->setFrameRate(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->surfaceCreated()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->getSurface()Landroid/view/Surface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurface:Landroid/view/Surface;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 46
    .line 47
    new-instance v1, Lcom/momo/mcamera/videoencoder/ProcessSurface$1;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/momo/mcamera/videoencoder/ProcessSurface$1;-><init>(Lcom/momo/mcamera/videoencoder/ProcessSurface;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->setProcessListener(Lcom/momo/mcamera/videoprocess/VideoProcessListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->startRender()V
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    const/4 v0, -0x1

    .line 62
    iput v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 63
    .line 64
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized activiteSurface(Ljava/lang/Object;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 8
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 9
    .line 10
    if-ne v1, p1, :cond_0

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedActiveSurface:Z

    .line 16
    .line 17
    :cond_1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mScreenSurface:Ljava/lang/Object;

    .line 18
    .line 19
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    :try_start_2
    throw p1

    .line 27
    :catchall_1
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :catch_0
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 33
    :try_start_4
    throw p1

    .line 34
    :catchall_2
    move-exception p1

    .line 35
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 36
    throw p1
.end method

.method public declared-synchronized addFilterToDestory(Ll/jt2;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->addFilterToDestory(Ll/jt2;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 19
    :try_start_4
    throw p1

    .line 20
    :catchall_1
    move-exception p1

    .line 21
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 22
    throw p1
.end method

.method public addGroupFilter(Landroid/content/Context;Lcom/momo/mcamera/mask/StickerGroupFilter;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iput-object p2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    :try_start_1
    throw p0

    .line 14
    :catchall_1
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :catch_0
    :goto_0
    monitor-exit p1

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    throw p0
.end method

.method public addMediaCodecSurface(Landroid/view/Surface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMediaCodecSurface:Landroid/view/Surface;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mAddCodecSurface:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    .line 9
    :try_start_1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    :try_start_2
    throw p0

    .line 17
    :catchall_1
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :catch_0
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 20
    new-instance p1, Landroid/os/HandlerThread;

    .line 21
    .line 22
    const-string v0, "VMonitor"

    .line 23
    .line 24
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorTread:Landroid/os/HandlerThread;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    new-instance p1, Landroid/os/Handler;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorTread:Landroid/os/HandlerThread;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMonitorHandler:Landroid/os/Handler;

    .line 44
    .line 45
    return-void

    .line 46
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 47
    throw p0
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
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
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v6, 0x3026

    .line 18
    .line 19
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

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
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v6, 0x3023

    .line 36
    .line 37
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/16 v6, 0x3022

    .line 42
    .line 43
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/16 v6, 0x3021

    .line 48
    .line 49
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

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

.method public getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->getCurrentBuffer()Landroid/media/MediaCodec$BufferInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getLastErr()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized getSurface()Landroid/view/Surface;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurface:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playIngTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->playIngTime:J

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter p1

    .line 18
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameAvailable:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v1, "mFrameAvailable already set, frame could be dropped"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->checkGlError(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameAvailable:Z

    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 40
    .line 41
    .line 42
    monitor-exit p1

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p0
.end method

.method public declared-synchronized release()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedRending:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderShouldExit:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    .line 13
    :try_start_2
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :catch_0
    :try_start_3
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 24
    .line 25
    .line 26
    :goto_0
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRenderThread:Lcom/momo/mcamera/videoencoder/ProcessSurface$RenderThread;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurface:Landroid/view/Surface;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurface:Landroid/view/Surface;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 36
    .line 37
    :catch_1
    :cond_1
    :try_start_4
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mMediaCodecSurface:Landroid/view/Surface;

    .line 40
    .line 41
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 42
    .line 43
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 44
    .line 45
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 46
    .line 47
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 48
    .line 49
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 52
    .line 53
    iput-object v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 60
    throw v0
.end method

.method public removeMediaCodecSurface()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mRemoveCodecSurface:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    .line 7
    :try_start_1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    :try_start_2
    throw p0

    .line 15
    :catchall_1
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :catch_0
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 20
    throw p0
.end method

.method public declared-synchronized selectFilter(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->switchFilterTo(Landroid/content/Context;Ll/jt2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw p1
.end method

.method public setEncodeFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mEncoderFrameRate:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mTextureRender:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->setFrameRate(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setLastErr(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mLastError:I

    .line 2
    .line 3
    return-void
.end method

.method public setProcessListener(Lcom/momo/mcamera/videoprocess/VideoProcessListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->processListener:Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 2
    .line 3
    return-void
.end method

.method public switchFilterTo(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iput-object p2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mFilterWrap:Ll/jt2;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    iput-boolean p2, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mNeedSetFilter:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    :try_start_1
    throw p0

    .line 17
    :catchall_1
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :catch_0
    :goto_0
    monitor-exit p1

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 22
    throw p0
.end method

.method public updatePoints(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->mStickersFilter:Lcom/momo/mcamera/mask/StickerGroupFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerGroupFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
