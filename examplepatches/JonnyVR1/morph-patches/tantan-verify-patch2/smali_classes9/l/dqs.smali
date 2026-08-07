.class public final synthetic Ll/dqs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jqs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;


# direct methods
.method public synthetic constructor <init>(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqs;->a:Ll/jqs;

    iput-object p2, p0, Ll/dqs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dqs;->a:Ll/jqs;

    iget-object p0, p0, Ll/dqs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->a(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Landroid/view/View;)V

    return-void
.end method
