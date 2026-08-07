.class public abstract Ll/umj0;
.super Ll/smj0;
.source "SourceFile"


# instance fields
.field protected G:F

.field protected H:F

.field private I:I

.field private J:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/smj0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ffj;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v0, v1, v0

    .line 12
    .line 13
    iput v0, p0, Ll/umj0;->G:F

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    div-float/2addr v1, v0

    .line 21
    iput v1, p0, Ll/umj0;->H:F

    .line 22
    .line 23
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/vej;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    const-string v1, "texelWidthOffset"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/umj0;->I:I

    .line 13
    .line 14
    iget v0, p0, Ll/vej;->d:I

    .line 15
    .line 16
    const-string v1, "texelHeightOffset"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/umj0;->J:I

    .line 23
    .line 24
    return-void
.end method

.method public x()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/smj0;->Q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    div-float/2addr v3, v0

    .line 17
    iput v3, p0, Ll/umj0;->G:F

    .line 18
    .line 19
    iput v2, p0, Ll/umj0;->H:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iput v2, p0, Ll/umj0;->G:F

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    div-float/2addr v3, v0

    .line 30
    iput v3, p0, Ll/umj0;->H:F

    .line 31
    .line 32
    :goto_0
    invoke-super {p0}, Ll/vej;->x()V

    .line 33
    .line 34
    .line 35
    iget v0, p0, Ll/umj0;->I:I

    .line 36
    .line 37
    iget v1, p0, Ll/umj0;->G:F

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Ll/umj0;->J:I

    .line 43
    .line 44
    iget p0, p0, Ll/umj0;->H:F

    .line 45
    .line 46
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
