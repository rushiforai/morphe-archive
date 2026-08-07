.class public Ll/yuk;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hj2<",
        "Ll/oo2;",
        "Ll/ats;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Ljava/lang/String;

.field public l:I

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

.field public final n:Ljava/lang/String;

.field public o:Z

.field public p:Lcom/p1/mobile/putong/data/User;

.field public q:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

.field public r:Lcom/p1/mobile/putong/live/base/data/BLiveData;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "530"

    .line 5
    .line 6
    iput-object p1, p0, Ll/yuk;->n:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private synthetic F4(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/yuk;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/yuk;->k:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 28
    .line 29
    invoke-static {p1, v0, v1, v2}, Ll/z1r;->c(ZLl/oo2;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

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

.method public static synthetic P3(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R3(Ll/yuk;Ll/y20;Ll/lsw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yuk;->C4(Ll/y20;Ll/lsw;)V

    return-void
.end method

.method public static synthetic S3(Ll/yuk;ILl/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yuk;->E4(ILl/y20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic T3(Ll/yuk;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic U3(Ll/yuk;Ll/y1r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->H4(Ll/y1r;)V

    return-void
.end method

.method public static synthetic V3(Ll/yuk;Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yuk;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic X3(Ll/yuk;Ll/y1r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->G4(Ll/y1r;)V

    return-void
.end method

.method public static synthetic Y3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/mdc0;->d2:I

    .line 8
    .line 9
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lv/VDraweeView;

    .line 14
    .line 15
    const-string v1, "context_single_room"

    .line 16
    .line 17
    invoke-static {v1, v0, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget p0, Ll/mdc0;->w2:I

    .line 21
    .line 22
    invoke-virtual {p3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    sget p0, Ll/mdc0;->f0:I

    .line 32
    .line 33
    invoke-virtual {p3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    sget p0, Ll/mdc0;->G4:I

    .line 42
    .line 43
    invoke-virtual {p3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lv/VText;

    .line 48
    .line 49
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->He:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ll/ouk;

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ll/ouk;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

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

.method public static synthetic a4(Ll/yuk;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yuk;->F4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

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

.method public static bridge synthetic c4(Ll/yuk;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/yuk;->l:I

    return-void
.end method


# virtual methods
.method public final A4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->roomId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string v0, "guard-leader-boards"

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic B4(Lcom/p1/mobile/putong/live/base/data/BLiveData;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yuk;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic C4(Ll/y20;Ll/lsw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hj2;->i:Ll/isl;

    .line 2
    .line 3
    check-cast v0, Ll/ats;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/ats;->J(Ll/lsw;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-boolean p1, p2, Ll/lsw;->l:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p2, Ll/lsw;->m:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p2, Ll/lsw;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Ll/yuk;->M4(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final synthetic D4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yuk;->r:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic E4(ILl/y20;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    int-to-long v2, p1

    .line 6
    cmp-long p1, v0, v2

    .line 7
    .line 8
    if-gez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    invoke-static {v2, v3, p0, p1}, Ll/fvk;->g(JJ)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/yuk;->K4(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic G4(Ll/y1r;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hj2;->isShowing()Z

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
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 9
    .line 10
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/yuk;->y4(Ll/y1r;)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/quk;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/quk;-><init>(Ll/yuk;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/yuk;->K4(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic H4(Ll/y1r;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/y1r;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/yuk;->o:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yuk;->g4()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yuk;->x4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightIntroduceUrl:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/yuk;->J4(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public J4(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ats;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ats;->A()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x41700000    # 15.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->w0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-double v0, v0

    .line 23
    const-wide v2, 0x3fe6666666666666L    # 0.7

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    mul-double/2addr v0, v2

    .line 29
    double-to-int v0, v0

    .line 30
    :cond_0
    const/16 v1, 0x1fa5

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0, v1}, Ll/i6t;->v3(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yuk;->u4()Ll/ats;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final K4(Ll/y20;)V
    .locals 2
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->d5(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/yuk;->m4(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public L4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "liveGiftGuardClick"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ll/hne0$a;->B(Ljava/lang/String;)Ll/hne0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {p0, p1}, Ll/yuk;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    new-instance v5, Ll/yuk$a;

    .line 27
    .line 28
    invoke-direct {v5, p0}, Ll/yuk$a;-><init>(Ll/yuk;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/yuk;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    const-string p0, "guard"

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    move-object v7, p2

    .line 46
    move-object v8, p3

    .line 47
    invoke-virtual/range {v3 .. v9}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public M3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hj2;->M3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->D2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/yuk;->o:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/16 v0, 0xed8

    .line 15
    .line 16
    iget v1, p0, Ll/yuk;->l:I

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/yuk;->p:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/yuk;->p:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/yuk;->N4(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final M4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    sget v1, Ll/yec0;->f5:I

    .line 4
    .line 5
    invoke-static {}, Ll/qag0;->g()Ll/rq2;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;ILl/rq2;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/wuk;

    .line 13
    .line 14
    invoke-direct {p0, p2, p1, v0}, Ll/wuk;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public N4(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yuk;->j3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, ""

    .line 21
    .line 22
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/16 v2, 0x1fa5

    .line 39
    .line 40
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->showShadow()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "Guard"

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {p0, v0, p1, v2}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {p0, v0, p1, v2}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ll/g2t;
    .locals 3

    .line 1
    new-instance v0, Ll/g2t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/g2t;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Ll/g2t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 7
    .line 8
    iget-object v1, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 18
    .line 19
    iput-object v1, v0, Ll/g2t;->d:Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 20
    .line 21
    iget-object p0, p0, Ll/yuk;->r:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/fvk;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/nsv;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iput-object p0, v0, Ll/g2t;->b:Ll/nsv;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 46
    .line 47
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/hiv;

    .line 52
    .line 53
    iget-object p1, v0, Ll/g2t;->b:Ll/nsv;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 60
    .line 61
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 62
    .line 63
    invoke-virtual {p0, v1, v2}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iput-object p0, v0, Ll/g2t;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 68
    .line 69
    :cond_0
    return-object v0
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 13
    .line 14
    long-to-double p0, p0

    .line 15
    invoke-static {p0, p1}, Ll/fvk;->m(D)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/16 p1, 0x18

    .line 20
    .line 21
    if-le p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->closeDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/y1r;

    .line 12
    .line 13
    const/16 v1, 0x1fa5

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/y1r;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public g4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/ats;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ats;->j()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public h4()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x7

    .line 16
    if-le v0, v1, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "..."

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    return-object p0
.end method

.method public i4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 12
    .line 13
    return-wide p0

    .line 14
    :cond_0
    const-wide/16 p0, 0x0

    .line 15
    .line 16
    return-wide p0
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/yuk;->x4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightsContractGiftId:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "530"

    .line 21
    .line 22
    return-object p0
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1}, Ll/yuk;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/yuk;->x4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    int-to-double v0, v0

    .line 24
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightGiftCoins:I

    .line 25
    .line 26
    int-to-double p0, p0

    .line 27
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 28
    .line 29
    mul-double/2addr p0, v2

    .line 30
    div-double/2addr v0, p0

    .line 31
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    double-to-int p0, p0

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public l4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/yuk;->x4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightGiftCoins:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/16 p0, 0x32

    .line 21
    .line 22
    return p0
.end method

.method public final m4(Ll/y20;)V
    .locals 3
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->V4(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Ll/ruk;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/ruk;-><init>(Ll/yuk;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/suk;

    .line 63
    .line 64
    invoke-direct {v1, p0, p1}, Ll/suk;-><init>(Ll/yuk;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ll/tuk;

    .line 68
    .line 69
    invoke-direct {v2, p1}, Ll/tuk;-><init>(Ll/y20;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ll/vp20;->p()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->U4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance v0, Ll/uuk;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/uuk;-><init>(Ll/yuk;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/hiv;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/hiv;->e:Lrx/subjects/a;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public n4(Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->q4()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const v1, 0x36ee80

    .line 13
    .line 14
    .line 15
    mul-int/2addr v0, v1

    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-static {}, Ll/pzi0;->n()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    sub-long/2addr v1, v3

    .line 25
    long-to-int v1, v1

    .line 26
    rem-int/2addr v1, v0

    .line 27
    sub-int/2addr v0, v1

    .line 28
    div-int/lit16 v0, v0, 0x3e8

    .line 29
    .line 30
    int-to-long v1, v0

    .line 31
    const-wide/16 v3, 0x0

    .line 32
    .line 33
    invoke-static {v1, v2, v3, v4}, Ll/fvk;->g(JJ)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p0, v1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p0, v1}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/xuk;

    .line 63
    .line 64
    invoke-direct {v2, p0, v0, p1}, Ll/xuk;-><init>(Ll/yuk;ILl/y20;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/nuk;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/nuk;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 15
    .line 16
    return-object p0
.end method

.method public p4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;",
            ")",
            "Ljava/util/List<",
            "Ll/g2t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/yuk;->r:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    sget-object v1, Ll/htd0;->c:Ll/htd0;

    .line 12
    .line 13
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/hiv;

    .line 18
    .line 19
    iget-object v1, v1, Ll/hiv;->f:Lrx/subjects/a;

    .line 20
    .line 21
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    const-string v2, "onlineGuard"

    .line 34
    .line 35
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;->onlineKnights:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ll/yuk;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ll/g2t;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;->potentialKnights:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ll/yuk;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ll/g2t;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    :goto_2
    return-object v0
.end method

.method public q4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 12
    .line 13
    return-wide p0

    .line 14
    :cond_0
    const-wide/16 p0, 0x0

    .line 15
    .line 16
    return-wide p0
.end method

.method public final r4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/lsw;
    .locals 8

    .line 1
    iput-object p1, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    new-instance v0, Ll/lsw;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/lsw;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput-boolean v1, v0, Ll/lsw;->g:Z

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qj:I

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yuk;->h4()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Ll/lsw;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Ll/lsw;->b:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x0

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    .line 58
    .line 59
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

    .line 60
    .line 61
    iput-wide v3, v0, Ll/lsw;->c:J

    .line 62
    .line 63
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

    .line 64
    .line 65
    iput-wide v3, v0, Ll/lsw;->d:J

    .line 66
    .line 67
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

    .line 68
    .line 69
    iput-wide v3, v0, Ll/lsw;->e:J

    .line 70
    .line 71
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 72
    .line 73
    iput-boolean v3, v0, Ll/lsw;->j:Z

    .line 74
    .line 75
    new-instance v3, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v3, v0, Ll/lsw;->h:Ljava/util/List;

    .line 81
    .line 82
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-nez v3, :cond_0

    .line 89
    .line 90
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-eqz v4, :cond_0

    .line 101
    .line 102
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;

    .line 107
    .line 108
    iget-object v5, v0, Ll/lsw;->h:Ljava/util/List;

    .line 109
    .line 110
    new-instance v6, Ll/lsw$c;

    .line 111
    .line 112
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->icon:Ljava/lang/String;

    .line 113
    .line 114
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->title:Ljava/lang/String;

    .line 115
    .line 116
    invoke-direct {v6, v7, v4}, Ll/lsw$c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {p0, v3, v1}, Ll/fvk;->l(Ll/yuk;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iput-object p0, v0, Ll/lsw;->f:Ljava/util/List;

    .line 130
    .line 131
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 132
    .line 133
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-nez p0, :cond_2

    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->discountNotice:Ljava/lang/String;

    .line 148
    .line 149
    iput-object p0, v0, Ll/lsw;->m:Ljava/lang/String;

    .line 150
    .line 151
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 152
    .line 153
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardPopupIcon:Ljava/lang/String;

    .line 160
    .line 161
    iput-object p0, v0, Ll/lsw;->k:Ljava/lang/String;

    .line 162
    .line 163
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 170
    .line 171
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->showDiscount:Z

    .line 172
    .line 173
    iput-boolean p0, v0, Ll/lsw;->l:Z

    .line 174
    .line 175
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    .line 176
    .line 177
    iput-object p0, v0, Ll/lsw;->i:Ljava/util/List;

    .line 178
    .line 179
    return-object v0
.end method

.method public s4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yuk;->x4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/yuk;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ll/vuk;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ll/vuk;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->knightCoins:I

    .line 49
    .line 50
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 51
    .line 52
    sub-int/2addr p1, p0

    .line 53
    return p1

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->openDialog()Ll/v3f$d;

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
    new-instance v1, Ll/luk;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/luk;-><init>(Ll/yuk;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->closeDialog()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/puk;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/puk;-><init>(Ll/yuk;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public t4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yuk;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u4()Ll/ats;
    .locals 0

    .line 1
    new-instance p0, Ll/ats;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ats;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final v4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/muk;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/muk;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 15
    .line 16
    return-object p0
.end method

.method public w4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/fvk;->t(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "onlive"

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->L0:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/yuk;->N4(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 43
    .line 44
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveId:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->roomId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_3

    .line 73
    .line 74
    new-instance v0, Ll/v24;

    .line 75
    .line 76
    const/16 v1, 0x1004

    .line 77
    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-direct {v0, v1, v2}, Ll/v24;-><init>(II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast v0, Ll/ats;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/ats;->j()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/yuk;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userId:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Ll/yuk;->N4(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final x4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yuk;->m:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final y4(Ll/y1r;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/y1r;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/yuk;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/qf2;->a()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/yuk;->l:I

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/y1r;->c()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/yuk;->p:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/y1r;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/yuk;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yuk;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
