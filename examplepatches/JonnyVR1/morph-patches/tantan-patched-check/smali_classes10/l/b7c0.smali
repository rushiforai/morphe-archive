.class public Ll/b7c0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/b7c0;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b7c0;->R3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    return-void
.end method

.method public static synthetic K3(ILl/qrm0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qrm0;->Z3()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic L3(Ljava/lang/String;Ll/qrm0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qrm0;->a4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->BOTTOM:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public N3(ILjava/lang/String;)Ll/g4$a;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/b7c0;->O3(I)Ll/g4$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, -0x1

    .line 16
    sparse-switch p1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :sswitch_0
    const-string p1, "voiceRoomGameCenterBubble"

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v0, 0x3

    .line 30
    goto :goto_0

    .line 31
    :sswitch_1
    const-string p1, "gamePanelButtonBubble"

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v0, 0x2

    .line 41
    goto :goto_0

    .line 42
    :sswitch_2
    const-string p1, "setVoiceRoomBgBubble"

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 v0, 0x1

    .line 52
    goto :goto_0

    .line 53
    :sswitch_3
    const-string p1, "settingButtonBubble"

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    const/4 v0, 0x0

    .line 63
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return-object p0

    .line 68
    :pswitch_0
    const-string p1, "intlGamePanel"

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/b7c0;->P3(Ljava/lang/String;)Ll/g4$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :pswitch_1
    const-string p1, "settingButton"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/b7c0;->P3(Ljava/lang/String;)Ll/g4$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    nop

    .line 83
    :sswitch_data_0
    .sparse-switch
        -0x47697b32 -> :sswitch_3
        0x13c50d3c -> :sswitch_2
        0x1fcaa8b0 -> :sswitch_1
        0x5c4195a0 -> :sswitch_0
    .end sparse-switch

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final O3(I)Ll/g4$a;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b7c0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/a7c0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/a7c0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/qrm0;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/qrm0;->d4()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/g4$a;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qrm0;->d4()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-direct {p1, p0}, Ll/g4$a;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public P3(Ljava/lang/String;)Ll/g4$a;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b7c0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/z6c0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/z6c0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/qrm0;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/qrm0;->d4()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/g4$a;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qrm0;->d4()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-direct {p1, p0}, Ll/g4$a;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/b7c0;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b7c0;->S3(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S3(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/b7c0;->i:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;->c()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;->setItems(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;->b(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshButton()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lrx/c;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/x6c0;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/x6c0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/y6c0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/y6c0;-><init>(Ll/b7c0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method
