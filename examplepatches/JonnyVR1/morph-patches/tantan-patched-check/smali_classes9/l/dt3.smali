.class public Ll/dt3;
.super Ll/e80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e80<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public x:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget v2, Ll/yec0;->t5:I

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/e80;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic n4(Ll/dt3;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dt3;->t4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p4(Ll/dt3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dt3;->v4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic q4(Ll/dt3;Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dt3;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;)V

    return-void
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic v4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dt3;->s4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kf2;->g4()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-boolean v0, p0, Ll/dt3;->x:Z

    .line 11
    .line 12
    xor-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/aiv;->i1(Ljava/lang/String;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/bt3;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/bt3;-><init>(Ll/dt3;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/ct3;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/ct3;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "guideGift"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dt3;->w4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/kf2;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dt3;->s4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/aiv;->B0(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ys3;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ys3;-><init>(Ll/dt3;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/zs3;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/zs3;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogDismiss()Ll/v3f$c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lrx/c;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/at3;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/at3;-><init>(Ll/dt3;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic t4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/dt3;->x:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dt3;->x4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->openStatus:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dt3;->x4(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/e80;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/e80;->Z3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-boolean p0, p0, Ll/dt3;->x:Z

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;->d(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public x4(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/dt3;->x:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaC/item/GuideGiftItemView;->e(ZZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
