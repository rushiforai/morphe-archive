.class public Ll/fvk;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    new-instance v0, Ll/evk;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/evk;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p0}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ll/nsv;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ")",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/bvk;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bvk;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/cvk;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/cvk;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, p0}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;
    .locals 3
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ")",
            "Ljava/util/List<",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
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
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 12
    .line 13
    new-instance v2, Ll/dvk;

    .line 14
    .line 15
    invoke-direct {v2, v1, v0}, Ll/dvk;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public static g(JJ)Ljava/lang/String;
    .locals 8

    .line 1
    sub-long/2addr p0, p2

    .line 2
    const-wide/16 p2, 0xe10

    .line 3
    .line 4
    div-long v0, p0, p2

    .line 5
    .line 6
    const-wide/16 v2, 0x3c

    .line 7
    .line 8
    div-long v4, p0, v2

    .line 9
    .line 10
    mul-long v6, v0, v2

    .line 11
    .line 12
    sub-long/2addr v4, v6

    .line 13
    mul-long/2addr v2, v4

    .line 14
    sub-long/2addr p0, v2

    .line 15
    mul-long/2addr p2, v0

    .line 16
    sub-long/2addr p0, p2

    .line 17
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->I2:I

    .line 18
    .line 19
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {v0, v1}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-static {v4, v5}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p0, p1}, Ll/kdu;->R(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p2, p3, v0, p0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "%1s %2s:%3s:%4s"

    .line 40
    .line 41
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;ZI)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I5:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->M5:I

    .line 13
    .line 14
    :goto_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t5:I

    .line 15
    .line 16
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    if-eqz p1, :cond_2

    .line 30
    .line 31
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J5:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N5:I

    .line 35
    .line 36
    :goto_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t5:I

    .line 37
    .line 38
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {p1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;",
            ")",
            "Ljava/util/List<",
            "Ll/lsw$b;",
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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardPrivileges:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardPrivileges:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;

    .line 31
    .line 32
    new-instance v3, Ll/lsw$b;

    .line 33
    .line 34
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->icon:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->title:Ljava/lang/String;

    .line 37
    .line 38
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->remain:I

    .line 39
    .line 40
    invoke-direct {v3, v4, v5, v2}, Ll/lsw$b;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 44
    .line 45
    invoke-static {v2}, Ll/fvk;->j(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput-object v2, v3, Ll/lsw$b;->b:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-object v0
.end method

.method public static j(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "#cc3253e1"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "#cc9732e1"

    .line 11
    .line 12
    return-object p0
.end method

.method public static k(JZ)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->h3:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->F6:I

    .line 13
    .line 14
    :goto_0
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p2, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, ""

    .line 24
    .line 25
    return-object p0
.end method

.method public static l(Ll/yuk;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/yuk;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;",
            ")",
            "Ljava/util/List<",
            "Ll/lsw$a;",
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
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_5

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_5

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 27
    .line 28
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 29
    .line 30
    const-string v3, "heartbeat"

    .line 31
    .line 32
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 39
    .line 40
    const-string v3, "cherish"

    .line 41
    .line 42
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    :cond_1
    new-instance v2, Ll/lsw$a;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/lsw$a;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 54
    .line 55
    iput-object v3, v2, Ll/lsw$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 56
    .line 57
    invoke-virtual {p0, v3}, Ll/yuk;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iput-boolean v3, v2, Ll/lsw$a;->f:Z

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Ll/yuk;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iput v3, v2, Ll/lsw$a;->g:I

    .line 70
    .line 71
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardNotice:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v3, v2, Ll/lsw$a;->t:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardPopupIcon:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v3, v2, Ll/lsw$a;->u:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 80
    .line 81
    invoke-static {v3}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    iget-wide v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 88
    .line 89
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->G5:I

    .line 90
    .line 91
    invoke-static {v5}, Ll/xau;->t(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    iput-object v5, v2, Ll/lsw$a;->b:Ljava/lang/String;

    .line 96
    .line 97
    sget v5, Ll/obc0;->y:I

    .line 98
    .line 99
    iput v5, v2, Ll/lsw$a;->h:I

    .line 100
    .line 101
    sget v5, Ll/obc0;->A2:I

    .line 102
    .line 103
    iput v5, v2, Ll/lsw$a;->i:I

    .line 104
    .line 105
    sget v5, Ll/obc0;->G2:I

    .line 106
    .line 107
    iput v5, v2, Ll/lsw$a;->l:I

    .line 108
    .line 109
    sget v5, Ll/obc0;->H2:I

    .line 110
    .line 111
    iput v5, v2, Ll/lsw$a;->m:I

    .line 112
    .line 113
    const-string v5, "#3253e1"

    .line 114
    .line 115
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    iput v5, v2, Ll/lsw$a;->n:I

    .line 120
    .line 121
    const-string v5, "#993353dd"

    .line 122
    .line 123
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    iput v6, v2, Ll/lsw$a;->o:I

    .line 128
    .line 129
    sget v6, Ll/obc0;->x:I

    .line 130
    .line 131
    iput v6, v2, Ll/lsw$a;->p:I

    .line 132
    .line 133
    iput-object v5, v2, Ll/lsw$a;->q:Ljava/lang/String;

    .line 134
    .line 135
    const-string v5, "#e0edff"

    .line 136
    .line 137
    iput-object v5, v2, Ll/lsw$a;->r:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 141
    .line 142
    invoke-static {v3}, Ll/lsw$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_3

    .line 147
    .line 148
    iget-wide v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 149
    .line 150
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->H5:I

    .line 151
    .line 152
    invoke-static {v5}, Ll/xau;->t(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    iput-object v5, v2, Ll/lsw$a;->b:Ljava/lang/String;

    .line 157
    .line 158
    sget v5, Ll/obc0;->K:I

    .line 159
    .line 160
    iput v5, v2, Ll/lsw$a;->h:I

    .line 161
    .line 162
    sget v5, Ll/obc0;->z2:I

    .line 163
    .line 164
    iput v5, v2, Ll/lsw$a;->i:I

    .line 165
    .line 166
    sget v5, Ll/obc0;->B2:I

    .line 167
    .line 168
    iput v5, v2, Ll/lsw$a;->l:I

    .line 169
    .line 170
    sget v5, Ll/obc0;->C2:I

    .line 171
    .line 172
    iput v5, v2, Ll/lsw$a;->m:I

    .line 173
    .line 174
    const-string v5, "#9f00d1"

    .line 175
    .line 176
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    iput v5, v2, Ll/lsw$a;->n:I

    .line 181
    .line 182
    const-string v5, "#999f00d1"

    .line 183
    .line 184
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    iput v6, v2, Ll/lsw$a;->o:I

    .line 189
    .line 190
    sget v6, Ll/obc0;->I:I

    .line 191
    .line 192
    iput v6, v2, Ll/lsw$a;->p:I

    .line 193
    .line 194
    iput-object v5, v2, Ll/lsw$a;->q:Ljava/lang/String;

    .line 195
    .line 196
    const-string v5, "#f3e0ff"

    .line 197
    .line 198
    iput-object v5, v2, Ll/lsw$a;->r:Ljava/lang/String;

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_3
    const-wide/16 v3, 0x0

    .line 202
    .line 203
    :goto_1
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 204
    .line 205
    invoke-virtual {p0, v5}, Ll/yuk;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)J

    .line 206
    .line 207
    .line 208
    move-result-wide v5

    .line 209
    iget-boolean v7, v2, Ll/lsw$a;->f:Z

    .line 210
    .line 211
    invoke-static {v5, v6, v7}, Ll/fvk;->k(JZ)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    iput-object v5, v2, Ll/lsw$a;->s:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 218
    .line 219
    iget-boolean v6, v2, Ll/lsw$a;->f:Z

    .line 220
    .line 221
    iget v7, v2, Ll/lsw$a;->g:I

    .line 222
    .line 223
    invoke-static {v5, v6, v7}, Ll/fvk;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;ZI)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    iput-object v5, v2, Ll/lsw$a;->e:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 230
    .line 231
    invoke-virtual {p0, v5}, Ll/yuk;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    iput v5, v2, Ll/lsw$a;->k:I

    .line 236
    .line 237
    iget-boolean v5, v2, Ll/lsw$a;->f:Z

    .line 238
    .line 239
    if-eqz v5, :cond_4

    .line 240
    .line 241
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 242
    .line 243
    invoke-virtual {p0, v5}, Ll/yuk;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)J

    .line 244
    .line 245
    .line 246
    move-result-wide v5

    .line 247
    long-to-double v5, v5

    .line 248
    invoke-static {v5, v6}, Ll/fvk;->p(D)I

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zb:I

    .line 253
    .line 254
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    invoke-static {v6, v5}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    iput-object v5, v2, Ll/lsw$a;->c:Ljava/lang/String;

    .line 263
    .line 264
    :cond_4
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->guardPrivileges:Ljava/util/List;

    .line 265
    .line 266
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->L5:I

    .line 271
    .line 272
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    invoke-static {v6, v3}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    iput-object v3, v2, Ll/lsw$a;->d:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {v1}, Ll/fvk;->i(Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;)Ljava/util/List;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    iput-object v1, v2, Ll/lsw$a;->j:Ljava/util/List;

    .line 295
    .line 296
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :cond_5
    return-object v0
.end method

.method public static m(D)I
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-float v0, v0

    .line 6
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    float-to-double v0, v0

    .line 10
    sub-double/2addr v0, p0

    .line 11
    const-wide p0, 0x40ac200000000000L    # 3600.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    div-double/2addr v0, p0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    double-to-int p0, p0

    .line 22
    return p0
.end method

.method public static n(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x64

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "100+"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Z)I
    .locals 0
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->v5:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->u5:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    invoke-static {p0}, Ll/lsw$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->x5:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w5:I

    .line 25
    .line 26
    return p0
.end method

.method public static p(D)I
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-float v0, v0

    .line 6
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    float-to-double v0, v0

    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 12
    .line 13
    sub-double/2addr p0, v0

    .line 14
    const-wide v0, 0x40f5180000000000L    # 86400.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr p0, v0

    .line 20
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    double-to-int p0, p0

    .line 25
    return p0
.end method

.method public static q(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;
    .locals 1

    .line 1
    sget v0, Ll/n9c0;->E0:I

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/fvk;->r(Ljava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static r(Ljava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableString;
    .locals 3
    .param p2    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Landroid/text/SpannableString;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    if-eq v0, p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 14
    .line 15
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-direct {p0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/2addr p1, v0

    .line 33
    const/16 p2, 0x12

    .line 34
    .line 35
    invoke-virtual {v1, p0, v0, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-object v1
.end method

.method public static s(D)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-float v0, v0

    .line 6
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    float-to-double v0, v0

    .line 10
    sub-double/2addr v0, p0

    .line 11
    const-wide p0, 0x40ac200000000000L    # 3600.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    div-double/2addr v0, p0

    .line 17
    const-wide/high16 p0, 0x4038000000000000L    # 24.0

    .line 18
    .line 19
    cmpg-double p0, v0, p0

    .line 20
    .line 21
    if-gtz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static t(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->rank:I

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ll/kfd0$a;->m(Ljava/lang/String;)Ll/kfd0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "e_guardboard"

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0, p1}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
