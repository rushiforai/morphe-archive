.class Ltv/danmaku/ijk/media/player/fakeSurface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;,
        Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;
    }
.end annotation


# static fields
.field private static final EGL_OPENGL_ES2_BIT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "fakeSurface"


# instance fields
.field attrib_list:[I

.field private final mActiviteSyncObject:Ljava/lang/Object;

.field mAttribList:[I

.field mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

.field private mDeblueEnabled:Z

.field private mDeblurWeight:F

.field private mEGL:Ljavax/microedition/khronos/egl/EGL10;

.field private mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mEGLRendingSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mFirstRenderT:J

.field private mFrameAvailable:Z

.field private mFrameH:I

.field private final mFrameSync:Ljava/util/concurrent/locks/Condition;

.field private final mFrameSyncObject:Ljava/lang/Object;

.field private mFrameW:I

.field private mLastError:I

.field private mNeedActiveSurface:Z

.field private mNeedRending:Z

.field mNumConfigs:[I

.field mPbAttribListbAttribList:[I

.field private mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

.field private mRenderShouldExit:Z

.field private mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

.field private mSaturation:F

.field private mScreenHight:[I

.field private mScreenSurface:Ljava/lang/Object;

.field private mScreenWidth:[I

.field private mSurface:Landroid/view/Surface;

.field mSurfaceAttribs:[I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

.field private mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

.field private final mThreadSyn:Ljava/util/concurrent/locks/Lock;

.field private final mThreadSyncObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mThreadSyn:Ljava/util/concurrent/locks/Lock;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSync:Ljava/util/concurrent/locks/Condition;

    .line 16
    .line 17
    const/16 v0, 0x3057

    .line 18
    .line 19
    const/16 v1, 0x160

    .line 20
    .line 21
    const/16 v2, 0x3056

    .line 22
    .line 23
    const/16 v3, 0x280

    .line 24
    .line 25
    const/16 v4, 0x3038

    .line 26
    .line 27
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceAttribs:[I

    .line 32
    .line 33
    const/16 v0, 0xb

    .line 34
    .line 35
    new-array v2, v0, [I

    .line 36
    .line 37
    fill-array-data v2, :array_0

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mPbAttribListbAttribList:[I

    .line 41
    .line 42
    new-array v0, v0, [I

    .line 43
    .line 44
    fill-array-data v0, :array_1

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mAttribList:[I

    .line 48
    .line 49
    const/16 v0, 0x3098

    .line 50
    .line 51
    const/4 v2, 0x2

    .line 52
    filled-new-array {v0, v2, v4}, [I

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->attrib_list:[I

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 60
    .line 61
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 62
    .line 63
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 64
    .line 65
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 66
    .line 67
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 68
    .line 69
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 70
    .line 71
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 72
    .line 73
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 74
    .line 75
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 76
    .line 77
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 78
    .line 79
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLRendingSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 80
    .line 81
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 82
    .line 83
    new-instance v2, Ljava/lang/Object;

    .line 84
    .line 85
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 89
    .line 90
    new-instance v2, Ljava/lang/Object;

    .line 91
    .line 92
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 96
    .line 97
    new-instance v2, Ljava/lang/Object;

    .line 98
    .line 99
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 103
    .line 104
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 105
    .line 106
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    new-array v4, v0, [I

    .line 110
    .line 111
    iput-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 112
    .line 113
    new-array v4, v0, [I

    .line 114
    .line 115
    iput-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 116
    .line 117
    const/4 v4, 0x0

    .line 118
    iput v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 119
    .line 120
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 121
    .line 122
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 123
    .line 124
    const-wide/16 v5, 0x0

    .line 125
    .line 126
    iput-wide v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 127
    .line 128
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 129
    .line 130
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedActiveSurface:Z

    .line 131
    .line 132
    new-instance v0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 133
    .line 134
    const-string v1, "ijkPlayRender"

    .line 135
    .line 136
    invoke-direct {v0, p0, p0, v1}, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;-><init>(Ltv/danmaku/ijk/media/player/fakeSurface;Ltv/danmaku/ijk/media/player/fakeSurface;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 140
    .line 141
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderShouldExit:Z

    .line 142
    .line 143
    const v0, 0x3ee66666    # 0.45f

    .line 144
    .line 145
    .line 146
    iput v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblurWeight:F

    .line 147
    .line 148
    const/high16 v0, 0x3f800000    # 1.0f

    .line 149
    .line 150
    iput v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSaturation:F

    .line 151
    .line 152
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblueEnabled:Z

    .line 153
    .line 154
    sget-object v0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;->RENDER_MODE_SIMPLE:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 155
    .line 156
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 157
    .line 158
    monitor-enter v2

    .line 159
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 160
    .line 161
    if-eqz v0, :cond_0

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :catchall_0
    move-exception p0

    .line 168
    goto :goto_1

    .line 169
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :goto_1
    :try_start_1
    throw p0

    .line 174
    :catchall_1
    move-exception p0

    .line 175
    goto :goto_3

    .line 176
    :catch_0
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 177
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 178
    .line 179
    return-void

    .line 180
    :goto_3
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 181
    throw p0

    .line 182
    nop

    .line 183
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

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
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

.method public constructor <init>(Landroid/view/SurfaceHolder;)V
    .locals 5

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mThreadSyn:Ljava/util/concurrent/locks/Lock;

    .line 185
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSync:Ljava/util/concurrent/locks/Condition;

    const/16 v0, 0x3057

    const/16 v1, 0x160

    const/16 v2, 0x3056

    const/16 v3, 0x280

    const/16 v4, 0x3038

    .line 186
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceAttribs:[I

    const/16 v0, 0xb

    .line 187
    new-array v2, v0, [I

    fill-array-data v2, :array_0

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mPbAttribListbAttribList:[I

    .line 188
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mAttribList:[I

    const/16 v0, 0x3098

    const/4 v2, 0x2

    .line 189
    filled-new-array {v0, v2, v4}, [I

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->attrib_list:[I

    const/4 v0, 0x0

    .line 190
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 191
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 192
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 193
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 194
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 195
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 196
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 197
    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLRendingSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 198
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 199
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 200
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 201
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 202
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 203
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    const/4 v0, 0x1

    .line 204
    new-array v2, v0, [I

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 205
    new-array v2, v0, [I

    iput-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    const/4 v2, 0x0

    .line 206
    iput v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 207
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 208
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    const-wide/16 v3, 0x0

    .line 209
    iput-wide v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 210
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 211
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedActiveSurface:Z

    .line 212
    new-instance v0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    const-string v1, "ijkPlayRender"

    invoke-direct {v0, p0, p0, v1}, Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;-><init>(Ltv/danmaku/ijk/media/player/fakeSurface;Ltv/danmaku/ijk/media/player/fakeSurface;Ljava/lang/String;)V

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 213
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderShouldExit:Z

    const v0, 0x3ee66666    # 0.45f

    .line 214
    iput v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblurWeight:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 215
    iput v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSaturation:F

    .line 216
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblueEnabled:Z

    .line 217
    sget-object v0, Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;->RENDER_MODE_SIMPLE:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 218
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->eglSetup(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->makeCurrent()V

    .line 220
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setup()V

    return-void

    .line 221
    :catch_0
    const-string p1, "fakeSurface"

    const-string v0, "eglSetup exception"

    invoke-static {p1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, -0x1

    .line 222
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    return-void

    nop

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

.method public static synthetic access$000(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mThreadSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Ltv/danmaku/ijk/media/player/fakeSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderShouldExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Ltv/danmaku/ijk/media/player/fakeSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->drawImage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Ltv/danmaku/ijk/media/player/fakeSurface;)Ltv/danmaku/ijk/media/player/TextureRender;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1102(Ltv/danmaku/ijk/media/player/fakeSurface;Ltv/danmaku/ijk/media/player/TextureRender;)Ltv/danmaku/ijk/media/player/TextureRender;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1202(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1300(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1402(Ltv/danmaku/ijk/media/player/fakeSurface;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Ltv/danmaku/ijk/media/player/fakeSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedActiveSurface:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Ltv/danmaku/ijk/media/player/fakeSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedActiveSurface:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Ltv/danmaku/ijk/media/player/fakeSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->activiteSurface_l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$600(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Ltv/danmaku/ijk/media/player/fakeSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Ltv/danmaku/ijk/media/player/fakeSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Ltv/danmaku/ijk/media/player/fakeSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameAvailable:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$902(Ltv/danmaku/ijk/media/player/fakeSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameAvailable:Z

    .line 2
    .line 3
    return p1
.end method

.method private activiteSurface_l()V
    .locals 8

    .line 1
    const-string v0, "fakeSurface"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/player/fakeSurface;->eglSetup(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->makeUnCurrent()V

    .line 14
    .line 15
    .line 16
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->makeCurrent()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 23
    .line 24
    aget v2, v2, v1

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 30
    .line 31
    aget v2, v2, v1

    .line 32
    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    sget-object v2, Ltv/danmaku/ijk/media/player/fakeSurface$1;->$SwitchMap$tv$danmaku$ijk$media$player$fakeSurface$RenderMode:[I

    .line 36
    .line 37
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    aget v2, v2, v4

    .line 44
    .line 45
    if-eq v2, v3, :cond_2

    .line 46
    .line 47
    const/4 v4, 0x2

    .line 48
    if-eq v2, v4, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    iget v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 56
    .line 57
    iget v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 58
    .line 59
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 60
    .line 61
    aget v6, v6, v1

    .line 62
    .line 63
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 64
    .line 65
    aget v7, v7, v1

    .line 66
    .line 67
    invoke-virtual {v2, v4, v5, v6, v7}, Ltv/danmaku/ijk/media/player/TextureRender;->updateRec(IIII)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 72
    .line 73
    if-eqz v2, :cond_3

    .line 74
    .line 75
    iget v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 76
    .line 77
    iget v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 78
    .line 79
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 80
    .line 81
    aget v6, v6, v1

    .line 82
    .line 83
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 84
    .line 85
    aget v7, v7, v1

    .line 86
    .line 87
    invoke-virtual {v2, v4, v5, v6, v7}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->updateRec(IIII)V

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_0
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 91
    .line 92
    :goto_1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setup()V

    .line 93
    .line 94
    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v3, "activiteSurface_l: mRenderMode: "

    .line 98
    .line 99
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v3, "\uff0c width: "

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, ","

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v3, ", "

    .line 128
    .line 129
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 133
    .line 134
    aget v4, v4, v1

    .line 135
    .line 136
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 143
    .line 144
    aget p0, p0, v1

    .line 145
    .line 146
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :catch_0
    const-string v2, "activiteSurface_l eglSetup exception"

    .line 158
    .line 159
    invoke-static {v0, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 163
    .line 164
    const/4 v0, -0x1

    .line 165
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

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
    const-string v1, "fakeSurface"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->setLastErr(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method private drawImage()V
    .locals 2

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/player/fakeSurface$1;->$SwitchMap$tv$danmaku$ijk$media$player$fakeSurface$RenderMode:[I

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->drawImageSimple()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/player/fakeSurface;->drawImageNormal()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private drawImageNormal()V
    .locals 8

    .line 1
    const-string v0, "fakeSurface"

    .line 2
    .line 3
    const-string v1, "updateRec mEGLSurface width = "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 12
    .line 13
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 14
    .line 15
    if-eq v2, v3, :cond_1

    .line 16
    .line 17
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 18
    .line 19
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 20
    .line 21
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 22
    .line 23
    const/16 v7, 0x3056

    .line 24
    .line 25
    invoke-interface {v4, v5, v2, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 29
    .line 30
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 31
    .line 32
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 33
    .line 34
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 35
    .line 36
    const/16 v7, 0x3057

    .line 37
    .line 38
    invoke-interface {v2, v4, v5, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    aget v2, v2, v4

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 49
    .line 50
    aget v2, v2, v4

    .line 51
    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 60
    .line 61
    aget v1, v1, v4

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, ";mEGLSurface hight ="

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 72
    .line 73
    aget v1, v1, v4

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 86
    .line 87
    iget v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 88
    .line 89
    iget v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 90
    .line 91
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 92
    .line 93
    aget v6, v6, v4

    .line 94
    .line 95
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 96
    .line 97
    aget v4, v7, v4

    .line 98
    .line 99
    invoke-virtual {v1, v2, v5, v6, v4}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->updateRec(IIII)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 103
    .line 104
    const-string v2, "before updateTexImage"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->checkGlError(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 112
    .line 113
    .line 114
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 115
    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    iget-wide v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 120
    .line 121
    const-wide/16 v4, 0x0

    .line 122
    .line 123
    cmp-long v1, v1, v4

    .line 124
    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 128
    .line 129
    .line 130
    move-result-wide v1

    .line 131
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 132
    .line 133
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 134
    .line 135
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->drawFrame(Landroid/graphics/SurfaceTexture;)V

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 141
    .line 142
    if-eqz v1, :cond_5

    .line 143
    .line 144
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 145
    .line 146
    if-eq v2, v3, :cond_5

    .line 147
    .line 148
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 149
    .line 150
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 151
    .line 152
    if-eq p0, v3, :cond_5

    .line 153
    .line 154
    invoke-interface {v1, p0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_0
    return-void

    .line 158
    :catch_0
    const-string p0, " mSurfaceTexture.updateTexImage exception "

    .line 159
    .line 160
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private drawImageSimple()V
    .locals 8

    .line 1
    const-string v0, "fakeSurface"

    .line 2
    .line 3
    const-string v1, "updateRec mEGLSurface width = "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 12
    .line 13
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 14
    .line 15
    if-eq v2, v3, :cond_1

    .line 16
    .line 17
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 18
    .line 19
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 20
    .line 21
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 22
    .line 23
    const/16 v7, 0x3056

    .line 24
    .line 25
    invoke-interface {v4, v5, v2, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 29
    .line 30
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 31
    .line 32
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 33
    .line 34
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 35
    .line 36
    const/16 v7, 0x3057

    .line 37
    .line 38
    invoke-interface {v2, v4, v5, v7, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    aget v2, v2, v4

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 49
    .line 50
    aget v2, v2, v4

    .line 51
    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 60
    .line 61
    aget v1, v1, v4

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, ";mEGLSurface hight ="

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 72
    .line 73
    aget v1, v1, v4

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 86
    .line 87
    iget v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 88
    .line 89
    iget v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 90
    .line 91
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 92
    .line 93
    aget v6, v6, v4

    .line 94
    .line 95
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 96
    .line 97
    aget v4, v7, v4

    .line 98
    .line 99
    invoke-virtual {v1, v2, v5, v6, v4}, Ltv/danmaku/ijk/media/player/TextureRender;->updateRec(IIII)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 103
    .line 104
    const-string v2, "before updateTexImage"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/TextureRender;->checkGlError(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 112
    .line 113
    .line 114
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedRending:Z

    .line 115
    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    iget-wide v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 120
    .line 121
    const-wide/16 v4, 0x0

    .line 122
    .line 123
    cmp-long v1, v1, v4

    .line 124
    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 128
    .line 129
    .line 130
    move-result-wide v1

    .line 131
    iput-wide v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 132
    .line 133
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 134
    .line 135
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/TextureRender;->drawFrame(Landroid/graphics/SurfaceTexture;)V

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 141
    .line 142
    if-eqz v1, :cond_5

    .line 143
    .line 144
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 145
    .line 146
    if-eq v2, v3, :cond_5

    .line 147
    .line 148
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 149
    .line 150
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 151
    .line 152
    if-eq p0, v3, :cond_5

    .line 153
    .line 154
    invoke-interface {v1, p0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_0
    return-void

    .line 158
    :catch_0
    const-string p0, " mSurfaceTexture.updateTexImage exception "

    .line 159
    .line 160
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private eglSetup(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 14
    .line 15
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, -0x1

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 22
    .line 23
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 30
    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 32
    .line 33
    invoke-interface {v1, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-array v0, v1, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 48
    .line 49
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    new-array v0, v1, [I

    .line 56
    .line 57
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 58
    .line 59
    :cond_3
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 60
    .line 61
    if-eqz p1, :cond_4

    .line 62
    .line 63
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 64
    .line 65
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mAttribList:[I

    .line 66
    .line 67
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 68
    .line 69
    const/4 v8, 0x1

    .line 70
    iget-object v9, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 71
    .line 72
    invoke-interface/range {v4 .. v9}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 82
    .line 83
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mPbAttribListbAttribList:[I

    .line 84
    .line 85
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 86
    .line 87
    const/4 v8, 0x1

    .line 88
    iget-object v9, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNumConfigs:[I

    .line 89
    .line 90
    invoke-interface/range {v4 .. v9}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_5

    .line 95
    .line 96
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 97
    .line 98
    return-void

    .line 99
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 100
    .line 101
    const/4 v4, 0x0

    .line 102
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 103
    .line 104
    if-ne v0, v5, :cond_6

    .line 105
    .line 106
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 107
    .line 108
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 109
    .line 110
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 111
    .line 112
    aget-object v7, v7, v4

    .line 113
    .line 114
    iget-object v8, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->attrib_list:[I

    .line 115
    .line 116
    invoke-interface {v0, v6, v7, v5, v8}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 121
    .line 122
    const-string v0, "eglCreateContext"

    .line 123
    .line 124
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->checkEglError(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 132
    .line 133
    return-void

    .line 134
    :cond_6
    const-string v0, "fakeSurface"

    .line 135
    .line 136
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 137
    .line 138
    if-eqz p1, :cond_9

    .line 139
    .line 140
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 141
    .line 142
    if-eq v1, v5, :cond_7

    .line 143
    .line 144
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 145
    .line 146
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 147
    .line 148
    invoke-interface {v6, v7, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 149
    .line 150
    .line 151
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 152
    .line 153
    :cond_7
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 154
    .line 155
    if-ne v1, v5, :cond_8

    .line 156
    .line 157
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 158
    .line 159
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 160
    .line 161
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 162
    .line 163
    aget-object v6, v6, v4

    .line 164
    .line 165
    invoke-interface {v1, v5, v6, p1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 170
    .line 171
    const-string p1, "eglCreateWindowSurface"

    .line 172
    .line 173
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->checkEglError(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 177
    .line 178
    if-nez p1, :cond_8

    .line 179
    .line 180
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    return-void

    .line 183
    :catch_0
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 184
    .line 185
    const-string p0, "eglCreateWindowSurface fail"

    .line 186
    .line 187
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 192
    .line 193
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 194
    .line 195
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 196
    .line 197
    const/16 v3, 0x3056

    .line 198
    .line 199
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 200
    .line 201
    invoke-interface {p1, v1, v2, v3, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 205
    .line 206
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 207
    .line 208
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 209
    .line 210
    const/16 v3, 0x3057

    .line 211
    .line 212
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 213
    .line 214
    invoke-interface {p1, v1, v2, v3, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 215
    .line 216
    .line 217
    new-instance p1, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    const-string v1, "mEGLSurface width = "

    .line 220
    .line 221
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 225
    .line 226
    aget v1, v1, v4

    .line 227
    .line 228
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v1, ";mEGLSurface hight ="

    .line 232
    .line 233
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

    .line 237
    .line 238
    aget p0, p0, v4

    .line 239
    .line 240
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_9
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceAttribs:[I

    .line 252
    .line 253
    aget v2, p1, v1

    .line 254
    .line 255
    iget v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 256
    .line 257
    const/4 v7, 0x3

    .line 258
    if-ne v2, v6, :cond_a

    .line 259
    .line 260
    aget p1, p1, v7

    .line 261
    .line 262
    iget v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 263
    .line 264
    if-eq p1, v2, :cond_b

    .line 265
    .line 266
    :cond_a
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 267
    .line 268
    if-eq p1, v5, :cond_b

    .line 269
    .line 270
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 271
    .line 272
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 273
    .line 274
    invoke-interface {v2, v6, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 275
    .line 276
    .line 277
    iput-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 278
    .line 279
    :cond_b
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 280
    .line 281
    if-ne p1, v5, :cond_c

    .line 282
    .line 283
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceAttribs:[I

    .line 284
    .line 285
    iget v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 286
    .line 287
    aput v2, p1, v1

    .line 288
    .line 289
    iget v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 290
    .line 291
    aput v1, p1, v7

    .line 292
    .line 293
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 294
    .line 295
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 296
    .line 297
    iget-object v5, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 298
    .line 299
    aget-object v4, v5, v4

    .line 300
    .line 301
    invoke-interface {v1, v2, v4, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 306
    .line 307
    const-string p1, "eglCreatePbufferSurface"

    .line 308
    .line 309
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/player/fakeSurface;->checkEglError(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 313
    .line 314
    if-nez p1, :cond_c

    .line 315
    .line 316
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 317
    .line 318
    return-void

    .line 319
    :catch_1
    iput v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 320
    .line 321
    const-string p0, "eglCreatePbufferSurface fail"

    .line 322
    .line 323
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :cond_c
    :goto_0
    const/16 p0, 0xb71

    .line 328
    .line 329
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 330
    .line 331
    .line 332
    const/16 p0, 0xb44

    .line 333
    .line 334
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 335
    .line 336
    .line 337
    return-void
.end method

.method private makeCurrent()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->checkEglError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenHight:[I

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
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenWidth:[I

    .line 28
    .line 29
    aget v2, v2, v3

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 34
    .line 35
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 36
    .line 37
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

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
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method private makeUnCurrent()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeUnCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/player/fakeSurface;->checkEglError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 21
    .line 22
    iget-object v3, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 23
    .line 24
    iget-object v4, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

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
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private setup()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 2
    .line 3
    sget-object v1, Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;->RENDER_MODE_NORMAL:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;-><init>(Ltv/danmaku/ijk/media/player/fakeSurface;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 18
    .line 19
    iget v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSaturation:F

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setSaturation(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 25
    .line 26
    iget v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblurWeight:F

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setDeblurWeight(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 32
    .line 33
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblueEnabled:Z

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setDeblurEnabled(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 39
    .line 40
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->surfaceCreated()V

    .line 41
    .line 42
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "textureID="

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 51
    .line 52
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->getTextureId()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "fakeSurface"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :try_start_0
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 69
    .line 70
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 71
    .line 72
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->getTextureId()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Landroid/view/Surface;

    .line 85
    .line 86
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 87
    .line 88
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurface:Landroid/view/Surface;
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    iput v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    sget-object v1, Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;->RENDER_MODE_SIMPLE:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 98
    .line 99
    if-ne v0, v1, :cond_1

    .line 100
    .line 101
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 102
    .line 103
    if-nez v0, :cond_1

    .line 104
    .line 105
    new-instance v0, Ltv/danmaku/ijk/media/player/TextureRender;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/player/TextureRender;-><init>(Ltv/danmaku/ijk/media/player/fakeSurface;)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 111
    .line 112
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/TextureRender;->surfaceCreated()V

    .line 113
    .line 114
    .line 115
    :try_start_1
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 116
    .line 117
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 118
    .line 119
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/TextureRender;->getTextureId()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 129
    .line 130
    .line 131
    new-instance v0, Landroid/view/Surface;

    .line 132
    .line 133
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 134
    .line 135
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 136
    .line 137
    .line 138
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurface:Landroid/view/Surface;
    :try_end_1
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_1 .. :try_end_1} :catch_1

    .line 139
    .line 140
    return-void

    .line 141
    :catch_1
    iput v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 142
    .line 143
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized activiteSurface(Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "activiteSurface"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 6
    .line 7
    const-string v1, "fakeSurface"

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 43
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mNeedActiveSurface:Z

    .line 44
    .line 45
    :cond_1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mScreenSurface:Ljava/lang/Object;

    .line 46
    .line 47
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mActiviteSyncObject:Ljava/lang/Object;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :goto_1
    :try_start_2
    throw p1

    .line 54
    :catchall_1
    move-exception p1

    .line 55
    goto :goto_3

    .line 56
    :catch_0
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    :try_start_4
    throw p1

    .line 61
    :catchall_2
    move-exception p1

    .line 62
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 63
    throw p1
.end method

.method public getFirstRender()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFirstRenderT:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLastErr()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurface:Landroid/view/Surface;
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

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 2
    .line 3
    return p0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    const-string p1, "fakeSurface"

    .line 2
    .line 3
    const-string v0, "new frame available"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSyncObject:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter p1

    .line 11
    const/4 v0, 0x1

    .line 12
    :try_start_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameAvailable:Z

    .line 13
    .line 14
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameSyncObject:Ljava/lang/Object;

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

.method public declared-synchronized release()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderShouldExit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    const-wide/16 v2, 0xbb8

    .line 11
    .line 12
    :try_start_1
    invoke-virtual {v0, v2, v3}, Ljava/lang/Thread;->join(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :catch_0
    :try_start_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 21
    .line 22
    .line 23
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderThread:Ltv/danmaku/ijk/media/player/fakeSurface$RenderThread;

    .line 24
    .line 25
    :cond_0
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 26
    .line 27
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 30
    .line 31
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 32
    .line 33
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 34
    .line 35
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 36
    .line 37
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGLDumpSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 38
    .line 39
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    .line 40
    .line 41
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 42
    .line 43
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurface:Landroid/view/Surface;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurface:Landroid/view/Surface;

    .line 51
    .line 52
    :cond_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 53
    .line 54
    iput-object v1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    throw v0
.end method

.method public setDeblurEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblueEnabled:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setDeblurEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDeblurWeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mDeblurWeight:F

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setDeblurWeight(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setLastErr(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mLastError:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mRenderMode:Ltv/danmaku/ijk/media/player/fakeSurface$RenderMode;

    .line 2
    .line 3
    return-void
.end method

.method public setSaturation(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mSaturation:F

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRender:Ltv/danmaku/ijk/media/player/TextureRenderExt;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/TextureRenderExt;->setSaturation(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public updateRec(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameW:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mFrameH:I

    .line 4
    .line 5
    return-void
.end method

.method public updateRect(FFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/fakeSurface;->mTextureRenderSimple:Ltv/danmaku/ijk/media/player/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/TextureRender;->updateRec(FFFF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
