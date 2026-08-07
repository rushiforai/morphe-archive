.class public final synthetic Ll/mqs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/gos;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;


# direct methods
.method public synthetic constructor <init>(Ll/gos;ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqs;->a:Ll/gos;

    iput p2, p0, Ll/mqs;->b:I

    iput-object p3, p0, Ll/mqs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mqs;->a:Ll/gos;

    iget v1, p0, Ll/mqs;->b:I

    iget-object p0, p0, Ll/mqs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->j0(Ll/gos;ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Landroid/view/View;)V

    return-void
.end method
