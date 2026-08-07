.class public Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_POSITION_2:Ljava/lang/String; = "position2"

.field static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field private PositionX:F

.field private context:Landroid/content/Context;

.field private decorateHandler:I

.field private drawListBuffer:Ljava/nio/ShortBuffer;

.field private final drawOrder:[S

.field private final fragmentShaderCode:Ljava/lang/String;

.field private fvertexBuffer:Ljava/nio/FloatBuffer;

.field private imagePath:Ljava/lang/String;

.field private isDraw:Z

.field private isPost:Z

.field private lockTexture:Z

.field protected final mProjectionMatrix:[F

.field protected final mViewMatrix:[F

.field protected maskListLock:Ljava/lang/Object;

.field private mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

.field mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field protected positionHandle2:I

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;

.field private stickerHeight:I

.field stickerScale:F

.field private stickerWidth:I

.field texData0:[F

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field private final vertexStride:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}    gl_FragColor = color1;\n}"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 11
    .line 12
    const/16 v0, 0x10

    .line 13
    .line 14
    new-array v1, v0, [F

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mProjectionMatrix:[F

    .line 17
    .line 18
    new-array v0, v0, [F

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mViewMatrix:[F

    .line 21
    .line 22
    const/4 v0, 0x6

    .line 23
    new-array v0, v0, [S

    .line 24
    .line 25
    fill-array-data v0, :array_0

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawOrder:[S

    .line 29
    .line 30
    const/16 v0, 0x8

    .line 31
    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->vertexStride:I

    .line 33
    .line 34
    new-instance v0, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 40
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->lockTexture:Z

    .line 54
    .line 55
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerWidth:I

    .line 56
    .line 57
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerHeight:I

    .line 58
    .line 59
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isPost:Z

    .line 60
    .line 61
    const/high16 v0, 0x3f000000    # 0.5f

    .line 62
    .line 63
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->PositionX:F

    .line 64
    .line 65
    iput-object p2, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->context:Landroid/content/Context;

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->initCoordinate()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method private drawPositionSetFixed()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    iget-object v3, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->getAdjustHeightScale()F

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    mul-float/2addr v3, v4

    .line 26
    sub-float/2addr v2, v3

    .line 27
    div-float/2addr v2, v1

    .line 28
    iget-object v3, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->getAdjustHeightScale()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    mul-float/2addr v3, v4

    .line 40
    div-float/2addr v3, v1

    .line 41
    add-float/2addr v2, v3

    .line 42
    new-instance v3, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    int-to-float v4, v4

    .line 49
    div-float/2addr v0, v4

    .line 50
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    int-to-float v4, v4

    .line 55
    div-float/2addr v2, v4

    .line 56
    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/16 v2, 0x168

    .line 66
    .line 67
    if-le v0, v2, :cond_0

    .line 68
    .line 69
    :goto_0
    move v0, v1

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/16 v2, 0x2d0

    .line 76
    .line 77
    if-ne v0, v2, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :goto_1
    const/4 v2, 0x0

    .line 84
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private drawPositionSetScaleSize()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->PositionX:F

    .line 4
    .line 5
    const/high16 v2, 0x3f000000    # 0.5f

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private initCoordinate()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->updateSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    const-string v1, "decorationSize"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public cancelDraw()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isDraw:Z

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public deleteTexture()V
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->deleteTexture()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->clearPoints()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public draw()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->decorateHandler:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    div-float/2addr v1, v2

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawOrder:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 32
    .line 33
    .line 34
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 35
    .line 36
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public drawSub()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_2

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isPost:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawPositionSetScaleSize()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawPositionSetFixed()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    iget v0, p0, Ll/wej;->texture_in:I

    .line 23
    .line 24
    if-nez v0, :cond_3

    .line 25
    .line 26
    return-void

    .line 27
    :cond_3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/wej;->programHandle:I

    .line 40
    .line 41
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 42
    .line 43
    .line 44
    const/16 v0, 0x4100

    .line 45
    .line 46
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 69
    .line 70
    monitor-enter v0

    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_4

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, [F

    .line 88
    .line 89
    invoke-virtual {p0, v2}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->passShaderValues([F)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->draw()V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :catchall_0
    move-exception p0

    .line 97
    goto :goto_2

    .line 98
    :cond_4
    monitor-exit v0

    .line 99
    return-void

    .line 100
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    throw p0
.end method

.method public getAdjustHeightScale()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x44200000    # 640.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    mul-float/2addr p0, v2

    .line 21
    div-float/2addr p0, v1

    .line 22
    return p0
.end method

.method public getAdjustWidthScale()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, v1

    .line 21
    return p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}    gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->positionHandle2:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "decorationSize"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->decorateHandler:I

    .line 23
    .line 24
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->lockTexture:Z

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Ll/wej;->texture_in:I

    .line 12
    .line 13
    if-lez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isDraw:Z

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 29
    .line 30
    if-eqz p1, :cond_7

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-lez p1, :cond_7

    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isDraw:Z

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->clearPoints()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->context:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->imagePath:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/umw;->a()[B

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    iget v0, p0, Ll/wej;->texture_in:I

    .line 69
    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput p1, p0, Ll/wej;->texture_in:I

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-static {v0, p1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Ll/wej;->texture_in:I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    iget-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getDelegateBitmap()Landroid/graphics/Bitmap;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->deleteTexture()V

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Ll/wej;->texture_in:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->clearPoints()V

    .line 105
    .line 106
    .line 107
    :goto_0
    iget p1, p0, Ll/wej;->texture_in:I

    .line 108
    .line 109
    if-nez p1, :cond_6

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->clearPoints()V

    .line 112
    .line 113
    .line 114
    :cond_6
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isDraw:Z

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_7
    const/4 p1, 0x0

    .line 118
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isDraw:Z

    .line 119
    .line 120
    :goto_1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    int-to-float p1, p1

    .line 139
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    int-to-float p3, p3

    .line 144
    div-float/2addr p1, p3

    .line 145
    iget-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mProjectionMatrix:[F

    .line 146
    .line 147
    const/high16 p3, -0x40800000    # -1.0f

    .line 148
    .line 149
    div-float v4, p3, p1

    .line 150
    .line 151
    const/high16 p3, 0x3f800000    # 1.0f

    .line 152
    .line 153
    div-float v5, p3, p1

    .line 154
    .line 155
    const/high16 v6, 0x40400000    # 3.0f

    .line 156
    .line 157
    const/high16 v7, 0x40e00000    # 7.0f

    .line 158
    .line 159
    const/4 v1, 0x0

    .line 160
    const/high16 v2, -0x40800000    # -1.0f

    .line 161
    .line 162
    const/high16 v3, 0x3f800000    # 1.0f

    .line 163
    .line 164
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public passShaderValues([F)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    array-length v0, p1

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 36
    .line 37
    const/16 v6, 0x8

    .line 38
    .line 39
    iget-object v7, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    const/4 v3, 0x2

    .line 42
    const/16 v4, 0x1406

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 46
    .line 47
    .line 48
    iget v8, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->positionHandle2:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    const/4 v9, 0x2

    .line 55
    const/16 v10, 0x1406

    .line 56
    .line 57
    const/4 v11, 0x0

    .line 58
    invoke-static/range {v8 .. v13}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    iget p1, p0, Ll/wej;->positionHandle:I

    .line 62
    .line 63
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 64
    .line 65
    .line 66
    iget p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->positionHandle2:I

    .line 67
    .line 68
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 72
    .line 73
    iget v0, p0, Ll/wej;->curRotation:I

    .line 74
    .line 75
    aget-object p1, p1, v0

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 78
    .line 79
    .line 80
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 81
    .line 82
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 83
    .line 84
    iget v0, p0, Ll/wej;->curRotation:I

    .line 85
    .line 86
    aget-object v7, p1, v0

    .line 87
    .line 88
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 89
    .line 90
    .line 91
    iget p1, p0, Ll/wej;->texCoordHandle:I

    .line 92
    .line 93
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 94
    .line 95
    .line 96
    const p1, 0x84c0

    .line 97
    .line 98
    .line 99
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 100
    .line 101
    .line 102
    const/16 p1, 0xde1

    .line 103
    .line 104
    iget v0, p0, Ll/wej;->texture_in:I

    .line 105
    .line 106
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 107
    .line 108
    .line 109
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 110
    .line 111
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;F)V
    .locals 11

    .line 1
    iget-object v1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    :try_start_0
    monitor-exit v1

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    move-object p0, v0

    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 13
    .line 14
    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    .line 16
    mul-float/2addr v0, v2

    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr v0, v3

    .line 20
    neg-float v0, v0

    .line 21
    iget v4, p3, Landroid/graphics/PointF;->y:F

    .line 22
    .line 23
    neg-float v4, v4

    .line 24
    mul-float/2addr v4, v2

    .line 25
    add-float/2addr v4, v3

    .line 26
    iput v0, p3, Landroid/graphics/PointF;->x:F

    .line 27
    .line 28
    iput v4, p3, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    const/16 p3, 0x10

    .line 31
    .line 32
    new-array v5, p3, [F

    .line 33
    .line 34
    new-array p3, p3, [F

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-static {p3, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 38
    .line 39
    .line 40
    neg-float v0, v0

    .line 41
    const/4 v6, 0x0

    .line 42
    invoke-static {p3, v2, v0, v4, v6}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 43
    .line 44
    .line 45
    iget-object v7, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mViewMatrix:[F

    .line 46
    .line 47
    iget-object v9, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mProjectionMatrix:[F

    .line 48
    .line 49
    const/4 v10, 0x0

    .line 50
    const/4 v6, 0x0

    .line 51
    const/4 v8, 0x0

    .line 52
    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 53
    .line 54
    .line 55
    const/4 v8, 0x0

    .line 56
    const/4 v10, 0x0

    .line 57
    const/4 v6, 0x0

    .line 58
    move-object v9, v5

    .line 59
    move-object v7, p3

    .line 60
    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 61
    .line 62
    .line 63
    const/4 v9, 0x0

    .line 64
    const/high16 v10, 0x3f800000    # 1.0f

    .line 65
    .line 66
    const/4 v6, 0x0

    .line 67
    const/4 v8, 0x0

    .line 68
    move v7, p4

    .line 69
    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 70
    .line 71
    .line 72
    mul-float/2addr p1, v3

    .line 73
    mul-float/2addr p2, v3

    .line 74
    invoke-static {v5, v2, p1, p2, v3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 75
    .line 76
    .line 77
    iget-object v9, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->texData0:[F

    .line 78
    .line 79
    const/4 v10, 0x0

    .line 80
    const/4 v6, 0x0

    .line 81
    const/4 v8, 0x0

    .line 82
    move-object v7, v5

    .line 83
    move-object v5, p3

    .line 84
    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 85
    .line 86
    .line 87
    aget p1, p3, v2

    .line 88
    .line 89
    const/4 p2, 0x1

    .line 90
    aget p4, p3, p2

    .line 91
    .line 92
    const/4 v0, 0x4

    .line 93
    aget v3, p3, v0

    .line 94
    .line 95
    const/4 v4, 0x5

    .line 96
    aget v5, p3, v4

    .line 97
    .line 98
    const/16 v6, 0x8

    .line 99
    .line 100
    aget v7, p3, v6

    .line 101
    .line 102
    const/16 v8, 0x9

    .line 103
    .line 104
    aget v8, p3, v8

    .line 105
    .line 106
    const/16 v9, 0xc

    .line 107
    .line 108
    aget v9, p3, v9

    .line 109
    .line 110
    const/16 v10, 0xd

    .line 111
    .line 112
    aget p3, p3, v10

    .line 113
    .line 114
    new-array v6, v6, [F

    .line 115
    .line 116
    aput p1, v6, v2

    .line 117
    .line 118
    aput p4, v6, p2

    .line 119
    .line 120
    const/4 p1, 0x2

    .line 121
    aput v3, v6, p1

    .line 122
    .line 123
    const/4 p1, 0x3

    .line 124
    aput v5, v6, p1

    .line 125
    .line 126
    aput v7, v6, v0

    .line 127
    .line 128
    aput v8, v6, v4

    .line 129
    .line 130
    const/4 p1, 0x6

    .line 131
    aput v9, v6, p1

    .line 132
    .line 133
    const/4 p1, 0x7

    .line 134
    aput p3, v6, p1

    .line 135
    .line 136
    iget-object p0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {p0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    monitor-exit v1

    .line 142
    return-void

    .line 143
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    throw p0
.end method

.method public setPosition(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->PositionX:F

    .line 2
    .line 3
    return-void
.end method

.method public setPostWatermark(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->isPost:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageLoader;->setRenderTime(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 9
    .line 10
    new-instance v2, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 11
    .line 12
    iget-object v3, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->context:Landroid/content/Context;

    .line 13
    .line 14
    invoke-direct {v2, v1, v3}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 18
    .line 19
    iget v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerWidth:I

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerHeight:I

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eq v2, v3, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    return-void

    .line 37
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    iput v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerWidth:I

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerHeight:I

    .line 48
    .line 49
    iget-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    int-to-float v1, v1

    .line 56
    iget-object v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    int-to-float v2, v2

    .line 63
    div-float/2addr v1, v2

    .line 64
    iput v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerScale:F

    .line 65
    .line 66
    const/high16 v2, 0x3f000000    # 0.5f

    .line 67
    .line 68
    mul-float v3, v1, v2

    .line 69
    .line 70
    const/high16 v4, -0x41000000    # -0.5f

    .line 71
    .line 72
    mul-float v5, v4, v1

    .line 73
    .line 74
    mul-float v6, v4, v1

    .line 75
    .line 76
    mul-float/2addr v1, v2

    .line 77
    const/16 v7, 0x8

    .line 78
    .line 79
    new-array v8, v7, [F

    .line 80
    .line 81
    const/4 v9, 0x0

    .line 82
    aput v4, v8, v9

    .line 83
    .line 84
    const/4 v10, 0x1

    .line 85
    aput v3, v8, v10

    .line 86
    .line 87
    const/4 v3, 0x2

    .line 88
    aput v4, v8, v3

    .line 89
    .line 90
    const/4 v11, 0x3

    .line 91
    aput v5, v8, v11

    .line 92
    .line 93
    const/4 v5, 0x4

    .line 94
    aput v2, v8, v5

    .line 95
    .line 96
    const/4 v12, 0x5

    .line 97
    aput v6, v8, v12

    .line 98
    .line 99
    const/4 v6, 0x6

    .line 100
    aput v2, v8, v6

    .line 101
    .line 102
    const/4 v13, 0x7

    .line 103
    aput v1, v8, v13

    .line 104
    .line 105
    const/16 v1, 0x20

    .line 106
    .line 107
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 112
    .line 113
    .line 114
    move-result-object v14

    .line 115
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 123
    .line 124
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 125
    .line 126
    .line 127
    iget-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 128
    .line 129
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    iget v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->stickerScale:F

    .line 133
    .line 134
    mul-float v8, v1, v2

    .line 135
    .line 136
    mul-float v14, v4, v1

    .line 137
    .line 138
    mul-float v15, v4, v1

    .line 139
    .line 140
    mul-float/2addr v1, v2

    .line 141
    move/from16 p1, v2

    .line 142
    .line 143
    const/16 v2, 0x10

    .line 144
    .line 145
    new-array v2, v2, [F

    .line 146
    .line 147
    aput v4, v2, v9

    .line 148
    .line 149
    aput v8, v2, v10

    .line 150
    .line 151
    const/4 v8, 0x0

    .line 152
    aput v8, v2, v3

    .line 153
    .line 154
    const/high16 v10, 0x3f800000    # 1.0f

    .line 155
    .line 156
    aput v10, v2, v11

    .line 157
    .line 158
    aput v4, v2, v5

    .line 159
    .line 160
    aput v14, v2, v12

    .line 161
    .line 162
    aput v8, v2, v6

    .line 163
    .line 164
    aput v10, v2, v13

    .line 165
    .line 166
    aput p1, v2, v7

    .line 167
    .line 168
    const/16 v4, 0x9

    .line 169
    .line 170
    aput v15, v2, v4

    .line 171
    .line 172
    const/16 v4, 0xa

    .line 173
    .line 174
    aput v8, v2, v4

    .line 175
    .line 176
    const/16 v4, 0xb

    .line 177
    .line 178
    aput v10, v2, v4

    .line 179
    .line 180
    const/16 v4, 0xc

    .line 181
    .line 182
    aput p1, v2, v4

    .line 183
    .line 184
    const/16 v4, 0xd

    .line 185
    .line 186
    aput v1, v2, v4

    .line 187
    .line 188
    const/16 v1, 0xe

    .line 189
    .line 190
    aput v8, v2, v1

    .line 191
    .line 192
    const/16 v1, 0xf

    .line 193
    .line 194
    aput v10, v2, v1

    .line 195
    .line 196
    iput-object v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->texData0:[F

    .line 197
    .line 198
    iget-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawOrder:[S

    .line 199
    .line 200
    array-length v1, v1

    .line 201
    mul-int/2addr v1, v3

    .line 202
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iput-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 218
    .line 219
    iget-object v2, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawOrder:[S

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 222
    .line 223
    .line 224
    iget-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 225
    .line 226
    invoke-virtual {v1, v9}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 227
    .line 228
    .line 229
    iget-object v1, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mViewMatrix:[F

    .line 230
    .line 231
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 232
    .line 233
    .line 234
    iget-object v0, v0, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->mViewMatrix:[F

    .line 235
    .line 236
    const/high16 v1, -0x40800000    # -1.0f

    .line 237
    .line 238
    aput v1, v0, v9

    .line 239
    .line 240
    return-void
.end method
