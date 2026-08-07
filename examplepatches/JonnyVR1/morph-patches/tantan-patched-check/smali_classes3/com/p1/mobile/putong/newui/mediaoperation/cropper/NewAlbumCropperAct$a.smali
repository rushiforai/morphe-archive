.class public Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->initDataOnCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->d:Lv/VProgressBar;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->d:Lv/VProgressBar;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    instance-of p1, p1, Lcom/p1/mobile/android/ui/cropiwa/TooLargeException;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget p1, Lcom/p1/mobile/putong/common/R$string;->Q:I

    .line 14
    .line 15
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget p1, Lcom/p1/mobile/putong/common/R$string;->D:I

    .line 20
    .line 21
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
