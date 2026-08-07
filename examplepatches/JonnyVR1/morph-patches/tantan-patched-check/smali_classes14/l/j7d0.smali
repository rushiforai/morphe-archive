.class public Ll/j7d0;
.super Ll/spl0;
.source "SourceFile"


# static fields
.field public static h:Ll/j7d0;


# instance fields
.field public final b:Ll/byd0;

.field public final c:Ll/vxd0;

.field public final d:Ll/byd0;

.field public e:J

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/spl0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "last_likers_req_time"

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
    iput-object v0, p0, Ll/j7d0;->b:Ll/byd0;

    .line 38
    .line 39
    new-instance v1, Ll/vxd0;

    .line 40
    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v4, "offline_dialog_show_time"

    .line 44
    .line 45
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const/4 v4, 0x0

    .line 64
    invoke-direct {v1, v3, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Ll/j7d0;->c:Ll/vxd0;

    .line 68
    .line 69
    new-instance v1, Ll/byd0;

    .line 70
    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v4, "offline_like_dialog_last_time"

    .line 74
    .line 75
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-direct {v1, v3, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Ll/j7d0;->d:Ll/byd0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ljava/lang/Long;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    iput-wide v0, p0, Ll/j7d0;->e:J

    .line 109
    .line 110
    return-void
.end method

.method public static c0()Ll/j7d0;
    .locals 2

    .line 1
    sget-object v0, Ll/j7d0;->h:Ll/j7d0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/j7d0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/j7d0;->h:Ll/j7d0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/j7d0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/j7d0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/j7d0;->h:Ll/j7d0;

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
    sget-object v0, Ll/j7d0;->h:Ll/j7d0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static d0(Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static e0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/j7d0;->h:Ll/j7d0;

    .line 3
    .line 4
    return-void
.end method

.method public static f0()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/j7d0;->g0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0

    .line 12
    :cond_0
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, v0, Ll/j7d0;->f:Z

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static g0()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Ll/j7d0;->f:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    return v0
.end method

.method public static h0(Ll/b240;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v3, 0x1

    .line 38
    iput-boolean v3, v2, Ll/j7d0;->f:Z

    .line 39
    .line 40
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-boolean v3, v2, Ll/j7d0;->g:Z

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    sput-boolean v2, Ll/b240;->X0:Z

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/b240;->t5()V

    .line 50
    .line 51
    .line 52
    iget p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 53
    .line 54
    invoke-static {v1, p0, v0}, Ll/hl3;->J(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Ll/j7d0;->d:Ll/byd0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_0

    .line 78
    .line 79
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p0, p0, Ll/j7d0;->c:Ll/vxd0;

    .line 84
    .line 85
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-object p0, p0, Ll/j7d0;->c:Ll/vxd0;

    .line 98
    .line 99
    invoke-virtual {p0, v3}, Ll/vxd0;->a(I)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iget-object p0, p0, Ll/j7d0;->d:Ll/byd0;

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    :cond_1
    return-void
.end method
