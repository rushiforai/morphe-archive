.class public Ll/brd0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/os/Handler;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;",
            "Landroid/os/Handler;",
            ")",
            "Lrx/c<",
            "Landroid/hardware/camera2/CameraCaptureSession;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/brd0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/brd0$b;-><init>(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static b(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/os/Handler;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraManager;",
            "Ljava/lang/String;",
            "Landroid/os/Handler;",
            ")",
            "Lrx/c<",
            "Landroid/hardware/camera2/CameraDevice;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/brd0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/brd0$a;-><init>(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static c(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;Ljava/lang/String;)Lrx/c;
    .locals 1
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap$CompressFormat;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/brd0$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/brd0$c;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Ll/brd0$d;

    .line 14
    .line 15
    invoke-direct {v0, p2, p1, p0}, Ll/brd0$d;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
