.class public Ll/b030;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/l030;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/pz20;

.field public d:Ll/f030;


# direct methods
.method public constructor <init>(Ll/s1e;Ll/pz20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/b030;->c:Ll/pz20;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/b030;Lcom/p1/mobile/putong/core/data/MyMeetExtra;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b030;->t(Lcom/p1/mobile/putong/core/data/MyMeetExtra;)V

    return-void
.end method

.method public static synthetic d(Ll/b030;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b030;->s(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic e(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b030;->u(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic g(Ll/b030;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b030;->r(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l030;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l030;->C()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b030;->o(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 2
    .line 3
    iget p0, p0, Ll/pz20;->u:I

    .line 4
    .line 5
    return p0
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b030;->c:Ll/pz20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "note"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/b030;->c:Ll/pz20;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "greet"

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 33
    .line 34
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/pz20;->N()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ll/lu8;->O3(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 47
    .line 48
    iget-object v1, p0, Ll/b030;->c:Ll/pz20;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/pz20;->N()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, v1, p0}, Ll/lu8;->K3(Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Ll/r97;->f()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/l030;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l030;->r()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/lu8;->h4()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/vz20;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/vz20;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/wz20;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/wz20;-><init>(Ll/b030;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/lu8;->P3()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/xz20;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/xz20;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/yz20;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/yz20;-><init>(Ll/b030;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    :cond_0
    iget-object v0, p0, Ll/b030;->c:Ll/pz20;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "note"

    .line 95
    .line 96
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    if-ne v0, v1, :cond_1

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/lu8;->g4()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/zz20;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/zz20;-><init>(Ll/b030;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    :cond_1
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z
    .locals 2

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ll/uie;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ll/uie;->f(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_0
    const-string p1, "video"

    .line 36
    .line 37
    invoke-static {p1}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v1, Ll/g4d0;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/g4d0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p0, v0, v1}, Ll/k4;->c(Ljava/lang/String;ZLl/y4m$a;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_1
    return v0
.end method

.method public final synthetic r(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l030;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/l030;->x(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b030;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/core/data/MyMeetExtra;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l030;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->title:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->subTitle:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/l030;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 5

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/lqb;->Y4()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-int p2, v0

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/lu8;->J3(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-gtz v0, :cond_2

    .line 21
    .line 22
    int-to-double v0, p2

    .line 23
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 24
    .line 25
    cmpg-double p2, v0, v2

    .line 26
    .line 27
    if-gez p2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/pz20;->F()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-string v0, "from_meet_picks"

    .line 38
    .line 39
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const-string v0, "chat_gift_id"

    .line 44
    .line 45
    const-string v1, "showfrom_meet_sayhi"

    .line 46
    .line 47
    const-string v2, "p_meet"

    .line 48
    .line 49
    const-string v3, "e_chat_gift_bar_gift_send"

    .line 50
    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    const-string p2, "picks_say_hi"

    .line 54
    .line 55
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-static {v3, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 85
    .line 86
    double-to-long v0, v0

    .line 87
    const-string p1, "p_meet_view,e_meet_gift_bar_picks,click"

    .line 88
    .line 89
    invoke-interface {p2, p0, p1, v0, v1}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ll/pz20;->F()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    const-string v4, "from_meet_liked"

    .line 102
    .line 103
    invoke-static {p2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_1

    .line 108
    .line 109
    const-string p2, "I_like_say_hi"

    .line 110
    .line 111
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {v3, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 141
    .line 142
    double-to-long v0, v0

    .line 143
    const-string p1, "p_meet_view,e_meet_gift_bar_ilike,click"

    .line 144
    .line 145
    invoke-interface {p2, p0, p1, v0, v1}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/pz20;->L()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    const-string v1, "e_gift"

    .line 168
    .line 169
    invoke-static {p0, v1}, Ll/vvj;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 174
    .line 175
    double-to-long v1, v1

    .line 176
    invoke-interface {p2, v0, p0, v1, v2}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_2
    iget-object p2, p0, Ll/b030;->c:Ll/pz20;

    .line 181
    .line 182
    iget-object p2, p2, Ll/pz20;->p:Ll/y20;

    .line 183
    .line 184
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-eqz p2, :cond_3

    .line 189
    .line 190
    iget-object p2, p0, Ll/b030;->c:Ll/pz20;

    .line 191
    .line 192
    iget-object p2, p2, Ll/pz20;->p:Ll/y20;

    .line 193
    .line 194
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    :cond_3
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public v()Ll/pz20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b030;->c:Ll/pz20;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l030;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/l030;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lqb;->k5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/a030;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/a030;-><init>(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/fjf0;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public y(Ll/f030;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b030;->d:Ll/f030;

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
    iget-object v0, p0, Ll/b030;->d:Ll/f030;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/f030;->I()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-object p1, p0, Ll/b030;->d:Ll/f030;

    .line 15
    .line 16
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l030;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/l030;->B(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
