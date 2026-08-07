.class public final Ll/dij0;
.super Ll/cij0;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u0007\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\n\u001a\u00020\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000e\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\rJ\u000f\u0010\u0010\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\rR\"\u0010\u0018\u001a\u00020\u00118\u0016@\u0016X\u0096\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\"\u0010\u001f\u001a\u00020\u00198\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010\u0010\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u0016\u0010\"\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008 \u0010!R\u0016\u0010&\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010%R\u0016\u0010(\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010%\u00a8\u0006)"
    }
    d2 = {
        "Ll/dij0;",
        "Ll/cij0;",
        "Ll/ahj0;",
        "transition",
        "<init>",
        "(Ll/ahj0;)V",
        "",
        "textureStart",
        "textureEnd",
        "",
        "z",
        "(II)V",
        "E",
        "()V",
        "D",
        "A",
        "F",
        "",
        "p",
        "Ljava/lang/String;",
        "B",
        "()Ljava/lang/String;",
        "setFragmentShader",
        "(Ljava/lang/String;)V",
        "fragmentShader",
        "",
        "q",
        "getProgress",
        "()F",
        "C",
        "(F)V",
        "progress",
        "r",
        "I",
        "program",
        "Ljava/nio/FloatBuffer;",
        "s",
        "Ljava/nio/FloatBuffer;",
        "vertexCoordsBuffer",
        "t",
        "textureCoordsBuffer",
        "android_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public p:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public q:F

.field public r:I

.field public s:Ljava/nio/FloatBuffer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public t:Ljava/nio/FloatBuffer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ahj0;)V
    .locals 2
    .param p1    # Ll/ahj0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-direct {p0, v0, v0, v1, v0}, Ll/cij0;-><init>(Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ll/ahj0;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "\nprecision mediump float;\n\nuniform sampler2D texture1;\nuniform sampler2D texture2;\n\nuniform float progress;\nuniform float ratio;\n\nvarying vec2 texCoord;\n\nvec4 getFromColor(vec2 uv) {\n  return texture2D(texture1, uv);\n}\n\nvec4 getToColor(vec2 uv) {\n  return texture2D(texture2, uv);\n}\n\nvec4 transition(vec2 uv);\n\nvoid main() {\n  gl_FragColor = transition(texCoord);\n}\n        \n"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/dij0;->p:Ljava/lang/String;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p1}, Ljava/nio/FloatBuffer;->allocate(I)Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/dij0;->s:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-static {p1}, Ljava/nio/FloatBuffer;->allocate(I)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/dij0;->t:Ljava/nio/FloatBuffer;

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/cij0;->g()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/cij0;->g()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v5, 0x0

    .line 13
    iget-object v6, p0, Ll/dij0;->s:Ljava/nio/FloatBuffer;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    const/16 v3, 0x1406

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/cij0;->m()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/cij0;->m()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v6, p0, Ll/dij0;->t:Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public B()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dij0;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dij0;->q:F

    .line 2
    .line 3
    return-void
.end method

.method public final D()V
    .locals 2

    .line 1
    iget v0, p0, Ll/dij0;->r:I

    .line 2
    .line 3
    const-string v1, "vPosition"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cij0;->t(I)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/dij0;->r:I

    .line 13
    .line 14
    const-string v1, "vTextureCoordinate"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cij0;->y(I)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Ll/dij0;->r:I

    .line 24
    .line 25
    const-string v1, "mvpMatrix"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0}, Ll/cij0;->s(I)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Ll/dij0;->r:I

    .line 35
    .line 36
    const-string v1, "flipX"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cij0;->q(I)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Ll/dij0;->r:I

    .line 46
    .line 47
    const-string v1, "flipY"

    .line 48
    .line 49
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cij0;->r(I)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Ll/dij0;->r:I

    .line 57
    .line 58
    const-string v1, "ratio"

    .line 59
    .line 60
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {p0, v0}, Ll/cij0;->v(I)V

    .line 65
    .line 66
    .line 67
    iget v0, p0, Ll/dij0;->r:I

    .line 68
    .line 69
    const-string v1, "texture1"

    .line 70
    .line 71
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p0, v0}, Ll/cij0;->w(I)V

    .line 76
    .line 77
    .line 78
    iget v0, p0, Ll/dij0;->r:I

    .line 79
    .line 80
    const-string v1, "texture2"

    .line 81
    .line 82
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-virtual {p0, v0}, Ll/cij0;->x(I)V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Ll/dij0;->r:I

    .line 90
    .line 91
    const-string v1, "progress"

    .line 92
    .line 93
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p0, v0}, Ll/cij0;->u(I)V

    .line 98
    .line 99
    .line 100
    sget-object v0, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 101
    .line 102
    sget-object v1, Ll/ifj;->a:[F

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ll/ifj;->g([F)Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, p0, Ll/dij0;->s:Ljava/nio/FloatBuffer;

    .line 109
    .line 110
    sget-object v1, Ll/ifj;->b:[F

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/ifj;->g([F)Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Ll/dij0;->t:Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    const/4 v0, 0x1

    .line 119
    invoke-virtual {p0, v0}, Ll/cij0;->p(Z)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/cij0;->e()[F

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    const/4 v0, 0x0

    .line 127
    invoke-static {p0, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final E()V
    .locals 3

    .line 1
    sget-object v0, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cij0;->n()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/dij0;->B()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/ifj;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/dij0;->r:I

    .line 16
    .line 17
    return-void
.end method

.method public final F()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/cij0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/cij0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/cij0;->d()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Ll/cij0;->c()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/cij0;->f()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p0}, Ll/cij0;->e()[F

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-static {v0, v3, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/cij0;->j()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0}, Ll/cij0;->i()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/cij0;->h()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget p0, p0, Ll/dij0;->q:F

    .line 52
    .line 53
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public z(II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "textureStart\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", textureEnd\uff1a"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/bok0;->c(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/ifj;->b()V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Ll/dij0;->r:I

    .line 32
    .line 33
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/dij0;->A()V

    .line 37
    .line 38
    .line 39
    const v0, 0x84c1

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 43
    .line 44
    .line 45
    const/16 v0, 0xde1

    .line 46
    .line 47
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/cij0;->k()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 56
    .line 57
    .line 58
    const p1, 0x84c2

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/cij0;->l()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const/4 p2, 0x2

    .line 72
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/dij0;->F()V

    .line 76
    .line 77
    .line 78
    const/4 p1, 0x4

    .line 79
    const/4 p2, 0x5

    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-static {p2, v1, p1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/cij0;->g()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/cij0;->m()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
