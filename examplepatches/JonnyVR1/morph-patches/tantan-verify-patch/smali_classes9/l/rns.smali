.class public final synthetic Ll/rns;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wns;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;


# direct methods
.method public synthetic constructor <init>(Ll/wns;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rns;->a:Ll/wns;

    iput-object p2, p0, Ll/rns;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rns;->a:Ll/wns;

    iget-object p0, p0, Ll/rns;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/category/LiveGiftWallCategoryItemView;->h0(Ll/wns;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;Landroid/view/View;)V

    return-void
.end method
