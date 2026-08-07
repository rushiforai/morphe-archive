.class public Lio/agora/base/internal/video/WrappedNativeTextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$TextureBuffer;
.implements Lio/agora/base/internal/video/IHandlerReplaceable;


# instance fields
.field private final colorSpace:Lio/agora/base/VideoFrame$ColorSpace;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final eglContext:Lio/agora/base/internal/video/EglBase$Context;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private fenceObject:J

.field private final height:I

.field private final id:I

.field private is10bitTexture:Z

.field private nativeRefCountedPointer:J

.field private final nativeRefLock:Ljava/lang/Object;

.field private final toI420Handler:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final transformMatrix:Landroid/graphics/Matrix;

.field private final type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

.field private final width:I

.field private final yuvConverter:Lio/agora/base/internal/video/YuvConverter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;JJLio/agora/base/VideoFrame$ColorSpace;)V
    .locals 2
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Lio/agora/base/VideoFrame$ColorSpace;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefLock:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->is10bitTexture:Z

    .line 7
    iput-object p1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 8
    iput p2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 9
    iput p3, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 10
    iput-object p4, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 11
    iput p5, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->id:I

    .line 12
    iput-object p6, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 13
    iput-object p7, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 14
    iput-object p8, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 15
    iput-object p13, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 16
    iput-wide p11, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->fenceObject:J

    .line 17
    monitor-enter v0

    .line 18
    :try_start_0
    iput-wide p9, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 19
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->retain()V

    .line 20
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IIZI[FLandroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;JJIIII)V
    .locals 15
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    if-eqz p4, :cond_0

    .line 1
    sget-object v0, Lio/agora/base/VideoFrame$TextureBuffer$Type;->OES:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    :goto_0
    move-object v5, v0

    goto :goto_1

    :cond_0
    sget-object v0, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    goto :goto_0

    .line 2
    :goto_1
    invoke-static/range {p6 .. p6}, Lio/agora/base/internal/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    move-result-object v7

    new-instance v14, Lio/agora/base/internal/video/WrappedNativeColorSpace;

    move/from16 v0, p13

    move/from16 v1, p14

    move/from16 v2, p15

    move/from16 v3, p16

    invoke-direct {v14, v0, v1, v2, v3}, Lio/agora/base/internal/video/WrappedNativeColorSpace;-><init>(IIII)V

    move-object v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v6, p5

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-wide/from16 v10, p9

    move-wide/from16 v12, p11

    .line 3
    invoke-direct/range {v1 .. v14}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;JJLio/agora/base/VideoFrame$ColorSpace;)V

    return-void
.end method

.method public static synthetic access$000(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)Lio/agora/base/internal/video/YuvConverter;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)Lio/agora/base/VideoFrame$ColorSpace;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    return-object p0
.end method

