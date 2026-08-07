.class public Ll/c9n;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/g9n;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/e7n;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lv/VFrame;Landroid/view/View;Ll/e7n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/g9n;

    .line 5
    .line 6
    invoke-direct {p1, p2, p3}, Ll/g9n;-><init>(Lv/VFrame;Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    iput-object p4, p0, Ll/c9n;->j:Ll/e7n;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->isInUse:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic T3(Ll/c9n;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c9n;->V3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->status:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItemStatus;

    .line 2
    .line 3
    const-string v0, "locked"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/c9n;->X3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic V3(Ljava/util/List;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/c9n;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c9n;->Y3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/c9n;->j:Ll/e7n;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    xor-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/e7n;->V4(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/g9n;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/g9n;->j(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->status:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItemStatus;

    .line 2
    .line 3
    const-string v1, "locked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->noPermissionWarnText:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/rwn0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    const-string v2, "anchor_id"

    .line 33
    .line 34
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "bullet_type"

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    check-cast p0, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v2, "live_id"

    .line 57
    .line 58
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {v1, p1, p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "e_live_bullet_icon_lock"

    .line 67
    .line 68
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->id:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iput-object p1, p0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p0, p0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public X3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v0, v1, v2}, Ll/x8n;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/z8n;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/z8n;-><init>(Ll/c9n;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

.method public Y3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c9n;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/a9n;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/a9n;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 13
    .line 14
    iput-object v0, p0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/c9n;->l:Ljava/util/List;

    .line 19
    .line 20
    new-instance v1, Ll/b9n;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/b9n;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 30
    .line 31
    iput-object v0, p0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 32
    .line 33
    :cond_0
    return-void
.end method
