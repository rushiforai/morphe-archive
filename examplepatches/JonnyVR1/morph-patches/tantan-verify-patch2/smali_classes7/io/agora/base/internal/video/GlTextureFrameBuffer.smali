.class public Lio/agora/base/internal/video/GlTextureFrameBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private frameBufferId:I

.field private height:I

.field private final pixelFormat:I

.field private textureId:I

.field private width:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x881a

    .line 5
    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "Invalid pixel format: "

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    throw p0

    .line 19
    :cond_0
    :pswitch_0
    iput p1, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->pixelFormat:I

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 23
    .line 24
    iput p1, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_data_0
    .packed-switch 0x1907
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public bindTexture(IIIIZ)V
    .locals 0

    .line 1
    if-nez p5, :cond_0

    .line 2
    .line 3
    iget p5, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 4
    .line 5
    if-ne p3, p5, :cond_0

    .line 6
    .line 7
    iget p5, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 8
    .line 9
    if-ne p4, p5, :cond_0

    .line 10
    .line 11
    iget p5, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 12
    .line 13
    if-ne p5, p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput p1, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 17
    .line 18
    iput p3, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 19
    .line 20
    iput p4, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 21
    .line 22
    iget p3, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 23
    .line 24
    const/4 p4, 0x0

    .line 25
    if-nez p3, :cond_1

    .line 26
    .line 27
    const/4 p3, 0x1

    .line 28
    new-array p5, p3, [I

    .line 29
    .line 30
    invoke-static {p3, p5, p4}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 31
    .line 32
    .line 33
    aget p3, p5, p4

    .line 34
    .line 35
    iput p3, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 36
    .line 37
    :cond_1
    iget p0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 38
    .line 39
    const p3, 0x8d40

    .line 40
    .line 41
    .line 42
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 43
    .line 44
    .line 45
    const p0, 0x8ce0

    .line 46
    .line 47
    .line 48
    invoke-static {p3, p0, p2, p1, p4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 49
    .line 50
    .line 51
    invoke-static {p3}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    const p1, 0x8cd5

    .line 56
    .line 57
    .line 58
    if-ne p0, p1, :cond_2

    .line 59
    .line 60
    invoke-static {p3, p4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    const-string p1, "Framebuffer not complete, status: "

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public getFrameBufferId()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 3

    .line 1
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 2
    .line 3
    filled-new-array {v0}, [I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 10
    .line 11
    .line 12
    iput v2, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 13
    .line 14
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 15
    .line 16
    filled-new-array {v0}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 21
    .line 22
    .line 23
    iput v2, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 24
    .line 25
    iput v2, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 26
    .line 27
    iput v2, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 28
    .line 29
    return-void
.end method

.method public setSize(II)V
    .locals 13

    .line 1
    if-lez p1, :cond_5

    .line 2
    .line 3
    if-lez p2, :cond_5

    .line 4
    .line 5
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->width:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->height:I

    .line 10
    .line 11
    if-ne p2, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->textureId:I

    .line 15
    .line 16
    const/16 v1, 0xde1

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-static {v1}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :cond_1
    move v3, v0

    .line 25
    iget v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    new-array v4, v0, [I

    .line 32
    .line 33
    invoke-static {v0, v4, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 34
    .line 35
    .line 36
    aget v0, v4, v2

    .line 37
    .line 38
    iput v0, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 39
    .line 40
    :cond_2
    const v0, 0x84c0

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 47
    .line 48
    .line 49
    iget v6, p0, Lio/agora/base/internal/video/GlTextureFrameBuffer;->pixelFormat:I

    .line 50
    .line 51
    const v0, 0x881a

    .line 52
    .line 53
    .line 54
    if-ne v6, v0, :cond_4

    .line 55
    .line 56
    invoke-static {}, Lio/agora/base/internal/video/HdrUtil;->isSupportedEGL3()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    const/16 v11, 0x1406

    .line 63
    .line 64
    const/4 v12, 0x0

    .line 65
    const/16 v4, 0xde1

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    const v6, 0x881a

    .line 69
    .line 70
    .line 71
    const/4 v9, 0x0

    .line 72
    const/16 v10, 0x1908

    .line 73
    .line 74
    move v7, p1

    .line 75
    move v8, p2

    .line 76
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 77
    .line 78
    .line 79
    const-string p1, "GlTextureFrameBuffer glTexImage2D GL_RGBA16F"

    .line 80
    .line 81
    invoke-static {p1}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    const-string p0, "not support hdr"

    .line 86
    .line 87
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    move v7, p1

    .line 92
    move v8, p2

    .line 93
    const/16 v11, 0x1401

    .line 94
    .line 95
    const/4 v12, 0x0

    .line 96
    const/16 v4, 0xde1

    .line 97
    .line 98
    const/4 v5, 0x0

    .line 99
    const/4 v9, 0x0

    .line 100
    move v10, v6

    .line 101
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 105
    .line 106
    .line 107
    const-string p1, "GlTextureFrameBuffer setSize"

    .line 108
    .line 109
    invoke-static {p1}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const/16 v4, 0xde1

    .line 113
    .line 114
    move v5, v7

    .line 115
    const/4 v7, 0x0

    .line 116
    move-object v2, p0

    .line 117
    move v6, v8

    .line 118
    invoke-virtual/range {v2 .. v7}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->bindTexture(IIIIZ)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_5
    move v7, p1

    .line 123
    move v8, p2

    .line 124
    const-string p0, "Invalid size: "

    .line 125
    .line 126
    const-string p1, "x"

    .line 127
    .line 128
    invoke-static {p0, v7, p1, v8}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 129
    .line 130
    .line 131
    return-void
.end method
