.class public final synthetic Ll/pos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pos;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;

    iput-object p2, p0, Ll/pos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;

    iput p3, p0, Ll/pos;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pos;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;

    iget-object v1, p0, Ll/pos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;

    iget p0, p0, Ll/pos;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILandroid/view/View;)V

    return-void
.end method
