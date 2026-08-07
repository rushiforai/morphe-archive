.class Ll/ib4$k;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ib4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "k"
.end annotation


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Z

.field private c:Ll/ib4$j;

.field private d:Ll/wje;

.field final synthetic e:Ll/ib4;


# direct methods
.method public constructor <init>(Ll/ib4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 2
    .line 3
    const-string p1, "CameraEGLThread"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Ll/ib4$k;->b:Z

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Ll/ib4$k;->c:Ll/ib4$j;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/ib4$k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ib4$k;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 0

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Landroid/graphics/SurfaceTexture;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 17
    .line 18
    aget v1, v1, v2

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/ib4;->Y1(Ll/ib4;I)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 24
    .line 25
    invoke-static {v0}, Ll/ib4;->X1(Ll/ib4;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const v1, 0x8d65

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x2801

    .line 36
    .line 37
    const/high16 v1, 0x46180000    # 9728.0f

    .line 38
    .line 39
    const/16 v2, 0xde1

    .line 40
    .line 41
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 42
    .line 43
    .line 44
    const/16 v0, 0x2800

    .line 45
    .line 46
    const v1, 0x46180400    # 9729.0f

    .line 47
    .line 48
    .line 49
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 50
    .line 51
    .line 52
    const/16 v0, 0x2802

    .line 53
    .line 54
    const v1, 0x812f

    .line 55
    .line 56
    .line 57
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 58
    .line 59
    .line 60
    const/16 v0, 0x2803

    .line 61
    .line 62
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 66
    .line 67
    new-instance v1, Landroid/graphics/SurfaceTexture;

    .line 68
    .line 69
    iget-object v2, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 70
    .line 71
    invoke-static {v2}, Ll/ib4;->X1(Ll/ib4;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-direct {v1, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/ib4;->h2(Ll/ib4;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 79
    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v1, "createTexture: mTextureID:"

    .line 84
    .line 85
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 89
    .line 90
    invoke-static {v1}, Ll/ib4;->X1(Ll/ib4;)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, ", mCameraTexture:"

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 103
    .line 104
    invoke-static {v1}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "CameraNV21PreviewInput"

    .line 116
    .line 117
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    :cond_0
    iget-object p0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 121
    .line 122
    invoke-static {p0}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0
.end method

.method public c()Ll/ib4$j;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4$k;->c:Ll/ib4$j;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "CameraNV21PreviewInput"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "releaseCameraTexture mCameraTexture: "

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 28
    .line 29
    invoke-static {v2}, Ll/ib4;->g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {v0, v2}, Ll/ib4;->h2(Ll/ib4;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 50
    .line 51
    invoke-static {v0}, Ll/ib4;->X1(Ll/ib4;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 58
    .line 59
    invoke-static {v0}, Ll/ib4;->X1(Ll/ib4;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    filled-new-array {v0}, [I

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v2, 0x1

    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "releaseCameraTexture glDeleteTextures: "

    .line 75
    .line 76
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 80
    .line 81
    invoke-static {v2}, Ll/ib4;->X1(Ll/ib4;)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/ib4$k;->e:Ll/ib4;

    .line 96
    .line 97
    invoke-static {p0, v3}, Ll/ib4;->Y1(Ll/ib4;I)I

    .line 98
    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :catch_0
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Ll/ib4$k;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    iget-object v1, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :try_start_2
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    throw p0
.end method

.method public run()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ib4$j;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ib4$j;-><init>(Ll/ib4$k;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ib4$k;->c:Ll/ib4$j;

    .line 10
    .line 11
    new-instance v0, Ll/wje;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/wje;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ib4$k;->d:Ll/wje;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wje;->b()V

    .line 19
    .line 20
    .line 21
    const-string v0, "CameraNV21PreviewInput"

    .line 22
    .line 23
    const-string v1, "run: Start"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ib4$k;->d:Ll/wje;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wje;->i()Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ib4$k;->b()Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 37
    .line 38
    monitor-enter v0

    .line 39
    const/4 v1, 0x1

    .line 40
    :try_start_0
    iput-boolean v1, p0, Ll/ib4$k;->b:Z

    .line 41
    .line 42
    iget-object v1, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 45
    .line 46
    .line 47
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 48
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ib4$k;->d()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ib4$k;->d:Ll/wje;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/wje;->j()V

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Ll/ib4$k;->c:Ll/ib4$j;

    .line 61
    .line 62
    iget-object v1, p0, Ll/ib4$k;->a:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter v1

    .line 65
    const/4 v0, 0x0

    .line 66
    :try_start_1
    iput-boolean v0, p0, Ll/ib4$k;->b:Z

    .line 67
    .line 68
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    const-string p0, "CameraNV21PreviewInput"

    .line 70
    .line 71
    const-string v0, "run: Exit"

    .line 72
    .line 73
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    throw p0

    .line 80
    :catchall_1
    move-exception p0

    .line 81
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 82
    throw p0
.end method
