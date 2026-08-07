.class public final synthetic Ll/kc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iput-object p2, p0, Ll/kc10;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kc10;->c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iget-object v1, p0, Ll/kc10;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/kc10;->c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->h0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Landroid/view/View;)V

    return-void
.end method
