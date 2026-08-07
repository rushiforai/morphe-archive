.class public Lio/agora/base/TextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$TextureBuffer;
.implements Lio/agora/base/internal/video/IHandlerReplaceable;


# static fields
.field private static final DEFAULT_FENCE_VALUE:J = 0x0L

.field private static final TAG:Ljava/lang/String; = "TextureBuffer"

.field private static final VERBOSE:Z


# instance fields
.field private final eglContext:Lio/agora/base/internal/video/EglBase$Context;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private fenceObject:J

.field private final height:I

.field private final id:I

.field private is10bitTexture:Z

.field private final refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

.field private sequence:I

.field private final sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

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
.method public constructor <init>(Landroid/opengl/EGLContext;IILio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 15
    .param p1    # Landroid/opengl/EGLContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 49
    invoke-static/range {p1 .. p1}, Lio/agora/base/internal/video/EglBaseFactory;->createEgl14Context(Landroid/opengl/EGLContext;)Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v1

    const/4 v13, -0x1

    const/4 v14, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-wide/from16 v11, p6

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    move-object/from16 v8, p10

    move-object/from16 v9, p11

    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 15
    .param p1    # Landroid/opengl/EGLContext;
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
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-static/range {p1 .. p1}, Lio/agora/base/internal/video/EglBaseFactory;->createEgl14Context(Landroid/opengl/EGLContext;)Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v1

    const/4 v13, -0x1

    const/4 v14, 0x0

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    move-object v0, p0

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 15
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v13, -0x1

    const/4 v14, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-wide/from16 v11, p6

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    move-object/from16 v8, p10

    move-object/from16 v9, p11

    .line 50
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 15
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v13, -0x1

    const/4 v14, 0x0

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    .line 52
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V
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
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Lio/agora/base/internal/video/TextureBufferPool;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lio/agora/base/TextureBuffer;->fenceObject:J

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

    .line 13
    .line 14
    iput-object p1, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 15
    .line 16
    iput p2, p0, Lio/agora/base/TextureBuffer;->width:I

    .line 17
    .line 18
    iput p3, p0, Lio/agora/base/TextureBuffer;->height:I

    .line 19
    .line 20
    iput-object p4, p0, Lio/agora/base/TextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 21
    .line 22
    iput p5, p0, Lio/agora/base/TextureBuffer;->id:I

    .line 23
    .line 24
    iput-object p6, p0, Lio/agora/base/TextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 25
    .line 26
    iput-object p7, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 27
    .line 28
    iput-object p8, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 29
    .line 30
    iput-object p10, p0, Lio/agora/base/TextureBuffer;->sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 31
    .line 32
    new-instance p1, Lio/agora/base/internal/RefCountDelegate;

    .line 33
    .line 34
    invoke-direct {p1, p9}, Lio/agora/base/internal/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lio/agora/base/TextureBuffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 38
    .line 39
    iput p13, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 40
    .line 41
    iput-wide p11, p0, Lio/agora/base/TextureBuffer;->fenceObject:J

    .line 42
    .line 43
    move/from16 p1, p14

    .line 44
    .line 45
    iput-boolean p1, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Z)V
    .locals 15
    .param p1    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-wide/16 v11, 0x0

    const/4 v13, -0x1

    const/4 v10, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v14, p10

    .line 51
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public constructor <init>(Ljavax/microedition/khronos/egl/EGLContext;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 15
    .param p1    # Ljavax/microedition/khronos/egl/EGLContext;
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
    .param p9    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    invoke-static/range {p1 .. p1}, Lio/agora/base/internal/video/EglBaseFactory;->createEgl10Context(Ljavax/microedition/khronos/egl/EGLContext;)Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v1

    const/4 v13, -0x1

    const/4 v14, 0x0

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    move-object v0, p0

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    return-void
.end method

.method public static synthetic access$000(Lio/agora/base/TextureBuffer;)Lio/agora/base/internal/video/YuvConverter;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public applyNewI420Handler(Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/VideoFrame$Buffer;
    .locals 15
    .param p1    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->retain()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/TextureBuffer;

    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 7
    .line 8
    iget v2, p0, Lio/agora/base/TextureBuffer;->width:I

    .line 9
    .line 10
    iget v3, p0, Lio/agora/base/TextureBuffer;->height:I

    .line 11
    .line 12
    iget-object v4, p0, Lio/agora/base/TextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 13
    .line 14
    iget v5, p0, Lio/agora/base/TextureBuffer;->id:I

    .line 15
    .line 16
    iget-object v6, p0, Lio/agora/base/TextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    new-instance v9, Lio/agora/base/TextureBuffer$1;

    .line 19
    .line 20
    invoke-direct {v9, p0}, Lio/agora/base/TextureBuffer$1;-><init>(Lio/agora/base/TextureBuffer;)V

    .line 21
    .line 22
    .line 23
    iget-object v10, p0, Lio/agora/base/TextureBuffer;->sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 24
    .line 25
    iget-wide v11, p0, Lio/agora/base/TextureBuffer;->fenceObject:J

    .line 26
    .line 27
    const/4 v13, -0x1

    .line 28
    iget-boolean v14, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

    .line 29
    .line 30
    move-object/from16 v7, p1

    .line 31
    .line 32
    move-object/from16 v8, p2

    .line 33
    .line 34
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public applyNewTextureInfo(Lio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;
    .locals 15

    .line 1
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->retain()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/TextureBuffer;

    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 7
    .line 8
    iget-object v7, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v8, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 11
    .line 12
    new-instance v9, Lio/agora/base/TextureBuffer$5;

    .line 13
    .line 14
    invoke-direct {v9, p0}, Lio/agora/base/TextureBuffer$5;-><init>(Lio/agora/base/TextureBuffer;)V

    .line 15
    .line 16
    .line 17
    iget-object v10, p0, Lio/agora/base/TextureBuffer;->sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 18
    .line 19
    iget v13, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 20
    .line 21
    iget-boolean v14, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

    .line 22
    .line 23
    move-object/from16 v4, p1

    .line 24
    .line 25
    move/from16 v5, p2

    .line 26
    .line 27
    move-wide/from16 v11, p3

    .line 28
    .line 29
    move-object/from16 v6, p5

    .line 30
    .line 31
    move/from16 v2, p6

    .line 32
    .line 33
    move/from16 v3, p7

    .line 34
    .line 35
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;
    .locals 15

    .line 1
    new-instance v6, Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v0, p0, Lio/agora/base/TextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

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
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->retain()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lio/agora/base/TextureBuffer;

    .line 17
    .line 18
    iget-object v1, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 19
    .line 20
    iget-object v4, p0, Lio/agora/base/TextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 21
    .line 22
    iget v5, p0, Lio/agora/base/TextureBuffer;->id:I

    .line 23
    .line 24
    iget-object v7, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 25
    .line 26
    iget-object v8, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 27
    .line 28
    new-instance v9, Lio/agora/base/TextureBuffer$4;

    .line 29
    .line 30
    invoke-direct {v9, p0}, Lio/agora/base/TextureBuffer$4;-><init>(Lio/agora/base/TextureBuffer;)V

    .line 31
    .line 32
    .line 33
    iget-object v10, p0, Lio/agora/base/TextureBuffer;->sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 34
    .line 35
    iget-wide v11, p0, Lio/agora/base/TextureBuffer;->fenceObject:J

    .line 36
    .line 37
    iget v13, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 38
    .line 39
    iget-boolean v14, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

    .line 40
    .line 41
    move/from16 v2, p2

    .line 42
    .line 43
    move/from16 v3, p3

    .line 44
    .line 45
    invoke-direct/range {v0 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Lio/agora/base/internal/video/TextureBufferPool;JIZ)V

    .line 46
    .line 47
    .line 48
    return-object v0
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
    iget v1, p0, Lio/agora/base/TextureBuffer;->height:I

    .line 7
    .line 8
    add-int/2addr p2, p4

    .line 9
    sub-int p2, v1, p2

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iget v2, p0, Lio/agora/base/TextureBuffer;->width:I

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
    iget p2, p0, Lio/agora/base/TextureBuffer;->width:I

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr p1, p2

    .line 27
    int-to-float p2, p4

    .line 28
    iget p3, p0, Lio/agora/base/TextureBuffer;->height:I

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
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

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
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEglContextType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

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
    iget-wide v0, p0, Lio/agora/base/TextureBuffer;->fenceObject:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/TextureBuffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->eglContext:Lio/agora/base/internal/video/EglBase$Context;

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

    .line 1
    iget p0, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 2
    .line 3
    return p0
.end method

.method public getSourceTexturePool()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->sourceTexturePool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/TextureBuffer;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getToI420Handler()Landroid/os/Handler;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransformMatrixArray()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->transformMatrix:Landroid/graphics/Matrix;

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
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/TextureBuffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public getYuvConverter()Lio/agora/base/internal/video/YuvConverter;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 2
    .line 3
    return-object p0
.end method

.method public is10BitTexture()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/TextureBuffer;->is10bitTexture:Z

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
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, v0, p1, v1}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/internal/RefCountDelegate;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer;->refCountDelegate:Lio/agora/base/internal/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/internal/RefCountDelegate;->retain()V

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
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getHeight()I

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
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_3

    .line 34
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getWidth()I

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
    invoke-virtual {p0, v0, v3, v1}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public toI010()Lio/agora/base/VideoFrame$I010Buffer;
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    filled-new-array {v1}, [Lio/agora/base/VideoFrame$I010Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    :try_start_0
    new-instance v3, Lio/agora/base/TextureBuffer$3;

    .line 15
    .line 16
    invoke-direct {v3, p0, v2}, Lio/agora/base/TextureBuffer$3;-><init>(Lio/agora/base/TextureBuffer;[Lio/agora/base/VideoFrame$I010Buffer;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v3}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    aget-object p0, v2, p0

    .line 24
    .line 25
    return-object p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "toI420 failure:"

    .line 30
    .line 31
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "TextureBuffer"

    .line 46
    .line 47
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_0
    const-string p0, "toI420Handler or yuvConverter is null"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public toI420()Lio/agora/base/VideoFrame$I420Buffer;
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/TextureBuffer;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lio/agora/base/TextureBuffer;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    filled-new-array {v1}, [Lio/agora/base/VideoFrame$I420Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    :try_start_0
    new-instance v3, Lio/agora/base/TextureBuffer$2;

    .line 15
    .line 16
    invoke-direct {v3, p0, v2}, Lio/agora/base/TextureBuffer$2;-><init>(Lio/agora/base/TextureBuffer;[Lio/agora/base/VideoFrame$I420Buffer;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v3}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    aget-object p0, v2, p0

    .line 24
    .line 25
    return-object p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "toI420 failure:"

    .line 30
    .line 31
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "TextureBuffer"

    .line 46
    .line 47
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_0
    const-string p0, "toI420Handler or yuvConverter is null"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v1
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
    iget v1, p0, Lio/agora/base/TextureBuffer;->height:I

    .line 7
    .line 8
    add-int/2addr p2, p4

    .line 9
    sub-int p2, v1, p2

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iget v2, p0, Lio/agora/base/TextureBuffer;->width:I

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
    iget p2, p0, Lio/agora/base/TextureBuffer;->width:I

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr p1, p2

    .line 27
    int-to-float p2, p4

    .line 28
    iget p3, p0, Lio/agora/base/TextureBuffer;->height:I

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
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

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
    invoke-virtual {p0, v0, p5, p6}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method

.method public withSequence(I)Lio/agora/base/TextureBuffer;
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/TextureBuffer;->sequence:I

    .line 2
    .line 3
    return-object p0
.end method
