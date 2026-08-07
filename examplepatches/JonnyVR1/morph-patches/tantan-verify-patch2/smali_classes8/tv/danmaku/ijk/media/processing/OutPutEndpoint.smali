.class public Ltv/danmaku/ijk/media/processing/OutPutEndpoint;
.super Ll/wej;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field private a:Ll/pej;

.field private b:F

.field private c:I


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public drawFrame()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    div-float/2addr v0, v1

    .line 17
    iget v1, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->b:F

    .line 18
    .line 19
    cmpl-float v0, v0, v1

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    iget v2, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->b:F

    .line 30
    .line 31
    mul-float/2addr v0, v2

    .line 32
    float-to-int v0, v0

    .line 33
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sub-int v2, v0, v2

    .line 38
    .line 39
    div-int/lit8 v2, v2, 0x2

    .line 40
    .line 41
    neg-int v2, v2

    .line 42
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {v2, v1, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 62
    .line 63
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/wej;->passShaderValues()V

    .line 86
    .line 87
    .line 88
    const/4 p0, 0x5

    .line 89
    const/4 v0, 0x4

    .line 90
    invoke-static {p0, v1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public initWithGLContext()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->a:Ll/pej;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pej;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->c:I

    .line 8
    .line 9
    mul-int/2addr v0, v1

    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->a:Ll/pej;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/pej;->e()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget v2, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->c:I

    .line 17
    .line 18
    mul-int/2addr v1, v2

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 15
    .line 16
    .line 17
    iget p1, p0, Ll/wej;->curRotation:I

    .line 18
    .line 19
    rem-int/lit8 p1, p1, 0x2

    .line 20
    .line 21
    const/4 p3, 0x1

    .line 22
    if-ne p1, p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    int-to-float p3, p3

    .line 34
    div-float/2addr p1, p3

    .line 35
    iput p1, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->b:F

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p1, p1

    .line 43
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    int-to-float p3, p3

    .line 48
    div-float/2addr p1, p3

    .line 49
    iput p1, p0, Ltv/danmaku/ijk/media/processing/OutPutEndpoint;->b:F

    .line 50
    .line 51
    :goto_0
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
