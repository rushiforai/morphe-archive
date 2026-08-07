.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;
.super Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView<",
        "Ll/ha3;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->z0(Ll/bnl0$g;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->B0(Ll/bnl0$g;)V

    return-void
.end method


# virtual methods
.method public final synthetic B0(Ll/bnl0$g;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->g:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Landroid/view/animation/RotateAnimation;

    .line 4
    .line 5
    const/4 v6, 0x1

    .line 6
    const/high16 v7, 0x3f000000    # 0.5f

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/high16 v3, 0x43b40000    # 360.0f

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    const/high16 v5, 0x3f000000    # 0.5f

    .line 13
    .line 14
    invoke-direct/range {v1 .. v7}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->w0(Lv/VImage;Landroid/view/animation/RotateAnimation;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->h:Lv/VImage;

    .line 21
    .line 22
    new-instance v1, Landroid/view/animation/RotateAnimation;

    .line 23
    .line 24
    const/high16 v2, 0x43b40000    # 360.0f

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct/range {v1 .. v7}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->w0(Lv/VImage;Landroid/view/animation/RotateAnimation;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 34
    .line 35
    check-cast v0, Ll/ha3;

    .line 36
    .line 37
    new-instance v1, Ll/ja3;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/ja3;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Ll/bnl0$g;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 p0, 0x5

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1, v1}, Ll/ha3;->K3(JLl/x20;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public D0(Ll/dum;)Ll/ha3;
    .locals 1

    .line 1
    new-instance v0, Ll/ha3;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/ha3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->g:Lv/VImage;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->h:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ha3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->y0(Ll/ha3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic j0(Ll/i6t;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ha3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->y0(Ll/ha3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic n0(Ll/dum;)Ll/i6t;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->D0(Ll/dum;)Ll/ha3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;->u0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q0(Ll/bnl0$g;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->q0(Ll/bnl0$g;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 5
    .line 6
    check-cast v0, Ll/ha3;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v1, 0x1fa4

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 28
    .line 29
    check-cast v0, Ll/ha3;

    .line 30
    .line 31
    new-instance v1, Ll/ia3;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/ia3;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Ll/bnl0$g;)V

    .line 34
    .line 35
    .line 36
    const-wide/16 p0, 0x1e0

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1, v1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ka3;->a(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ka3;->b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final w0(Lv/VImage;Landroid/view/animation/RotateAnimation;)V
    .locals 2

    .line 1
    new-instance p0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, p0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0xdac

    .line 10
    .line 11
    invoke-virtual {p2, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 12
    .line 13
    .line 14
    const/4 p0, -0x1

    .line 15
    invoke-virtual {p2, p0}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    invoke-virtual {p2, p0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public y0(Ll/ha3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->j0(Ll/i6t;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z0(Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->k0(Ll/bnl0$g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
