.class public final synthetic Ll/ysh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cth0;

.field public final synthetic b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;


# direct methods
.method public synthetic constructor <init>(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysh0;->a:Ll/cth0;

    iput-object p2, p0, Ll/ysh0;->b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ysh0;->a:Ll/cth0;

    iget-object p0, p0, Ll/ysh0;->b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    check-cast p1, Landroid/hardware/camera2/CameraDevice;

    invoke-static {v0, p0, p1}, Ll/cth0;->g(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
