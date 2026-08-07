.class public Ll/m9k0;
.super Ll/ms2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/i9k0<",
        "TD;>;TD;>;"
    }
.end annotation


# instance fields
.field public k:Ll/q1d0;

.field public l:Ll/fko0;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Landroidx/appcompat/app/a;

.field public final p:Ljava/lang/String;

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public s:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lv/VText;Lv/VImage;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VText;",
            "Lv/VImage;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ob:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/m9k0;->m:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/m9k0;->n:Ljava/lang/String;

    .line 23
    .line 24
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/m9k0;->p:Ljava/lang/String;

    .line 33
    .line 34
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/m9k0;->q:Ljava/lang/String;

    .line 43
    .line 44
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yb:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ll/m9k0;->r:Ljava/lang/String;

    .line 53
    .line 54
    new-instance p1, Ll/i9k0;

    .line 55
    .line 56
    invoke-direct {p1, p2, p3}, Ll/i9k0;-><init>(Lv/VText;Lv/VImage;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic j4(Ll/m9k0;Ll/nsv;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m9k0;->t4(Ll/nsv;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k4(Ll/m9k0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m9k0;->r4(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic l4(Ll/m9k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m9k0;->s4()V

    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m9k0;->n4()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/m9k0;->s:Ll/nsv;

    .line 9
    .line 10
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 17
    .line 18
    :goto_0
    iput-object v0, p0, Ll/m9k0;->s:Ll/nsv;

    .line 19
    .line 20
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/i9k0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/i9k0;->l(Ll/nsv;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/oo2;->T1()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/j9k0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/j9k0;-><init>(Ll/m9k0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m9k0;->o:Landroidx/appcompat/app/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m9k0;->n4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final n4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m9k0;->k:Ll/q1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q1d0;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/m9k0;->l:Ll/fko0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fko0;->j()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public o4(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/m9k0;->p4(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final p4(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0, p1}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/fn10;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ms2;->d4()Ll/ms2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/bf10;->M(Ll/i6t;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-static {p1}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final q4(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/mc50;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/mc50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public final synthetic r4(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/i9k0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/m9k0;->s:Ll/nsv;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/i9k0;->l(Ll/nsv;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic s4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m9k0;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t4(Ll/nsv;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m9k0;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/m9k0;->u4(Ll/nsv;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/l9k0;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/l9k0;-><init>(Ll/m9k0;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v0, 0xc8

    .line 22
    .line 23
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/m9k0;->q:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/m9k0;->r:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Ll/m9k0;->v4(Ll/nsv;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/m9k0;->m4()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public u4(Ll/nsv;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->show()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :goto_0
    invoke-direct {v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;-><init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_1
    return-void
.end method

.method public v4(Ll/nsv;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 23
    .line 24
    const-string v4, "indonesia"

    .line 25
    .line 26
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    iget-object v2, v0, Ll/m9k0;->l:Ll/fko0;

    .line 33
    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    new-instance v2, Ll/fko0;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/fko0;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v2, v0, Ll/m9k0;->l:Ll/fko0;

    .line 42
    .line 43
    :cond_0
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ll/rwn0;

    .line 48
    .line 49
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    move-object/from16 v6, p1

    .line 54
    .line 55
    iget-object v4, v6, Ll/nsv;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2, v4}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 v3, 0x0

    .line 69
    :goto_0
    iget-object v4, v0, Ll/m9k0;->l:Ll/fko0;

    .line 70
    .line 71
    iget-object v5, v0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    invoke-virtual {v0}, Ll/ms2;->f4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v12

    .line 113
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 114
    .line 115
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v13

    .line 121
    sget-object v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 124
    .line 125
    .line 126
    move-result v14

    .line 127
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v15, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 136
    .line 137
    move-object v7, v6

    .line 138
    move v6, v3

    .line 139
    invoke-virtual/range {v4 .. v15}, Ll/fko0;->p(Lcom/p1/mobile/android/app/Act;ZLl/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v0, v2}, Ll/ms2;->i0(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-nez v2, :cond_3

    .line 154
    .line 155
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v0, v2}, Ll/m9k0;->q4(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-eqz v2, :cond_4

    .line 166
    .line 167
    :cond_3
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 168
    .line 169
    invoke-virtual {v2}, Ll/wrv;->I()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-eqz v2, :cond_7

    .line 174
    .line 175
    :cond_4
    iget-object v2, v0, Ll/m9k0;->k:Ll/q1d0;

    .line 176
    .line 177
    if-nez v2, :cond_5

    .line 178
    .line 179
    new-instance v2, Ll/q1d0;

    .line 180
    .line 181
    invoke-direct {v2}, Ll/q1d0;-><init>()V

    .line 182
    .line 183
    .line 184
    iput-object v2, v0, Ll/m9k0;->k:Ll/q1d0;

    .line 185
    .line 186
    :cond_5
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    invoke-virtual {v2}, Ll/oo2;->A0()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    const-string v3, "live"

    .line 195
    .line 196
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_6

    .line 201
    .line 202
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 203
    .line 204
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    :goto_1
    move v13, v2

    .line 209
    goto :goto_2

    .line 210
    :cond_6
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 211
    .line 212
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    goto :goto_1

    .line 217
    :goto_2
    iget-object v4, v0, Ll/m9k0;->k:Ll/q1d0;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    invoke-virtual {v0}, Ll/ms2;->f4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 244
    .line 245
    .line 246
    move-result-wide v9

    .line 247
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v11

    .line 263
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v0}, Ll/vwt;->j5()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v12

    .line 271
    move-object/from16 v6, p1

    .line 272
    .line 273
    invoke-virtual/range {v4 .. v13}, Ll/q1d0;->q(Lcom/p1/mobile/android/app/Act;Ll/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;I)V

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_7
    new-instance v1, Landroid/content/Intent;

    .line 278
    .line 279
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    const-class v4, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 284
    .line 285
    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 286
    .line 287
    .line 288
    sget-object v2, Ll/efv;->v:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v0, v4}, Ll/m9k0;->q4(Ljava/lang/String;)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-eqz v4, :cond_8

    .line 301
    .line 302
    new-instance v4, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    const-string v2, "?officialShowAnchorId="

    .line 311
    .line 312
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    :cond_8
    const-string v4, "url"

    .line 329
    .line 330
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 331
    .line 332
    .line 333
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 334
    .line 335
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 336
    .line 337
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    const-string v4, "title"

    .line 342
    .line 343
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 344
    .line 345
    .line 346
    const-string v2, "hideNavigationBar"

    .line 347
    .line 348
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 363
    .line 364
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 369
    .line 370
    .line 371
    return-void
.end method

.method public w4(Ll/nsv;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/m9k0;->s:Ll/nsv;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/eb20;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/m9k0;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    sget-object v1, Ll/htd0;->b:Ll/htd0;

    .line 27
    .line 28
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/jfv;

    .line 33
    .line 34
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 45
    .line 46
    iget-wide v1, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 47
    .line 48
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ll/vwt;->R5()J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    cmp-long v1, v1, v3

    .line 57
    .line 58
    if-gez v1, :cond_2

    .line 59
    .line 60
    iget-object v1, p0, Ll/m9k0;->r:Ljava/lang/String;

    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object v1, p0, Ll/m9k0;->q:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/m9k0;->x4(Ll/nsv;Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ms2;->Y3()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final x4(Ll/nsv;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k9k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/k9k0;-><init>(Ll/m9k0;Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2, v0}, Ll/d9k0;->d(Ll/i6t;Ljava/util/List;Ll/y20;)Landroidx/appcompat/app/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/m9k0;->o:Landroidx/appcompat/app/a;

    .line 11
    .line 12
    return-void
.end method
