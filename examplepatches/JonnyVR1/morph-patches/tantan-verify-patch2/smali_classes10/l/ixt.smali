.class public final synthetic Ll/ixt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

.field public final synthetic b:Ll/zxt;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    iput-object p2, p0, Ll/ixt;->b:Ll/zxt;

    iput-object p3, p0, Ll/ixt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ixt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    iget-object v1, p0, Ll/ixt;->b:Ll/zxt;

    iget-object p0, p0, Ll/ixt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->b(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V

    return-void
.end method
