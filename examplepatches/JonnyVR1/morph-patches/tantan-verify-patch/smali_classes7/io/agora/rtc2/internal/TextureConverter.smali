.class public Lio/agora/rtc2/internal/TextureConverter;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String; = "TextureConverter"


# instance fields
.field private final drawMatrix:Landroid/graphics/Matrix;

.field private eglContext:Lio/agora/base/internal/video/EglBase$Context;

.field private final frameDrawer:Lio/agora/base/internal/video/VideoFrameDrawer;

.field private textureBufferHelper:Lio/agora/base/TextureBufferHelper;

.field private final textureDrawer:Lio/agora/base/internal/video/GlRectDrawer;

.field private textureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    new-instance v0, Lio/agora/base/internal/video/GlRectDrawer;

    invoke-direct {v0}, Lio/agora/base/internal/video/GlRectDrawer;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureDrawer:Lio/agora/base/internal/video/GlRectDrawer;

    new-instance v0, Lio/agora/base/internal/video/VideoFrameDrawer;

    invoke-direct {v0}, Lio/agora/base/internal/video/VideoFrameDrawer;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->frameDrawer:Lio/agora/base/internal/video/VideoFrameDrawer;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->drawMatrix:Landroid/graphics/Matrix;

    sget-object p0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    const-string v0, "constructor()"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$000(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/TextureBufferHelper;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    return-object p0
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    return-object p0
.end method

.method public static synthetic access$202(Lio/agora/rtc2/internal/TextureConverter;Lio/agora/base/internal/video/GlTextureFrameBuffer;)Lio/agora/base/internal/video/GlTextureFrameBuffer;
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/TextureConverter;->textureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    return-object p1
.end method

.method public static synthetic access$300(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlRectDrawer;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureDrawer:Lio/agora/base/internal/video/GlRectDrawer;

    return-object p0
.end method

.method public static synthetic access$400(Lio/agora/rtc2/internal/TextureConverter;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter;->drawMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method public static synthetic access$500(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/VideoFrameDrawer;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter;->frameDrawer:Lio/agora/base/internal/video/VideoFrameDrawer;

    return-object p0
.end method

.method private configEglEnv(Lio/agora/base/internal/video/EglBase$Context;)Z
    .locals 1
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "AgConvertor"

    invoke-static {v0, p1}, Lio/agora/base/TextureBufferHelper;->create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/TextureBufferHelper;

    move-result-object v0

    iput-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    if-nez v0, :cond_0

    sget-object p0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    const-string p1, "Failed to create texture buffer helper."

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_0
    iput-object p1, p0, Lio/agora/rtc2/internal/TextureConverter;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    const/4 p0, 0x1

    return p0
.end method

.method private reconfigEglEnv(Lio/agora/base/internal/video/EglBase$Context;)Z
    .locals 2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    sget-object v0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    const-string v1, "reconfigEglEnv(()"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lio/agora/rtc2/internal/TextureConverter;->releaseEglEnv()V

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/TextureConverter;->configEglEnv(Lio/agora/base/internal/video/EglBase$Context;)Z

    move-result p0

    return p0
.end method

.method private releaseEglEnv()V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lio/agora/rtc2/internal/TextureConverter;->textureFrameBuffer:Lio/agora/base/internal/video/GlTextureFrameBuffer;

    if-eqz v2, :cond_0

    new-instance v2, Lio/agora/rtc2/internal/TextureConverter$2;

    invoke-direct {v2, p0}, Lio/agora/rtc2/internal/TextureConverter$2;-><init>(Lio/agora/rtc2/internal/TextureConverter;)V

    invoke-virtual {v0, v2}, Lio/agora/base/TextureBufferHelper;->invoke(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    invoke-virtual {v0}, Lio/agora/base/TextureBufferHelper;->dispose()V

    iput-object v1, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    :cond_1
    iput-object v1, p0, Lio/agora/rtc2/internal/TextureConverter;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    return-void
.end method


# virtual methods
.method public convert(Lio/agora/base/VideoFrame;)Lio/agora/base/VideoFrame;
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v1

    instance-of v1, v1, Lio/agora/base/VideoFrame$TextureBuffer;

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v1

    check-cast v1, Lio/agora/base/VideoFrame$TextureBuffer;

    invoke-interface {v1}, Lio/agora/base/VideoFrame$TextureBuffer;->getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v2

    instance-of v2, v2, Lio/agora/base/VideoFrame$I420Buffer;

    if-eqz v2, :cond_2

    invoke-static {}, Lio/agora/rtc2/gl/EglBaseProvider;->instance()Lio/agora/rtc2/gl/EglBaseProvider;

    move-result-object v1

    invoke-virtual {v1}, Lio/agora/rtc2/gl/EglBaseProvider;->getRootEglBase()Lio/agora/base/internal/video/EglBase;

    move-result-object v1

    invoke-interface {v1}, Lio/agora/base/internal/video/EglBase;->getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v1

    :cond_2
    if-nez v1, :cond_3

    return-object v0

    :cond_3
    invoke-direct {p0, v1}, Lio/agora/rtc2/internal/TextureConverter;->reconfigEglEnv(Lio/agora/base/internal/video/EglBase$Context;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object p0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    const-string p1, "failed to reconfig egl env"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_4
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter;->textureBufferHelper:Lio/agora/base/TextureBufferHelper;

    new-instance v1, Lio/agora/rtc2/internal/TextureConverter$1;

    invoke-direct {v1, p0, p1}, Lio/agora/rtc2/internal/TextureConverter$1;-><init>(Lio/agora/rtc2/internal/TextureConverter;Lio/agora/base/VideoFrame;)V

    invoke-virtual {v0, v1}, Lio/agora/base/TextureBufferHelper;->invoke(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/agora/base/VideoFrame;

    return-object p0

    :cond_5
    :goto_1
    return-object v0
.end method

.method public dispose()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    sget-object v0, Lio/agora/rtc2/internal/TextureConverter;->TAG:Ljava/lang/String;

    const-string v1, "dispose()"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lio/agora/rtc2/internal/TextureConverter;->releaseEglEnv()V

    return-void
.end method
