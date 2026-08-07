.class public Ll/mxh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mxh0$b;
    }
.end annotation


# static fields
.field public static h:I


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Landroid/media/ImageReader;

.field public final c:Landroid/os/HandlerThread;

.field public final d:Landroid/os/Handler;

.field public e:Ll/ft5;

.field public f:Ll/mxh0$b;

.field public final g:Ll/cth0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/cth0;IIII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/mxh0;->a:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/ft5;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/mxh0;->e:Ll/ft5;

    .line 20
    .line 21
    invoke-static {p2, p3, p4, p5}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 26
    .line 27
    iput-object p1, p0, Ll/mxh0;->g:Ll/cth0;

    .line 28
    .line 29
    new-instance p2, Landroid/os/HandlerThread;

    .line 30
    .line 31
    new-instance p3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string p4, "TTImageReader"

    .line 34
    .line 35
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget p4, Ll/mxh0;->h:I

    .line 39
    .line 40
    add-int/lit8 p5, p4, 0x1

    .line 41
    .line 42
    sput p5, Ll/mxh0;->h:I

    .line 43
    .line 44
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-direct {p2, p3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Ll/mxh0;->c:Landroid/os/HandlerThread;

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 57
    .line 58
    .line 59
    new-instance p3, Landroid/os/Handler;

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-direct {p3, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 66
    .line 67
    .line 68
    iput-object p3, p0, Ll/mxh0;->d:Landroid/os/Handler;

    .line 69
    .line 70
    iget-object p2, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 71
    .line 72
    new-instance p4, Ll/mxh0$a;

    .line 73
    .line 74
    invoke-direct {p4, p0, p1}, Ll/mxh0$a;-><init>(Ll/mxh0;Ll/cth0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2, p4, p3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static bridge synthetic a(Ll/mxh0;)Ll/mxh0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxh0;->f:Ll/mxh0$b;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/mxh0;)Ll/ft5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxh0;->e:Ll/ft5;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/mxh0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxh0;->a:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/mxh0;->f:Ll/mxh0$b;

    .line 3
    .line 4
    iget-object v1, p0, Ll/mxh0;->e:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Ll/mxh0;->c:Landroid/os/HandlerThread;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 22
    .line 23
    return-void
.end method

.method public e()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f(Ll/mxh0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mxh0;->f:Ll/mxh0$b;

    .line 2
    .line 3
    return-void
.end method

.method public g(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/mxh0;->b:Landroid/media/ImageReader;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Ll/mxh0;->d:Landroid/os/Handler;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p2, p1, v0, p0}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/mxh0;->f:Ll/mxh0$b;

    .line 37
    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    new-instance p1, Ljava/lang/RuntimeException;

    .line 41
    .line 42
    const-string p2, "CameraSession not created"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, p1}, Ll/mxh0$b;->onError(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method
