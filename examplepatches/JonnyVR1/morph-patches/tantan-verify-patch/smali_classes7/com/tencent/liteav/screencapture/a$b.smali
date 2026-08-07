.class public Lcom/tencent/liteav/screencapture/a$b;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/screencapture/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:[I

.field public c:Landroid/view/Surface;

.field public d:Landroid/graphics/SurfaceTexture;

.field public e:I

.field public f:I

.field public g:I

.field protected h:Z

.field protected i:J

.field protected j:J

.field protected k:Lcom/tencent/liteav/basic/c/b;

.field protected l:Lcom/tencent/liteav/basic/c/i;

.field m:[F

.field final synthetic n:Lcom/tencent/liteav/screencapture/a;

.field private o:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a;Landroid/os/Looper;Lcom/tencent/liteav/screencapture/a;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/tencent/liteav/screencapture/a$b;->a:I

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$b;->c:Landroid/view/Surface;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    const/16 p3, 0x2d0

    .line 17
    .line 18
    iput p3, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 19
    .line 20
    const/16 p3, 0x500

    .line 21
    .line 22
    iput p3, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 23
    .line 24
    const/16 p3, 0x19

    .line 25
    .line 26
    iput p3, p0, Lcom/tencent/liteav/screencapture/a$b;->g:I

    .line 27
    .line 28
    iput-boolean p1, p0, Lcom/tencent/liteav/screencapture/a$b;->h:Z

    .line 29
    .line 30
    const-wide/16 v0, 0x0

    .line 31
    .line 32
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 33
    .line 34
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 35
    .line 36
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    .line 37
    .line 38
    iput-object p2, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 39
    .line 40
    const/16 p1, 0x10

    .line 41
    .line 42
    new-array p1, p1, [F

    .line 43
    .line 44
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->m:[F

    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p0, Lcom/tencent/liteav/screencapture/a$b;->o:Z

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "TXCScreenCapture"

    .line 62
    .line 63
    const-string p2, "TXCScreenCaptureGLThreadHandler inited. hashCode: %d"

    .line 64
    .line 65
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/screencapture/a$b;->o:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "EVT_MSG"

    .line 16
    .line 17
    const-string v3, "Screen recording started successfully"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/16 v3, 0x3ec

    .line 29
    .line 30
    invoke-static {v2, v3, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/screencapture/a;->c(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iput-boolean v1, p0, Lcom/tencent/liteav/screencapture/a$b;->o:Z

    .line 39
    .line 40
    return-void
.end method

.method public a(Landroid/os/Message;)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 41
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 42
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 43
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->b()Z

    move-result p1

    if-nez p1, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->c()V

    .line 45
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    invoke-virtual {p1}, Lcom/tencent/liteav/screencapture/a;->b()V

    .line 46
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    const p1, 0x1312d03

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a;->c(I)V

    :cond_0
    return-void
.end method

.method public b(Landroid/os/Message;)V
    .locals 1

    .line 89
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/tencent/liteav/screencapture/a;->i:Z

    .line 90
    invoke-static {p1}, Lcom/tencent/liteav/screencapture/a;->b(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/a$a;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 91
    invoke-interface {p1, v0}, Lcom/tencent/liteav/screencapture/a$a;->onScreenCaptureStopped(I)V

    .line 92
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    invoke-virtual {p1}, Lcom/tencent/liteav/screencapture/a;->c()Lcom/tencent/liteav/screencapture/b;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 93
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    invoke-static {v0}, Lcom/tencent/liteav/screencapture/a;->f(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/tencent/liteav/screencapture/b;->a(Ljava/lang/Object;)V

    .line 94
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->c()V

    return-void
.end method

.method public b()Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "init egl size[%d/%d]"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TXCScreenCapture"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 29
    .line 30
    iget v1, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {v2, v2, v2, v0, v1}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    new-instance v0, Lcom/tencent/liteav/basic/c/i;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/i;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    return v1

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 64
    .line 65
    iget v3, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 66
    .line 67
    iget v4, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 68
    .line 69
    invoke-virtual {v0, v3, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 73
    .line 74
    sget-object v3, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 75
    .line 76
    sget-object v4, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 77
    .line 78
    invoke-static {v4, v1, v1}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v3, v1}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->e()V

    .line 86
    .line 87
    .line 88
    return v2
.end method

.method public c()V
    .locals 2

    .line 179
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->d()V

    .line 180
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 182
    iput-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    if-eqz v0, :cond_1

    .line 184
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->c()V

    .line 185
    iput-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    :cond_1
    return-void
.end method

.method public c(Landroid/os/Message;)V
    .locals 14

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 2
    .line 3
    const/16 v0, 0x66

    .line 4
    .line 5
    const-wide/16 v1, 0x5

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, v2}, Lcom/tencent/liteav/screencapture/a;->a(IJ)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/tencent/liteav/screencapture/a;->i:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    .line 19
    .line 20
    const-string v1, "TXCScreenCapture"

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    const-string p0, "eglhelper is null"

    .line 25
    .line 26
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-boolean p1, p0, Lcom/tencent/liteav/screencapture/a$b;->h:Z

    .line 31
    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iput-wide v2, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    iget-wide v6, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 50
    .line 51
    iget-wide v8, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 52
    .line 53
    const-wide/32 v10, 0x3b9aca00

    .line 54
    .line 55
    .line 56
    mul-long/2addr v8, v10

    .line 57
    iget p1, p0, Lcom/tencent/liteav/screencapture/a$b;->g:I

    .line 58
    .line 59
    int-to-long v12, p1

    .line 60
    div-long/2addr v8, v12

    .line 61
    add-long/2addr v8, v6

    .line 62
    cmp-long p1, v4, v8

    .line 63
    .line 64
    if-gez p1, :cond_3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    cmp-long p1, v6, v2

    .line 68
    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    iput-wide v4, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    add-long/2addr v6, v10

    .line 75
    cmp-long p1, v4, v6

    .line 76
    .line 77
    if-lez p1, :cond_5

    .line 78
    .line 79
    iput-wide v2, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 80
    .line 81
    iput-wide v4, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    .line 82
    .line 83
    :cond_5
    :goto_0
    iget-wide v2, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 84
    .line 85
    const-wide/16 v4, 0x1

    .line 86
    .line 87
    add-long/2addr v2, v4

    .line 88
    iput-wide v2, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 89
    .line 90
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 91
    .line 92
    if-eqz p1, :cond_7

    .line 93
    .line 94
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 95
    .line 96
    if-nez v0, :cond_6

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->m:[F

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 102
    .line 103
    .line 104
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :catch_0
    move-exception v0

    .line 111
    move-object p1, v0

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v2, "onMsgRend Exception "

    .line 115
    .line 116
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :goto_1
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 134
    .line 135
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->m:[F

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/c/i;->a([F)V

    .line 138
    .line 139
    .line 140
    iget p1, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 141
    .line 142
    iget v0, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 143
    .line 144
    const/4 v1, 0x0

    .line 145
    invoke-static {v1, v1, p1, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    .line 149
    .line 150
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 151
    .line 152
    aget v0, v0, v1

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 159
    .line 160
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->k:Lcom/tencent/liteav/basic/c/b;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iget v5, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 167
    .line 168
    iget v6, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 169
    .line 170
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 171
    .line 172
    .line 173
    move-result-wide v7

    .line 174
    const/4 v2, 0x0

    .line 175
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/liteav/screencapture/a;->a(ILjavax/microedition/khronos/egl/EGLContext;IIIJ)V

    .line 176
    .line 177
    .line 178
    :cond_7
    :goto_2
    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/tencent/liteav/screencapture/a$b$1;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/a$b$1;-><init>(Lcom/tencent/liteav/screencapture/a$b;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/e;->a(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->c:Landroid/view/Surface;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->c:Landroid/view/Surface;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 39
    .line 40
    .line 41
    iput-boolean v2, p0, Lcom/tencent/liteav/screencapture/a$b;->h:Z

    .line 42
    .line 43
    iput-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public d(Landroid/os/Message;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 56
    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/4 v0, 0x1

    if-ge p1, v0, :cond_1

    move p1, v0

    :cond_1
    iput p1, p0, Lcom/tencent/liteav/screencapture/a$b;->g:I

    const-wide/16 v0, 0x0

    .line 57
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->i:J

    .line 58
    iput-wide v0, p0, Lcom/tencent/liteav/screencapture/a$b;->j:J

    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->b()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    aput v1, v0, v2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 14
    .line 15
    aget v0, v0, v2

    .line 16
    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->b:[I

    .line 26
    .line 27
    aget v1, v1, v2

    .line 28
    .line 29
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    new-instance v0, Landroid/view/Surface;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->c:Landroid/view/Surface;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 44
    .line 45
    iget v1, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 46
    .line 47
    iget v2, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b;->d:Landroid/graphics/SurfaceTexture;

    .line 53
    .line 54
    new-instance v1, Lcom/tencent/liteav/screencapture/a$b$2;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/a$b$2;-><init>(Lcom/tencent/liteav/screencapture/a$b;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Landroid/os/Handler;

    .line 63
    .line 64
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Lcom/tencent/liteav/screencapture/a$b$3;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/a$b$3;-><init>(Lcom/tencent/liteav/screencapture/a$b;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public e(Landroid/os/Message;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 80
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    iput v0, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 81
    iget p1, p1, Landroid/os/Message;->arg2:I

    iput p1, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 82
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->d()V

    .line 83
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->l:Lcom/tencent/liteav/basic/c/i;

    iget v0, p0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    iget v1, p0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    invoke-virtual {p1, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 84
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->e()V

    .line 85
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    invoke-static {p1}, Lcom/tencent/liteav/screencapture/a;->d(Lcom/tencent/liteav/screencapture/a;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    invoke-static {p0}, Lcom/tencent/liteav/screencapture/a;->e(Lcom/tencent/liteav/screencapture/a;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "set screen capture size[%d/%d]"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXCScreenCapture"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/screencapture/a$b;->a:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 7
    .line 8
    iget v1, v1, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 9
    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x65

    .line 13
    .line 14
    iget v1, p1, Landroid/os/Message;->what:I

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 20
    .line 21
    packed-switch v0, :pswitch_data_0

    .line 22
    .line 23
    .line 24
    :pswitch_0
    goto :goto_0

    .line 25
    :pswitch_1
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a$b;->a()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a$b;->e(Landroid/os/Message;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a$b;->d(Landroid/os/Message;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :pswitch_4
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a$b;->c(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    const-string v0, "TXCScreenCapture"

    .line 43
    .line 44
    const-string v1, "render failed."

    .line 45
    .line 46
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a$b;->b(Landroid/os/Message;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :pswitch_6
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a$b;->a(Landroid/os/Message;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 58
    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    check-cast p0, Ljava/lang/Runnable;

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_1
    return-void

    .line 67
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
