.class public Ll/s950;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/pwl;
.implements Ll/y2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;",
        "Ll/pwl;",
        "Ll/y2m;"
    }
.end annotation


# instance fields
.field public final i:Ll/uxh0;

.field public final j:Ll/ea50;

.field public final k:Landroid/widget/FrameLayout;

.field public l:Ll/ef80;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/s950;->k:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    new-instance p2, Ll/ea50;

    .line 7
    .line 8
    invoke-direct {p2, p1, p0}, Ll/ea50;-><init>(Ll/dum;Ll/y2m;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/ea50;

    .line 16
    .line 17
    iput-object p1, p0, Ll/s950;->j:Ll/ea50;

    .line 18
    .line 19
    new-instance p1, Ll/ef80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/ef80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/s950;->l:Ll/ef80;

    .line 25
    .line 26
    new-instance p1, Ll/uxh0;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/uxh0;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/s950;->i:Ll/uxh0;

    .line 32
    .line 33
    invoke-static {}, Ll/df80;->a()Ll/df80;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p2, 0x1

    .line 38
    invoke-virtual {p0, p2}, Ll/df80;->b(Z)Ll/qwl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Ll/uxh0;->y(Ll/qwl;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic J3(Ll/s950;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->W3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic K3(Ll/s950;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->V3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ll/s950;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s950;->T3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic M3(Ll/s950;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->X3(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/s950;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->Y3(Ljava/lang/Long;)V

    return-void
.end method

.method private T3(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0}, Ll/s950;->d4()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Ll/uxh0;->u(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    invoke-virtual {p0}, Ll/s950;->Z3()V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Ll/s950;->i4(Ll/jsv;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private d4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/s950;->i:Ll/uxh0;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ll/uxh0;->u(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public D0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->onVideoEnable()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public F1()V
    .locals 0

    .line 1
    return-void
.end method

.method public M0()Ll/ef80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    return-object p0
.end method

.method public O()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/wg80;->h(Ll/i6t;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final O3()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lti;->f()Z

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
    iget-object p0, p0, Ll/s950;->i:Ll/uxh0;

    .line 9
    .line 10
    const-string v0, "live"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/uxh0;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public P0(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->n(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/s950;->P3(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ef80;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/s950;->l:Ll/ef80;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Ll/ef80;->l(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/s950;->h4(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/s950;->h4(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ef80;->p(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R3()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_1
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/s950;->h4(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "audience retryConnect"

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/s950;->j:Ll/ea50;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ea50;->i4()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/s950;->P3(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/s950;->U3()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/s950;->O3()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/s950;->c4()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ll/ef80;->n(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final U3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/uxh0;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/s950;->i:Ll/uxh0;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Ll/uxh0;->t(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Ll/s950;->m(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic V3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/ef80;->l(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s950;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->onVideoEnable()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/uxh0;->j()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/s950;->i:Ll/uxh0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/uxh0;->j()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic Y3(Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s950;->m:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    iget-object v2, p0, Ll/s950;->k:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/dw40;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/vp20;->x()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/dw40;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    move-object v3, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Ll/uxh0;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Landroid/widget/FrameLayout;Ll/pwl;Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final Z3()V
    .locals 2

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/dw40;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 19
    .line 20
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->useCurrentPullStream:Z

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/s950;->i:Ll/uxh0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/uxh0;->k()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "useCurrentPull : false, isStartPlay:true"

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0, v0}, Ll/s950;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final a4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)I
    .locals 6

    .line 1
    iput-object p1, p0, Ll/s950;->m:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/s950;->k:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/dw40;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/vp20;->x()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/dw40;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    move-object v3, p0

    .line 28
    move-object v1, p1

    .line 29
    invoke-virtual/range {v0 .. v5}, Ll/uxh0;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Landroid/widget/FrameLayout;Ll/pwl;Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public b4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uxh0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/ef80;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/s950;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c0(Ll/fyb;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    iget v1, p1, Ll/fyb;->a:I

    .line 4
    .line 5
    iget v2, p1, Ll/fyb;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ef80;->j(II)V

    .line 8
    .line 9
    .line 10
    iget p1, p1, Ll/fyb;->a:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/s950;->f4(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final c4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

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
    new-instance v1, Ll/n950;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/n950;-><init>(Ll/s950;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->enterRoomFail()Ll/v3f$c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lrx/c;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/o950;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/o950;-><init>(Ll/s950;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->startObsPlay()Ll/v3f$d;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lrx/c;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/p950;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/p950;-><init>(Ll/s950;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Ll/dw40;

    .line 96
    .line 97
    const/4 v1, 0x3

    .line 98
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/q950;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/q950;-><init>(Ll/s950;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/r950;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/r950;-><init>(Ll/s950;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public e4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s950;->i:Ll/uxh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uxh0;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f2()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f4(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p1, v1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-eq p1, v1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    move v1, v0

    .line 12
    :cond_1
    invoke-virtual {p0, v0, v1}, Ll/s950;->g4(ZI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g4(ZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public h4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final i4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jsv;->h()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPlayerEvent;->onVideoEnable()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/dw40;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/vp20;->r()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/s950;->l:Ll/ef80;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p1, v0}, Ll/ef80;->n(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/s950;->l:Ll/ef80;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/ef80;->l(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/s950;->R3()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ef80;->i()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/uxh0;->x()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s950;->e4()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/z91;->b()J

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/s950;->i:Ll/uxh0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/uxh0;->f()V

    .line 20
    .line 21
    .line 22
    invoke-super {p0}, Ll/i6t;->n()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/s950;->m(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0()V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K9:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/o1j0;->A(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ef80;->o(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/ef80;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public u1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s950;->l:Ll/ef80;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/ef80;->n(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
