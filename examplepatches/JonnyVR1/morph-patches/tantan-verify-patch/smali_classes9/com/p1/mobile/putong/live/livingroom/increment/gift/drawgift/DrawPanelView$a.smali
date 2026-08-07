.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
