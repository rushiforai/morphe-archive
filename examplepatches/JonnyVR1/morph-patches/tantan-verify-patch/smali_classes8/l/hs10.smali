.class public abstract Ll/hs10;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field protected filterLocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/gfj;",
            ">;"
        }
    .end annotation
.end field

.field protected glFrameBufferList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/lej;",
            ">;"
        }
    .end annotation
.end field

.field private numOfInputs:I

.field protected texture:[I

.field private textureHandle:[I

.field protected texturesReceived:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/gfj;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hs10;->numOfInputs:I

    .line 5
    .line 6
    add-int/lit8 v0, p1, -0x1

    .line 7
    .line 8
    new-array v1, v0, [I

    .line 9
    .line 10
    iput-object v1, p0, Ll/hs10;->textureHandle:[I

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Ll/hs10;->texture:[I

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/hs10;->glFrameBufferList:Ljava/util/List;

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public clearRegisteredFilterLocations()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hs10;->glFrameBufferList:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public initShaderHandles()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Ll/hs10;->numOfInputs:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/hs10;->textureHandle:[I

    .line 12
    .line 13
    iget v2, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v4, "inputImageTexture"

    .line 18
    .line 19
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v4, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    aput v2, v1, v0

    .line 36
    .line 37
    move v0, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public lockRenderBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->lockRenderBuffer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public declared-synchronized newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    :goto_0
    iget-object p3, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p3, p2}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-nez p3, :cond_1

    .line 32
    .line 33
    iput p1, p0, Ll/wej;->texture_in:I

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iget-object v0, p0, Ll/hs10;->texture:[I

    .line 37
    .line 38
    add-int/lit8 p3, p3, -0x1

    .line 39
    .line 40
    aput p1, v0, p3

    .line 41
    .line 42
    :goto_1
    iget-object p1, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget p3, p0, Ll/hs10;->numOfInputs:I

    .line 49
    .line 50
    if-ne p1, p3, :cond_2

    .line 51
    .line 52
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .line 73
    .line 74
    :cond_2
    monitor-exit p0

    .line 75
    return-void

    .line 76
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw p1
.end method

.method public passShaderValues()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hs10;->passTextureValues()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public passTextureValues()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Ll/hs10;->numOfInputs:I

    .line 4
    .line 5
    add-int/lit8 v2, v2, -0x1

    .line 6
    .line 7
    if-ge v0, v2, :cond_0

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_1

    .line 13
    :pswitch_0
    const v1, 0x84c9

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :pswitch_1
    const v1, 0x84c8

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :pswitch_2
    const v1, 0x84c7

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :pswitch_3
    const v1, 0x84c6

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :pswitch_4
    const v1, 0x84c5

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :pswitch_5
    const v1, 0x84c4

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :pswitch_6
    const v1, 0x84c3

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :pswitch_7
    const v1, 0x84c2

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :pswitch_8
    const v1, 0x84c1

    .line 46
    .line 47
    .line 48
    :goto_1
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Ll/hs10;->texture:[I

    .line 52
    .line 53
    aget v2, v2, v0

    .line 54
    .line 55
    const/16 v3, 0xde1

    .line 56
    .line 57
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Ll/hs10;->textureHandle:[I

    .line 61
    .line 62
    aget v2, v2, v0

    .line 63
    .line 64
    add-int/lit8 v0, v0, 0x1

    .line 65
    .line 66
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    return-void

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public registerFilterLocation(Ll/gfj;)V
    .locals 1

    .line 20
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    iget-object p0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public registerFilterLocation(Ll/gfj;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public unlockInputRenderBuffer()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hs10;->texturesReceived:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/gfj;

    .line 18
    .line 19
    if-ne v1, p0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v2, v1, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget v3, v2, Ll/lej;->h:I

    .line 29
    .line 30
    add-int/lit8 v3, v3, -0x1

    .line 31
    .line 32
    iput v3, v2, Ll/lej;->h:I

    .line 33
    .line 34
    if-gtz v3, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/lej;->l()V

    .line 37
    .line 38
    .line 39
    iget-object v1, v1, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    iput v2, v1, Ll/lej;->h:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return-void
.end method
