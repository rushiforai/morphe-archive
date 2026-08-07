.class public final Lcom/momo/xeengine/egl/GLFrameBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final currentFBO:[I

.field private final depthRenderBuffer:[I

.field private final frameBuffer:[I

.field private mHeight:I

.field private mWidth:I

.field private final texture_out:[I

.field private useDepthBuffer:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 36
    invoke-direct {p0, v0}, Lcom/momo/xeengine/egl/GLFrameBuffer;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v1, v0, [I

    .line 6
    .line 7
    iput-object v1, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 8
    .line 9
    new-array v2, v0, [I

    .line 10
    .line 11
    iput-object v2, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 12
    .line 13
    new-array v3, v0, [I

    .line 14
    .line 15
    iput-object v3, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 16
    .line 17
    new-array v0, v0, [I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->currentFBO:[I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mWidth:I

    .line 23
    .line 24
    iput v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mHeight:I

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->useDepthBuffer:Z

    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    aput p0, v1, v0

    .line 30
    .line 31
    aput p0, v2, v0

    .line 32
    .line 33
    aput p0, v3, v0

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public bind()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->currentFBO:[I

    .line 2
    .line 3
    const v1, 0x8ca6

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 11
    .line 12
    aget p0, p0, v2

    .line 13
    .line 14
    const v0, 0x8d40

    .line 15
    .line 16
    .line 17
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public getColorTexture()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    const/4 v3, -0x1

    .line 7
    const/4 v4, 0x1

    .line 8
    if-lez v2, :cond_0

    .line 9
    .line 10
    invoke-static {v4, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 14
    .line 15
    aput v3, v0, v1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 18
    .line 19
    aget v2, v0, v1

    .line 20
    .line 21
    if-lez v2, :cond_1

    .line 22
    .line 23
    invoke-static {v4, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 27
    .line 28
    aput v3, v0, v1

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 31
    .line 32
    aget v2, v0, v1

    .line 33
    .line 34
    if-lez v2, :cond_2

    .line 35
    .line 36
    invoke-static {v4, v0, v1}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 40
    .line 41
    aput v3, p0, v1

    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public resize(II)V
    .locals 14

    .line 1
    move/from16 v4, p2

    .line 2
    .line 3
    iget v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mWidth:I

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mHeight:I

    .line 8
    .line 9
    if-ne v0, v4, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/momo/xeengine/egl/GLFrameBuffer;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v9, 0x1

    .line 16
    new-array v10, v9, [I

    .line 17
    .line 18
    const v0, 0x8ca6

    .line 19
    .line 20
    .line 21
    const/4 v11, 0x0

    .line 22
    invoke-static {v0, v10, v11}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 26
    .line 27
    invoke-static {v9, v0, v11}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 31
    .line 32
    invoke-static {v9, v0, v11}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->frameBuffer:[I

    .line 36
    .line 37
    aget v0, v0, v11

    .line 38
    .line 39
    const v12, 0x8d40

    .line 40
    .line 41
    .line 42
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 43
    .line 44
    .line 45
    const v0, 0x84c0

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 52
    .line 53
    aget v0, v0, v11

    .line 54
    .line 55
    const/16 v13, 0xde1

    .line 56
    .line 57
    invoke-static {v13, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 58
    .line 59
    .line 60
    const/16 v7, 0x1401

    .line 61
    .line 62
    const/4 v8, 0x0

    .line 63
    const/16 v0, 0xde1

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    const/16 v2, 0x1908

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    const/16 v6, 0x1908

    .line 70
    .line 71
    move v3, p1

    .line 72
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    const/16 v0, 0x2802

    .line 76
    .line 77
    const v1, 0x812f

    .line 78
    .line 79
    .line 80
    invoke-static {v13, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 81
    .line 82
    .line 83
    const/16 v0, 0x2803

    .line 84
    .line 85
    invoke-static {v13, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 86
    .line 87
    .line 88
    const/16 v0, 0x2800

    .line 89
    .line 90
    const/16 v1, 0x2601

    .line 91
    .line 92
    invoke-static {v13, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 93
    .line 94
    .line 95
    const/16 v0, 0x2801

    .line 96
    .line 97
    invoke-static {v13, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->texture_out:[I

    .line 101
    .line 102
    aget v0, v0, v11

    .line 103
    .line 104
    const v1, 0x8ce0

    .line 105
    .line 106
    .line 107
    invoke-static {v12, v1, v13, v0, v11}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 108
    .line 109
    .line 110
    iget-boolean v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->useDepthBuffer:Z

    .line 111
    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 115
    .line 116
    invoke-static {v9, v0, v11}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 120
    .line 121
    aget v0, v0, v11

    .line 122
    .line 123
    const v1, 0x8d41

    .line 124
    .line 125
    .line 126
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 127
    .line 128
    .line 129
    const v0, 0x81a5

    .line 130
    .line 131
    .line 132
    invoke-static {v1, v0, p1, v4}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->depthRenderBuffer:[I

    .line 136
    .line 137
    aget v0, v0, v11

    .line 138
    .line 139
    const v2, 0x8d00

    .line 140
    .line 141
    .line 142
    invoke-static {v12, v2, v1, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 143
    .line 144
    .line 145
    :cond_1
    aget v0, v10, v11

    .line 146
    .line 147
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 148
    .line 149
    .line 150
    iput p1, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mWidth:I

    .line 151
    .line 152
    iput v4, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->mHeight:I

    .line 153
    .line 154
    return-void
.end method

.method public unbind()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/egl/GLFrameBuffer;->currentFBO:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    const v0, 0x8d40

    .line 7
    .line 8
    .line 9
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
