.class public Lcom/tencent/liteav/beauty/b/y;
.super Lcom/tencent/liteav/b/a;
.source "SourceFile"


# static fields
.field private static x:Ljava/lang/String; = "varying lowp vec2 textureCoordinate;\n   \n  uniform sampler2D inputImageTexture;\n  uniform mediump float alphaBlend;\n  \n  void main()\n  {\n      mediump vec4 color = texture2D(inputImageTexture, textureCoordinate);\n       if (0.0 == color.a){\n            gl_FragColor = color;\n       }else{\n            gl_FragColor = vec4(color.rgb, alphaBlend);\n       } \n  }\n"

.field private static z:Ljava/lang/String; = "AlphaTexture"


# instance fields
.field private A:Z

.field private y:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/b/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/y;->y:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b/y;->A:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/y;->y:I

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tencent/liteav/beauty/b/y;->z:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "onInit failed!"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 17
    .line 18
    const-string v1, "alphaBlend"

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/tencent/liteav/beauty/b/y;->y:I

    .line 25
    .line 26
    const/high16 v0, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/b/y;->a(F)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/y;->A:Z

    .line 2
    .line 3
    return-void
.end method

.method public j()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    const/16 v0, 0xbe2

    .line 10
    .line 11
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 12
    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/tencent/liteav/beauty/b/y;->A:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne v2, v1, :cond_0

    .line 18
    .line 19
    const/16 v1, 0x305

    .line 20
    .line 21
    const/16 v2, 0x304

    .line 22
    .line 23
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/16 v1, 0x302

    .line 28
    .line 29
    const/16 v2, 0x303

    .line 30
    .line 31
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const v1, 0x84c0

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    move v2, v1

    .line 42
    :goto_1
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 43
    .line 44
    array-length v4, v3

    .line 45
    if-ge v2, v4, :cond_2

    .line 46
    .line 47
    aget-object v3, v3, v2

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    iget-object v3, v3, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 52
    .line 53
    aget v3, v3, v1

    .line 54
    .line 55
    const/16 v4, 0xde1

    .line 56
    .line 57
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 58
    .line 59
    .line 60
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->c:I

    .line 61
    .line 62
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 63
    .line 64
    .line 65
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 66
    .line 67
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 68
    .line 69
    aget-object v3, v3, v2

    .line 70
    .line 71
    iget-object v9, v3, Lcom/tencent/liteav/beauty/b/z$a;->a:Ljava/nio/FloatBuffer;

    .line 72
    .line 73
    const/4 v5, 0x2

    .line 74
    const/16 v6, 0x1406

    .line 75
    .line 76
    const/4 v7, 0x0

    .line 77
    const/16 v8, 0x8

    .line 78
    .line 79
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 80
    .line 81
    .line 82
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 83
    .line 84
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 85
    .line 86
    .line 87
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 88
    .line 89
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 90
    .line 91
    aget-object v3, v3, v2

    .line 92
    .line 93
    iget-object v9, v3, Lcom/tencent/liteav/beauty/b/z$a;->b:Ljava/nio/FloatBuffer;

    .line 94
    .line 95
    const/4 v5, 0x4

    .line 96
    const/16 v8, 0x10

    .line 97
    .line 98
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 99
    .line 100
    .line 101
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 102
    .line 103
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 104
    .line 105
    .line 106
    sget-object v3, Lcom/tencent/liteav/beauty/b/z;->v:[S

    .line 107
    .line 108
    array-length v3, v3

    .line 109
    const/16 v4, 0x1403

    .line 110
    .line 111
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/z;->w:Ljava/nio/ShortBuffer;

    .line 112
    .line 113
    const/4 v6, 0x4

    .line 114
    invoke-static {v6, v3, v4, v5}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 115
    .line 116
    .line 117
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 118
    .line 119
    invoke-static {v3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 120
    .line 121
    .line 122
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 123
    .line 124
    invoke-static {v3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 125
    .line 126
    .line 127
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_2
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 131
    .line 132
    .line 133
    :cond_3
    return-void
.end method
