.class public final synthetic Ll/gi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;

.field public final synthetic b:Ll/fi;

.field public final synthetic c:Lcom/p1/mobile/putong/account/data/CameraSticker;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gi;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;

    iput-object p2, p0, Ll/gi;->b:Ll/fi;

    iput-object p3, p0, Ll/gi;->c:Lcom/p1/mobile/putong/account/data/CameraSticker;

    iput p4, p0, Ll/gi;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gi;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;

    iget-object v1, p0, Ll/gi;->b:Ll/fi;

    iget-object v2, p0, Ll/gi;->c:Lcom/p1/mobile/putong/account/data/CameraSticker;

    iget p0, p0, Ll/gi;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILandroid/view/View;)V

    return-void
.end method
