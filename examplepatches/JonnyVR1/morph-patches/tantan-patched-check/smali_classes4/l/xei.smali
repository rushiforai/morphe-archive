.class public Ll/xei;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static e:Ll/xei;


# instance fields
.field public a:Ll/byd0;

.field public b:Ll/vxd0;

.field public c:Ll/byd0;

.field public d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "female_vip_guide_show_time_v2"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/xei;->a:Ll/byd0;

    .line 38
    .line 39
    new-instance v0, Ll/vxd0;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "female_vip_home_card_swipe_count"

    .line 44
    .line 45
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v3, 0x1

    .line 64
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/xei;->b:Ll/vxd0;

    .line 68
    .line 69
    new-instance v0, Ll/byd0;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, "female_vip_home_card_last_swipe_time"

    .line 74
    .line 75
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Ll/xei;->c:Ll/byd0;

    .line 97
    .line 98
    const/4 v0, 0x0

    .line 99
    iput-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 100
    .line 101
    return-void
.end method

.method public static c()Ll/xei;
    .locals 2

    .line 1
    sget-object v0, Ll/xei;->e:Ll/xei;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/xei;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/xei;->e:Ll/xei;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/xei;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/xei;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/xei;->e:Ll/xei;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/xei;->e:Ll/xei;

    .line 27
    .line 28
    return-object v0
.end method

.method public static k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/xei;->e:Ll/xei;

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/t$a;->C()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final b()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xei;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/data/FemaleVipConfig;->guide_card_swipe_limit_count:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x5

    .line 18
    return p0
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xei;->b:Ll/vxd0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/xei;->c:Ll/byd0;

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "female_vip_config"

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/FemaleVipConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 18
    .line 19
    iput-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    :catch_0
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xei;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xei;->l()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->C3()Z

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
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->FemaleVipGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 16
    .line 17
    const-string v1, "VirtualCard"

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/xei;->a:Ll/byd0;

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final h()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xei;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/data/FemaleVipConfig;->guide_card_insert_interval_day:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/16 p0, 0xa

    .line 18
    .line 19
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xei;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/xei;->d:Lcom/p1/mobile/putong/core/data/FemaleVipConfig;

    .line 13
    .line 14
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/FemaleVipConfig;->guide_card_right_swipe_guide_purchase:Z

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final j()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/xei;->c:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xei;->b:Ll/vxd0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xei;->b:Ll/vxd0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xei;->c:Ll/byd0;

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/xei;->a:Ll/byd0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xei;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xei;->a()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object v0, p0, Ll/xei;->b:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Ll/xei;->b()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge v0, v2, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    invoke-static {}, Ll/joa;->V3()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/joa;->C3()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ll/xei;->a:Ll/byd0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/Long;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-static {}, Ll/joa;->q3()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    cmp-long v0, v0, v2

    .line 60
    .line 61
    if-gez v0, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_2
    invoke-virtual {p0}, Ll/xei;->h()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object p0, p0, Ll/xei;->a:Ll/byd0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Ljava/lang/Long;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    invoke-static {v0, v1, v2}, Ll/pzi0;->B(IJ)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0
.end method
