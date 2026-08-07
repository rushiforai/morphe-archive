.class public Ll/b3i0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:Ll/qpw;

.field private c:Ll/ppw;

.field public volatile d:Z

.field private volatile e:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/b3i0;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/b3i0;->d:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/b3i0;->e:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/b3i0;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/b3i0;->e(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(IIIII)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    if-lez p4, :cond_0

    .line 2
    .line 3
    if-lez p3, :cond_0

    .line 4
    .line 5
    mul-int v0, p3, p4

    .line 6
    .line 7
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    const/16 v4, 0x1908

    .line 12
    .line 13
    const/16 v5, 0x1401

    .line 14
    .line 15
    move v0, p1

    .line 16
    move v1, p2

    .line 17
    move v2, p3

    .line 18
    move v3, p4

    .line 19
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 23
    .line 24
    invoke-static {p3, p4, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 29
    .line 30
    .line 31
    new-instance v5, Landroid/graphics/Matrix;

    .line 32
    .line 33
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 34
    .line 35
    .line 36
    const/high16 v1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    const/high16 v4, -0x40800000    # -1.0f

    .line 39
    .line 40
    invoke-virtual {v5, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 41
    .line 42
    .line 43
    int-to-float v1, p5

    .line 44
    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v6, 0x1

    .line 49
    const/4 v1, 0x0

    .line 50
    move v3, p3

    .line 51
    move v4, p4

    .line 52
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    return-object v0

    .line 57
    :cond_0
    const/4 v0, 0x0

    .line 58
    return-object v0
.end method

.method private declared-synchronized e(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p2, p1}, Ll/a33;->b(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Ll/b3i0;->b:Ll/qpw;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, p2, v0}, Ll/qpw;->a(ILjava/lang/Exception;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :catch_0
    move-exception p1

    .line 18
    :try_start_1
    iget-object p2, p0, Ll/b3i0;->b:Ll/qpw;

    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    invoke-interface {p2, v0, p1}, Ll/qpw;->a(ILjava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    throw p1
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/b3i0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/b3i0;->a:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/b3i0;->e:Z

    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized f(Ll/ppw;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/b3i0;->c:Ll/ppw;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized g(Ll/qpw;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/b3i0;->b:Ll/qpw;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized h(Ljava/lang/String;IIIII)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/b3i0;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    :try_start_1
    iput-boolean v0, p0, Ll/b3i0;->d:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 9
    .line 10
    move-object v2, p0

    .line 11
    move v7, p2

    .line 12
    move v3, p3

    .line 13
    move v4, p4

    .line 14
    move v5, p5

    .line 15
    move v6, p6

    .line 16
    :try_start_2
    invoke-direct/range {v2 .. v7}, Ll/b3i0;->b(IIIII)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-boolean p2, v2, Ll/b3i0;->e:Z

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    iput-boolean v1, v2, Ll/b3i0;->d:Z

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    :goto_0
    move-object p0, v0

    .line 29
    goto :goto_6

    .line 30
    :catch_0
    move-exception v0

    .line 31
    :goto_1
    move-object p0, v0

    .line 32
    goto :goto_3

    .line 33
    :cond_0
    :goto_2
    iget-object p2, v2, Ll/b3i0;->c:Ll/ppw;

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-interface {p2, p0, p1}, Ll/ppw;->a(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    .line 39
    .line 40
    .line 41
    goto :goto_4

    .line 42
    :cond_1
    new-instance p2, Ll/b3i0$a;

    .line 43
    .line 44
    invoke-direct {p2, v2, p0, p1}, Ll/b3i0$a;-><init>(Ll/b3i0;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x2

    .line 48
    invoke-static {p0, p2}, Ll/lyi0;->d(ILjava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_4

    .line 52
    :catchall_1
    move-exception v0

    .line 53
    move-object v2, p0

    .line 54
    goto :goto_0

    .line 55
    :catch_1
    move-exception v0

    .line 56
    move-object v2, p0

    .line 57
    goto :goto_1

    .line 58
    :goto_3
    :try_start_3
    iput-boolean v1, v2, Ll/b3i0;->d:Z

    .line 59
    .line 60
    iget-object p1, v2, Ll/b3i0;->b:Ll/qpw;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    const/4 p2, -0x1

    .line 65
    invoke-interface {p1, p2, p0}, Ll/qpw;->a(ILjava/lang/Exception;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_4
    iput-boolean v1, v2, Ll/b3i0;->a:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 69
    .line 70
    goto :goto_5

    .line 71
    :cond_3
    move-object v2, p0

    .line 72
    :goto_5
    monitor-exit v2

    .line 73
    return-void

    .line 74
    :goto_6
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 75
    throw p0
.end method
