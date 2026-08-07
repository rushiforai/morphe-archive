.class public Ll/fde0;
.super Ll/qnw;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Ll/m5m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fde0$c;
    }
.end annotation


# instance fields
.field private A:Ll/uow;

.field private B:I

.field private C:I

.field private D:[F

.field private E:Landroid/media/projection/MediaProjection;

.field private F:Z

.field private G:Landroid/media/projection/MediaProjection$Callback;

.field private v:Landroid/hardware/display/VirtualDisplay;

.field private x:Landroid/view/Surface;

.field private y:Ll/g510;

.field private z:Ll/fde0$c;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qnw;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Ll/fde0;->B:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/fde0;->C:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/fde0;->F:Z

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    fill-array-data v0, :array_0

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/fde0;->D:[F

    .line 21
    .line 22
    new-instance v0, Ll/fde0$a;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/fde0$a;-><init>(Ll/fde0;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/fde0;->G:Landroid/media/projection/MediaProjection$Callback;

    .line 28
    .line 29
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic Q1(Ll/fde0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fde0;->V1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R1(Ll/fde0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/fde0;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S1(Ll/fde0;)Ll/g510;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fde0;->y:Ll/g510;

    .line 2
    .line 3
    return-object p0
.end method

.method private T1()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/fde0;->A:Ll/uow;

    .line 2
    .line 3
    iget-object v1, v0, Ll/uow;->V0:[I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget v3, v1, v2

    .line 7
    .line 8
    const/4 v4, 0x2

    .line 9
    aget v5, v1, v4

    .line 10
    .line 11
    const/4 v6, 0x3

    .line 12
    aget v7, v1, v6

    .line 13
    .line 14
    const/4 v8, 0x4

    .line 15
    aget v1, v1, v8

    .line 16
    .line 17
    add-int v9, v3, v7

    .line 18
    .line 19
    add-int v10, v5, v1

    .line 20
    .line 21
    iget v11, v0, Ll/uow;->y0:I

    .line 22
    .line 23
    if-le v9, v11, :cond_0

    .line 24
    .line 25
    move v9, v11

    .line 26
    :cond_0
    iget v0, v0, Ll/uow;->z0:I

    .line 27
    .line 28
    if-le v10, v0, :cond_1

    .line 29
    .line 30
    move v10, v0

    .line 31
    :cond_1
    int-to-float v3, v3

    .line 32
    int-to-float v12, v11

    .line 33
    div-float/2addr v3, v12

    .line 34
    const/4 v12, 0x0

    .line 35
    add-float/2addr v3, v12

    .line 36
    int-to-float v9, v9

    .line 37
    int-to-float v11, v11

    .line 38
    div-float/2addr v9, v11

    .line 39
    int-to-float v10, v10

    .line 40
    int-to-float v11, v0

    .line 41
    div-float/2addr v10, v11

    .line 42
    int-to-float v5, v5

    .line 43
    int-to-float v0, v0

    .line 44
    div-float/2addr v5, v0

    .line 45
    add-float/2addr v5, v12

    .line 46
    const/16 v0, 0x8

    .line 47
    .line 48
    new-array v0, v0, [F

    .line 49
    .line 50
    const/4 v11, 0x0

    .line 51
    aput v3, v0, v11

    .line 52
    .line 53
    aput v10, v0, v2

    .line 54
    .line 55
    aput v9, v0, v4

    .line 56
    .line 57
    aput v10, v0, v6

    .line 58
    .line 59
    aput v3, v0, v8

    .line 60
    .line 61
    const/4 v2, 0x5

    .line 62
    aput v5, v0, v2

    .line 63
    .line 64
    const/4 v2, 0x6

    .line 65
    aput v9, v0, v2

    .line 66
    .line 67
    const/4 v2, 0x7

    .line 68
    aput v5, v0, v2

    .line 69
    .line 70
    iput-object v0, p0, Ll/fde0;->D:[F

    .line 71
    .line 72
    iget-object v2, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    array-length v0, v0

    .line 75
    mul-int/2addr v0, v8

    .line 76
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    aput-object v0, v2, v11

    .line 93
    .line 94
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    aget-object v0, v0, v11

    .line 97
    .line 98
    iget-object v2, p0, Ll/fde0;->D:[F

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 105
    .line 106
    .line 107
    iput v7, p0, Ll/wej;->width:I

    .line 108
    .line 109
    iput v1, p0, Ll/wej;->height:I

    .line 110
    .line 111
    return-void
.end method

.method private U1(II)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x22
    .end annotation

    .line 1
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 2
    .line 3
    const-string v1, "Handling configuration change: "

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "x"

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v2, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 47
    .line 48
    .line 49
    :cond_1
    new-instance v1, Landroid/view/Surface;

    .line 50
    .line 51
    iget-object v2, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 57
    .line 58
    iget-object v1, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-virtual {v1, p1, p2, v2}, Landroid/hardware/display/VirtualDisplay;->resize(III)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 67
    .line 68
    iget-object v2, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/qnw;->setRenderSize(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :goto_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance p2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v1, "Failed to handle configuration change: "

    .line 84
    .line 85
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p1, v0, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private V1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "MediaProjection stopped, cleaning up resources"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/fde0;->F:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/fde0$c;->a()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 47
    .line 48
    :cond_2
    iput-object v1, p0, Ll/fde0;->E:Landroid/media/projection/MediaProjection;

    .line 49
    .line 50
    return-void
.end method

.method private getScreenTexture()Landroid/graphics/SurfaceTexture;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 10
    .line 11
    .line 12
    aget v0, v1, v2

    .line 13
    .line 14
    const v3, 0x8d65

    .line 15
    .line 16
    .line 17
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x2801

    .line 21
    .line 22
    const v4, 0x46180400    # 9729.0f

    .line 23
    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2800

    .line 29
    .line 30
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x2802

    .line 34
    .line 35
    const v4, 0x812f

    .line 36
    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 39
    .line 40
    .line 41
    const/16 v0, 0x2803

    .line 42
    .line 43
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    .line 45
    .line 46
    aget v0, v1, v2

    .line 47
    .line 48
    iput v0, p0, Ll/wej;->texture_in:I

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 51
    .line 52
    iget v1, p0, Ll/wej;->texture_in:I

    .line 53
    .line 54
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    return-object p0
.end method


# virtual methods
.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fde0;->y:Ll/g510;

    .line 2
    .line 3
    return-void
.end method

.method public P1()V
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "stopScreenRecord"

    .line 9
    .line 10
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/fde0;->F:Z

    .line 17
    .line 18
    iget-object v0, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/fde0$c;->a()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Ll/fde0;->E:Landroid/media/projection/MediaProjection;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    iget-object v3, p0, Ll/fde0;->G:Landroid/media/projection/MediaProjection$Callback;

    .line 56
    .line 57
    if-eqz v3, :cond_4

    .line 58
    .line 59
    :try_start_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 60
    .line 61
    const/16 v5, 0x22

    .line 62
    .line 63
    if-lt v4, v5, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Landroid/media/projection/MediaProjection;->unregisterCallback(Landroid/media/projection/MediaProjection$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catch_0
    move-exception v0

    .line 70
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    new-instance v4, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v5, "Failed to unregister MediaProjection callback: "

    .line 77
    .line 78
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v3, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_0
    iput-object v1, p0, Ll/fde0;->E:Landroid/media/projection/MediaProjection;

    .line 96
    .line 97
    :cond_4
    return-void
.end method

.method public U0(Ll/uow;Landroid/media/projection/MediaProjection;)V
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    iget-boolean v3, p0, Ll/fde0;->F:Z

    .line 6
    .line 7
    if-nez v3, :cond_2

    .line 8
    .line 9
    iput-object p1, p0, Ll/fde0;->A:Ll/uow;

    .line 10
    .line 11
    iput-object p2, p0, Ll/fde0;->E:Landroid/media/projection/MediaProjection;

    .line 12
    .line 13
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v3, 0x22

    .line 16
    .line 17
    if-lt p1, v3, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/fde0;->G:Landroid/media/projection/MediaProjection$Callback;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, p1, v2}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Ll/fde0;->F:Z

    .line 31
    .line 32
    invoke-virtual {p0, v1, p2}, Ll/fde0;->W1(ILandroid/media/projection/MediaProjection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    new-instance p1, Ll/fde0$c;

    .line 40
    .line 41
    const-string p2, "live-media-SInput"

    .line 42
    .line 43
    invoke-direct {p1, p0, p2}, Ll/fde0$c;-><init>(Ll/fde0;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Ll/fde0;->y:Ll/g510;

    .line 52
    .line 53
    invoke-virtual {p0, v2}, Ll/g510;->z(Ll/omw;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    :try_start_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string p2, "Cannot reuse MediaProjection - active session exists"

    .line 62
    .line 63
    invoke-virtual {p1, v0, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 67
    .line 68
    const-string p2, "MediaProjection is already in use. For Android 14+, each MediaProjection can only be used once."

    .line 69
    .line 70
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 74
    :goto_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v4, "Failed to start screen record: "

    .line 81
    .line 82
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {p2, v0, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 100
    .line 101
    .line 102
    iput-boolean v1, p0, Ll/fde0;->F:Z

    .line 103
    .line 104
    iput-object v2, p0, Ll/fde0;->E:Landroid/media/projection/MediaProjection;

    .line 105
    .line 106
    throw p1
.end method

.method public W1(ILandroid/media/projection/MediaProjection;)V
    .locals 18
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "VirtualDisplay created successfully: "

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    monitor-enter v3

    .line 12
    :try_start_0
    iget-object v4, v1, Ll/fde0;->A:Ll/uow;

    .line 13
    .line 14
    iget v5, v4, Ll/uow;->y0:I

    .line 15
    .line 16
    iget v4, v4, Ll/uow;->z0:I

    .line 17
    .line 18
    const/16 v6, 0x10e

    .line 19
    .line 20
    const/16 v7, 0x5a

    .line 21
    .line 22
    if-eq v0, v7, :cond_1

    .line 23
    .line 24
    if-ne v0, v6, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v11, v4

    .line 28
    move v10, v5

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    move v10, v4

    .line 31
    move v11, v5

    .line 32
    :goto_1
    iget-object v4, v1, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 33
    .line 34
    const/16 v5, 0x22

    .line 35
    .line 36
    const/4 v8, 0x0

    .line 37
    if-eqz v4, :cond_3

    .line 38
    .line 39
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 40
    .line 41
    if-lt v9, v5, :cond_2

    .line 42
    .line 43
    invoke-direct {v1, v10, v11}, Ll/fde0;->U1(II)V

    .line 44
    .line 45
    .line 46
    monitor-exit v3

    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_2
    invoke-virtual {v4, v8}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 52
    .line 53
    .line 54
    iget-object v4, v1, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 55
    .line 56
    invoke-virtual {v4}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 57
    .line 58
    .line 59
    iput-object v8, v1, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 60
    .line 61
    :cond_3
    iget-object v4, v1, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 62
    .line 63
    if-nez v4, :cond_4

    .line 64
    .line 65
    invoke-direct {v1}, Ll/fde0;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iput-object v4, v1, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    new-instance v4, Landroid/view/Surface;

    .line 72
    .line 73
    iget-object v9, v1, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 74
    .line 75
    invoke-direct {v4, v9}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 76
    .line 77
    .line 78
    iput-object v4, v1, Ll/fde0;->x:Landroid/view/Surface;

    .line 79
    .line 80
    :cond_4
    iget-object v4, v1, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 81
    .line 82
    invoke-virtual {v4, v10, v11}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 83
    .line 84
    .line 85
    iget-object v4, v1, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 86
    .line 87
    invoke-virtual {v4, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .line 89
    .line 90
    :try_start_1
    const-string v9, "MainScreen"

    .line 91
    .line 92
    iget-object v14, v1, Ll/fde0;->x:Landroid/view/Surface;

    .line 93
    .line 94
    const/4 v15, 0x0

    .line 95
    const/16 v16, 0x0

    .line 96
    .line 97
    const/4 v12, 0x1

    .line 98
    const/16 v13, 0x13

    .line 99
    .line 100
    move-object v4, v8

    .line 101
    move-object/from16 v8, p2

    .line 102
    .line 103
    invoke-virtual/range {v8 .. v16}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    iput-object v9, v1, Ll/fde0;->v:Landroid/hardware/display/VirtualDisplay;

    .line 108
    .line 109
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    const-string v9, "Pipeline_Normal_pip->PIPLINE"

    .line 114
    .line 115
    new-instance v12, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v12, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v2, "x"

    .line 124
    .line 125
    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v8, v9, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    .line 137
    .line 138
    :try_start_2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 139
    .line 140
    if-ge v2, v5, :cond_5

    .line 141
    .line 142
    new-instance v2, Ll/fde0$b;

    .line 143
    .line 144
    invoke-direct {v2, v1}, Ll/fde0$b;-><init>(Ll/fde0;)V

    .line 145
    .line 146
    .line 147
    move-object/from16 v8, p2

    .line 148
    .line 149
    invoke-virtual {v8, v2, v4}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 150
    .line 151
    .line 152
    :cond_5
    if-eq v0, v7, :cond_7

    .line 153
    .line 154
    if-ne v0, v6, :cond_6

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_6
    const/4 v2, 0x0

    .line 158
    invoke-virtual {v1, v2}, Ll/qnw;->changeCurRotation(I)V

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    :goto_2
    invoke-virtual/range {p0 .. p1}, Ll/qnw;->changeCurRotation(I)V

    .line 163
    .line 164
    .line 165
    :goto_3
    invoke-virtual {v1, v10, v11}, Ll/qnw;->setRenderSize(II)V

    .line 166
    .line 167
    .line 168
    const/4 v0, 0x2

    .line 169
    invoke-virtual {v1, v0}, Ll/qnw;->flipPosition(I)V

    .line 170
    .line 171
    .line 172
    const/4 v0, 0x1

    .line 173
    invoke-virtual {v1, v0}, Ll/qnw;->flipPosition(I)V

    .line 174
    .line 175
    .line 176
    iget-object v2, v1, Ll/fde0;->A:Ll/uow;

    .line 177
    .line 178
    iget-object v2, v2, Ll/uow;->V0:[I

    .line 179
    .line 180
    if-eqz v2, :cond_8

    .line 181
    .line 182
    const/16 v17, 0x0

    .line 183
    .line 184
    aget v2, v2, v17

    .line 185
    .line 186
    if-ne v2, v0, :cond_8

    .line 187
    .line 188
    invoke-direct {v1}, Ll/fde0;->T1()V

    .line 189
    .line 190
    .line 191
    :cond_8
    monitor-exit v3

    .line 192
    return-void

    .line 193
    :catch_0
    move-exception v0

    .line 194
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 199
    .line 200
    const-string v5, "SecurityException: MediaProjection cannot be reused for Android 14+"

    .line 201
    .line 202
    invoke-virtual {v2, v4, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    const/4 v2, 0x0

    .line 206
    iput-boolean v2, v1, Ll/fde0;->F:Z

    .line 207
    .line 208
    throw v0

    .line 209
    :goto_4
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 210
    throw v0
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/qnw;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fde0;->P1()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/fde0$c;->a()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/fde0;->z:Ll/fde0$c;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ll/fde0;->x:Landroid/view/Surface;

    .line 25
    .line 26
    :cond_1
    iput-object v1, p0, Ll/fde0;->G:Landroid/media/projection/MediaProjection$Callback;

    .line 27
    .line 28
    return-void
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public onDrawFrame()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "onDrawFrame"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/wej;->texture_in:I

    .line 13
    .line 14
    iget-object v1, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v0, "onFrameAvailable"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fde0;->B:I

    .line 2
    .line 3
    return-void
.end method
