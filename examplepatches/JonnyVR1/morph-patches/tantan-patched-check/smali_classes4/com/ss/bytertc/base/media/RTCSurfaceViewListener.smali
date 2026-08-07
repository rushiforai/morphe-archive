.class public Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field private final key:Ljava/lang/String;

.field private nativeSurfaceHelperHandle:J

.field private surfaceView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Landroid/view/SurfaceView;JLjava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 5
    .line 6
    iput-object p1, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->surfaceView:Landroid/view/SurfaceView;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->key:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->surfaceView:Landroid/view/SurfaceView;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    move-object v2, p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    const/4 p1, 0x0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 55
    .line 56
    const-wide/16 v3, 0x0

    .line 57
    .line 58
    cmp-long p1, v0, v3

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    new-instance p1, Landroid/os/Handler;

    .line 63
    .line 64
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/jjc0;

    .line 72
    .line 73
    move-object v1, p0

    .line 74
    move-wide v3, p2

    .line 75
    move-object v5, p4

    .line 76
    invoke-direct/range {v0 .. v5}, Ll/jjc0;-><init>(Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;Landroid/view/Surface;JLjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;Landroid/view/Surface;JLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->surfaceView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/Surface;->isValid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    invoke-static {p2, p3, p0, p4}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public resetCallback()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->surfaceView:Landroid/view/SurfaceView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "surfaceCreated key:"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->key:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "RTCSurfaceViewListener"

    .line 44
    .line 45
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 49
    .line 50
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->key:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "surfaceDestroyed key:"

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->key:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "RTCSurfaceViewListener"

    .line 26
    .line 27
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->nativeSurfaceHelperHandle:J

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->key:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
