.class public final synthetic Ll/ba4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/CameraSticker;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;Lcom/p1/mobile/putong/feed/newui/camera/widget/c;Lcom/p1/mobile/putong/feed/data/CameraSticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ba4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;

    iput-object p2, p0, Ll/ba4;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

    iput-object p3, p0, Ll/ba4;->c:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iput p4, p0, Ll/ba4;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ba4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;

    iget-object v1, p0, Ll/ba4;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

    iget-object v2, p0, Ll/ba4;->c:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iget p0, p0, Ll/ba4;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMaskItemView;Lcom/p1/mobile/putong/feed/newui/camera/widget/c;Lcom/p1/mobile/putong/feed/data/CameraSticker;ILandroid/view/View;)V

    return-void
.end method
