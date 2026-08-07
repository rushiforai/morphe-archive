.class public final synthetic Ll/gce;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gce;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    iput-object p2, p0, Ll/gce;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gce;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    iget-object p0, p0, Ll/gce;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Landroid/animation/ValueAnimator;)V

    return-void
.end method
