.class public final synthetic Ll/xn20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xn20;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    iput-boolean p2, p0, Ll/xn20;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xn20;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    iget-boolean p0, p0, Ll/xn20;->b:Z

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;ZLandroid/view/View;)V

    return-void
.end method
