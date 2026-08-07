.class public final synthetic Ll/lvh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ovh0;

.field public final synthetic b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

.field public final synthetic c:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;


# direct methods
.method public synthetic constructor <init>(Ll/ovh0;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvh0;->a:Ll/ovh0;

    iput-object p2, p0, Ll/lvh0;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    iput-object p3, p0, Ll/lvh0;->c:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lvh0;->a:Ll/ovh0;

    iget-object v1, p0, Ll/lvh0;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    iget-object p0, p0, Ll/lvh0;->c:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    invoke-static {v0, v1, p0, p1}, Ll/ovh0;->c(Ll/ovh0;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;)V

    return-void
.end method
