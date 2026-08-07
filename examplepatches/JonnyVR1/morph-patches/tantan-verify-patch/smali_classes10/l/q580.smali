.class public Ll/q580;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/animation/Animator;

.field public i:Landroid/view/View;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VImage;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VImage;

.field public v:Landroid/widget/TextView;

.field public w:Lv/VText;

.field public x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public y:Ljava/lang/String;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "valid_time"

    .line 5
    .line 6
    iput-object p1, p0, Ll/q580;->y:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "invalid_time"

    .line 9
    .line 10
    iput-object p1, p0, Ll/q580;->z:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 14
    .line 15
    return-void
.end method

.method private A4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    move p1, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    :goto_0
    iget-object v1, p0, Ll/q580;->v:Landroid/widget/TextView;

    .line 21
    .line 22
    if-lez p1, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    :cond_1
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/q580;->v:Landroid/widget/TextView;

    .line 29
    .line 30
    const/16 v0, 0x32

    .line 31
    .line 32
    if-lt p1, v0, :cond_2

    .line 33
    .line 34
    const-string p1, "50+"

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method private C4(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private D4()V
    .locals 5

    .line 1
    sget-object v0, Ll/efv;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v1, 0x258

    .line 14
    .line 15
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 24
    .line 25
    const-wide v3, 0x3fd999999999999aL    # 0.4

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x50

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic J3(Ll/q580;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->n4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->p4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M3(Ll/q580;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q580;->u4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic N3(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->r4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/q580;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->z4(I)V

    return-void
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S3(Ll/q580;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q580;->k4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T3(Ll/q580;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q580;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic U3(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->q4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V3(Ll/q580;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q580;->v4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W3(Ll/q580;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->w4(Ll/hct;)V

    return-void
.end method

.method public static synthetic X3(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->m4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y3(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->o4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z3(Ll/q580;Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q580;->l4(Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b4(Ll/q580;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q580;->t4(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c4(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->s4(Landroid/view/View;)V

    return-void
.end method

.method private f4()V
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
    const-string v0, ""

    .line 9
    .line 10
    const/16 v1, 0x32

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D5(Ljava/lang/String;I)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/d580;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/d580;-><init>(Ll/q580;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/e580;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/e580;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->E5()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/f580;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/f580;-><init>(Ll/q580;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private g4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/q580;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 15
    .line 16
    new-instance v1, Ll/b580;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/b580;-><init>(Ll/q580;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private h4(IIII)Z
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/Calendar;

    .line 17
    .line 18
    const/16 v1, 0xb

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0xc

    .line 24
    .line 25
    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->set(II)V

    .line 26
    .line 27
    .line 28
    const/16 p2, 0xd

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, p2, v3}, Ljava/util/Calendar;->set(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Ljava/util/Calendar;

    .line 39
    .line 40
    invoke-virtual {v4, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4, v2, p4}, Ljava/util/Calendar;->set(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, p2, v3}, Ljava/util/Calendar;->set(II)V

    .line 47
    .line 48
    .line 49
    const/4 p2, 0x1

    .line 50
    if-gt p1, p3, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0, v4}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    return p2

    .line 65
    :cond_0
    return v3

    .line 66
    :cond_1
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0, v4}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return v3

    .line 80
    :cond_3
    :goto_0
    return p2
.end method

.method private i4()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->timeRanges:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/c580;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/c580;-><init>(Ll/q580;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method private synthetic m4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q580;->D4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/q580;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private synthetic o4(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/q580;->y:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/q580;->q:Lv/VImage;

    .line 16
    .line 17
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->startRandomSeek()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->startRandomSeek()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    sget p0, Ll/fct;->m:I

    .line 67
    .line 68
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private synthetic p4(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/a580;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/a580;-><init>(Ll/q580;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/q580;->C4(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic q4(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/q580;->y:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-static {p0, p1}, Ll/su70;->b(Ll/i6t;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget p0, Ll/fct;->m:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic r4(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/h580;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/h580;-><init>(Ll/q580;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/q580;->C4(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic s4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w4(Ll/hct;)V
    .locals 2

    .line 1
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/q580;->B4()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l7()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/i580;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/i580;-><init>(Ll/q580;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/j580;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/j580;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->k7()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/k580;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/k580;-><init>(Ll/q580;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/l580;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/l580;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Ll/q580;->e4()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private z4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/q580;->v:Landroid/widget/TextView;

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/q580;->v:Landroid/widget/TextView;

    .line 22
    .line 23
    const/16 v0, 0x32

    .line 24
    .line 25
    if-lt p1, v0, :cond_1

    .line 26
    .line 27
    const-string p1, "50+"

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method


# virtual methods
.method public B4()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/q580;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Ll/c0s;

    .line 11
    .line 12
    iget-object v3, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {p0, v3, v4}, Ll/q580;->d4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-direct {v1, p0, v3}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    new-instance v3, Ll/m580;

    .line 29
    .line 30
    invoke-direct {v3, p0}, Ll/m580;-><init>(Ll/q580;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/q580;->o:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    new-instance v3, Ll/n580;

    .line 39
    .line 40
    invoke-direct {v3, p0}, Ll/n580;-><init>(Ll/q580;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/q580;->t:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    new-instance v3, Ll/o580;

    .line 49
    .line 50
    invoke-direct {v3, p0}, Ll/o580;-><init>(Ll/q580;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/q580;->i:Landroid/view/View;

    .line 57
    .line 58
    new-instance v3, Ll/p580;

    .line 59
    .line 60
    invoke-direct {v3, p0}, Ll/p580;-><init>(Ll/q580;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/q580;->l:Lv/VImage;

    .line 67
    .line 68
    new-instance v3, Ll/w480;

    .line 69
    .line 70
    invoke-direct {v3, p0}, Ll/w480;-><init>(Ll/q580;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/q580;->v:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    :cond_0
    iget-object v1, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/q580;->s:Lv/VText;

    .line 87
    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Ll/q580;->q:Lv/VImage;

    .line 92
    .line 93
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/q580;->p:Lv/VImage;

    .line 97
    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    sget v2, Ll/obc0;->L5:I

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    sget v2, Ll/obc0;->K5:I

    .line 104
    .line 105
    :goto_0
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/q580;->u:Lv/VImage;

    .line 109
    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    sget v2, Ll/obc0;->Z4:I

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    sget v2, Ll/obc0;->Y4:I

    .line 116
    .line 117
    :goto_1
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/q580;->o:Landroid/widget/LinearLayout;

    .line 121
    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    iget-object v2, p0, Ll/q580;->y:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_3
    iget-object v2, p0, Ll/q580;->z:Ljava/lang/String;

    .line 128
    .line 129
    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/q580;->r:Lv/VText;

    .line 133
    .line 134
    if-eqz v0, :cond_4

    .line 135
    .line 136
    const-string v2, "#f57c00"

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_4
    const-string v2, "#80f57c00"

    .line 140
    .line 141
    :goto_3
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/q580;->w:Lv/VText;

    .line 149
    .line 150
    if-eqz v0, :cond_5

    .line 151
    .line 152
    const-string v2, "#923bff"

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_5
    const-string v2, "#80923bff"

    .line 156
    .line 157
    :goto_4
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll/q580;->t:Landroid/widget/LinearLayout;

    .line 165
    .line 166
    if-eqz v0, :cond_6

    .line 167
    .line 168
    iget-object v2, p0, Ll/q580;->y:Ljava/lang/String;

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_6
    iget-object v2, p0, Ll/q580;->z:Ljava/lang/String;

    .line 172
    .line 173
    :goto_5
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    if-eqz v0, :cond_7

    .line 177
    .line 178
    invoke-direct {p0}, Ll/q580;->f4()V

    .line 179
    .line 180
    .line 181
    :cond_7
    iget-object p0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public E4(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v8, 0x2

    .line 9
    new-array v7, v8, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    const-string v1, "alpha"

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    const-wide/16 v4, 0x12c

    .line 19
    .line 20
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/high16 v1, 0x41c00000    # 24.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x0

    .line 31
    filled-new-array {v2, v1}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-array v3, v8, [Landroid/animation/Animator;

    .line 40
    .line 41
    aput-object v1, v3, v2

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    aput-object v0, v3, v2

    .line 45
    .line 46
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 51
    .line 52
    new-instance v0, Ll/x480;

    .line 53
    .line 54
    invoke-direct {v0, p0, v1}, Ll/x480;-><init>(Ll/q580;Landroid/animation/ValueAnimator;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 61
    .line 62
    new-instance v1, Ll/y480;

    .line 63
    .line 64
    invoke-direct {v1, p0, p1}, Ll/y480;-><init>(Ll/q580;Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 71
    .line 72
    new-instance v1, Ll/z480;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1}, Ll/z480;-><init>(Ll/q580;Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    nop

    .line 87
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public d4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/r580;->b(Ll/q580;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/q580;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/q580;->A4(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v1, 0x258

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

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

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;->from:Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;->hour:I

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;->minute:I

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;->to:Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;

    .line 8
    .line 9
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;->hour:I

    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRangeInfo;->minute:I

    .line 12
    .line 13
    invoke-direct {p0, v1, v0, v2, p1}, Ll/q580;->h4(IIII)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->isStarted()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/q580;->A:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/q580;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f()V

    .line 31
    .line 32
    .line 33
    :cond_1
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

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
    new-instance v1, Ll/v480;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/v480;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/g580;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/g580;-><init>(Ll/q580;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public final synthetic t4(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p2, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    iget-object p0, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic u4(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q580;->g4(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v4(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q580;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/q580;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->setBroadCastInfos(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public x4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q580;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/q580;->E4(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public y4(Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;->canJoinBountyPk:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/q580;->s:Lv/VText;

    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/q580;->q:Lv/VImage;

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/q580;->s:Lv/VText;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ja:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/vwt;->V4()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/q580;->s:Lv/VText;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/q580;->s:Lv/VText;

    .line 40
    .line 41
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 42
    .line 43
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ta:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;->winTimes:J

    .line 50
    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method
