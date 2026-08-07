.class public Ll/zed0;
.super Ll/n54;
.source "SourceFile"


# instance fields
.field public final l:Ll/nv2;

.field public m:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/z34;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Ll/n54;-><init>(Ll/dum;Ll/z34;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/zed0;->m:Lrx/subjects/a;

    .line 13
    .line 14
    iget-object v0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 15
    .line 16
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/nv2;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/nv2;-><init>(Ll/dum;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/nv2;

    .line 31
    .line 32
    iput-object v0, p0, Ll/zed0;->l:Ll/nv2;

    .line 33
    .line 34
    new-instance v0, Ll/o91;

    .line 35
    .line 36
    invoke-direct {v0, p1, p0}, Ll/o91;-><init>(Ll/dum;Ll/zed0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/d24;

    .line 43
    .line 44
    iget-object v1, p2, Ll/z34;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 45
    .line 46
    invoke-direct {v0, p1, v1, p0}, Ll/d24;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/zed0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/m14;

    .line 53
    .line 54
    iget-object p2, p2, Ll/z34;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 55
    .line 56
    invoke-direct {v0, p1, p0, p2}, Ll/m14;-><init>(Ll/dum;Ll/zed0;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 60
    .line 61
    .line 62
    new-instance p2, Ll/t14;

    .line 63
    .line 64
    invoke-direct {p2, p1, p0}, Ll/t14;-><init>(Ll/dum;Ll/zed0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic A4(Ll/zed0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->P4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic B4(Ll/zed0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->U4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D4(Ll/zed0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->Y4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic E4(Ll/zed0;Ll/j2s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->e5(Ll/j2s;)V

    return-void
.end method

.method public static synthetic F4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic G4(Ll/zed0;Ll/qvd;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->d5(Ll/qvd;)V

    return-void
.end method

.method public static synthetic H4(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic I4(Ll/zed0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->S4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic J4(Ll/zed0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zed0;->c5(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic c5(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/q24;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic o4(Ll/zed0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->Z4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p4(Ll/zed0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->V4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic q4(Ll/zed0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->X4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic t4(Ll/zed0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->R4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic u4(Ll/zed0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->T4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v4(Ll/zed0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->b5(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic w4(Ljava/util/List;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x4(Ll/zed0;Ll/v24;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->a5(Ll/v24;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y4(Ll/zed0;Ll/j2s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->W4(Ll/j2s;)V

    return-void
.end method

.method public static synthetic z4(Ll/qvd;)Ljava/lang/Boolean;
    .locals 1

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
    invoke-virtual {p0, v0}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method


# virtual methods
.method public K4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T3(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/ped0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ped0;-><init>(Ll/zed0;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/qed0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/qed0;-><init>(Ll/zed0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public L4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/gyb;

    .line 13
    .line 14
    const/16 v1, 0x1130

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/gyb;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/fyb;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v2, "checkCtypChanged newCtyp is  "

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget v2, v0, Ll/fyb;->a:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Ll/g64;->d(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget v1, v0, Ll/fyb;->a:I

    .line 48
    .line 49
    const/4 v2, 0x2

    .line 50
    if-ne v1, v2, :cond_2

    .line 51
    .line 52
    iget v0, v0, Ll/fyb;->c:F

    .line 53
    .line 54
    const/high16 v1, 0x3f800000    # 1.0f

    .line 55
    .line 56
    cmpl-float v0, v0, v1

    .line 57
    .line 58
    if-lez v0, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 61
    .line 62
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object p0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 69
    .line 70
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final M4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "hung-up"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zed0;->m:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    return-object p0
.end method

.method public O4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zed0;->m:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final P4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/zed0;->i5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p1}, Ll/u54;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {p1}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public final Q4(Ll/v24;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleBackEvent "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/v24;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-virtual {p1}, Ll/v24;->d()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-static {v0}, Ll/u54;->d(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-static {v0}, Ll/u54;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Ll/zed0;->k5(Ll/v24;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_2
    invoke-static {v0}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/v24;->f()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0}, Ll/zed0;->k5(Ll/v24;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    invoke-static {v0, p1}, Ll/u54;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/v24;)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 89
    .line 90
    return-object p0
.end method

.method public final synthetic R4(Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic S4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/n54;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zed0;->f5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->roomCall()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic T4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public U3(Ll/y34;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Ll/n54;->U3(Ll/y34;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic U4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic V4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/zed0;->g5(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W4(Ll/j2s;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->n4(Ll/j2s;)V

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
    invoke-virtual {p1, v0}, Ll/j2s;->j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/zed0;->l5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic X4(Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Y4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/zed0;->K4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/n54;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a5(Ll/v24;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->Q4(Ll/v24;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b5(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zed0;->L4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d5(Ll/qvd;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic e5(Ll/j2s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->n4(Ll/j2s;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f5()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ded0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/ded0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

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
    new-instance v1, Ll/oed0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/oed0;-><init>(Ll/zed0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/red0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/red0;-><init>(Ll/zed0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/sed0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/sed0;-><init>(Ll/zed0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/zed0;->n:Ll/kcg0;

    .line 50
    .line 51
    return-void
.end method

.method public final g5(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/hed0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/hed0;-><init>(Ll/zed0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/n54;->Y3(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->k4(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/ied0;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/ied0;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/jed0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/jed0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final h5(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l4(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/med0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/med0;-><init>(Ll/zed0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ned0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ned0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/n54;->i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/16 v0, 0xd

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 32
    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->a0:I

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_5

    .line 56
    .line 57
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q1:I

    .line 58
    .line 59
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/zed0;->M4()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    const/16 v0, 0x19

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->B1:I

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 93
    .line 94
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    const/16 v0, 0x15

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->V:I

    .line 132
    .line 133
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_4
    const/16 v0, 0x1e

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    sget-object v0, Ll/q24;->b:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_5

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v0}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_5

    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 174
    .line 175
    .line 176
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->i1:I

    .line 177
    .line 178
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 179
    .line 180
    .line 181
    :cond_5
    return-void
.end method

.method public final i5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/u54;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->callSummary()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zed0;->M4()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {p1}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 63
    .line 64
    if-ne v0, v1, :cond_2

    .line 65
    .line 66
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 73
    .line 74
    if-ne v0, v1, :cond_2

    .line 75
    .line 76
    :goto_0
    return-void

    .line 77
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v1, "send self call state: id "

    .line 80
    .line 81
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/zed0;->m:Lrx/subjects/a;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/n54;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final k5(Ll/v24;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, p1}, Ll/u54;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/v24;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {v0, p1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Ll/n9c0;->p0:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Ll/u54;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->O1:I

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance v0, Ll/ked0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/ked0;-><init>(Ll/zed0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Ll/th0$a;->l(Landroid/content/DialogInterface$OnCancelListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l1:I

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    new-instance v0, Ll/led0;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/led0;-><init>(Ll/zed0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    :goto_0
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final l5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/zed0;->h5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/zed0;->M4()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->callSummary()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/zed0;->M4()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/zed0;->n:Ll/kcg0;

    .line 43
    .line 44
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public n4(Ll/j2s;)V
    .locals 2

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
    invoke-virtual {p1, v0}, Ll/j2s;->j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/zed0;->M4()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Ll/n54;->n4(Ll/j2s;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/n54;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ted0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ted0;-><init>(Ll/zed0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/v24;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/zed0;->O4()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ued0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ued0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/ved0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ved0;-><init>(Ll/zed0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lrx/c;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->videoSizeChanged()Ll/v3f$d;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lrx/c;

    .line 74
    .line 75
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/wed0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/wed0;-><init>(Ll/zed0;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->roomCall()Ll/v3f$d;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lrx/c;

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/xed0;

    .line 116
    .line 117
    invoke-direct {v1}, Ll/xed0;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/yed0;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/yed0;-><init>(Ll/zed0;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ll/n54;->a4()Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ll/eed0;

    .line 145
    .line 146
    invoke-direct {v1}, Ll/eed0;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Ll/fed0;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Ll/fed0;-><init>(Ll/zed0;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Ll/dw40;

    .line 170
    .line 171
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 180
    .line 181
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;->onVoiceCallIds:Ljava/util/List;

    .line 182
    .line 183
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_0

    .line 188
    .line 189
    new-instance v0, Ll/ged0;

    .line 190
    .line 191
    invoke-direct {v0, p0}, Ll/ged0;-><init>(Ll/zed0;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v0}, Ll/n54;->Y3(Ll/y20;)V

    .line 195
    .line 196
    .line 197
    :cond_0
    invoke-virtual {p0}, Ll/zed0;->L4()V

    .line 198
    .line 199
    .line 200
    return-void
.end method
