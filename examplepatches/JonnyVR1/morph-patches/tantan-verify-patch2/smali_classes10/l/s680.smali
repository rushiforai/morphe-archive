.class public Ll/s680;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/ha80;

.field public final j:Ll/d880;

.field public final k:Ll/o8b0;

.field public final l:Ll/gv70;

.field public m:[Z

.field public n:Ll/nc80;

.field public o:Ll/it70;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [Z

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/s680;->m:[Z

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/d880;

    .line 16
    .line 17
    invoke-direct {v0, p1, p0, p2}, Ll/d880;-><init>(Ll/dum;Ll/s680;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Ll/d880;

    .line 25
    .line 26
    iput-object p2, p0, Ll/s680;->j:Ll/d880;

    .line 27
    .line 28
    new-instance p2, Ll/ha80;

    .line 29
    .line 30
    invoke-direct {p2, p1, p0}, Ll/ha80;-><init>(Ll/dum;Ll/s680;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ll/ha80;

    .line 38
    .line 39
    iput-object p2, p0, Ll/s680;->i:Ll/ha80;

    .line 40
    .line 41
    new-instance p2, Ll/o8b0;

    .line 42
    .line 43
    invoke-direct {p2, p1, p0}, Ll/o8b0;-><init>(Ll/dum;Ll/s680;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Ll/o8b0;

    .line 51
    .line 52
    iput-object p2, p0, Ll/s680;->k:Ll/o8b0;

    .line 53
    .line 54
    new-instance p2, Ll/gv70;

    .line 55
    .line 56
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 61
    .line 62
    invoke-direct {p2, p1, v0, p0}, Ll/gv70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;Ll/s680;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Ll/gv70;

    .line 70
    .line 71
    iput-object p1, p0, Ll/s680;->l:Ll/gv70;

    .line 72
    .line 73
    return-void

    .line 74
    nop

    .line 75
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic K3(Ll/s680;Ll/qc80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->i4(Ll/qc80;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/s680;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->Z3(Z)V

    return-void
.end method

.method public static synthetic M3(Ll/s680;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic N3(Ll/s680;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->s4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method public static synthetic O3(Ll/s680;Ll/ru70;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->k4(Ll/ru70;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/s680;Ll/ju70;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->j4(Ll/ju70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private q4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkEnd:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;->getIsLeave()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;->getLeaveUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/dw40;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;->getPk()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;->getId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const-string p1, "show end toast when someone leave"

    .line 59
    .line 60
    invoke-static {p1}, Ll/n180;->j(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_4

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wa:I

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPunishing()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ze:I

    .line 88
    .line 89
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 90
    .line 91
    .line 92
    :cond_4
    :goto_0
    return-void
.end method

.method private r4(Ljava/lang/String;)V
    .locals 5

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
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 25
    .line 26
    const/16 v3, 0x258

    .line 27
    .line 28
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, v4, p1, v3}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0, v0, p1, v3}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "live"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "pk"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public S3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/s680;->o:Ll/it70;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/it70;

    .line 13
    .line 14
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 15
    .line 16
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 19
    .line 20
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 21
    .line 22
    invoke-direct {v0, v2, v3}, Ll/it70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/it70;

    .line 30
    .line 31
    iput-object v0, p0, Ll/s680;->o:Ll/it70;

    .line 32
    .line 33
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 34
    .line 35
    const-string v2, "playing"

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/s680;->X3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0, p1}, Ll/s680;->e4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p1, p0, Ll/s680;->n:Ll/nc80;

    .line 51
    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/l6t;->C2(Ll/l6t;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Ll/s680;->n:Ll/nc80;

    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p1, p0, Ll/s680;->n:Ll/nc80;

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    new-instance p1, Ll/nc80;

    .line 65
    .line 66
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 67
    .line 68
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->G:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

    .line 73
    .line 74
    invoke-direct {p1, v0, p0, v2}, Ll/nc80;-><init>(Ll/dum;Ll/s680;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ll/nc80;

    .line 82
    .line 83
    iput-object p1, p0, Ll/s680;->n:Ll/nc80;

    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Ll/s680;->o:Ll/it70;

    .line 86
    .line 87
    if-eqz p1, :cond_4

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/l6t;->C2(Ll/l6t;)V

    .line 90
    .line 91
    .line 92
    iput-object v1, p0, Ll/s680;->o:Ll/it70;

    .line 93
    .line 94
    :cond_4
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/j680;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/j680;-><init>(Ll/s680;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/qc80;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/k680;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/k680;-><init>(Ll/s680;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/ju70;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/l680;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/l680;-><init>(Ll/s680;)V

    .line 27
    .line 28
    .line 29
    const-class v1, Ll/ru70;

    .line 30
    .line 31
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public T3()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    return-object p0
.end method

.method public U3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->O3()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handle action = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/s680$a;->a:[I

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    aget p1, v0, p1

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-eq p1, v0, :cond_1

    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    if-eq p1, v0, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p1, p0, Ll/s680;->j:Ll/d880;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/d880;->z4()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ll/dw40;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "liveId"

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "e_pk_adverseprofile_button"

    .line 67
    .line 68
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    iget-object p0, p0, Ll/s680;->j:Ll/d880;

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ll/d880;->f4(Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public W3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->o:Ll/it70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/it70;->K3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->o:Ll/it70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/it70;->M3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public Y3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->l:Ll/gv70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gv70;->W3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Z3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->e0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->n:Ll/nc80;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nc80;->K3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->n:Ll/nc80;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nc80;->reset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s680;->n:Ll/nc80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/nc80;->J3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->o:Ll/it70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/it70;->N3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->S3()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h4()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->C()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vwt;->S4()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic i4(Ll/qc80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s680;->f4()Z

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

.method public final synthetic j4(Ll/ju70;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s680;->T3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic k4(Ll/ru70;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

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
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v1, "pk_punish_select"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x3

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "pk_point"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x2

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "pk_mute"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x1

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string v1, "pk_end"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v2, 0x0

    .line 58
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_0
    invoke-virtual {p0, p1}, Ll/s680;->o4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_1
    iget-object p0, p0, Ll/s680;->j:Ll/d880;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/d880;->w4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :pswitch_2
    invoke-virtual {p0, p1}, Ll/s680;->a4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :pswitch_3
    invoke-direct {p0, p1}, Ll/s680;->q4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :sswitch_data_0
    .sparse-switch
        -0x3ad0af69 -> :sswitch_3
        -0x1f417e23 -> :sswitch_2
        0x37391e4c -> :sswitch_1
        0x53633862 -> :sswitch_0
    .end sparse-switch

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public m4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/s680;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s680;->j:Ll/d880;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/d880;->t4()Z

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
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public n4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getUserId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Ll/s680;->r4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/s680;->i:Ll/ha80;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 31
    .line 32
    new-instance v2, Ll/r680;

    .line 33
    .line 34
    invoke-direct {v2, v0}, Ll/r680;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Ll/dw40;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ll/dw40;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    goto :goto_1

    .line 90
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 91
    .line 92
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ll/dw40;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    goto :goto_2

    .line 109
    :cond_4
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 110
    .line 111
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string v3, "anchorId"

    .line 116
    .line 117
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getRank()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    add-int/lit8 p1, p1, 0x1

    .line 126
    .line 127
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string v3, "index"

    .line 132
    .line 133
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string v3, "live_id"

    .line 138
    .line 139
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    const-string v3, "pk_type_live"

    .line 144
    .line 145
    const-string v4, ""

    .line 146
    .line 147
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    const-string v4, "roomId"

    .line 152
    .line 153
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    filled-new-array {v1, p1, v2, v3, v0}, [Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string v0, "e_live_pk_contributionposition"

    .line 162
    .line 163
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 164
    .line 165
    .line 166
    :cond_5
    :goto_3
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/eb20;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->getPkMvpUid()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Ll/eb20;->b()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->getPkMvpUid()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, p0, Ll/s680;->i:Ll/ha80;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ll/s680;->k:Ll/o8b0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Ll/o8b0;->V3(Lcom/p1/mobile/android/app/Act;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method

.method public p4(ZLjava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final s4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/n180;->o(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, -0x1

    .line 20
    sparse-switch v0, :sswitch_data_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :sswitch_0
    const-string v0, "ended"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v3, 0x2

    .line 34
    goto :goto_0

    .line 35
    :sswitch_1
    const-string v0, "playing"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v3, v1

    .line 45
    goto :goto_0

    .line 46
    :sswitch_2
    const-string v0, "punishing"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move v3, v2

    .line 56
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->e0()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance p1, Ll/vyr;

    .line 93
    .line 94
    invoke-direct {p1, v2}, Ll/vyr;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    new-instance p1, Ll/vyr;

    .line 127
    .line 128
    invoke-direct {p1, v1}, Ll/vyr;-><init>(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x33863113 -> :sswitch_2
        -0x1d6b2fd2 -> :sswitch_1
        0x5c2caba -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

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
    new-instance v1, Ll/m680;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/m680;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/n680;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/n680;-><init>(Ll/s680;)V

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
    iget-object v0, p0, Ll/s680;->i:Ll/ha80;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/ha80;->P3()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/o680;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/o680;-><init>(Ll/s680;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogStatus()Ll/v3f$d;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/p680;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/p680;-><init>(Ll/s680;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public t4(Ljava/util/List;Ljava/util/List;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/4 v4, 0x3

    .line 10
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const-string v5, "roomId"

    .line 15
    .line 16
    const-string v6, ""

    .line 17
    .line 18
    const-string v7, "pk_type_live"

    .line 19
    .line 20
    const-string v8, "live_id"

    .line 21
    .line 22
    const-string v9, "index"

    .line 23
    .line 24
    const-string v10, "anchorId"

    .line 25
    .line 26
    const-string v11, "e_live_pk_contributionposition"

    .line 27
    .line 28
    const/4 v12, 0x1

    .line 29
    if-ge v2, v3, :cond_1

    .line 30
    .line 31
    iget-object v3, v0, Ll/s680;->m:[Z

    .line 32
    .line 33
    aget-boolean v3, v3, v2

    .line 34
    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Ll/dw40;

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v10, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    add-int/lit8 v10, v2, 0x1

    .line 58
    .line 59
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    invoke-static {v9, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    check-cast v10, Ll/dw40;

    .line 72
    .line 73
    invoke-virtual {v10}, Ll/vp20;->k()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-static {v8, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    check-cast v7, Ll/dw40;

    .line 90
    .line 91
    invoke-virtual {v7}, Ll/vp20;->o()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-static {v5, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    filled-new-array {v4, v9, v8, v6, v5}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-static {v11, v3, v4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 104
    .line 105
    .line 106
    iget-object v3, v0, Ll/s680;->m:[Z

    .line 107
    .line 108
    aput-boolean v12, v3, v2

    .line 109
    .line 110
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    iget-object v2, v0, Ll/s680;->i:Ll/ha80;

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iget-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 120
    .line 121
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 122
    .line 123
    new-instance v13, Ll/q680;

    .line 124
    .line 125
    invoke-direct {v13, v2}, Ll/q680;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v3, v13}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 133
    .line 134
    :goto_1
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-ge v1, v3, :cond_3

    .line 143
    .line 144
    iget-object v3, v0, Ll/s680;->m:[Z

    .line 145
    .line 146
    add-int/lit8 v13, v1, 0x3

    .line 147
    .line 148
    aget-boolean v3, v3, v13

    .line 149
    .line 150
    if-nez v3, :cond_2

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    iget-object v14, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v10, v14}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object v14

    .line 162
    add-int/lit8 v15, v1, 0x1

    .line 163
    .line 164
    invoke-static {v15}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v15

    .line 168
    invoke-static {v9, v15}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v15

    .line 172
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v8, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    move/from16 v16, v12

    .line 179
    .line 180
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v12

    .line 184
    move/from16 p1, v1

    .line 185
    .line 186
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    filled-new-array {v14, v15, v4, v12, v1}, [Ll/pf60;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {v11, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 197
    .line 198
    .line 199
    iget-object v1, v0, Ll/s680;->m:[Z

    .line 200
    .line 201
    aput-boolean v16, v1, v13

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_2
    move/from16 p1, v1

    .line 205
    .line 206
    move/from16 v16, v12

    .line 207
    .line 208
    :goto_2
    add-int/lit8 v1, p1, 0x1

    .line 209
    .line 210
    move/from16 v12, v16

    .line 211
    .line 212
    const/4 v4, 0x3

    .line 213
    goto :goto_1

    .line 214
    :cond_3
    return-void
.end method
