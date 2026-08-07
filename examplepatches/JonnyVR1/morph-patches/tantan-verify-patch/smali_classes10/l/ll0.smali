.class public final Ll/ll0;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/hj2<",
        "TD;",
        "Ll/dl0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00040\u0003B\u0015\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u0015\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/ll0;",
        "Ll/oo2;",
        "D",
        "Ll/hj2;",
        "Ll/dl0;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "W3",
        "",
        "content",
        "Z3",
        "(Ljava/lang/String;)V",
        "Y3",
        "()Ll/dl0;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
        "k",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
        "announcement",
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
.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;
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
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic O3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ll0;->X3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    return-void
.end method

.method public static P3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static R3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 2
    .line 3
    const-string v1, "approved"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kc:I

    .line 12
    .line 13
    invoke-static {v0}, Ll/r1j0;->f(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 18
    .line 19
    const-string v1, "pending"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->lc:I

    .line 28
    .line 29
    invoke-static {v0}, Ll/r1j0;->f(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Ll/dl0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dl0;->j()V

    .line 37
    .line 38
    .line 39
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->announcementData()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static S3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/dl0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static T3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ll0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/dl0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/dl0;->L(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static V3(Ll/ll0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p1, Ll/bf10;->INSTANCE:Ll/bf10;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/bf10;->f0(Ll/i6t;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static final X3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/dl0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dl0;->j()V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ec:I

    .line 9
    .line 10
    invoke-static {v0}, Ll/r1j0;->f(I)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->announcementData()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ll0;->Y3()Ll/dl0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final W3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ll0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/jr10;->a()V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/es0;->INSTANCE:Ll/es0;

    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2, v0}, Ll/es0;->g(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/kl0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/kl0;-><init>(Ll/ll0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public Y3()Ll/dl0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/dl0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dl0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final Z3(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->gc:I

    .line 11
    .line 12
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/ll0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 24
    .line 25
    const-string v1, "approved"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/ll0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->content:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Ll/dl0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/dl0;->j()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-static {}, Ll/jr10;->g()V

    .line 55
    .line 56
    .line 57
    sget-object v0, Ll/es0;->INSTANCE:Ll/es0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1, p1}, Ll/es0;->i(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v0, Ll/il0;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/il0;-><init>(Ll/ll0;)V

    .line 81
    .line 82
    .line 83
    new-instance p0, Ll/jl0;

    .line 84
    .line 85
    invoke-direct {p0}, Ll/jl0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/bf10;->INSTANCE:Ll/bf10;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/bf10;->f0(Ll/i6t;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->showAnnouncementDlg()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lrx/c;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/el0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/el0;-><init>(Ll/ll0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    new-instance v0, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-direct {v0, v1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;-><init>(Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->announcementData()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lrx/c;

    .line 62
    .line 63
    new-instance v1, Ll/fl0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/fl0;-><init>(Ll/ll0;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/gl0;

    .line 69
    .line 70
    invoke-direct {v2, v1}, Ll/gl0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/hl0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/hl0;-><init>(Ll/ll0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method
