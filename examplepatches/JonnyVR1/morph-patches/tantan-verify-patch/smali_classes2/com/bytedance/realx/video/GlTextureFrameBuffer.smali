.class public Lcom/bytedance/realx/video/GlTextureFrameBuffer;
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
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    packed-switch p1, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    const-string p0, "Invalid pixel format: "

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    throw p0

    .line 14
    :pswitch_0
    iput p1, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->pixelFormat:I

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->width:I

    .line 18
    .line 19
    iput p1, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->height:I

    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x1907
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getFrameBufferId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

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
    iput v2, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 13
    .line 14
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

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
    iput v2, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 24
    .line 25
    iput v2, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->width:I

    .line 26
    .line 27
    iput v2, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->height:I

    .line 28
    .line 29
    return-void
.end method

.method public setSize(II)V
    .locals 12

    .line 1
    if-lez p1, :cond_4

    .line 2
    .line 3
    if-lez p2, :cond_4

    .line 4
    .line 5
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->width:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->height:I

    .line 10
    .line 11
    if-ne p2, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput p1, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->width:I

    .line 15
    .line 16
    iput p2, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->height:I

    .line 17
    .line 18
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 19
    .line 20
    const/16 v1, 0xde1

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 29
    .line 30
    :cond_1
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    new-array v3, v0, [I

    .line 37
    .line 38
    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 39
    .line 40
    .line 41
    aget v0, v3, v2

    .line 42
    .line 43
    iput v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 44
    .line 45
    :cond_2
    const v0, 0x84c0

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 52
    .line 53
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 54
    .line 55
    .line 56
    iget v5, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->pixelFormat:I

    .line 57
    .line 58
    const/16 v10, 0x1401

    .line 59
    .line 60
    const/4 v11, 0x0

    .line 61
    const/16 v3, 0xde1

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const/4 v8, 0x0

    .line 65
    move v9, v5

    .line 66
    move v6, p1

    .line 67
    move v7, p2

    .line 68
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 72
    .line 73
    .line 74
    const-string p1, "GlTextureFrameBuffer setSize"

    .line 75
    .line 76
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget p1, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->frameBufferId:I

    .line 80
    .line 81
    const p2, 0x8d40

    .line 82
    .line 83
    .line 84
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 85
    .line 86
    .line 87
    const p1, 0x8ce0

    .line 88
    .line 89
    .line 90
    iget p0, p0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->textureId:I

    .line 91
    .line 92
    invoke-static {p2, p1, v1, p0, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 93
    .line 94
    .line 95
    invoke-static {p2}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    const p1, 0x8cd5

    .line 100
    .line 101
    .line 102
    if-ne p0, p1, :cond_3

    .line 103
    .line 104
    invoke-static {p2, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    const-string p1, "Framebuffer not complete, status: "

    .line 109
    .line 110
    invoke-static {p1, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_4
    move v6, p1

    .line 115
    move v7, p2

    .line 116
    const-string p0, "Invalid size: "

    .line 117
    .line 118
    const-string p1, "x"

    .line 119
    .line 120
    invoke-static {p0, v6, p1, v7}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 121
    .line 122
    .line 123
    return-void
.end method
