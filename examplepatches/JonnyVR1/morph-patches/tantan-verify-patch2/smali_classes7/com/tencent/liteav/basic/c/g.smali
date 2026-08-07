.class public Lcom/tencent/liteav/basic/c/g;
.super Lcom/tencent/liteav/basic/util/e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/c/g$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/view/Surface;

.field public d:Z

.field public e:Lcom/tencent/liteav/basic/c/c;

.field public f:Landroid/opengl/EGLContext;

.field public g:Lcom/tencent/liteav/basic/c/b;

.field public h:Ljavax/microedition/khronos/egl/EGLContext;

.field private i:Lcom/tencent/liteav/basic/c/g$a;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x2d0

    .line 5
    .line 6
    iput p1, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 7
    .line 8
    const/16 p1, 0x500

    .line 9
    .line 10
    iput p1, p0, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->i:Lcom/tencent/liteav/basic/c/g$a;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 19
    .line 20
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->f:Landroid/opengl/EGLContext;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 27
    .line 28
    return-void
.end method

.method public static a(Landroid/os/Handler;Landroid/os/HandlerThread;)V
    .locals 2

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 32
    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x65

    .line 33
    iput v1, v0, Landroid/os/Message;->what:I

    .line 34
    new-instance v1, Lcom/tencent/liteav/basic/c/g$1;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/basic/c/g$1;-><init>(Landroid/os/Handler;Landroid/os/HandlerThread;)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 35
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method private a(Landroid/os/Message;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/g;->e()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "surface-render: init egl context exception "

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "TXGLThreadHandler"

    .line 22
    .line 23
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 28
    .line 29
    return-void
.end method

.method private b(Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/g;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(Landroid/os/Message;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->i:Lcom/tencent/liteav/basic/c/g$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/liteav/basic/c/g$a;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "onMsgRend Exception "

    .line 13
    .line 14
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "TXGLThreadHandler"

    .line 29
    .line 30
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private e()Z
    .locals 6

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/tencent/liteav/basic/c/g;->b:I

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
    const-string v1, "TXGLThreadHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 36
    .line 37
    iget v4, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 38
    .line 39
    iget v5, p0, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 40
    .line 41
    invoke-static {v2, v0, v3, v4, v5}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/b;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->f:Landroid/opengl/EGLContext;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 51
    .line 52
    iget v4, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 53
    .line 54
    iget v5, p0, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 55
    .line 56
    invoke-static {v2, v0, v3, v4, v5}, Lcom/tencent/liteav/basic/c/c;->a(Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 61
    .line 62
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 63
    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 67
    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return p0

    .line 72
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "surface-render: create egl context "

    .line 75
    .line 76
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->i:Lcom/tencent/liteav/basic/c/g$a;

    .line 92
    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-interface {p0}, Lcom/tencent/liteav/basic/c/g$a;->c()V

    .line 96
    .line 97
    .line 98
    :cond_2
    const/4 p0, 0x1

    .line 99
    return p0
.end method

.method private f()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "surface-render: destroy egl context "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TXGLThreadHandler"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->i:Lcom/tencent/liteav/basic/c/g$a;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/tencent/liteav/basic/c/g$a;->e()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->c()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->c()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 47
    .line 48
    :cond_2
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public a()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/liteav/basic/c/g$a;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/g;->i:Lcom/tencent/liteav/basic/c/g$a;

    return-void
.end method

.method public b()Landroid/view/Surface;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    return-object p0
.end method

.method public c()V
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->a()Z

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    if-eqz p0, :cond_1

    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/c;->d()Z

    :cond_1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/c;->b()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/c/g;->c(Landroid/os/Message;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/c/g;->b(Landroid/os/Message;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/c/g;->a(Landroid/os/Message;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    check-cast p0, Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_1
    return-void

    .line 31
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
