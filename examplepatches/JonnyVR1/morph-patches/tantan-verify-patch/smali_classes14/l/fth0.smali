.class public final synthetic Ll/fth0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ith0;

.field public final synthetic b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fth0;->a:Ll/ith0;

    iput-object p2, p0, Ll/fth0;->b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    iput-object p3, p0, Ll/fth0;->c:Ll/x20;

    iput-object p4, p0, Ll/fth0;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fth0;->a:Ll/ith0;

    iget-object v1, p0, Ll/fth0;->b:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    iget-object v2, p0, Ll/fth0;->c:Ll/x20;

    iget-object p0, p0, Ll/fth0;->d:Ll/y20;

    check-cast p1, Landroid/hardware/camera2/CameraCaptureSession;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ith0;->g(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V

    return-void
.end method
