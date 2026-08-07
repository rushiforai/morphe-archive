.class public Lcom/idv/identity/platform/camera/CameraSurfaceView;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field static f:Ll/dql;


# instance fields
.field a:Landroid/content/Context;

.field b:Landroid/view/SurfaceHolder;

.field c:F

.field d:Ll/zpl;

.field private e:Lcom/idv/identity/platform/config/DeviceSetting;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->a:Landroid/content/Context;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-static {p1, p2}, Ll/x5e;->c(Landroid/content/Context;Z)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c:F

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 22
    .line 23
    const/4 p2, -0x2

    .line 24
    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 28
    .line 29
    const/4 p2, 0x3

    .line 30
    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 34
    .line 35
    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p2, ":"

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static declared-synchronized getCameraImpl()Ll/dql;
    .locals 2

    .line 1
    const-class v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/yn0;->G()Ll/yn0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    sget-object v1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-object v1

    .line 21
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v1
.end method

.method public static getCameraName()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Android"

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/dql;->q()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/dql;->g()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Landroid/content/Context;ZZ[Lcom/idv/identity/platform/config/DeviceSetting;)V
    .locals 0

    .line 1
    invoke-static {p4}, Ll/h0e;->a([Lcom/idv/identity/platform/config/DeviceSetting;)Lcom/idv/identity/platform/config/DeviceSetting;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    iput-object p4, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->e:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 6
    .line 7
    invoke-static {}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraImpl()Ll/dql;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    sput-object p4, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c()V

    .line 16
    .line 17
    .line 18
    iget-object p4, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->a:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {p4, p2}, Ll/x5e;->c(Landroid/content/Context;Z)F

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    iput p4, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c:F

    .line 25
    .line 26
    sget-object p4, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->e:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 29
    .line 30
    invoke-interface {p4, p1, p2, p3, p0}, Ll/dql;->p(Landroid/content/Context;ZZLcom/idv/identity/platform/config/DeviceSetting;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/dql;->a()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/dql;->s()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/dql;->f()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/dql;->r()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ll/dql;->e(Ll/zpl;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public getCameraInterface()Ll/dql;
    .locals 0

    .line 1
    sget-object p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceHolder()Landroid/view/SurfaceHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCameraCallback(Ll/zpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 2
    .line 3
    return-void
.end method

.method public setFocusModes(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/dql;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    iget-object p2, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 6
    .line 7
    iget v0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c:F

    .line 8
    .line 9
    invoke-interface {p1, p2, v0, p3, p4}, Ll/dql;->d(Landroid/view/SurfaceHolder;FII)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 13
    .line 14
    if-eqz p1, :cond_4

    .line 15
    .line 16
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 17
    .line 18
    invoke-interface {p1}, Ll/dql;->o()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/16 p2, 0x5a

    .line 23
    .line 24
    if-eq p1, p2, :cond_2

    .line 25
    .line 26
    const/16 p2, 0x10e

    .line 27
    .line 28
    if-ne p1, p2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const/16 p2, 0xb4

    .line 34
    .line 35
    if-ne p1, p2, :cond_3

    .line 36
    .line 37
    :cond_1
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 38
    .line 39
    invoke-interface {p1}, Ll/dql;->m()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/dql;->j()I

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    :goto_0
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 51
    .line 52
    invoke-interface {p1}, Ll/dql;->j()I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 57
    .line 58
    invoke-interface {p1}, Ll/dql;->m()I

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 63
    .line 64
    int-to-double p1, p3

    .line 65
    int-to-double p3, p4

    .line 66
    invoke-interface {p0, p1, p2, p3, p4}, Ll/zpl;->g0(DD)V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ll/dql;->e(Ll/zpl;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-interface {p1}, Ll/dql;->n()V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-interface {p0}, Ll/zpl;->b0()V

    .line 22
    .line 23
    .line 24
    :cond_2
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    sget-boolean p1, Ll/hfm;->d:Z

    .line 2
    .line 3
    sget-object v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/dql;->s()V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-interface {p1, v0}, Ll/dql;->e(Ll/zpl;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/idv/identity/platform/camera/CameraSurfaceView;->f:Ll/dql;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/dql;->r()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/platform/camera/CameraSurfaceView;->d:Ll/zpl;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ll/zpl;->e0()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
