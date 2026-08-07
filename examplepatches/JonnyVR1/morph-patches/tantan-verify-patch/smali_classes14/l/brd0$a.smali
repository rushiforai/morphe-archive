.class public Ll/brd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/brd0;->b(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/os/Handler;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Landroid/hardware/camera2/CameraDevice;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Landroid/hardware/camera2/CameraManager;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/brd0$a;->a:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    iput-object p2, p0, Ll/brd0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/brd0$a;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Landroid/hardware/camera2/CameraDevice;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/brd0$a;->a:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/brd0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ll/brd0$a$a;

    .line 6
    .line 7
    invoke-direct {v2, p0, p1}, Ll/brd0$a$a;-><init>(Ll/brd0$a;Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/brd0$a;->c:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, p0}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/brd0$a;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
