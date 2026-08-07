.class public Ll/qhg;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/lag;

.field public b:Ll/yhg;


# direct methods
.method public constructor <init>(Ll/lag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qhg;->a:Ll/lag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/qhg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhg;->I(Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/qhg;->a:Ll/lag;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Ll/qhg;->a:Ll/lag;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "message"

    .line 24
    .line 25
    invoke-static {p1, v0, v1}, Ll/lig;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/qhg;->b:Ll/yhg;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->users:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 52
    .line 53
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 54
    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->followed:Z

    .line 58
    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, 0x1

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-object p1, p0, Ll/qhg;->a:Ll/lag;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->showFansRecallSelectPanel()Ll/v3f$d;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p0, p0, Ll/qhg;->b:Ll/yhg;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->v4:I

    .line 89
    .line 90
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method


# virtual methods
.method public J(Ll/yhg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qhg;->b:Ll/yhg;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->K0:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->T4:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lv/VText;

    .line 11
    .line 12
    new-instance v0, Ll/phg;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/phg;-><init>(Ll/qhg;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
