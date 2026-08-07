.class public final Ll/mos;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/gos;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\n\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0017\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ%\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u001a\u001a\u00020\u00082\u0006\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR$\u0010!\u001a\u0004\u0018\u00010\u00158\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u001f\"\u0004\u0008 \u0010\u0017\u00a8\u0006\""
    }
    d2 = {
        "Ll/mos;",
        "Ll/y8s;",
        "Ll/oo2;",
        "Ll/gos;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "",
        "type",
        "giftId",
        "skinId",
        "V3",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;",
        "user",
        "W3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V",
        "Ll/mx50;",
        "Z3",
        "(Ll/mx50;)V",
        "",
        "isFirst",
        "X3",
        "(Z)V",
        "j",
        "Ll/mx50;",
        "getOpenGiftDetailInfo",
        "()Ll/mx50;",
        "setOpenGiftDetailInfo",
        "openGiftDetailInfo",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public j:Ll/mx50;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic S3(Ll/mos;Ll/mx50;ZLcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/mos;->Y3(Ll/mos;Ll/mx50;ZLcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

.method public static T3(Ll/mos;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/mos;->X3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static U3(Ll/mos;Ll/mx50;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/mos;->Z3(Ll/mx50;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static final Y3(Ll/mos;Ll/mx50;ZLcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gos;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/mx50;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p3, p2}, Ll/gos;->B0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final V3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const v1, -0x2dd4b8e3

    .line 15
    .line 16
    .line 17
    if-eq v0, v1, :cond_4

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const p2, 0x4eab8d75

    .line 22
    .line 23
    .line 24
    if-eq v0, p2, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p2, "showGiftDialog"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p1, Ll/gos;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/gos;->p()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/lx50;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/lx50;-><init>()V

    .line 56
    .line 57
    .line 58
    const/16 p2, 0x1b60

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Ll/lx50;->i(I)Ll/lx50;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string p2, "live"

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const-string p2, ""

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 84
    .line 85
    check-cast p0, Ll/gos;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/gos;->p()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    const-string v0, "equipGiftSkin"

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_5

    .line 98
    .line 99
    :goto_0
    return-void

    .line 100
    :cond_5
    invoke-static {p2, p3}, Ll/aiv;->o0(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance p2, Ll/los;

    .line 109
    .line 110
    invoke-direct {p2, p0}, Ll/los;-><init>(Ll/mos;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final W3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->showUserCardDialog()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final X3(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mos;->j:Ll/mx50;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mx50;->d()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/mx50;->c()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFromIdentity()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v1, v3

    .line 28
    :goto_0
    invoke-virtual {v0}, Ll/mx50;->c()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 35
    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getTo()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    :cond_1
    move-object v4, v3

    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v0}, Ll/mx50;->b()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    move-object v3, v1

    .line 60
    invoke-static/range {v2 .. v7}, Ll/aiv;->G0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v2, Ll/kos;

    .line 69
    .line 70
    invoke-direct {v2, p0, v0, p1}, Ll/kos;-><init>(Ll/mos;Ll/mx50;Z)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public final Z3(Ll/mx50;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/mos;->j:Ll/mx50;

    .line 2
    .line 3
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/gos;

    .line 8
    .line 9
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {p1, v0, p0}, Ll/gos;-><init>(Lcom/p1/mobile/android/app/Act;Ll/mos;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->n(Ll/y8s;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/gos;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-virtual {p0, p1}, Ll/mos;->X3(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallV2Event:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->showGiftWallV2DetailDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/jos;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/jos;-><init>(Ll/mos;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
