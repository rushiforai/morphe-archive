.class public final synthetic Ll/prj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/prj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    iput-object p2, p0, Ll/prj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/prj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    iget-object p0, p0, Ll/prj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;Landroid/view/View;)V

    return-void
.end method
