.class public Ll/nks;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/widget/FrameLayout;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 25
    .line 26
    sget v0, Ll/bnl0;->e:I

    .line 27
    .line 28
    invoke-virtual {p1, p0, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/nks;->e()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nks;->a(Landroid/widget/FrameLayout;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/nks;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nks;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;

    .line 2
    .line 3
    new-instance v1, Ll/mks;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mks;-><init>(Ll/nks;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method
