.class public final Ll/wns;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/tgs;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0017\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0015\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\nR\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/wns;",
        "Ll/y8s;",
        "Ll/oo2;",
        "Ll/tgs;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;",
        "gift",
        "V3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;",
        "user",
        "W3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V",
        "Ll/nx50;",
        "Y3",
        "(Ll/nx50;)V",
        "X3",
        "j",
        "Ll/nx50;",
        "openGiftWallInfo",
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
.field public j:Ll/nx50;
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

.method public static S3(Ll/wns;Ll/lx50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tgs;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static T3(Ll/wns;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tgs;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/tgs;->g0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static U3(Ll/wns;Ll/nx50;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/wns;->Y3(Ll/nx50;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final V3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;
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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->showGiftDetail()Ll/v3f$d;

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

.method public final X3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wns;->j:Ll/nx50;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/nx50;->c()Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v1

    .line 16
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Ll/wns;->j:Ll/nx50;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/nx50;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :cond_1
    invoke-static {v0, v2, v1}, Ll/aiv;->H0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/vns;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/vns;-><init>(Ll/wns;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final Y3(Ll/nx50;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/wns;->j:Ll/nx50;

    .line 2
    .line 3
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/tgs;

    .line 8
    .line 9
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {p1, v0, p0}, Ll/tgs;-><init>(Lcom/p1/mobile/android/app/Act;Ll/wns;)V

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
    check-cast p1, Ll/tgs;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/wns;->X3()V

    .line 30
    .line 31
    .line 32
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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->showCategorySetDialog()Ll/v3f$d;

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
    new-instance v1, Ll/tns;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tns;-><init>(Ll/wns;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-direct {v0, v1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lrx/c;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/uns;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/uns;-><init>(Ll/wns;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method
