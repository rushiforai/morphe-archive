.class public final synthetic Ll/fos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/gos;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;


# direct methods
.method public synthetic constructor <init>(Ll/gos;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fos;->a:Ll/gos;

    iput-object p2, p0, Ll/fos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput-object p3, p0, Ll/fos;->c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fos;->a:Ll/gos;

    iget-object v1, p0, Ll/fos;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iget-object p0, p0, Ll/fos;->c:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    invoke-static {v0, v1, p0, p1}, Ll/gos;->J(Ll/gos;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Landroid/view/View;)V

    return-void
.end method
