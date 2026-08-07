.class public Ll/lce;
.super Ll/hfj;
.source "SourceFile"


# instance fields
.field private D:I

.field private E:Ll/mej;

.field private F:[F

.field private G:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/hfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    iput v0, p0, Ll/lce;->D:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/lce;->E:Ll/mej;

    .line 10
    .line 11
    iput-object v0, p0, Ll/lce;->F:[F

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Ll/lce;->G:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/xej;->i:Z

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public F()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    const/16 v0, 0x4100

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/xej;->d:I

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/lce;->w()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x5

    .line 46
    const/4 v0, 0x4

    .line 47
    invoke-static {p0, v2, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public O(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/xej;->a:I

    .line 3
    .line 4
    div-int/lit8 p1, p1, 0x5a

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/xej;->x(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lce;->D:I

    .line 2
    .line 3
    return-void
.end method

.method public Q([F)V
    .locals 0

    .line 1
    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, [F

    .line 6
    .line 7
    iput-object p1, p0, Ll/lce;->F:[F

    .line 8
    .line 9
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nuniform mat4 u_Matrix;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n   vec4 texPos = u_Matrix * vec4(inputTextureCoordinate, 1, 1);\n   textureCoordinate = texPos.xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/xej;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/xej;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/xej;->w()V

    .line 2
    .line 3
    .line 4
    const v0, 0x84c0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 8
    .line 9
    .line 10
    const v0, 0x8d65

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    iget v2, p0, Ll/lce;->D:I

    .line 18
    .line 19
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/lce;->F:[F

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget v0, p0, Ll/lce;->G:I

    .line 27
    .line 28
    if-gez v0, :cond_0

    .line 29
    .line 30
    iget v0, p0, Ll/xej;->d:I

    .line 31
    .line 32
    const-string v2, "u_Matrix"

    .line 33
    .line 34
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Ll/lce;->G:I

    .line 39
    .line 40
    :cond_0
    iget v0, p0, Ll/lce;->G:I

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    iget-object p0, p0, Ll/lce;->F:[F

    .line 44
    .line 45
    invoke-static {v0, v2, v1, p0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
