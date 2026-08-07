.class public final synthetic Ll/oos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xrs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;


# direct methods
.method public synthetic constructor <init>(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oos;->a:Ll/xrs;

    iput-object p2, p0, Ll/oos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oos;->a:Ll/xrs;

    iget-object p0, p0, Ll/oos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->h0(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;Landroid/view/View;)V

    return-void
.end method
