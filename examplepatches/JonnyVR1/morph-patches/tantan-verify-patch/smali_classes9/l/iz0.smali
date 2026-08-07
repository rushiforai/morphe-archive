.class public Ll/iz0;
.super Ll/cm2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cm2<",
        "Ll/jz0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cm2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jz0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/jz0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/gz0;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/gz0;-><init>(Ll/iz0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;->setOnLayoutAction(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic b4(Ll/iz0;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iz0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    return-void
.end method

.method public static synthetic c4(Ll/iz0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iz0;->d4(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public T3()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jz0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/jz0;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->setApplyLineVisibility()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const-string v1, "multiCallButtonInput"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    const-string v1, "callButtonInput"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v0, Ll/l24;

    .line 28
    .line 29
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 30
    .line 31
    invoke-direct {v0, v1, p1}, Ll/l24;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    new-instance v0, Ll/gc10;

    .line 39
    .line 40
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 41
    .line 42
    invoke-direct {v0, v1, p1}, Ll/gc10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public f4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jz0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jz0;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/hz0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/hz0;-><init>(Ll/iz0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