.method private static wrapNewTextureBuffer(Lio/agora/base/TextureBuffer;IIIIJ[F)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 8
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget-object p3, Lio/agora/base/VideoFrame$TextureBuffer$Type;->OES:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 4
    .line 5
    :goto_0
    move-object v1, p3

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    sget-object p3, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :goto_1
    invoke-static {p7}, Lio/agora/base/internal/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    move-object v0, p0

    .line 15
    move v6, p1

    .line 16
    move v7, p2

    .line 17
    move v2, p4

    .line 18
    move-wide v3, p5

    .line 19
    invoke-virtual/range {v0 .. v7}, Lio/agora/base/TextureBuffer;->applyNewTextureInfo(Lio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public applyNewI420Handler(Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/VideoFrame$Buffer;
    .locals 16
    .param p1    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    new-instance v2, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 7
    .line 8
    iget-object v3, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 9
    .line 10
    iget v4, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 11
    .line 12
    iget v5, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 13
    .line 14
    iget-object v6, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 15
    .line 16
    iget v7, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->id:I

    .line 17
    .line 18
    iget-object v8, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 19
    .line 20
    iget-wide v11, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 21
    .line 22
    iget-wide v13, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->fenceObject:J

    .line 23
    .line 24
    iget-object v15, v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 25
    .line 26
    move-object/from16 v9, p1

    .line 27
    .line 28
    move-object/from16 v10, p2

    .line 29
    .line 30
    invoke-direct/range {v2 .. v15}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;JJLio/agora/base/VideoFrame$ColorSpace;)V

    .line 31
    .line 32
    .line 33
    monitor-exit v1

    .line 34
    return-object v2

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw v0
.end method

.method public applyNewRefCountedPointer(J)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->release()V

    .line 5
    .line 6
    .line 7
    iput-wide p1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 8
    .line 9
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->retain()V

    .line 10
    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;
    .locals 15

    .line 1
    new-instance v6, Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {v6, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 6
    .line 7
    .line 8
    move-object/from16 v0, p1

    .line 9
    .line 10
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 11
    .line 12
    .line 13
    iget-object v14, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefLock:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v14

    .line 16
    :try_start_0
    new-instance v0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 17
    .line 18
    iget-object v1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 19
    .line 20
    iget-object v4, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 21
    .line 22
    iget v5, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->id:I

    .line 23
    .line 24
    iget-object v7, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 25
    .line 26
    iget-object v8, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 27
    .line 28
    iget-wide v9, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 29
    .line 30
    iget-wide v11, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->fenceObject:J

    .line 31
    .line 32
    iget-object v13, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 33
    .line 34
    move/from16 v2, p2

    .line 35
    .line 36
    move/from16 v3, p3

    .line 37
    .line 38
    invoke-direct/range {v0 .. v13}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;JJLio/agora/base/VideoFrame$ColorSpace;)V

    .line 39
    .line 40
    .line 41
    monitor-exit v14

    .line 42
    return-object v0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    move-object p0, v0

    .line 45
    monitor-exit v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p0
.end method

.method public cropAndScale(IIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 7
    .line 8
    add-int/2addr p2, p4

    .line 9
    sub-int p2, v1, p2

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iget v2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    div-float/2addr p1, v2

    .line 16
    int-to-float p2, p2

    .line 17
    int-to-float v1, v1

    .line 18
    div-float/2addr p2, v1

    .line 19
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 20
    .line 21
    .line 22
    int-to-float p1, p3

    .line 23
    iget p2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr p1, p2

    .line 27
    int-to-float p2, p4

    .line 28
    iget p3, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 29
    .line 30
    int-to-float p3, p3

    .line 31
    div-float/2addr p2, p3

    .line 32
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEglContextType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 2
    .line 3
    invoke-static {p0}, Lio/agora/base/internal/video/EglBaseFactory;->isEglBase14(Lio/agora/base/internal/video/EglBase$Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lio/agora/base/VideoFrame$TextureBuffer$ContextType;->EGL_CONTEXT_14:Lio/agora/base/VideoFrame$TextureBuffer$ContextType;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    sget-object p0, Lio/agora/base/VideoFrame$TextureBuffer$ContextType;->EGL_CONTEXT_10:Lio/agora/base/VideoFrame$TextureBuffer$ContextType;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public getFenceObject()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->fenceObject:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/internal/video/EglBase$Context;->getNativeEglContext()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getSequence()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getSourceTexturePool()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getToI420Handler()Landroid/os/Handler;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransformMatrixArray()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-static {p0}, Lio/agora/base/internal/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getType()Lio/agora/base/VideoFrame$TextureBuffer$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public getYuvConverter()Lio/agora/base/internal/video/YuvConverter;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 2
    .line 3
    return-object p0
.end method

.method public is10BitTexture()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->is10bitTexture:Z

    .line 2
    .line 3
    return p0
.end method

.method public mirror(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x3f000000    # 0.5f

    .line 7
    .line 8
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x5a

    .line 12
    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/high16 v3, -0x40800000    # -1.0f

    .line 16
    .line 17
    if-eq p1, v1, :cond_1

    .line 18
    .line 19
    const/16 v1, 0x10e

    .line 20
    .line 21
    if-ne p1, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 29
    .line 30
    .line 31
    :goto_1
    const/high16 p1, -0x41000000    # -0.5f

    .line 32
    .line 33
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, v0, p1, v1}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeReleaseRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->nativeRefCountedPointer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeAddRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public rotate(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x10e

    .line 7
    .line 8
    const/16 v2, 0x5a

    .line 9
    .line 10
    if-eq p1, v2, :cond_1

    .line 11
    .line 12
    if-ne p1, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    :goto_1
    if-eq p1, v2, :cond_3

    .line 25
    .line 26
    if-ne p1, v1, :cond_2

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_2
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_3

    .line 34
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    :goto_3
    const/high16 v2, 0x3f000000    # 0.5f

    .line 39
    .line 40
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 41
    .line 42
    .line 43
    int-to-float p1, p1

    .line 44
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 45
    .line 46
    .line 47
    const/high16 p1, -0x41000000    # -0.5f

    .line 48
    .line 49
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0, v3, v1}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public toI010()Lio/agora/base/VideoFrame$I010Buffer;
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    filled-new-array {v1}, [Lio/agora/base/VideoFrame$I010Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :try_start_0
    new-instance v2, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$1;

    .line 15
    .line 16
    invoke-direct {v2, p0, v1}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$1;-><init>(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;[Lio/agora/base/VideoFrame$I010Buffer;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v2}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "toI010 failure:"

    .line 27
    .line 28
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "WrappedNativeTextureBuffer"

    .line 43
    .line 44
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    const/4 p0, 0x0

    .line 48
    aget-object p0, v1, p0

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_0
    const-string p0, "toI010Handler or yuvConverter is null"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public toI420()Lio/agora/base/VideoFrame$I420Buffer;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    :try_start_0
    new-instance v1, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;-><init>(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lio/agora/base/VideoFrame$I420Buffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    return-object p0

    .line 21
    :catch_0
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string p0, "toI420Handler or yuvConverter is null"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public transform(IIIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 7
    .line 8
    add-int/2addr p2, p4

    .line 9
    sub-int p2, v1, p2

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iget v2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    div-float/2addr p1, v2

    .line 16
    int-to-float p2, p2

    .line 17
    int-to-float v1, v1

    .line 18
    div-float/2addr p2, v1

    .line 19
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 20
    .line 21
    .line 22
    int-to-float p1, p3

    .line 23
    iget p2, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->width:I

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr p1, p2

    .line 27
    int-to-float p2, p4

    .line 28
    iget p3, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->height:I

    .line 29
    .line 30
    int-to-float p3, p3

    .line 31
    div-float/2addr p2, p3

    .line 32
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 33
    .line 34
    .line 35
    if-lez p5, :cond_0

    .line 36
    .line 37
    if-lez p6, :cond_0

    .line 38
    .line 39
    if-nez p7, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    const/high16 p1, 0x3f000000    # 0.5f

    .line 47
    .line 48
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 49
    .line 50
    .line 51
    const/high16 p1, 0x3f800000    # 1.0f

    .line 52
    .line 53
    const/high16 p2, -0x40800000    # -1.0f

    .line 54
    .line 55
    if-gez p5, :cond_1

    .line 56
    .line 57
    invoke-virtual {v0, p2, p1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 58
    .line 59
    .line 60
    neg-int p5, p5

    .line 61
    :cond_1
    if-gez p6, :cond_2

    .line 62
    .line 63
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 64
    .line 65
    .line 66
    neg-int p6, p6

    .line 67
    :cond_2
    const/16 p1, 0x5a

    .line 68
    .line 69
    if-eq p7, p1, :cond_3

    .line 70
    .line 71
    const/16 p1, 0x10e

    .line 72
    .line 73
    if-ne p7, p1, :cond_4

    .line 74
    .line 75
    :cond_3
    move v3, p6

    .line 76
    move p6, p5

    .line 77
    move p5, v3

    .line 78
    :cond_4
    if-eqz p7, :cond_5

    .line 79
    .line 80
    int-to-float p1, p7

    .line 81
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 82
    .line 83
    .line 84
    :cond_5
    const/high16 p1, -0x41000000    # -0.5f

    .line 85
    .line 86
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method
