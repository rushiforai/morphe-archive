.class public Ll/o8b0;
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
.field public i:Landroid/view/View;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroidx/recyclerview/widget/RecyclerView;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public p:Ll/kcg0;

.field public q:Ll/s680;

.field public r:Ll/b8b0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/s680;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/o8b0;->q:Ll/s680;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/o8b0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o8b0;->U3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L3(Ll/o8b0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o8b0;->X3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/n8b0;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/n8b0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private S3()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 22
    .line 23
    new-instance v2, Ll/m8b0;

    .line 24
    .line 25
    invoke-direct {v2, v0, p0}, Ll/m8b0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/util/ArrayList;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method private T3(J)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hb:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private synthetic U3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/o8b0;->P3(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private W3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o8b0;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/k8b0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/k8b0;-><init>(Ll/o8b0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/o8b0;->p:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method private X3(Ljava/lang/Long;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0xa

    .line 6
    .line 7
    sub-long v0, v2, v0

    .line 8
    .line 9
    const-wide/16 v4, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v4

    .line 12
    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/o8b0;->p:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/o8b0;->r:Ll/b8b0;

    .line 21
    .line 22
    sget-object v1, Ll/gkc0;->a:Ljava/util/Random;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/b8b0;->C()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {v1, v4}, Ljava/util/Random;->nextInt(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ll/b8b0;->G(I)Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->id:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {p0, v0, v1}, Ll/o8b0;->P3(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    sub-long/2addr v2, v0

    .line 47
    long-to-int p1, v2

    .line 48
    iget-object v0, p0, Ll/o8b0;->n:Landroid/widget/TextView;

    .line 49
    .line 50
    int-to-long v1, p1

    .line 51
    invoke-direct {p0, v1, v2}, Ll/o8b0;->T3(J)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public O3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/p8b0;->b(Ll/o8b0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P3(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "choosePunish punishId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",isAuto:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/o8b0;->R3()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/o8b0;->q:Ll/s680;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/s680;->T3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z7(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p1, Ll/l8b0;

    .line 44
    .line 45
    invoke-direct {p1}, Ll/l8b0;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance p2, Ll/ga80;

    .line 49
    .line 50
    invoke-direct {p2}, Ll/ga80;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public R3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o8b0;->o:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/o8b0;->p:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public V3(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/o8b0;->o:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/c0s;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {p0, v2, v3}, Ll/o8b0;->O3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, p0, v2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/o8b0;->o:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 21
    .line 22
    iget-object v0, p0, Ll/o8b0;->m:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 25
    .line 26
    invoke-direct {v2, p1, v1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/b8b0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/b8b0;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/o8b0;->r:Ll/b8b0;

    .line 38
    .line 39
    iget-object v2, p0, Ll/o8b0;->m:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/o8b0;->r:Ll/b8b0;

    .line 45
    .line 46
    new-instance v2, Ll/j8b0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/j8b0;-><init>(Ll/o8b0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ll/b8b0;->I(Ll/y20;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    new-instance v0, Ll/db20;

    .line 55
    .line 56
    const/16 v2, 0x258

    .line 57
    .line 58
    invoke-direct {v0, v2}, Ll/db20;-><init>(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 66
    .line 67
    iget-object v2, p0, Ll/o8b0;->j:Lv/VDraweeView;

    .line 68
    .line 69
    sget v3, Ll/obc0;->J8:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/eb20;->b()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const-string v3, "context_single_room"

    .line 79
    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v1, p0, Ll/o8b0;->j:Lv/VDraweeView;

    .line 85
    .line 86
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 87
    .line 88
    sget v4, Ll/qa00;->x:I

    .line 89
    .line 90
    invoke-static {v3, v1, v2, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/o8b0;->k:Landroid/widget/TextView;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Ll/o8b0;->j:Lv/VDraweeView;

    .line 102
    .line 103
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 104
    .line 105
    invoke-virtual {v2}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 114
    .line 115
    sget v2, Ll/qa00;->x:I

    .line 116
    .line 117
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/o8b0;->k:Landroid/widget/TextView;

    .line 121
    .line 122
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    :goto_0
    iget-object v0, p0, Ll/o8b0;->n:Landroid/widget/TextView;

    .line 134
    .line 135
    const-wide/16 v1, 0xa

    .line 136
    .line 137
    invoke-direct {p0, v1, v2}, Ll/o8b0;->T3(J)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 145
    .line 146
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Ll/jfv;

    .line 151
    .line 152
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 153
    .line 154
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 163
    .line 164
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 165
    .line 166
    const-wide/16 v2, 0x26

    .line 167
    .line 168
    cmp-long v0, v0, v2

    .line 169
    .line 170
    if-ltz v0, :cond_2

    .line 171
    .line 172
    invoke-static {}, Ll/eb20;->b()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_2

    .line 177
    .line 178
    iget-object v0, p0, Ll/o8b0;->l:Landroid/widget/TextView;

    .line 179
    .line 180
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wa:I

    .line 181
    .line 182
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_2
    iget-object v0, p0, Ll/o8b0;->l:Landroid/widget/TextView;

    .line 191
    .line 192
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ra:I

    .line 193
    .line 194
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    .line 200
    .line 201
    :goto_1
    invoke-direct {p0}, Ll/o8b0;->W3()V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ll/o8b0;->r:Ll/b8b0;

    .line 205
    .line 206
    invoke-direct {p0}, Ll/o8b0;->S3()Ljava/util/List;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p1, v0}, Ll/b8b0;->J(Ljava/util/List;)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Ll/o8b0;->o:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 216
    .line 217
    .line 218
    return-void
.end method
