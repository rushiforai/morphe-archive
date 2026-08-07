.class public Ll/pq70;
.super Ll/kt2;
.source "SourceFile"


# instance fields
.field private D:I

.field private E:I

.field private F:I

.field private G:F

.field private H:F

.field private I:I


# direct methods
.method public constructor <init>(FF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/pq70;->I:I

    .line 6
    .line 7
    iput p1, p0, Ll/pq70;->G:F

    .line 8
    .line 9
    iput p2, p0, Ll/pq70;->H:F

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public O(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/pq70;->I:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x1

    .line 8
    iput p1, p0, Ll/pq70;->I:I

    .line 9
    .line 10
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_FractionalWidth;\nuniform float u_AspectRatio;\nuniform int u_Normal;\nvoid main(){\n   highp vec2 sampleDivisor = vec2(u_FractionalWidth, u_FractionalWidth / u_AspectRatio);\n   highp vec2 samplePos = textureCoordinate - mod(textureCoordinate, sampleDivisor) + 0.5 * sampleDivisor;\n     if (u_Normal == 0) {   gl_FragColor = texture2D(inputImageTexture0, samplePos);\n     } else {\n   gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n     }\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/xej;->t()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xej;->d:I

    .line 5
    .line 6
    const-string v1, "u_FractionalWidth"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/pq70;->D:I

    .line 13
    .line 14
    iget v0, p0, Ll/xej;->d:I

    .line 15
    .line 16
    const-string v1, "u_AspectRatio"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/pq70;->E:I

    .line 23
    .line 24
    iget v0, p0, Ll/xej;->d:I

    .line 25
    .line 26
    const-string v1, "u_Normal"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/pq70;->F:I

    .line 33
    .line 34
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/xej;->w()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/pq70;->D:I

    .line 5
    .line 6
    iget v1, p0, Ll/pq70;->G:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/pq70;->E:I

    .line 12
    .line 13
    iget v1, p0, Ll/pq70;->H:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/pq70;->F:I

    .line 19
    .line 20
    iget p0, p0, Ll/pq70;->I:I

    .line 21
    .line 22
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
