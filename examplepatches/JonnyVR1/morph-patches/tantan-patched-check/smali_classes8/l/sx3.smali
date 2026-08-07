.class public abstract Ll/sx3;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field protected currentPass:I

.field protected glFrameBufferFirst:Ll/lej;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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
    iput-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public drawFrame()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/sx3;->currentPass:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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
    invoke-virtual {p0}, Ll/sx3;->initFBO()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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
    invoke-virtual {p0}, Ll/sx3;->initFBO()V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/lej;->i()[I

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    aget v0, v0, v1

    .line 78
    .line 79
    iput v0, p0, Ll/wej;->texture_in:I

    .line 80
    .line 81
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x2

    .line 85
    iput v0, p0, Ll/sx3;->currentPass:I

    .line 86
    .line 87
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public getCurrentPass()I
    .locals 0

    .line 1
    iget p0, p0, Ll/sx3;->currentPass:I

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
    iget-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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
    iput-object v0, p0, Ll/sx3;->glFrameBufferFirst:Ll/lej;

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

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
