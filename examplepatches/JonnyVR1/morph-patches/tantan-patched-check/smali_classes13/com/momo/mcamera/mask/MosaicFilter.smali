.class public Lcom/momo/mcamera/mask/MosaicFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private final UNIFORM_RATIO:Ljava/lang/String;

.field private final UNIFORM_TILE_SIZE:Ljava/lang/String;

.field fragmentShader:Ljava/lang/String;

.field private handler:Landroid/os/Handler;

.field private volatile isKeepMosaic:Z

.field private mmcvInfo:Ll/omw;

.field private mosaicTriggerAngle:[F

.field private ratioHandle:I

.field private runnable:Ljava/lang/Runnable;

.field private tileSize:F

.field private tileSizeHandle:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "tile_size"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->UNIFORM_TILE_SIZE:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "ratio"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->UNIFORM_RATIO:Ljava/lang/String;

    .line 11
    .line 12
    const/high16 v0, 0x3f000000    # 0.5f

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSize:F

    .line 15
    .line 16
    new-instance v0, Landroid/os/Handler;

    .line 17
    .line 18
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->handler:Landroid/os/Handler;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->isKeepMosaic:Z

    .line 29
    .line 30
    new-instance v0, Lcom/momo/mcamera/mask/MosaicFilter$1;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/MosaicFilter$1;-><init>(Lcom/momo/mcamera/mask/MosaicFilter;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->runnable:Ljava/lang/Runnable;

    .line 36
    .line 37
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate;\n\nuniform sampler2D inputImageTexture;\nuniform float tile_size;\nuniform float ratio;\n\nvoid main()\n{\n   vec2 mos_texCoord;\n   if(tile_size > 0.0) {\n       float factor = 25.0 / tile_size;\n       mos_texCoord = floor(textureCoordinate * vec2(factor * ratio, factor))/vec2(factor * ratio, factor);\n   } else {\n       mos_texCoord = textureCoordinate;\n   }\n   gl_FragColor = texture2D(inputImageTexture, mos_texCoord);\n}"

    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->fragmentShader:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/MosaicFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->isKeepMosaic:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->handler:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->fragmentShader:Ljava/lang/String;

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
    const-string v1, "tile_size"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSizeHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "ratio"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->ratioHandle:I

    .line 23
    .line 24
    return-void
.end method

.method public keepMosaic(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->runnable:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->isKeepMosaic:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->handler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->runnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mmcvInfo:Ll/omw;

    .line 5
    .line 6
    if-eqz v0, :cond_6

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_6

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->isKeepMosaic:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mmcvInfo:Ll/omw;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/nuf;->c()[F

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    aget v0, v0, v2

    .line 33
    .line 34
    iget-object v3, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mosaicTriggerAngle:[F

    .line 35
    .line 36
    const/high16 v4, 0x42b40000    # 90.0f

    .line 37
    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    move v3, v4

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    aget v3, v3, v2

    .line 43
    .line 44
    :goto_0
    iget-object v5, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mmcvInfo:Ll/omw;

    .line 45
    .line 46
    invoke-virtual {v5, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v5}, Ll/nuf;->c()[F

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    aget v5, v5, v1

    .line 55
    .line 56
    iget-object v6, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mosaicTriggerAngle:[F

    .line 57
    .line 58
    if-nez v6, :cond_2

    .line 59
    .line 60
    move v1, v4

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    aget v1, v6, v1

    .line 63
    .line 64
    :goto_1
    iget-object v6, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mmcvInfo:Ll/omw;

    .line 65
    .line 66
    invoke-virtual {v6, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Ll/nuf;->c()[F

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const/4 v6, 0x2

    .line 75
    aget v2, v2, v6

    .line 76
    .line 77
    iget-object v7, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mosaicTriggerAngle:[F

    .line 78
    .line 79
    if-nez v7, :cond_3

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    aget v4, v7, v6

    .line 83
    .line 84
    :goto_2
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    cmpl-float v0, v0, v3

    .line 89
    .line 90
    if-gtz v0, :cond_5

    .line 91
    .line 92
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    cmpl-float v0, v0, v1

    .line 97
    .line 98
    if-gtz v0, :cond_5

    .line 99
    .line 100
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    cmpl-float v0, v0, v4

    .line 105
    .line 106
    if-lez v0, :cond_4

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_4
    iget v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSizeHandle:I

    .line 110
    .line 111
    const/4 v1, 0x0

    .line 112
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 113
    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_5
    :goto_3
    iget v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSizeHandle:I

    .line 117
    .line 118
    iget v1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSize:F

    .line 119
    .line 120
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 121
    .line 122
    .line 123
    goto :goto_5

    .line 124
    :cond_6
    :goto_4
    iget v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSizeHandle:I

    .line 125
    .line 126
    iget v1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSize:F

    .line 127
    .line 128
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 129
    .line 130
    .line 131
    :goto_5
    iget v0, p0, Lcom/momo/mcamera/mask/MosaicFilter;->ratioHandle:I

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    int-to-float v1, v1

    .line 138
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    int-to-float p0, p0

    .line 143
    div-float/2addr v1, p0

    .line 144
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method

.method public setMosaicTriggerAngle([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->mosaicTriggerAngle:[F

    .line 2
    .line 3
    return-void
.end method

.method public setTileSize(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MosaicFilter;->tileSize:F

    .line 2
    .line 3
    return-void
.end method
