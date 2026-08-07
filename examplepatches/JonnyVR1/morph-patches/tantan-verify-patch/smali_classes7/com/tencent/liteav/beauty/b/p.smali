.class public Lcom/tencent/liteav/beauty/b/p;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# static fields
.field private static C:[F

.field private static D:[F

.field private static E:[F


# instance fields
.field private A:Ljava/lang/String;

.field private B:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lcom/tencent/liteav/beauty/b/p;->C:[F

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/tencent/liteav/beauty/b/p;->D:[F

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    new-array v0, v0, [F

    .line 19
    .line 20
    fill-array-data v0, :array_2

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/tencent/liteav/beauty/b/p;->E:[F

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :array_0
    .array-data 4
        0x3e3afb7f    # 0.1826f
        0x3f1d3c36    # 0.6142f
        0x3d7df3b6    # 0.062f
        -0x4231f8a1    # -0.1006f
        -0x4152a305    # -0.3386f
        0x3ee0ded3    # 0.4392f
        0x3ee0ded3    # 0.4392f
        -0x4133c361    # -0.3989f
        -0x42daee63    # -0.0403f
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    :array_1
    .array-data 4
        0x3e837d63    # 0.256816f
        0x3f01103d
        0x3dc886fa
        -0x41e83233
        -0x416aff6d    # -0.29102f
        0x3ee0e779
        0x3ee0e821
        -0x4143ab65
        -0x426db1ea    # -0.071438f
    .end array-data

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_2
    .array-data 4
        0x3d800000    # 0.0625f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->r:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->s:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->t:I

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->u:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->v:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->w:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->x:I

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->y:I

    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->z:I

    .line 26
    .line 27
    const-string v0, "RGBA2I420Filter"

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    .line 30
    .line 31
    iput p1, p0, Lcom/tencent/liteav/beauty/b/p;->B:I

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 3

    if-lez p1, :cond_2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    if-ne v0, p2, :cond_1

    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    if-ne v0, p1, :cond_1

    return-void

    .line 118
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 119
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RGBA2I420Filter width "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " height "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget v0, p0, Lcom/tencent/liteav/beauty/b/p;->r:I

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 121
    iget p1, p0, Lcom/tencent/liteav/beauty/b/p;->s:I

    int-to-float p2, p2

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void

    .line 122
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    const-string p1, "width or height is error!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a()Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/p;->B:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v2, v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "RGB-->I420 init!"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v3, 0x3

    .line 26
    if-ne v3, v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "RGB-->NV21 init!"

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 36
    .line 37
    .line 38
    const/16 v0, 0xb

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/p;->A:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v4, 0x2

    .line 50
    if-ne v4, v0, :cond_2

    .line 51
    .line 52
    const-string v0, "RGBA Format init!"

    .line 53
    .line 54
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0

    .line 62
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v4, "don\'t support format "

    .line 65
    .line 66
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget v4, p0, Lcom/tencent/liteav/beauty/b/p;->B:I

    .line 70
    .line 71
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v4, " use default I420"

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 94
    .line 95
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/p;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    iput-boolean v2, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    const/4 v0, 0x0

    .line 109
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 110
    .line 111
    :goto_1
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/p;->c()V

    .line 112
    .line 113
    .line 114
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 115
    .line 116
    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 5
    .line 6
    const-string v1, "width"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->r:I

    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 15
    .line 16
    const-string v1, "height"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/tencent/liteav/beauty/b/p;->s:I

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
