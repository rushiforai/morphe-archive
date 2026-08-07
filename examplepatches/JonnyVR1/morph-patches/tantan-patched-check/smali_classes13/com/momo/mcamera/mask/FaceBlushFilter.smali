.class public Lcom/momo/mcamera/mask/FaceBlushFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private bitMapChanged:Z

.field private glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

.field private mImagePath:Ljava/lang/String;

.field private mMmcvInfo:Ll/omw;

.field private maskTexture:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mImagePath:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mMmcvInfo:Ll/omw;

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->bitMapChanged:Z

    .line 13
    .line 14
    new-instance v0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->setDrawType(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 26
    .line 27
    const-string v0, "Normal"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->setBlendType(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private landMark104ToPoint([FFF)[F
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, v0, 0x2

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget v3, p1, v1

    .line 11
    .line 12
    div-float/2addr v3, p2

    .line 13
    aput v3, p0, v1

    .line 14
    .line 15
    add-int/2addr v2, v1

    .line 16
    aget v3, p1, v2

    .line 17
    .line 18
    div-float/2addr v3, p3

    .line 19
    aput v3, p0, v2

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public drawSub()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mMmcvInfo:Ll/omw;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mMmcvInfo:Ll/omw;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/omw;->n()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget v3, p0, Ll/wej;->texture_in:I

    .line 37
    .line 38
    filled-new-array {v3, v2}, [I

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mMmcvInfo:Ll/omw;

    .line 43
    .line 44
    invoke-virtual {v3, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ll/nuf;->r()[F

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    int-to-float v4, v4

    .line 57
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    int-to-float v5, v5

    .line 62
    invoke-direct {p0, v3, v4, v5}, Lcom/momo/mcamera/mask/FaceBlushFilter;->landMark104ToPoint([FFF)[F

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v3}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulation([F)[[F

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 71
    .line 72
    invoke-virtual {v4, v3, v2}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->drawFrame([[F[I)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_2

    .line 78
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    monitor-exit v0

    .line 82
    return-void

    .line 83
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->bitMapChanged:Z

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_2

    .line 17
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mImagePath:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_3

    .line 24
    .line 25
    new-instance v1, Ll/umw;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/umw;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mImagePath:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1, v2}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ll/umw;->a()[B

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/umw;->e()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-lez v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/umw;->c()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-lez v2, :cond_2

    .line 52
    .line 53
    iget v2, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 54
    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-static {v1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    invoke-static {v2, v1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->maskTexture:I

    .line 69
    .line 70
    :cond_2
    :goto_1
    const/4 v1, 0x0

    .line 71
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->bitMapChanged:Z

    .line 72
    .line 73
    :cond_3
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 74
    .line 75
    .line 76
    monitor-exit v0

    .line 77
    return-void

    .line 78
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method

.method public setImagePath(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mImagePath:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->bitMapChanged:Z

    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->glFaceBlendProgram:Lcom/momo/mcamera/mask/GLFaceBlendProgram;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->setIntensity(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceBlushFilter;->mMmcvInfo:Ll/omw;

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method
