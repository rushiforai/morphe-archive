.class public Ll/u0p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/kyo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

.field public o:Lv/VImage;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/lang/String;

.field public s:Ll/kyo0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/kyo0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->xa:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Ll/u0p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u0p0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Ll/u0p0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u0p0;->M(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic H(Ll/u0p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u0p0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/u0p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u0p0;->O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ljava/lang/String;)V

    return-void
.end method

.method private L(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    move v1, v2

    .line 18
    :cond_1
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v0p0;->a(Ll/u0p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ll/kyo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic M(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 9
    .line 10
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/ryo0;->d()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-direct {p0, p1}, Ll/u0p0;->L(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->L4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;->f(Ljava/util/List;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f(Ljava/util/List;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f(Ljava/util/List;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S(Ljava/util/List;Ljava/util/List;Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-object p1, p0, Ll/u0p0;->p:Ljava/util/List;

    .line 7
    .line 8
    iput-object p2, p0, Ll/u0p0;->q:Ljava/util/List;

    .line 9
    .line 10
    iput-object p3, p0, Ll/u0p0;->r:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/u0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, p3}, Ll/u0p0;->Q(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    if-ltz p4, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    if-ge p4, p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/u0p0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 28
    .line 29
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->f(I)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p4}, Ll/u0p0;->L(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u0p0;->K(Ll/kyo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/u0p0;->J(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/u0p0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->fi:I

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->yh:I

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->g(II)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/u0p0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->setMargin(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/u0p0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 23
    .line 24
    new-instance v0, Ll/q0p0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/q0p0;-><init>(Ll/u0p0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->setOnTabSelectedListener(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/u0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 33
    .line 34
    new-instance v0, Ll/r0p0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/r0p0;-><init>(Ll/u0p0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;->setHouseItemClickListener(Ll/z20;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 43
    .line 44
    new-instance v0, Ll/s0p0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/s0p0;-><init>(Ll/u0p0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->setHouseItemClickListener(Ll/z20;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/u0p0;->p:Ljava/util/List;

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Ll/u0p0;->q:Ljava/util/List;

    .line 57
    .line 58
    iget-object v1, p0, Ll/u0p0;->r:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, p1, v0, v1}, Ll/u0p0;->Q(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p1, p0, Ll/u0p0;->o:Lv/VImage;

    .line 64
    .line 65
    new-instance v0, Ll/t0p0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/t0p0;-><init>(Ll/u0p0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u0p0;->K(Ll/kyo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/kyo0;->W4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public x()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->x()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u0p0;->s:Ll/kyo0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/kyo0;->V4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
