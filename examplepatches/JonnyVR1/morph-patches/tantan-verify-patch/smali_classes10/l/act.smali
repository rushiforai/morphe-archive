.class public Ll/act;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/xbt;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xbt;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/xbt;-><init>(Ll/act;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/act;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/act;->X3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;)V

    return-void
.end method

.method public static synthetic T3(Ll/act;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/act;->V3(Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Ll/aj1;->E1:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ybt;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ybt;-><init>(Ll/act;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public U3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/act;->W3()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final synthetic V3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/act;->W3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final W3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->switchOffAnchor()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final X3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;->getText()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;->getPictureUrl()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;->getText()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;->getButtonText()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert$ActionType;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert$ActionType;->anchorKickOut:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LivePictureTextAlert$ActionType;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    if-ne p1, v3, :cond_1

    .line 32
    .line 33
    move p1, v4

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p1, 0x0

    .line 36
    :goto_0
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v3, Ll/xbt;

    .line 39
    .line 40
    invoke-virtual {v3, v0, v1, v2, p1}, Ll/xbt;->I(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/4 v0, 0x3

    .line 50
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v4}, Lrx/c;->take(I)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/zbt;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/zbt;-><init>(Ll/act;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_1
    return-void
.end method
