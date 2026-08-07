.class public Lcom/ss/bytertc/engine/utils/TextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;
    }
.end annotation


# static fields
.field public static final FORMAT_TEXTURE_2D:I = 0xa

.field public static final FORMAT_TEXTURE_OES:I = 0xb

.field private static final TAG:Ljava/lang/String; = "TextureHelper"

.field private static final TEXTURE_MAX_COUNT:I = 0x2d

.field private static TEX_MATRIX:[F

.field private static YUV_TEX_MATRIX:[F


# instance fields
.field private final mEglBase:Lcom/bytedance/realx/video/EglBase;

.field private mFrameBufferId:I

.field private final mHandler:Landroid/os/Handler;

.field private mHeight:I

.field private mIsQuitting:Z

.field private mIsRelease:Z

.field private mIsTextureInUse:Z

.field private mTextureCnt:I

.field private mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

.field private mTextureFreeQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTextureUsedQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mWidth:I

.field private mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

.field private mYuvUploader:Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    sput-object v1, Lcom/ss/bytertc/engine/utils/TextureHelper;->TEX_MATRIX:[F

    .line 6
    .line 7
    new-array v0, v0, [F

    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Landroid/os/Handler;II)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureCnt:I

    .line 6
    .line 7
    new-instance v1, Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/4 v3, 0x0

    .line 34
    if-ne v1, v2, :cond_3

    .line 35
    .line 36
    iput p3, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mWidth:I

    .line 37
    .line 38
    iput p4, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHeight:I

    .line 39
    .line 40
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 41
    .line 42
    sget-object p3, Lcom/ss/bytertc/engine/utils/TextureHelper;->TEX_MATRIX:[F

    .line 43
    .line 44
    invoke-static {p3, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 45
    .line 46
    .line 47
    sget-object p3, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    .line 48
    .line 49
    invoke-static {p3, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 50
    .line 51
    .line 52
    sget-object p3, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    .line 53
    .line 54
    const/high16 p4, 0x3f000000    # 0.5f

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-static {p3, v0, p4, p4, v1}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 58
    .line 59
    .line 60
    sget-object p3, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    .line 61
    .line 62
    const/high16 p4, -0x40800000    # -1.0f

    .line 63
    .line 64
    const/high16 v2, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-static {p3, v0, v2, p4, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 67
    .line 68
    .line 69
    sget-object p3, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    .line 70
    .line 71
    const/high16 p4, -0x41000000    # -0.5f

    .line 72
    .line 73
    invoke-static {p3, v0, p4, p4, v1}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 74
    .line 75
    .line 76
    instance-of p3, p1, Ljavax/microedition/khronos/egl/EGLContext;

    .line 77
    .line 78
    if-eqz p3, :cond_0

    .line 79
    .line 80
    check-cast p1, Ljavax/microedition/khronos/egl/EGLContext;

    .line 81
    .line 82
    sget-object p3, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 83
    .line 84
    invoke-static {p1, p3}, Lcom/bytedance/realx/video/EglBase;->createEgl10(Ljavax/microedition/khronos/egl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    instance-of p3, p1, Landroid/opengl/EGLContext;

    .line 92
    .line 93
    if-eqz p3, :cond_1

    .line 94
    .line 95
    check-cast p1, Landroid/opengl/EGLContext;

    .line 96
    .line 97
    sget-object p3, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 98
    .line 99
    invoke-static {p1, p3}, Lcom/bytedance/realx/video/EglBase;->createEgl14(Landroid/opengl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    instance-of p3, p1, Lcom/bytedance/realx/video/EglBase$Context;

    .line 107
    .line 108
    if-eqz p3, :cond_2

    .line 109
    .line 110
    check-cast p1, Lcom/bytedance/realx/video/EglBase$Context;

    .line 111
    .line 112
    invoke-static {p1}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/EglBase;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 117
    .line 118
    :goto_0
    :try_start_0
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 119
    .line 120
    iget p3, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mWidth:I

    .line 121
    .line 122
    iget p4, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHeight:I

    .line 123
    .line 124
    invoke-interface {p1, p3, p4}, Lcom/bytedance/realx/video/EglBase;->createPbufferSurface(II)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 128
    .line 129
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    const/4 p1, 0x1

    .line 133
    new-array p2, p1, [I

    .line 134
    .line 135
    invoke-static {p1, p2, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 136
    .line 137
    .line 138
    aget p1, p2, v0

    .line 139
    .line 140
    iput p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mFrameBufferId:I

    .line 141
    .line 142
    new-instance p1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 143
    .line 144
    invoke-direct {p1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 148
    .line 149
    new-instance p1, Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 150
    .line 151
    invoke-direct {p1}, Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvUploader:Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 155
    .line 156
    const-string p0, "TextureHelper construct"

    .line 157
    .line 158
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :catch_0
    move-exception p1

    .line 163
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 164
    .line 165
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 173
    .line 174
    .line 175
    throw p1

    .line 176
    :cond_2
    const-string p0, "unknown shareContext:"

    .line 177
    .line 178
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    throw v3

    .line 182
    :cond_3
    const-string p0, "TextureHelper must be created on the handler thread"

    .line 183
    .line 184
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    throw v3
.end method

.method public static synthetic a(Landroid/opengl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/utils/TextureHelper;-><init>(Ljava/lang/Object;Landroid/os/Handler;II)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-object v0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p2, " create failure"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "TextureHelper"

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/ss/bytertc/engine/utils/TextureHelper;Lcom/bytedance/realx/video/GlRectDrawer;)Lcom/bytedance/realx/video/GlRectDrawer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/engine/utils/TextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mFrameBufferId:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/engine/utils/TextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/engine/utils/TextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvUploader:Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/ss/bytertc/engine/utils/TextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsTextureInUse:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/YuvConverter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/ss/bytertc/engine/utils/TextureHelper;Lcom/bytedance/realx/video/YuvConverter;)Lcom/bytedance/realx/video/YuvConverter;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/engine/utils/TextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsQuitting:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/engine/utils/TextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->release()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;IILjava/lang/String;)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/utils/TextureHelper;-><init>(Ljava/lang/Object;Landroid/os/Handler;II)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-object v0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p2, " create failure"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "TextureHelper"

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static synthetic c(I)V
    .locals 2

    .line 1
    filled-new-array {p0}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v1, p0, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static create(Ljava/lang/String;Landroid/opengl/EGLContext;II)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 7

    .line 34
    new-instance v0, Landroid/os/HandlerThread;

    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 35
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 36
    new-instance v3, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    new-instance v1, Ll/pti0;

    move-object v6, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v1 .. v6}, Ll/pti0;-><init>(Landroid/opengl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)V

    invoke-static {v3, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;II)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 7

    .line 38
    new-instance v0, Landroid/os/HandlerThread;

    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 40
    new-instance v3, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 41
    new-instance v1, Ll/oti0;

    move-object v6, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v1 .. v6}, Ll/oti0;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;IILjava/lang/String;)V

    invoke-static {v3, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    return-object p0
.end method

.method public static create(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGLContext;II)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 7

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    new-instance v3, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/kti0;

    .line 19
    .line 20
    move-object v6, p0

    .line 21
    move-object v2, p1

    .line 22
    move v4, p2

    .line 23
    move v5, p3

    .line 24
    invoke-direct/range {v1 .. v6}, Ll/kti0;-><init>(Ljavax/microedition/khronos/egl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 32
    .line 33
    return-object p0
.end method

.method public static synthetic d(Lcom/ss/bytertc/engine/utils/TextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsQuitting:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsTextureInUse:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljavax/microedition/khronos/egl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/utils/TextureHelper;-><init>(Ljava/lang/Object;Landroid/os/Handler;II)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-object v0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p2, " create failure"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "TextureHelper"

    .line 26
    .line 27
    invoke-static {p2, p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static synthetic f(Lcom/ss/bytertc/engine/utils/TextureHelper;III)Ljava/lang/Integer;
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const v0, 0x84c0

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 12
    .line 13
    .line 14
    const/16 v0, 0xde1

    .line 15
    .line 16
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 17
    .line 18
    .line 19
    const/16 v8, 0x1401

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    const/16 v1, 0xde1

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/16 v3, 0x1908

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    const/16 v7, 0x1908

    .line 29
    .line 30
    move v4, p2

    .line 31
    move v5, p3

    .line 32
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 33
    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_0

    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    iget p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureCnt:I

    .line 51
    .line 52
    add-int/lit8 p2, p2, 0x1

    .line 53
    .line 54
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureCnt:I

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static synthetic g(Lcom/ss/bytertc/engine/utils/TextureHelper;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private generateTexture(III)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureCnt:I

    .line 2
    .line 3
    const/16 v1, 0x2d

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Ll/nti0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nti0;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;III)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static synthetic h(Lcom/ss/bytertc/engine/utils/TextureHelper;[I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mWidth:I

    .line 13
    .line 14
    iget v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHeight:I

    .line 15
    .line 16
    const/16 v3, 0xde1

    .line 17
    .line 18
    invoke-direct {p0, v3, v0, v2}, Lcom/ss/bytertc/engine/utils/TextureHelper;->generateTexture(III)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    aput v0, p1, v1

    .line 23
    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    aput v0, p1, v1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 56
    .line 57
    aget p1, p1, v1

    .line 58
    .line 59
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method private release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-ne v0, v1, :cond_5

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsTextureInUse:Z

    .line 18
    .line 19
    if-nez v0, :cond_4

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsQuitting:Z

    .line 22
    .line 23
    if-eqz v0, :cond_4

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsRelease:Z

    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/bytedance/realx/video/YuvConverter;->release()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mYuvUploader:Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/utils/TextureHelper$YuvUploader;->release()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-lez v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    filled-new-array {v3}, [I

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureFreeQueue:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 89
    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-lez v1, :cond_3

    .line 97
    .line 98
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Ljava/lang/Integer;

    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    filled-new-array {v3}, [I

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mTextureUsedQueue:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 131
    .line 132
    .line 133
    iget v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mFrameBufferId:I

    .line 134
    .line 135
    filled-new-array {v1}, [I

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 140
    .line 141
    .line 142
    iput v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mFrameBufferId:I

    .line 143
    .line 144
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 145
    .line 146
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_4
    const-string p0, "Unexpected release."

    .line 160
    .line 161
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_5
    const-string p0, "Wrong thread."

    .line 166
    .line 167
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method


# virtual methods
.method public dequeueTexture()I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 5
    .line 6
    new-instance v2, Ll/rti0;

    .line 7
    .line 8
    invoke-direct {v2, p0, v0}, Ll/rti0;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;[I)V

    .line 9
    .line 10
    .line 11
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    aget p0, v0, p0

    .line 16
    .line 17
    return p0
.end method

.method public declared-synchronized dispose()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "TextureHelper"

    .line 3
    .line 4
    const-string v1, "dispose()"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Ll/lti0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/lti0;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method

.method public drawTexture(III)V
    .locals 1

    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/utils/TextureHelper;->TEX_MATRIX:[F

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->drawTexture(III[F)V

    return-void
.end method

.method public drawTexture(III[F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/engine/utils/TextureHelper$1;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move v4, p1

    .line 7
    move v5, p2

    .line 8
    move v3, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Lcom/ss/bytertc/engine/utils/TextureHelper$1;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;III[F)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

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

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase$Context;->getNativeEglContext()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0

    .line 14
    :cond_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    return-wide v0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public queueTexture(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/qti0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/qti0;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public releaseTextureID(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsQuitting:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mIsRelease:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    new-instance v0, Ll/mti0;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/mti0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized textureToYuv(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    new-array v0, v0, [Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 6
    .line 7
    new-instance v2, Lcom/ss/bytertc/engine/utils/TextureHelper$3;

    .line 8
    .line 9
    invoke-direct {v2, p0, v0, p1}, Lcom/ss/bytertc/engine/utils/TextureHelper$3;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;[Lcom/bytedance/realx/video/VideoFrame$I420Buffer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    aget-object p1, v0, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-object p1

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public yuvToTexture(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;I)V
    .locals 1

    .line 12
    sget-object v0, Lcom/ss/bytertc/engine/utils/TextureHelper;->YUV_TEX_MATRIX:[F

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->yuvToTexture(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;I[F)V

    return-void
.end method

.method public yuvToTexture(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;I[F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/engine/utils/TextureHelper$2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1, p3}, Lcom/ss/bytertc/engine/utils/TextureHelper$2;-><init>(Lcom/ss/bytertc/engine/utils/TextureHelper;ILcom/bytedance/realx/video/VideoFrame$I420Buffer;[F)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
