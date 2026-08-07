.class public Ll/d74;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public j:Ll/n54;

.field public k:Lcom/p1/mobile/putong/data/User;

.field public l:Ll/th0;

.field public m:Ll/th0;

.field public n:Ll/w30;

.field public o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public p:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;Ll/n54;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/d74;->j:Ll/n54;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/y64;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/y64;-><init>(Ll/d74;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/d74;->o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 15
    .line 16
    return-void
.end method

.method private synthetic A4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d74;->O4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/d74;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->B4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/d74;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->q4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L3(Ll/d74;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->C4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/d74;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->y4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N3(Ll/d74;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d74;->t4(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic O3(Ll/d74;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->z4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P3(Ll/d74;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->w4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic R3(Ll/d74;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->u4(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic S3(Ll/d74;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->v4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T3(Ll/d74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d74;->A4()V

    return-void
.end method

.method public static synthetic U3(Ll/d74;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->s4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V3(Ljava/lang/String;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic W3(Ll/d74;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->x4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X3(Ll/d74;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->E4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Y3(Ll/d74;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->D4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Ll/d74;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->r4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b4(Ll/d74;Ll/i84;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d74;->F4(Ll/i84;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic B4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic E4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/d74;->p4(Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;->l(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F4(Ll/i84;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d74;->h4()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public G4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/16 v1, 0x1130

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "callVideoVice"

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->giftSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v4, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0, v3, v4, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v4, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0, v3, v4, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v1, "call"

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v1, "live"

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public H4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/vyr;

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v1, v2}, Ll/vyr;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/d74;->j:Ll/n54;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Ll/h64;->b:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Landroid/view/View;

    .line 54
    .line 55
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    invoke-static {p1}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/d74;->i4(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v1, p0, Ll/d74;->o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast v0, Landroid/view/View;

    .line 88
    .line 89
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/d74;->J4()V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 114
    .line 115
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 116
    .line 117
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;->y(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 121
    .line 122
    return-void
.end method

.method public I4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/cqj$a;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/cqj$a;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/h64;

    .line 25
    .line 26
    iget-object v3, v0, Ll/h64;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v4, v0, Ll/h64;->b:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, v0, Ll/h64;->c:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {v2, v3, v4, v0}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 36
    .line 37
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string v4, "gift-audience-none-callaudience"

    .line 40
    .line 41
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 42
    .line 43
    invoke-static {v3, v4, v0}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v2, v0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v1, v0}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/cqj$a;->d()Ll/cqj;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance v1, Ll/lx50;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/lx50;-><init>()V

    .line 72
    .line 73
    .line 74
    const/16 v2, 0x1130

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ll/lx50;->i(I)Ll/lx50;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1, v0}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "callVideoVice"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public J4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/d74;->j4()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "availableSpace:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/d74;->c4()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    sget v1, Ll/pae;->j:I

    .line 29
    .line 30
    sub-int v1, v0, v1

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/d74;->K4(I)V

    .line 33
    .line 34
    .line 35
    sget v1, Ll/pae;->h:I

    .line 36
    .line 37
    sub-int/2addr v0, v1

    .line 38
    invoke-virtual {p0, v0}, Ll/d74;->L4(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final K4(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->TraysViewEvent:Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;->changeBottomSpace()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;

    .line 12
    .line 13
    const/16 v1, 0x1130

    .line 14
    .line 15
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;->a(I)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$a;->b()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final L4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->updateWidgetMargin()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final M4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->S7(Ljava/lang/String;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/s64;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/s64;-><init>(Ll/d74;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/t64;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/t64;-><init>(Ll/d74;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public N4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s2s;->b(Ll/i6t;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final O4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/d74;->e4(Landroid/content/Context;Landroid/view/Window;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-boolean v1, p0, Ll/d74;->p:Z

    .line 12
    .line 13
    if-eq v1, v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/d74;->p:Z

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/d74;->J4()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final c4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d74;->j4()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget v0, Ll/pae;->h:I

    .line 6
    .line 7
    sub-int/2addr p0, v0

    .line 8
    sget v0, Ll/pae;->f:I

    .line 9
    .line 10
    sub-int/2addr p0, v0

    .line 11
    sget v0, Ll/pae;->k:I

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    sget v0, Ll/pae;->o:I

    .line 15
    .line 16
    sub-int/2addr p0, v0

    .line 17
    sget v0, Ll/pae;->d:I

    .line 18
    .line 19
    if-lt p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 17
    .line 18
    xor-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->H7(Ljava/lang/String;ZZ)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/b74;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/b74;-><init>(Ll/d74;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/c74;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/c74;-><init>(Ll/d74;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final e4(Landroid/content/Context;Landroid/view/Window;)Z
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Window;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x2

    .line 30
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne p2, p1, :cond_1

    .line 35
    .line 36
    const p1, 0x1020002

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget p1, v0, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eq p1, p0, :cond_0

    .line 50
    .line 51
    return v2

    .line 52
    :cond_0
    return v1

    .line 53
    :cond_1
    new-instance p1, Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    iget p1, v0, Landroid/graphics/Point;->y:I

    .line 64
    .line 65
    if-eq p0, p1, :cond_2

    .line 66
    .line 67
    return v2

    .line 68
    :cond_2
    return v1
.end method

.method public f4()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->P5:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->A4:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/w30$b;

    .line 37
    .line 38
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x0

    .line 54
    const/4 v2, 0x1

    .line 55
    filled-new-array {v1, v2}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget v2, Ll/n9c0;->r0:I

    .line 60
    .line 61
    filled-new-array {v2, v2}, [I

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v0, v1, v2}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const v1, -0x666667

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/w30$b;->J(I)Ll/w30$b;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/o64;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/o64;-><init>(Ll/d74;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/p64;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/p64;-><init>(Ll/d74;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Ll/w30$b;->F()Ll/w30;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Ll/d74;->n:Ll/w30;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public g4()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/s2s;->a(Ll/i6t;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    const-string v9, "callVideo"

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    const-string v5, "liveRoom"

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    const-string v7, ""

    .line 36
    .line 37
    invoke-virtual/range {v1 .. v9}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/z64;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/z64;-><init>(Ll/d74;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/a74;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/a74;-><init>(Ll/d74;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final h4()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d74;->c4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d74;->j4()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sget v0, Ll/pae;->h:I

    .line 22
    .line 23
    sub-int/2addr p0, v0

    .line 24
    return p0

    .line 25
    :cond_0
    sget p0, Ll/pae;->n:I

    .line 26
    .line 27
    return p0
.end method

.method public i4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/k64;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/k64;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/l64;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/l64;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/m64;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/m64;-><init>(Ll/d74;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/n64;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/n64;-><init>(Ll/d74;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final j4()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/d74;->p:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sget v0, Ll/pae;->i:I

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sget v1, Ll/pae;->i:I

    .line 20
    .line 21
    sub-int/2addr v0, v1

    .line 22
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-static {p0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sub-int/2addr v0, p0

    .line 29
    return v0
.end method

.method public k4(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ll/qvd;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CallVideoPresenter stream "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Ll/qvd;

    .line 37
    .line 38
    if-eqz p1, :cond_8

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget v0, p1, Ll/qvd;->e:I

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    if-ne v0, v1, :cond_4

    .line 51
    .line 52
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 57
    .line 58
    invoke-static {v1, v0}, Ll/u54;->j(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_7

    .line 63
    .line 64
    :cond_2
    iget-object v0, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 65
    .line 66
    invoke-static {v0}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object p1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/d74;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    const/4 v1, 0x3

    .line 83
    if-ne v0, v1, :cond_5

    .line 84
    .line 85
    iget-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 86
    .line 87
    if-eqz v0, :cond_7

    .line 88
    .line 89
    iget-object p1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 90
    .line 91
    invoke-static {v0, p1}, Ll/u54;->j(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_7

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_5
    const/4 v1, 0x1

    .line 102
    if-ne v0, v1, :cond_7

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    if-eqz v0, :cond_6

    .line 109
    .line 110
    invoke-virtual {p1}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p0, p1}, Ll/d74;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 119
    .line 120
    .line 121
    :cond_7
    return-void

    .line 122
    :cond_8
    :goto_0
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final l4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->r2:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g1:I

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    new-instance v1, Ll/th0$a;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/n9c0;->p0:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v2:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/r64;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/r64;-><init>(Ll/d74;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v1, Ll/n9c0;->X0:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Ll/d74;->l:Ll/th0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final m4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f1:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->e1:I

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    new-instance v1, Ll/th0$a;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o1:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget v1, Ll/n9c0;->p0:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->d1:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/q64;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/q64;-><init>(Ll/d74;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget v1, Ll/n9c0;->X0:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/d74;->m:Ll/th0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d74;->o4()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/i6t;->n()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final n4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/n54;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Ll/pae;->n:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/d74;->L4(I)V

    .line 14
    .line 15
    .line 16
    sget v0, Ll/pae;->m:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/d74;->K4(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/vyr;

    .line 32
    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-direct {v1, v2}, Ll/vyr;-><init>(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/d74;->l:Ll/th0;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Ll/d74;->m:Ll/th0;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, Ll/d74;->n:Ll/w30;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 59
    .line 60
    .line 61
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/d74;->o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;->m()V

    .line 94
    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    iput-object v0, p0, Ll/d74;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 98
    .line 99
    iput-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    return-void
.end method

.method public p4(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic q4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic r4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic s4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->n:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/j64;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/j64;-><init>(Ll/d74;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/u64;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/u64;-><init>(Ll/d74;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/d74;->j:Ll/n54;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/n54;->a4()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/d74;->j:Ll/n54;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/n54;->l4()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/v64;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/v64;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/w64;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/w64;-><init>(Ll/d74;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    new-instance v0, Ll/x64;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/x64;-><init>(Ll/d74;)V

    .line 81
    .line 82
    .line 83
    const-class v1, Ll/i84;

    .line 84
    .line 85
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic t4(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d74;->m4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/d74;->n:Ll/w30;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/d74;->l4()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/d74;->n:Ll/w30;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/d74;->p4(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;->l(ZZ)V

    .line 21
    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/d74;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/d74;->p4(Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;->l(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic x4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d74;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d74;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d74;->M4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
