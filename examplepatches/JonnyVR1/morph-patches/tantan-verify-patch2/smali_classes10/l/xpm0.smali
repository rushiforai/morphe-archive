.class public final synthetic Ll/xpm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/aqm0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;


# direct methods
.method public synthetic constructor <init>(Ll/aqm0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xpm0;->a:Ll/aqm0;

    iput-object p2, p0, Ll/xpm0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/xpm0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xpm0;->a:Ll/aqm0;

    iget-object v1, p0, Ll/xpm0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/xpm0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    invoke-static {v0, v1, p0, p1}, Ll/aqm0;->L3(Ll/aqm0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;Landroid/view/View;)V

    return-void
.end method
