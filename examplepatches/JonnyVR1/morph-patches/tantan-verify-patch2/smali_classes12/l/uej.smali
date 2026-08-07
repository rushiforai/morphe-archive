.class public abstract Ll/uej;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uej$a;
    }
.end annotation


# instance fields
.field private a:Landroid/opengl/EGLConfig;

.field private b:Landroid/opengl/EGLDisplay;

.field private c:Landroid/opengl/EGLContext;

.field private d:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "Ll/uej$a;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/afj;",
            ">;"
        }
    .end annotation
.end field

.field private f:Z

.field private g:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/uej;->a:Landroid/opengl/EGLConfig;

    .line 6
    .line 7
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 8
    .line 9
    iput-object v0, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 10
    .line 11
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 12
    .line 13
    iput-object v0, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "GLRenderer-"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/uej;->e:Ljava/util/List;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Ll/uej;->f:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Ll/uej;->g:Z

    .line 47
    .line 48
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 49
    .line 50
    const/16 v1, 0x64

    .line 51
    .line 52
    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 56
    .line 57
    return-void
.end method

.method private d(Ll/afj;)Z
    .locals 8

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "surface type error "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget v3, p1, Ll/afj;->a:I

    .line 7
    .line 8
    const/16 v4, 0x3038

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    if-eqz v3, :cond_2

    .line 12
    .line 13
    if-eq v3, v5, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x2

    .line 16
    if-eq v3, p0, :cond_0

    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget v1, p1, Ll/afj;->a:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v2

    .line 36
    :cond_0
    const-string p0, "nonsupport pixmap surface"

    .line 37
    .line 38
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v2

    .line 42
    :cond_1
    iget-object v1, p1, Ll/afj;->d:Ll/afj$a;

    .line 43
    .line 44
    iget v3, v1, Ll/afj$a;->c:I

    .line 45
    .line 46
    iget v1, v1, Ll/afj$a;->d:I

    .line 47
    .line 48
    const/16 v6, 0x3057

    .line 49
    .line 50
    const/16 v7, 0x3056

    .line 51
    .line 52
    filled-new-array {v6, v3, v7, v1, v4}, [I

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v3, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 57
    .line 58
    iget-object p0, p0, Ll/uej;->a:Landroid/opengl/EGLConfig;

    .line 59
    .line 60
    invoke-static {v3, p0, v1, v2}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, p1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    filled-new-array {v4}, [I

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v3, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 72
    .line 73
    iget-object p0, p0, Ll/uej;->a:Landroid/opengl/EGLConfig;

    .line 74
    .line 75
    iget-object v4, p1, Ll/afj;->b:Ljava/lang/Object;

    .line 76
    .line 77
    invoke-static {v3, p0, v4, v1, v2}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iput-object p0, p1, Ll/afj;->c:Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    :goto_0
    return v5

    .line 84
    :catch_0
    const-string p0, "can\'t create eglSurface"

    .line 85
    .line 86
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 90
    .line 91
    iput-object p0, p1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 92
    .line 93
    return v2
.end method

.method private j()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/uej;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/afj;

    .line 18
    .line 19
    iget-object v2, v1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 20
    .line 21
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 22
    .line 23
    if-ne v2, v3, :cond_0

    .line 24
    .line 25
    invoke-direct {p0, v1}, Ll/uej;->d(Ll/afj;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v2, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 33
    .line 34
    iget-object v3, v1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 35
    .line 36
    iget-object v4, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 37
    .line 38
    invoke-static {v2, v3, v3, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 39
    .line 40
    .line 41
    iget-object v2, v1, Ll/afj;->d:Ll/afj$a;

    .line 42
    .line 43
    iget v3, v2, Ll/afj$a;->a:I

    .line 44
    .line 45
    iget v4, v2, Ll/afj$a;->b:I

    .line 46
    .line 47
    iget v5, v2, Ll/afj$a;->c:I

    .line 48
    .line 49
    iget v2, v2, Ll/afj$a;->d:I

    .line 50
    .line 51
    invoke-static {v3, v4, v5, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ll/uej;->g(Ll/afj;)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 58
    .line 59
    iget-object v1, v1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 60
    .line 61
    invoke-static {v2, v1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Ll/afj;)V
    .locals 2
    .param p1    # Ll/afj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/uej$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/uej$a;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object p1, v0, Ll/uej$a;->b:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object p0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const-string p0, "mediaRender"

    .line 18
    .line 19
    const-string p1, "queue full"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public b()V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iput-object v1, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [I

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    invoke-static {v1, v3, v0, v3, v4}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v3, "EGL error "

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0xf

    .line 21
    .line 22
    new-array v6, v1, [I

    .line 23
    .line 24
    fill-array-data v6, :array_0

    .line 25
    .line 26
    .line 27
    new-array v11, v4, [I

    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    new-array v8, v10, [Landroid/opengl/EGLConfig;

    .line 31
    .line 32
    iget-object v5, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 33
    .line 34
    const/4 v9, 0x0

    .line 35
    const/4 v12, 0x0

    .line 36
    const/4 v7, 0x0

    .line 37
    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    aget-object v1, v8, v0

    .line 44
    .line 45
    iput-object v1, p0, Ll/uej;->a:Landroid/opengl/EGLConfig;

    .line 46
    .line 47
    const/16 v4, 0x3098

    .line 48
    .line 49
    const/16 v5, 0x3038

    .line 50
    .line 51
    filled-new-array {v4, v2, v5}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v4, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 56
    .line 57
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 58
    .line 59
    invoke-static {v4, v1, v6, v2, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 64
    .line 65
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 66
    .line 67
    if-eq v1, v2, :cond_0

    .line 68
    .line 69
    new-instance v1, Ll/afj;

    .line 70
    .line 71
    const/16 v2, 0x200

    .line 72
    .line 73
    invoke-direct {v1, v2, v2}, Ll/afj;-><init>(II)V

    .line 74
    .line 75
    .line 76
    iget-object v2, v1, Ll/afj;->d:Ll/afj$a;

    .line 77
    .line 78
    iget v3, v2, Ll/afj$a;->c:I

    .line 79
    .line 80
    const/16 v4, 0x3056

    .line 81
    .line 82
    iget v2, v2, Ll/afj$a;->d:I

    .line 83
    .line 84
    const/16 v6, 0x3057

    .line 85
    .line 86
    filled-new-array {v6, v3, v4, v2, v5}, [I

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget-object v3, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 91
    .line 92
    iget-object v4, p0, Ll/uej;->a:Landroid/opengl/EGLConfig;

    .line 93
    .line 94
    invoke-static {v3, v4, v2, v0}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, v1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 99
    .line 100
    iget-object v1, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 101
    .line 102
    iget-object p0, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 103
    .line 104
    invoke-static {v1, v0, v0, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    nop

    .line 133
    :array_0
    .array-data 4
        0x3020
        0x20
        0x3021
        0x8
        0x3022
        0x8
        0x3023
        0x8
        0x3024
        0x8
        0x3040
        0x4
        0x3033
        0x4
        0x3038
    .end array-data
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 6
    .line 7
    .line 8
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    iput-object v0, p0, Ll/uej;->c:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 13
    .line 14
    iput-object v0, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 15
    .line 16
    return-void
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public abstract g(Ll/afj;)V
.end method

.method public abstract h()V
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    new-instance v1, Ll/uej$a;

    .line 4
    .line 5
    const/4 v2, 0x7

    .line 6
    invoke-direct {v1, v2}, Ll/uej$a;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-wide/16 v0, 0x3e8

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    new-instance v0, Ll/uej$a;

    .line 4
    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-direct {v0, v1}, Ll/uej$a;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    new-instance v1, Ll/uej$a;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-direct {v1, v2}, Ll/uej$a;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "mediaRender"

    .line 16
    .line 17
    const-string v1, "queue full"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    .line 27
    .line 28
    if-ne v0, v1, :cond_1

    .line 29
    .line 30
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ": render create"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "mediaRender"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/uej;->b()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/uej;->e()V

    .line 31
    .line 32
    .line 33
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ll/uej;->g:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    :try_start_0
    iget-object v0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->take()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/uej$a;

    .line 44
    .line 45
    iget v2, v0, Ll/uej$a;->a:I

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    packed-switch v2, :pswitch_data_0

    .line 49
    .line 50
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v3, "event error: "

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    move-exception v0

    .line 73
    goto :goto_1

    .line 74
    :pswitch_0
    iput-boolean v3, p0, Ll/uej;->g:Z

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :pswitch_1
    iget-object v0, v0, Ll/uej$a;->b:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v0, Ljava/lang/Runnable;

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :pswitch_2
    const/4 v0, 0x0

    .line 86
    iput-boolean v0, p0, Ll/uej;->f:Z

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :pswitch_3
    iget-boolean v0, p0, Ll/uej;->f:Z

    .line 90
    .line 91
    if-eqz v0, :cond_0

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/uej;->h()V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0}, Ll/uej;->j()V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :pswitch_4
    iput-boolean v3, p0, Ll/uej;->f:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :pswitch_5
    iget-object v0, v0, Ll/uej$a;->b:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v0, Ll/afj;

    .line 106
    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v3, "remove:"

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 128
    .line 129
    iget-object v3, v0, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 130
    .line 131
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Ll/uej;->e:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :pswitch_6
    iget-object v0, v0, Ll/uej$a;->b:Ljava/lang/Object;

    .line 141
    .line 142
    check-cast v0, Ll/afj;

    .line 143
    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v3, "add:"

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-direct {p0, v0}, Ll/uej;->d(Ll/afj;)Z

    .line 165
    .line 166
    .line 167
    iget-object v2, p0, Ll/uej;->e:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_1
    invoke-virtual {p0}, Ll/uej;->f()V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Ll/uej;->e:Ljava/util/List;

    .line 183
    .line 184
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_2

    .line 193
    .line 194
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    check-cast v2, Ll/afj;

    .line 199
    .line 200
    iget-object v3, p0, Ll/uej;->b:Landroid/opengl/EGLDisplay;

    .line 201
    .line 202
    iget-object v4, v2, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 203
    .line 204
    invoke-static {v3, v4}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 205
    .line 206
    .line 207
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 208
    .line 209
    iput-object v3, v2, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_2
    invoke-virtual {p0}, Ll/uej;->c()V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/uej;->d:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 218
    .line 219
    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string p0, ": render release"

    .line 233
    .line 234
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public start()V
    .locals 1

    .line 1
    const-string p0, "mediaRender"

    .line 2
    .line 3
    const-string v0, "Don\'t call this function"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
