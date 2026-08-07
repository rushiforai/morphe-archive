.class public Ll/lag;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/y9g;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/teg;

.field public k:Ll/yhg;


# direct methods
.method public constructor <init>(Ll/dum;Ll/tk2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Ll/tk2;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/teg;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-direct {p1, v0}, Ll/teg;-><init>(Z)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/lag;->j:Ll/teg;

    .line 14
    .line 15
    new-instance p1, Ll/y9g;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {p1, p2}, Ll/y9g;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic i4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Fans club leader board error"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "lsy"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic j4(Ll/lag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lag;->y4()V

    return-void
.end method

.method public static synthetic k4(Ll/lag;Ll/yhg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lag;->z4(Ll/yhg;)V

    return-void
.end method

.method public static synthetic l4(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lag;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic m4(Ll/lag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lag;->C4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic n4(Ll/lag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lag;->A4()V

    return-void
.end method

.method public static synthetic o4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->r4:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p4(Ll/lag;Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lag;->x4(Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic q4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Fans club leader board error"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "lsy"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isFollowForbidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H4:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic s4(Ll/lag;Ll/mag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lag;->B4(Ll/mag;)V

    return-void
.end method

.method public static synthetic t4(Ll/lag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lag;->D4(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y9g;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iget-object p0, p0, Ll/lag;->j:Ll/teg;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Ll/y9g;->e(ZLl/teg;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic B4(Ll/mag;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y9g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lag;->j:Ll/teg;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/y9g;->i(Ll/mag;Ll/teg;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lag;->j:Ll/teg;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {v0, p1}, Ll/teg;->f(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/lag;->E4()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic D4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/lag;->k:Ll/yhg;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->enable:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/lag;->E4()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public E4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lag;->j:Ll/teg;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/teg;->a()Ll/teg$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Ll/teg$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "leaderboard_id_fans_recall"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Ll/lig;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/tk2;->Z3()Ll/x7g;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/x7g;->U()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/dag;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/dag;-><init>(Ll/lag;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/eag;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/eag;-><init>(Ll/lag;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/fag;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/fag;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {p0}, Ll/tk2;->Z3()Ll/x7g;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v0, v0, Ll/teg$a;->b:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ll/x7g;->C(Ljava/lang/String;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/gag;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/gag;-><init>(Ll/lag;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ll/hag;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/hag;-><init>(Ll/lag;)V

    .line 103
    .line 104
    .line 105
    new-instance p0, Ll/iag;

    .line 106
    .line 107
    invoke-direct {p0}, Ll/iag;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lag;->E4()V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/hiv;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/hiv;->p()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/z9g;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/z9g;-><init>(Ll/lag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansInvitationEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;->invitationResult()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lrx/c;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/cag;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/cag;-><init>(Ll/lag;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public R3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a4()Ll/bkj0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K3:I

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I3:I

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v1, Ll/y9g;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/y9g;->c()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    const/4 p0, -0x1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const/4 p0, 0x1

    .line 47
    :goto_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v0, v1, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public u4()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->m4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/jag;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/jag;-><init>(Ll/lag;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/kag;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/kag;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public v4(Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    iput-object p1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const-string v8, "fans_recall_panel"

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    const-string v4, "liveRoom"

    .line 37
    .line 38
    invoke-virtual/range {v0 .. v8}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/aag;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/aag;-><init>(Ll/lag;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/bag;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/bag;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t4:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/lag;->k:Ll/yhg;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->enable:Z

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/lag;->E4()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic x4(Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 2

    .line 1
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->q4:I

    .line 2
    .line 3
    invoke-static {p2}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/lag;->k:Ll/yhg;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->users:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 40
    .line 41
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    check-cast p0, Ll/y9g;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/y9g;->d(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final synthetic y4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y9g;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    iget-object p0, p0, Ll/lag;->j:Ll/teg;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Ll/y9g;->e(ZLl/teg;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic z4(Ll/yhg;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/lag;->k:Ll/yhg;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Ll/y9g;

    .line 6
    .line 7
    iget-object p0, p0, Ll/lag;->j:Ll/teg;

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1}, Ll/y9g;->f(Ll/teg;Ll/yhg;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
