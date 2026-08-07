.class public final Ll/xls;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/dls;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0017\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0015\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u000f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Ll/xls;",
        "Ll/y8s;",
        "Ll/oo2;",
        "Ll/dls;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "",
        "isEquip",
        "V3",
        "(Z)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;",
        "Y3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V",
        "j",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;",
        "skinDetailInfo",
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
.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;
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

.method public static S3(Ll/xls;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/xls;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic T3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xls;->X3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U3(ZLl/xls;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xls;->W3(ZLl/xls;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static final W3(ZLl/xls;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "\u7a7f\u6234\u6210\u529f"

    .line 4
    .line 5
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Ll/xls;->j:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const-string p2, "equipped"

    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;->status:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p2, p1, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p2, Ll/dls;

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Ll/dls;->U(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "\u5378\u4e0b\u6210\u529f"

    .line 25
    .line 26
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Ll/xls;->j:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const-string p2, "unlocked"

    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;->status:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p2, p1, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p2, Ll/dls;

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Ll/dls;->U(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGift()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/16 p1, 0x1b66

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static final X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final V3(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xls;->j:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0, v1}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    move v1, p1

    .line 46
    invoke-static/range {v1 .. v6}, Ll/aiv;->p0(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/vls;

    .line 55
    .line 56
    invoke-direct {v0, v1, p0}, Ll/vls;-><init>(ZLl/xls;)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Ll/wls;

    .line 60
    .line 61
    invoke-direct {p0}, Ll/wls;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final Y3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/xls;->j:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/dls;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Ll/dls;-><init>(Lcom/p1/mobile/android/app/Act;Ll/xls;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->n(Ll/y8s;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/dls;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/dls;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/dls;->U(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;->showGiftSkinDetail()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lrx/c;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/uls;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/uls;-><init>(Ll/xls;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method
