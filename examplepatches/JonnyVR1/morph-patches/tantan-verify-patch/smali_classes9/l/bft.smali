.class public Ll/bft;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/bft;->l:I

    .line 6
    .line 7
    return-void
.end method

.method private synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/bft;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bft;->z4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/bft;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->N4()V

    return-void
.end method

.method public static synthetic L3(Ll/bft;ZLjava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bft;->P4(ZLjava/lang/String;Ll/pf60;)V

    return-void
.end method

.method public static synthetic M3(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->E4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic N3(Ll/bft;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bft;->O4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/bft;ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bft;->U4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic P3(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic R3(Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->y6(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic S3(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic T3(Ll/bft;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->S4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U3(Ll/bft;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bft;->A4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic V3(Ll/bft;ZLjava/lang/String;Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bft;->I4(ZLjava/lang/String;Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V

    return-void
.end method

.method public static synthetic W3(Ll/bft;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->F4()V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y3(Ll/bft;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->T4(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic Z3(Ll/bft;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->V4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a4(Ll/bft;Ll/dft;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->B4(Ll/dft;)V

    return-void
.end method

.method public static synthetic b4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c4(Ll/bft;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->D4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic d4()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLive;Lrx/Notification;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    :goto_0
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic f4(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->g5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g4(Ll/bft;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->b5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h4(Ll/bft;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bft;->Q4(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i4(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private i5()Z
    .locals 2

    .line 1
    new-instance v0, Ll/vs80;

    .line 2
    .line 3
    const/16 v1, 0xce4

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/vs80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public static synthetic j4(Ll/bft;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->M4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k4(Ll/bft;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->x4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic l4(Ll/bft;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->C4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o4(Ll/bft;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->J4()V

    return-void
.end method

.method public static synthetic p4(Ll/bft;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->G4()V

    return-void
.end method

.method public static synthetic q4(Ll/bft;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->L4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r4(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bft;->R4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method private synthetic z4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bft;->c5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic B4(Ll/dft;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Ll/dft;->a:Z

    .line 2
    .line 3
    iget-object v1, p1, Ll/dft;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dft;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {p0, v2, v0, v1, p1}, Ll/bft;->m5(ZZLjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic C4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bft;->Y4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/bft;->Z4()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final synthetic D4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget v0, p0, Ll/bft;->l:I

    .line 10
    .line 11
    const/4 v1, 0x5

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iput v1, p0, Ll/bft;->l:I

    .line 16
    .line 17
    check-cast p1, Ll/v9s;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/bft;->W4(Ll/v9s;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic E4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p0, v1, p1, v0}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic F4()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p0, v2, v0, v1}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic G4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCall()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic I4(ZLjava/lang/String;Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bft;->n5(ZLjava/lang/String;Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ep10;

    .line 5
    .line 6
    sget-object p2, Ll/cd10;->d:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p3, p4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->multiCallOrder:Ljava/lang/String;

    .line 9
    .line 10
    iget p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->maxCallNum:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p4, v0}, Ll/bf10;->u(IZ)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    const/4 v0, -0x1

    .line 18
    invoke-direct {p1, p2, p3, p4, v0}, Ll/ep10;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->startLiveMultiCall()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic J4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 2
    .line 3
    const-string v1, "jailed"

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
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->eb:I

    .line 24
    .line 25
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 26
    .line 27
    invoke-static {v3, v4}, Ll/pzi0;->p(D)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/tet;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/tet;-><init>(Ll/bft;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final synthetic L4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/bft;->X4(Ljava/lang/Throwable;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic M4(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "anchor_stop_live_confirm"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/mu40;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/bft;->o5(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic N4()V
    .locals 2

    .line 1
    const-string v0, "anchor_stop_live_confirm"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v0, v1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/mu40;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/bft;->o5(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic O4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/bft;->i5()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/mu40;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mu40;->K2()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p2, v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f4(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic P4(ZLjava/lang/String;Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "friends"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/bft;->a5(ZLjava/lang/String;Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Ll/bft;->n5(ZLjava/lang/String;Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic Q4(ZLjava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, -0x3

    .line 2
    iput v0, p0, Ll/bft;->l:I

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p2, v0}, Ll/bft;->X4(Ljava/lang/Throwable;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/bft;->d5(Ljava/lang/Throwable;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic R4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, p1, v0}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic S4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, p1, v0}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bft;->p5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->recoverLive()Ll/v3f$c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/rdt;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/rdt;-><init>(Ll/bft;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->stopLive()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lrx/c;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/cet;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/cet;-><init>(Ll/bft;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->suspendLive()Ll/v3f$d;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lrx/c;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/net;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/net;-><init>(Ll/bft;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lrx/c;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/uet;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/uet;-><init>(Ll/bft;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 140
    .line 141
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->startLive()Ll/v3f$d;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Lrx/c;

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/vet;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/vet;-><init>(Ll/bft;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    new-instance v1, Ll/wet;

    .line 176
    .line 177
    invoke-direct {v1, p0}, Ll/wet;-><init>(Ll/bft;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Ll/mu40;

    .line 192
    .line 193
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v1, Ll/xet;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/xet;-><init>(Ll/bft;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Ll/mu40;

    .line 218
    .line 219
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance v1, Ll/yet;

    .line 226
    .line 227
    invoke-direct {v1, p0}, Ll/yet;-><init>(Ll/bft;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    iput-object v0, p0, Ll/bft;->m:Ll/kcg0;

    .line 239
    .line 240
    return-void
.end method

.method public final synthetic T4(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/mu40;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/dw40;->B2()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ll/mu40;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/mu40;->R2()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ll/get;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/get;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/het;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/het;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final synthetic U4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/mu40;

    .line 15
    .line 16
    sget-object v0, Ll/qcu;->b:Ll/qcu;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ll/mu40;->h(Ll/jsv;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bft;->e5()V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/z310;

    .line 25
    .line 26
    const/16 v0, 0xa28

    .line 27
    .line 28
    invoke-direct {p2, v0}, Ll/z310;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ll/h0m;

    .line 36
    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    invoke-interface {p2}, Ll/h0m;->b()V

    .line 40
    .line 41
    .line 42
    :cond_0
    const/4 p2, 0x2

    .line 43
    iput p2, p0, Ll/bft;->l:I

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p2, p1}, Ll/bft;->t4(ILcom/p1/mobile/android/app/c;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public final synthetic V4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, -0x2

    .line 2
    iput p1, p0, Ll/bft;->l:I

    .line 3
    .line 4
    return-void
.end method

.method public final W4(Ll/v9s;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/v9s;->l()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/v9s;->n()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/mu40;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/dw40;->A2()Ll/ew40;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Ll/mu40;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Ll/mu40;

    .line 68
    .line 69
    invoke-virtual {v4}, Ll/mu40;->J2()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Ll/mu40;

    .line 78
    .line 79
    invoke-virtual {v5}, Ll/vp20;->x()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/IntlLiveEndAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Ll/mu40;

    .line 104
    .line 105
    invoke-virtual {v1}, Ll/dw40;->A2()Ll/ew40;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Ll/mu40;

    .line 118
    .line 119
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    check-cast v4, Ll/mu40;

    .line 128
    .line 129
    invoke-virtual {v4}, Ll/mu40;->J2()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    check-cast v5, Ll/mu40;

    .line 138
    .line 139
    invoke-virtual {v5}, Ll/vp20;->x()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const-string v0, ""

    .line 156
    .line 157
    invoke-static {p1, v0, v3}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public X4(Ljava/lang/Throwable;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_c

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 15
    .line 16
    const v1, 0xa030

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eq v0, v1, :cond_a

    .line 21
    .line 22
    const v1, 0xa03c

    .line 23
    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    const p1, 0xa028

    .line 30
    .line 31
    .line 32
    if-eq v0, p1, :cond_9

    .line 33
    .line 34
    const p1, 0xa02a

    .line 35
    .line 36
    .line 37
    if-ne v0, p1, :cond_1

    .line 38
    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_1
    const p1, 0xa032

    .line 42
    .line 43
    .line 44
    if-ne v0, p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/bft;->h5()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const p1, 0xa02d

    .line 51
    .line 52
    .line 53
    if-ne v0, p1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H2:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    goto/16 :goto_3

    .line 66
    .line 67
    :cond_3
    const p1, 0xa036

    .line 68
    .line 69
    .line 70
    if-eq v0, p1, :cond_8

    .line 71
    .line 72
    const p1, 0xa039

    .line 73
    .line 74
    .line 75
    if-eq v0, p1, :cond_8

    .line 76
    .line 77
    const p1, 0xa03a

    .line 78
    .line 79
    .line 80
    if-ne v0, p1, :cond_4

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    const p1, 0xa037

    .line 84
    .line 85
    .line 86
    if-ne v0, p1, :cond_5

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->cb:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    goto :goto_3

    .line 99
    :cond_5
    const p1, 0xa031

    .line 100
    .line 101
    .line 102
    if-ne v0, p1, :cond_6

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->P:I

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    goto :goto_3

    .line 115
    :cond_6
    const p1, 0xa052

    .line 116
    .line 117
    .line 118
    if-ne v0, p1, :cond_7

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G2:I

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance v2, Ll/ket;

    .line 131
    .line 132
    invoke-direct {v2, p0}, Ll/ket;-><init>(Ll/bft;)V

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_7
    const-string p1, ""

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_8
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->x:I

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    goto :goto_3

    .line 150
    :cond_9
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0}, Ll/bft;->y4()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_b

    .line 165
    .line 166
    new-instance v2, Ll/jet;

    .line 167
    .line 168
    invoke-direct {v2, p0}, Ll/jet;-><init>(Ll/bft;)V

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_a
    :goto_2
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 173
    .line 174
    :cond_b
    :goto_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_c

    .line 179
    .line 180
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    const/4 p2, 0x0

    .line 193
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 202
    .line 203
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    new-instance p2, Ll/let;

    .line 208
    .line 209
    invoke-direct {p2, v2}, Ll/let;-><init>(Ll/x20;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_c
    if-eqz p2, :cond_d

    .line 221
    .line 222
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 223
    .line 224
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 225
    .line 226
    .line 227
    :cond_d
    return-void
.end method

.method public Y4()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/bft;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/bft;->i:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v1, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/bft;->y4()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sget-object v3, Ll/v2t;->b:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v5, "onResume:"

    .line 36
    .line 37
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v5, p0, Ll/bft;->k:Z

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v5, ":"

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-boolean v6, p0, Ll/bft;->j:Z

    .line 51
    .line 52
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v6, p0, Ll/bft;->l:I

    .line 59
    .line 60
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-static {v3, v4}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-boolean v3, p0, Ll/bft;->k:Z

    .line 77
    .line 78
    if-nez v3, :cond_2

    .line 79
    .line 80
    iget-boolean v3, p0, Ll/bft;->j:Z

    .line 81
    .line 82
    if-nez v3, :cond_2

    .line 83
    .line 84
    iget v3, p0, Ll/bft;->l:I

    .line 85
    .line 86
    const/4 v4, -0x2

    .line 87
    if-eq v3, v4, :cond_1

    .line 88
    .line 89
    if-eq v3, v2, :cond_1

    .line 90
    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    :cond_1
    const/4 v1, 0x3

    .line 94
    iput v1, p0, Ll/bft;->l:I

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Ll/mu40;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v2, "manual"

    .line 107
    .line 108
    invoke-virtual {p0, v0, v1, v2}, Ll/bft;->l5(ZLjava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    :goto_0
    return-void
.end method

.method public Z4()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/bft;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/mu40;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/jsv;->d()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget v0, p0, Ll/bft;->l:I

    .line 50
    .line 51
    const/4 v2, 0x4

    .line 52
    if-eq v0, v2, :cond_3

    .line 53
    .line 54
    const/4 v2, -0x3

    .line 55
    if-ne v0, v2, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    :goto_0
    return-void

    .line 59
    :cond_3
    :goto_1
    invoke-virtual {p0, v1}, Ll/bft;->q5(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final a5(ZLjava/lang/String;Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O7(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    new-instance v1, Ll/met;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/met;-><init>(Ll/bft;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/oet;

    .line 16
    .line 17
    invoke-direct {v1, p3}, Ll/oet;-><init>(Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

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
    new-instance v1, Ll/pet;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, p2, p3}, Ll/pet;-><init>(Ll/bft;ZLjava/lang/String;Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/qet;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/qet;-><init>(Ll/bft;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final b5(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, -0x3

    .line 19
    iput p1, p0, Ll/bft;->l:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c5()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/bft;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/bft;->j:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    iput v0, p0, Ll/bft;->l:I

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/mu40;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "manual"

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p0, v2, v0, v1}, Ll/bft;->l5(ZLjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final d5(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const p2, 0xa028

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p1}, Ll/yvr;->b(ILjava/lang/Throwable;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyRecoverLiveStopped()Ll/v3f$c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final e5()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/z310;

    .line 9
    .line 10
    const/16 v1, 0xa28

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/h0m;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->k1()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final f5(Ljava/lang/String;Ljava/lang/String;ILl/x20;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, p3}, Ll/bft;->v4(I)Ljava/lang/CharSequence;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {v0, p3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    sget v0, Ll/n9c0;->Q:I

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Ll/bft;->w4(Ljava/lang/String;I)Landroid/text/SpannableString;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p3, p0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/bri0;

    .line 50
    .line 51
    invoke-direct {p1, p4}, Ll/bri0;-><init>(Ll/x20;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p2, p1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    new-instance p1, Ll/bri0;

    .line 82
    .line 83
    invoke-direct {p1, p4}, Ll/bri0;-><init>(Ll/x20;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final g5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/iet;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Ll/iet;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final h5()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/ret;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ret;-><init>(Ll/bft;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/set;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/set;-><init>(Ll/bft;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public j5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/th0$a;

    .line 8
    .line 9
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/aet;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/aet;-><init>(Ll/bft;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget p2, Ll/n9c0;->d:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p2, Ll/bet;

    .line 76
    .line 77
    invoke-direct {p2, p0}, Ll/bet;-><init>(Ll/bft;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 89
    .line 90
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public k5()V
    .locals 3

    .line 1
    new-instance v0, Ll/pfu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pfu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/pfu;->j()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v1, Ll/fet;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/fet;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, p0, v2, v1}, Ll/pfu;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public l5(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/bft;->m5(ZZLjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m5(ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Za:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    check-cast p3, Ll/mu40;

    .line 22
    .line 23
    invoke-virtual {p3}, Ll/dw40;->B2()Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    check-cast p3, Ll/mu40;

    .line 34
    .line 35
    invoke-virtual {p3}, Ll/mu40;->R2()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    new-instance v0, Ll/aft;

    .line 40
    .line 41
    invoke-direct {v0, p0, p4}, Ll/aft;-><init>(Ll/bft;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p3, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    check-cast p3, Ll/mu40;

    .line 54
    .line 55
    invoke-virtual {p3}, Ll/vp20;->o()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-direct {p0}, Ll/bft;->i5()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ll/mu40;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/mu40;->K2()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {p3, v0, v1, p4}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f4(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    :goto_0
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 78
    .line 79
    const-string v1, "create_live_room"

    .line 80
    .line 81
    const-string v2, "createLive"

    .line 82
    .line 83
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/sdt;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/sdt;-><init>(Ll/bft;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p3, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    invoke-virtual {p0, p3}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    new-instance v0, Ll/tdt;

    .line 100
    .line 101
    invoke-direct {v0, p0, p1, p4}, Ll/tdt;-><init>(Ll/bft;ZLjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    new-instance p1, Ll/udt;

    .line 105
    .line 106
    invoke-direct {p1, p0, p2}, Ll/udt;-><init>(Ll/bft;Z)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bft;->m:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n5(ZLjava/lang/String;Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x4

    .line 9
    iput p2, p0, Ll/bft;->l:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p2, v0}, Ll/bft;->t4(ILcom/p1/mobile/android/app/c;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 25
    .line 26
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/mu40;

    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/mu40;

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ll/oo2;->R(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    const-string p1, "anchor_live_started"

    .line 51
    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-static {p0, p1, p2}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 57
    .line 58
    const-string p2, "create_live_room"

    .line 59
    .line 60
    const-string v0, "startLiveSuccess"

    .line 61
    .line 62
    invoke-virtual {p1, p2, v0}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/bft;->k5()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ll/mu40;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/mu40;->O2()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->onObsLiveStart()Ll/v3f$d;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    new-instance p1, Ll/fa50;

    .line 91
    .line 92
    iget-object p2, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 99
    .line 100
    invoke-direct {p1, p2, p3}, Ll/fa50;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ll/mu40;

    .line 112
    .line 113
    sget-object p1, Ll/j2t;->c:Ll/j2t;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ll/mu40;->h(Ll/jsv;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public o5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/bft;->k:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bft;->e5()V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/z310;

    .line 8
    .line 9
    const/16 v2, 0xa28

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ll/z310;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/h0m;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/h0m;->b()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->liveEndEvent()Ll/v3f$c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Ll/bf10;->H(Ll/i6t;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->X2:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Ll/det;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/det;-><init>(Ll/bft;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/eet;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/eet;-><init>(Ll/bft;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final p5()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/zet;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/zet;-><init>(Ll/bft;)V

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

.method public q5(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/qc80;

    .line 4
    .line 5
    const/16 v1, 0xce4

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    new-instance v0, Ll/ml50;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ll/ml50;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-boolean v0, p0, Ll/bft;->j:Z

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    iget-boolean v0, p0, Ll/bft;->k:Z

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 v0, 0x1

    .line 62
    iput v0, p0, Ll/bft;->l:I

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/mu40;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/4 v1, 0x0

    .line 75
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/vdt;

    .line 80
    .line 81
    invoke-direct {v1, p0, p1}, Ll/vdt;-><init>(Ll/bft;Z)V

    .line 82
    .line 83
    .line 84
    new-instance p1, Ll/wdt;

    .line 85
    .line 86
    invoke-direct {p1, p0}, Ll/wdt;-><init>(Ll/bft;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_0
    return-void
.end method

.method public final s4(ZLjava/lang/String;Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/mu40;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_3

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/mu40;

    .line 31
    .line 32
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/mu40;->h(Ll/jsv;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    new-instance p1, Ll/z310;

    .line 39
    .line 40
    const/16 v0, 0xa28

    .line 41
    .line 42
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ll/h0m;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/bft;->e5()V

    .line 52
    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-interface {p1}, Ll/h0m;->b()V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-boolean p1, p0, Ll/bft;->k:Z

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const/4 p1, 0x1

    .line 65
    iput-boolean p1, p0, Ll/bft;->j:Z

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Ll/mu40;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Ll/mu40;

    .line 88
    .line 89
    new-instance p1, Ll/v9s;

    .line 90
    .line 91
    invoke-direct {p1, p2, p3}, Ll/v9s;-><init>(Ljava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/mu40;->h(Ll/jsv;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_0
    return-void
.end method

.method public final t4(ILcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/mu40;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "manual"

    .line 20
    .line 21
    invoke-virtual {p0, v1, p1, p2}, Ll/bft;->l5(ZLjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p2, v0, :cond_1

    .line 28
    .line 29
    const/4 p2, 0x4

    .line 30
    if-ne p1, p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/bft;->q5(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public u4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ll/h880;

    .line 26
    .line 27
    const/16 v1, 0xce4

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ll/h880;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->va:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/gu70;

    .line 55
    .line 56
    const/16 v2, 0x258

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ll/gu70;-><init>(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p0, v0, v1, v2}, Ll/bft;->j5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {p0, v0}, Ll/bu10;->a(Ll/i6t;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const-string v1, ""

    .line 92
    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o9:I

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 110
    .line 111
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {p0, v1, v0, v2}, Ll/bft;->j5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-static {p0}, Ll/bf10;->P(Ll/i6t;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->J7:I

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 140
    .line 141
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {p0, v1, v0, v2}, Ll/bft;->j5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Ll/mu40;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/mu40;->O2()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_4

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Uc:I

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    goto :goto_0

    .line 172
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pj:I

    .line 177
    .line 178
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    check-cast v2, Ll/mu40;

    .line 187
    .line 188
    invoke-virtual {v2}, Ll/mu40;->O2()Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_5

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->b:I

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    goto :goto_1

    .line 205
    :cond_5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z2:I

    .line 210
    .line 211
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    :goto_1
    invoke-virtual {p0, v1, v0, v2}, Ll/bft;->j5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public final v4(I)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    const/16 v0, 0x103

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q5:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget v0, Ll/n9c0;->y0:I

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/bft;->w4(Ljava/lang/String;I)Landroid/text/SpannableString;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, ""

    .line 29
    .line 30
    return-object p0
.end method

.method public final w4(Ljava/lang/String;I)Landroid/text/SpannableString;
    .locals 2

    .line 1
    new-instance p0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 7
    .line 8
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-direct {v0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/16 p2, 0x21

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public final x4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x2

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, -0x1

    .line 14
    sparse-switch v1, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_0
    const-string v1, "delete_manager"

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
    goto :goto_0

    .line 27
    :cond_0
    const/4 v5, 0x6

    .line 28
    goto :goto_0

    .line 29
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v5, 0x5

    .line 39
    goto :goto_0

    .line 40
    :sswitch_2
    const-string v1, "force_stop"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 v5, 0x4

    .line 50
    goto :goto_0

    .line 51
    :sswitch_3
    const-string v1, "stop"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    const/4 v5, 0x3

    .line 61
    goto :goto_0

    .line 62
    :sswitch_4
    const-string v1, "re_request_room_gift_list"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    move v5, v2

    .line 72
    goto :goto_0

    .line 73
    :sswitch_5
    const-string v1, "system"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    move v5, v4

    .line 83
    goto :goto_0

    .line 84
    :sswitch_6
    const-string v1, "add_manager"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_6

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    move v5, v3

    .line 94
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    goto/16 :goto_2

    .line 98
    .line 99
    :pswitch_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 100
    .line 101
    if-nez v0, :cond_7

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ll/mu40;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/ydt;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/ydt;-><init>(Ll/bft;)V

    .line 124
    .line 125
    .line 126
    new-instance p0, Ll/zdt;

    .line 127
    .line 128
    invoke-direct {p0}, Ll/zdt;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    goto/16 :goto_2

    .line 139
    .line 140
    :cond_7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0, v4, v0, v3}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_2

    .line 154
    .line 155
    :pswitch_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {p0, v4, v0, v4}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 158
    .line 159
    .line 160
    goto/16 :goto_2

    .line 161
    .line 162
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p0, v4, v0, v4}, Ll/bft;->s4(ZLjava/lang/String;Z)V

    .line 173
    .line 174
    .line 175
    goto :goto_2

    .line 176
    :pswitch_3
    invoke-static {v3}, Ll/muj;->w(Z)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Ll/mu40;

    .line 184
    .line 185
    new-instance v1, Ll/uxj$a;

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    check-cast v3, Ll/mu40;

    .line 192
    .line 193
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    check-cast p0, Ll/mu40;

    .line 202
    .line 203
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 208
    .line 209
    const-string v4, "live"

    .line 210
    .line 211
    invoke-direct {v1, v3, p0, v4}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Ll/uxj$a;->f()Ll/uxj;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    const/4 v1, 0x0

    .line 219
    invoke-virtual {v0, p0, v1}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :pswitch_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 224
    .line 225
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-nez v1, :cond_8

    .line 230
    .line 231
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 236
    .line 237
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    goto :goto_1

    .line 242
    :cond_8
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 247
    .line 248
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    :goto_1
    iget v3, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->templateId:I

    .line 253
    .line 254
    new-instance v4, Ll/xdt;

    .line 255
    .line 256
    invoke-direct {v4}, Ll/xdt;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v0, v1, v3, v4}, Ll/bft;->f5(Ljava/lang/String;Ljava/lang/String;ILl/x20;)V

    .line 260
    .line 261
    .line 262
    goto :goto_2

    .line 263
    :pswitch_5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    check-cast v0, Ll/mu40;

    .line 268
    .line 269
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    check-cast p0, Ll/mu40;

    .line 274
    .line 275
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-virtual {v0, p0}, Ll/dw40;->K1(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :goto_2
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    if-nez p0, :cond_9

    .line 287
    .line 288
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    const-string p1, "[live]"

    .line 293
    .line 294
    const-string v0, "[passivity_exit]"

    .line 295
    .line 296
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-static {p0, p1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :cond_9
    return-void

    .line 304
    nop

    .line 305
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_6
        -0x34e38dd1 -> :sswitch_5
        -0x33a7a8db -> :sswitch_4
        0x360802 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method public final y4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jsv;->g()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
