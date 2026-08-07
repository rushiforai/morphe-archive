.class public Ll/ssm0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/z5o0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->lb:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/ssm0;->i:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->tb:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/ssm0;->j:Ljava/lang/String;

    .line 23
    .line 24
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ob:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/ssm0;->k:Ljava/lang/String;

    .line 33
    .line 34
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/ssm0;->l:Ljava/lang/String;

    .line 43
    .line 44
    const-string p1, ""

    .line 45
    .line 46
    iput-object p1, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 47
    .line 48
    new-instance p1, Ll/z5o0;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/z5o0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic J3(Ll/ssm0;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ssm0;->t4(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->u9:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic L3(Ll/ssm0;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ssm0;->o4(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/ssm0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ssm0;->s4(Z)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic O3(Ll/ssm0;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ssm0;->n4(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/ssm0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->j4(Ll/nsv;)V

    return-void
.end method

.method public static synthetic R3(Ll/ssm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->e4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/ssm0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->r4(Z)V

    return-void
.end method

.method public static synthetic T3(Ll/ssm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ssm0;->p4()V

    return-void
.end method

.method public static synthetic U3(Ll/ssm0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->l4(Ll/nsv;)V

    return-void
.end method

.method public static synthetic V3(Ll/ssm0;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ssm0;->q4(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic W3(Ll/ssm0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->m4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;)V

    return-void
.end method

.method public static synthetic X3(Ll/ssm0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssm0;->k4(Ll/nsv;)V

    return-void
.end method

.method private Y3(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rsm0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rsm0;-><init>(Ll/ssm0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/esm0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/esm0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private c4(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-ne p0, v1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v2, 0x2

    .line 21
    if-ne p0, v2, :cond_1

    .line 22
    .line 23
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->J6:I

    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    const/4 v3, 0x3

    .line 49
    if-ne p0, v3, :cond_2

    .line 50
    .line 51
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 52
    .line 53
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->i7:I

    .line 54
    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {v0, v1, p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, v3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_2
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 77
    .line 78
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->h7:I

    .line 79
    .line 80
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    filled-new-array {v0, v1, p1}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, v3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method private h4(Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of v0, p1, Ll/e3t;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p1, Ll/e3t;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/e3t;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private i4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method private synthetic n4(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/ssm0;->l:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Ll/ssm0;->k:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0
.end method

.method private synthetic s4(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, p1}, Ll/oo2;->r1(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private w4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->refresh()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/dsm0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/dsm0;-><init>(Ll/ssm0;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->kickOff()Ll/v3f$d;

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
    new-instance v1, Ll/jsm0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/jsm0;-><init>(Ll/ssm0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->forbiddenWords()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/ksm0;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ksm0;-><init>(Ll/ssm0;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->unMuteWords()Ll/v3f$d;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lrx/c;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/lsm0;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/lsm0;-><init>(Ll/ssm0;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public Z3(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->q4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public a4(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->m6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public b4()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    invoke-virtual {v0}, Ll/oo2;->F0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/oo2;->G0()Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/ssm0;->j:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ssm0;->k:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v2, p0, Ll/ssm0;->l:Ljava/lang/String;

    .line 35
    .line 36
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, p0, Ll/ssm0;->i:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Ll/ssm0;->k:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, p0, Ll/ssm0;->l:Ljava/lang/String;

    .line 50
    .line 51
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-direct {p0}, Ll/ssm0;->i4()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    iget-object v1, p0, Ll/ssm0;->i:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ssm0;->j:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/oo2;->F0()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/4 v1, 0x2

    .line 85
    if-ne v0, v1, :cond_2

    .line 86
    .line 87
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/vwt;->I4()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_2

    .line 100
    .line 101
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/vwt;->I4()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-direct {p0, v0}, Ll/ssm0;->Y3(Ljava/util/List;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    const/4 v0, 0x0

    .line 115
    :cond_3
    :goto_1
    if-nez v0, :cond_4

    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    new-array p0, p0, [Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :cond_4
    return-object v0
.end method

.method public d4(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->unMuteWords(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final e4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0xa21c

    .line 10
    .line 11
    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const v0, 0xc761

    .line 15
    .line 16
    .line 17
    if-ne p0, v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 26
    .line 27
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v9:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public f4(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ssm0;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/ssm0;->x4(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/ssm0;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/ssm0;->x4(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Ll/ssm0;->k:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ssm0;->v4()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object v0, p0, Ll/ssm0;->l:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ssm0;->u4()V

    .line 48
    .line 49
    .line 50
    :cond_3
    return-void
.end method

.method public g4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0xa02c

    .line 10
    .line 11
    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const v0, 0xa21c

    .line 15
    .line 16
    .line 17
    if-eq p0, v0, :cond_0

    .line 18
    .line 19
    const v0, 0xc761

    .line 20
    .line 21
    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R6:I

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
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 43
    .line 44
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oe:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 55
    .line 56
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R6:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic j4(Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ssm0;->h4(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ssm0;->v4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k4(Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ssm0;->h4(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ssm0;->u4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic l4(Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ssm0;->z4(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/ManagerPersonBean;->livingUser:Ll/nsv;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/ssm0;->y4(Lcom/p1/mobile/android/app/Act;Ll/nsv;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/ssm0;->n:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o4(Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->setJailed()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, "\u5df2\u88ab\u7981\u8a00"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic p4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ssm0;->Z3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/hsm0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/hsm0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/osm0;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/osm0;-><init>(Ll/ssm0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic q4(ZLl/uxj0;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/pf60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "anchorId"

    .line 18
    .line 19
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/pf60;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, "liveId"

    .line 33
    .line 34
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/pf60;

    .line 38
    .line 39
    const-string v3, "confirm_type"

    .line 40
    .line 41
    const-string v4, "kick_user"

    .line 42
    .line 43
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance v3, Ll/pf60;

    .line 47
    .line 48
    const-string v4, "user_type"

    .line 49
    .line 50
    invoke-static {p0}, Ll/i9o0;->l(Ll/i6t;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "e_audio_room_pop_confirm_button"

    .line 62
    .line 63
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-direct {p0}, Ll/ssm0;->w4()V

    .line 67
    .line 68
    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    const-string p0, "\u5df2\u8e22\u51fa\u8be5\u7528\u6237"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 75
    .line 76
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->S6:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    :goto_0
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic r4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ssm0;->a4(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/fsm0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/fsm0;-><init>(Ll/ssm0;Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/gsm0;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/gsm0;-><init>(Ll/ssm0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic t4(Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->setJailed()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, "\u5df2\u88ab\u53d6\u6d88\u7981\u8a00"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u4()V
    .locals 3

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
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/ssm0;->Z3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v2, Ll/psm0;

    .line 26
    .line 27
    invoke-direct {v2, p0, v1}, Ll/psm0;-><init>(Ll/ssm0;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/osm0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/osm0;-><init>(Ll/ssm0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/qsm0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/qsm0;-><init>(Ll/ssm0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/egn0;->c(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public v4()V
    .locals 3

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
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/msm0;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/msm0;-><init>(Ll/ssm0;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v0, v2}, Ll/lqn0;->c(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public x4(Z)V
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->je:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/vwt;->I4()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Ll/vwt;->I4()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {p0, v2}, Ll/ssm0;->Y3(Ljava/util/List;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v2, 0x0

    .line 53
    :goto_0
    if-eqz v2, :cond_3

    .line 54
    .line 55
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 63
    .line 64
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->g7:I

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-direct {p0, v2}, Ll/ssm0;->c4(Ljava/util/List;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 84
    .line 85
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->P2:I

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v2, p0, Ll/ssm0;->m:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 94
    .line 95
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 116
    .line 117
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    new-instance v3, Ll/ism0;

    .line 124
    .line 125
    invoke-direct {v3, p0, p1}, Ll/ism0;-><init>(Ll/ssm0;Z)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 133
    .line 134
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_4

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 151
    .line 152
    .line 153
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public y4(Lcom/p1/mobile/android/app/Act;Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/ssm0;->h4(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p2, Ll/z5o0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ssm0;->b4()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2, p1, p0}, Ll/z5o0;->d(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ssm0;->d4(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, Ll/nsm0;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Ll/nsm0;-><init>(Ll/ssm0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/osm0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/osm0;-><init>(Ll/ssm0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method
