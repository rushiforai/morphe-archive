.class public abstract Ll/is10;
.super Ll/kt2;
.source "SourceFile"


# instance fields
.field protected D:[I

.field protected E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hfj;",
            ">;"
        }
    .end annotation
.end field

.field protected F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hfj;",
            ">;"
        }
    .end annotation
.end field

.field private G:I

.field private H:[I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/is10;->G:I

    .line 5
    .line 6
    add-int/lit8 v0, p1, -0x1

    .line 7
    .line 8
    new-array v1, v0, [I

    .line 9
    .line 10
    iput-object v1, p0, Ll/is10;->H:[I

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Ll/is10;->D:[I

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/is10;->E:Ljava/util/List;

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/is10;->F:Ljava/util/List;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/is10;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Ll/is10;->G:I

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
    iget-object v2, p0, Ll/is10;->D:[I

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
    iget-object v2, p0, Ll/is10;->H:[I

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

.method public Q(Ll/hfj;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/is10;->F:Ljava/util/List;

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
    iget-object v0, p0, Ll/is10;->F:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/is10;->F:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public declared-synchronized c(ILl/hfj;Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/is10;->E:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/is10;->E:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_2

    .line 23
    :cond_0
    :goto_0
    iget-object p3, p0, Ll/is10;->F:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p3, p2}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_1

    .line 30
    .line 31
    iput p1, p0, Ll/xej;->h:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v0, p0, Ll/is10;->D:[I

    .line 35
    .line 36
    add-int/lit8 p3, p3, -0x1

    .line 37
    .line 38
    aput p1, v0, p3

    .line 39
    .line 40
    :goto_1
    iget-object p1, p0, Ll/is10;->E:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget p3, p0, Ll/is10;->G:I

    .line 47
    .line 48
    if-ne p1, p3, :cond_2

    .line 49
    .line 50
    invoke-virtual {p2}, Ll/xej;->r()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0, p1}, Ll/xej;->B(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ll/xej;->n()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p0, p1}, Ll/xej;->y(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xej;->v()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/is10;->E:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    :cond_2
    monitor-exit p0

    .line 73
    return-void

    .line 74
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    throw p1
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/hfj;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/is10;->D:[I

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v2, p0, Ll/is10;->D:[I

    .line 14
    .line 15
    array-length v3, v2

    .line 16
    if-ge v1, v3, :cond_1

    .line 17
    .line 18
    aget v2, v2, v1

    .line 19
    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    filled-new-array {v2}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-static {v3, v2, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public t()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/xej;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Ll/is10;->G:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/is10;->H:[I

    .line 12
    .line 13
    iget v2, p0, Ll/xej;->d:I

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

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/xej;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/is10;->P()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
