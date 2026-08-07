.class public abstract Ll/rmj0;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private currentPass:I

.field protected glFrameBufferFirst:Ll/lej;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public drawFrame()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/rmj0;->currentPass:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/rmj0;->initFBO()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/rmj0;->initFBO()V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    aget v0, v0, v1

    .line 56
    .line 57
    const v2, 0x8d40

    .line 58
    .line 59
    .line 60
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 61
    .line 62
    .line 63
    iget v0, p0, Ll/wej;->texture_in:I

    .line 64
    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    :cond_2
    return-void

    .line 68
    :cond_3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-static {v1, v1, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 77
    .line 78
    .line 79
    iget v0, p0, Ll/wej;->programHandle:I

    .line 80
    .line 81
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 82
    .line 83
    .line 84
    const/16 v0, 0x4100

    .line 85
    .line 86
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/wej;->passShaderValues()V

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x5

    .line 112
    const/4 v3, 0x4

    .line 113
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/lej;->i()[I

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    aget v0, v0, v1

    .line 123
    .line 124
    iput v0, p0, Ll/wej;->texture_in:I

    .line 125
    .line 126
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 127
    .line 128
    .line 129
    const/4 v0, 0x2

    .line 130
    iput v0, p0, Ll/rmj0;->currentPass:I

    .line 131
    .line 132
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public getCurrentPass()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rmj0;->currentPass:I

    .line 2
    .line 3
    return p0
.end method

.method public initFBO()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->initFBO()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance v0, Ll/lej;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/rmj0;->glFrameBufferFirst:Ll/lej;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 35
    .line 36
    .line 37
    const v0, 0x8d40

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const v1, 0x8cd5

    .line 45
    .line 46
    .line 47
    if-ne v0, v1, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
