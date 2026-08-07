.class public Ll/bwj;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/owj;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/qvj;


# direct methods
.method public constructor <init>(Ll/s1e;Ll/qvj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/bwj;->c:Ll/qvj;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bwj;->s(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic e(Ll/bwj;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bwj;->o(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Ll/bwj;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bwj;->r(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic g(Ll/bwj;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bwj;->n(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ij2;->destroy()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/lu8;->I3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/uie;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string p1, "video"

    .line 30
    .line 31
    invoke-static {p1}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v0, Ll/g4d0;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/g4d0;-><init>()V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p1, p0, v1, v0}, Ll/k4;->c(Ljava/lang/String;ZLl/y4m$a;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Ll/uie;->f(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 2
    .line 3
    iget p0, p0, Ll/qvj;->u:I

    .line 4
    .line 5
    return p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/owj;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/owj;->r()V

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
    new-instance v1, Ll/wvj;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/wvj;-><init>()V

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
    new-instance v1, Ll/xvj;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/xvj;-><init>(Ll/bwj;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/yvj;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/yvj;-><init>(Ll/bwj;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 57
    .line 58
    const-string v1, "svip"

    .line 59
    .line 60
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/zvj;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/zvj;-><init>(Ll/bwj;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "note"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const-string v0, "greet"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-ne p0, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final synthetic n(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bwj;->m()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->new_()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "o_diamond_gift_id"

    .line 26
    .line 27
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "\u65e0\u9650\u6253\u62db\u547c"

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 32
    .line 33
    const/16 v0, 0x3e7

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return-object p1
.end method

.method public final synthetic o(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/owj;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/qvj;->N()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p1, p0}, Ll/owj;->w(Ljava/util/List;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bwj;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 10
    .line 11
    iget-object v0, p0, Ll/bwj;->c:Ll/qvj;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/qvj;->N()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, v0, p0}, Ll/lu8;->K3(Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 30
    .line 31
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/qvj;->N()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/lu8;->O3(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V
    .locals 6

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
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/qvj;->F()Ljava/lang/String;

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
    const-string v4, "p_chat,gift_send"

    .line 52
    .line 53
    if-eqz p2, :cond_0

    .line 54
    .line 55
    const-string p2, "picks_say_hi"

    .line 56
    .line 57
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {v3, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 87
    .line 88
    double-to-long v0, v0

    .line 89
    invoke-interface {p2, p0, v4, v0, v1}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ll/qvj;->F()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    const-string v5, "from_meet_liked"

    .line 102
    .line 103
    invoke-static {p2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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
    invoke-interface {p2, p0, v4, v0, v1}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 160
    .line 161
    double-to-long v0, v0

    .line 162
    invoke-interface {p2, p0, v4, v0, v1}, Ll/r97;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    iget-object p2, p0, Ll/bwj;->c:Ll/qvj;

    .line 167
    .line 168
    iget-object p2, p2, Ll/qvj;->p:Ll/y20;

    .line 169
    .line 170
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_3

    .line 175
    .line 176
    iget-object p2, p0, Ll/bwj;->c:Ll/qvj;

    .line 177
    .line 178
    iget-object p2, p2, Ll/qvj;->p:Ll/y20;

    .line 179
    .line 180
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 184
    .line 185
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public t()Ll/qvj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwj;->c:Ll/qvj;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/owj;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/owj;->v(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
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
    new-instance v1, Ll/awj;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/awj;-><init>(Ll/bwj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

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

.method public w(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/owj;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/owj;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/owj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/owj;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
