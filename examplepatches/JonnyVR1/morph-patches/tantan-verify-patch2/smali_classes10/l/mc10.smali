.class public final synthetic Ll/mc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iput-object p2, p0, Ll/mc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iget-object p0, p0, Ll/mc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->j0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Landroid/view/View;)V

    return-void
.end method
