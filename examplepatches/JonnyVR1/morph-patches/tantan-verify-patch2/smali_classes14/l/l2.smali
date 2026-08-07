.class public Ll/l2;
.super Ll/xi5;
.source "SourceFile"


# static fields
.field public static volatile b:Ljava/lang/String;


# instance fields
.field public volatile a:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/l2;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic B(Ljava/lang/String;)Ll/uxj0;
    .locals 5

    .line 1
    const-string v0, "MAC "

    .line 2
    .line 3
    const-string v1, "/abtest/abgroup"

    .line 4
    .line 5
    invoke-static {v1}, Ll/xi5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/rnl;->p()Ll/rnl$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "device_identifier"

    .line 18
    .line 19
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    :try_start_0
    sget-object v3, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v1}, Ll/rnl$a;->d()Ll/rnl;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v3, v1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget-object v3, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 43
    .line 44
    invoke-static {v3, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 53
    .line 54
    .line 55
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 56
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3}, Ll/rnl;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {p0}, Ll/x1d0;->a()Ll/z1d0;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/api/api/Network;->fakeToken(Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 86
    :try_start_2
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v3, "Authorization"

    .line 91
    .line 92
    invoke-virtual {v1, v3, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 97
    .line 98
    .line 99
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 100
    goto :goto_1

    .line 101
    :catch_0
    move-exception v0

    .line 102
    goto :goto_0

    .line 103
    :catch_1
    move-exception v0

    .line 104
    const/16 v1, 0x32

    .line 105
    .line 106
    :try_start_3
    invoke-static {v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :catch_2
    move-exception v0

    .line 111
    move-object p0, v2

    .line 112
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    if-nez p0, :cond_0

    .line 116
    .line 117
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_0
    :try_start_4
    sget-object v0, Ll/uqb0;->D:Ll/rg50;

    .line 121
    .line 122
    invoke-virtual {v0, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 127
    .line 128
    .line 129
    move-result-object p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 130
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :catchall_0
    move-exception p0

    .line 135
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 136
    .line 137
    .line 138
    throw p0

    .line 139
    :catch_3
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 140
    .line 141
    .line 142
    :goto_2
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 143
    .line 144
    :goto_3
    return-object p0
.end method

.method public static synthetic C(Ljava/lang/Throwable;)Ll/pf60;
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "old"

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static synthetic D(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;J)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/l2;->Q(Lcom/p1/mobile/putong/api/ABManager$Mode;J)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Ll/l2;J)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l2;->R(J)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ljava/lang/Boolean;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "new"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic G()Ll/uxj0;
    .locals 2

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/api/api/Network;->maybeUpdateRequestBeforeCall(Ll/x1d0;)Ll/x1d0;

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static synthetic H(Ljava/lang/Throwable;)Ll/pf60;
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "new"

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static declared-synchronized I(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-class v0, Ll/l2;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/l2;->b:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object v1, Ll/l2;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Ll/giw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/immomo/momosec/jni/MNative;->b()Lcom/immomo/momosec/jni/MNative;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, p0, v1}, Lcom/immomo/momosec/jni/MNative;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit v0

    .line 29
    return-object p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0

    .line 33
    :catch_0
    :cond_0
    monitor-exit v0

    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public static declared-synchronized K(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-class v0, Ll/l2;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/l2;->b:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object v1, Ll/l2;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Ll/giw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/immomo/momosec/jni/MNative;->b()Lcom/immomo/momosec/jni/MNative;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, p0, v1}, Lcom/immomo/momosec/jni/MNative;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit v0

    .line 29
    return-object p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0

    .line 33
    :catch_0
    :cond_0
    monitor-exit v0

    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public static X(Lcom/p1/mobile/putong/api/ABManager$Mode;JLjava/lang/Exception;)V
    .locals 4

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "ab_mode"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/pf60;

    .line 9
    .line 10
    const-string v2, "duration"

    .line 11
    .line 12
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ll/pf60;

    .line 20
    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p2, "unknown"

    .line 33
    .line 34
    :goto_0
    const-string v2, "fail_"

    .line 35
    .line 36
    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-string v2, "result"

    .line 41
    .line 42
    invoke-direct {p1, v2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/pf60;

    .line 46
    .line 47
    const-string v2, "last_ab_used"

    .line 48
    .line 49
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-direct {p2, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    filled-new-array {v0, v1, p1, p2}, [Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "e_load_ab_data_end"

    .line 59
    .line 60
    const-string v0, ""

    .line 61
    .line 62
    invoke-static {p2, v0, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static Y(Lcom/p1/mobile/putong/api/ABManager$Mode;JZ)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "ab_mode"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/pf60;

    .line 9
    .line 10
    const-string v2, "duration"

    .line 11
    .line 12
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ll/pf60;

    .line 20
    .line 21
    const-string p2, "result"

    .line 22
    .line 23
    const-string v2, "success"

    .line 24
    .line 25
    invoke-direct {p1, p2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Ll/pf60;

    .line 29
    .line 30
    const-string v2, "last_ab_used"

    .line 31
    .line 32
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-direct {p2, v2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    filled-new-array {v0, v1, p1, p2}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "e_load_ab_data_end"

    .line 44
    .line 45
    const-string p3, ""

    .line 46
    .line 47
    invoke-static {p2, p3, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static Z(Lcom/p1/mobile/putong/api/ABManager$Mode;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "ab_mode"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    filled-new-array {v0}, [Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "e_load_ab_data_begin"

    .line 13
    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic x(Ll/l2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l2;->P(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic y(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l2;->O(Lcom/p1/mobile/putong/api/ABManager$Mode;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z(JLjava/lang/Boolean;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->y(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    sget-object p2, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    sub-long/2addr v1, p0

    .line 21
    invoke-static {p2, v1, v2, v0}, Ll/l2;->Y(Lcom/p1/mobile/putong/api/ABManager$Mode;JZ)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public final J(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/16 v2, 0x26

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/util/Map$Entry;

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const/16 v3, 0x3d

    .line 38
    .line 39
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/4 v1, 0x1

    .line 60
    if-lt p1, v1, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    sub-int/2addr p1, v1

    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-ne p1, v2, :cond_1

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    sub-int/2addr p1, v1

    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-virtual {p0}, Ll/l2;->N()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/l2;->I(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/api/ABManager$Mode;)Lrx/c;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/ABManager$Mode;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/d2;-><init>(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/e2;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/e2;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/f2;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/f2;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final M(Lcom/p1/mobile/putong/api/ABManager$Mode;J)Lrx/c;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/ABManager$Mode;",
            "J)",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/l2;->a:Z

    .line 3
    .line 4
    new-instance v0, Ll/a2;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2, p3}, Ll/a2;-><init>(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;J)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/l2$a;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/l2$a;-><init>(Ll/l2;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/c2;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/c2;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final N()V
    .locals 1

    .line 1
    sget-object p0, Ll/l2;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    const-class p0, Lcom/immomo/momosec/jni/MNative;

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    sget-object v0, Ll/l2;->b:Ljava/lang/String;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/immomo/momosec/jni/MNative;->b()Lcom/immomo/momosec/jni/MNative;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/immomo/momosec/jni/MNative;->o()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Ll/l2;->b:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw v0

    .line 29
    :cond_1
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/api/ABManager$Mode;)Ljava/lang/Boolean;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/l2;->N()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "/ttt/abtest/abgroup"

    .line 19
    .line 20
    invoke-static {v1}, Ll/xi5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/rnl;->p()Ll/rnl$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "oneid"

    .line 33
    .line 34
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v2, v3}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v2, v3}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "appsflyer_id"

    .line 54
    .line 55
    invoke-virtual {v1, v3, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 56
    .line 57
    .line 58
    sget v2, Ll/uqb0;->f0:I

    .line 59
    .line 60
    if-nez v2, :cond_0

    .line 61
    .line 62
    const-string v2, "none"

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    sget v3, Ll/uqb0;->f0:I

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v3, ""

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    :goto_0
    const-string v3, "mobile_country_code"

    .line 85
    .line 86
    invoke-virtual {v1, v3, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 87
    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    :try_start_0
    sget-object v3, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v1}, Ll/rnl$a;->d()Ll/rnl;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v3, v1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const-string v3, "X-Crypto-Pub-Key"

    .line 109
    .line 110
    sget-object v4, Ll/l2;->b:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1, v3, v4}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 117
    .line 118
    .line 119
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 120
    :try_start_1
    invoke-virtual {p0, v1, v0}, Ll/l2;->b0(Ll/x1d0;Ljava/lang/String;)Ll/x1d0;

    .line 121
    .line 122
    .line 123
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 124
    goto :goto_2

    .line 125
    :catch_0
    move-exception p0

    .line 126
    goto :goto_1

    .line 127
    :catch_1
    move-exception p0

    .line 128
    move-object v1, v2

    .line 129
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    move-object p0, v1

    .line 133
    :goto_2
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/api/api/Network;->addLocationHeader(Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;

    .line 138
    .line 139
    .line 140
    :try_start_2
    sget-object v0, Ll/uqb0;->D:Ll/rg50;

    .line 141
    .line 142
    invoke-virtual {v0, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/api/ABManager;->g0(Ll/i5d0;Lcom/p1/mobile/putong/api/ABManager$Mode;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 151
    .line 152
    .line 153
    :catch_2
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 154
    .line 155
    .line 156
    goto :goto_3

    .line 157
    :catchall_0
    move-exception p0

    .line 158
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 159
    .line 160
    .line 161
    throw p0

    .line 162
    :goto_3
    if-eqz v2, :cond_1

    .line 163
    .line 164
    const/4 p0, 0x1

    .line 165
    goto :goto_4

    .line 166
    :cond_1
    const/4 p0, 0x0

    .line 167
    :goto_4
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0
.end method

.method public final synthetic P(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/yp50;->e()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0x7d0

    .line 11
    .line 12
    cmp-long p1, v0, v2

    .line 13
    .line 14
    if-gtz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/l2;->T()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "oneid"

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    const-string v0, "request"

    .line 24
    .line 25
    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/api/ABManager$Mode;J)Ljava/lang/Boolean;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "raw_testGroup start fromCallable\uff0cthread="

    .line 8
    .line 9
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v3, "[putong-common][ab]"

    .line 24
    .line 25
    invoke-static {v3, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v4, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 33
    .line 34
    invoke-virtual {v4}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    sget-object v5, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 47
    .line 48
    if-eq v2, v5, :cond_1

    .line 49
    .line 50
    sget-object v6, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 51
    .line 52
    if-ne v2, v6, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->C()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->D()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    :goto_1
    const-string v7, "/abtest/abgroup"

    .line 65
    .line 66
    invoke-static {v7}, Ll/xi5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-static {v7}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-virtual {v7}, Ll/rnl;->p()Ll/rnl$a;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    new-instance v8, Ljava/util/HashMap;

    .line 79
    .line 80
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v9, "affiliate"

    .line 84
    .line 85
    sget-object v10, Ll/ls4;->a:Ljava/lang/String;

    .line 86
    .line 87
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    const-string v9, "device_identifier"

    .line 91
    .line 92
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    const-string v9, "device_name"

    .line 100
    .line 101
    sget-object v10, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 102
    .line 103
    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    sget-object v9, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v9

    .line 112
    const-string v10, "os_version"

    .line 113
    .line 114
    invoke-interface {v8, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    sget v9, Ll/uqb0;->f0:I

    .line 118
    .line 119
    if-nez v9, :cond_2

    .line 120
    .line 121
    const-string v9, "none"

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    sget v10, Ll/uqb0;->f0:I

    .line 130
    .line 131
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v10, ""

    .line 135
    .line 136
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    :goto_2
    const-string v10, "mobile_country_code"

    .line 144
    .line 145
    invoke-interface {v8, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    const-string v9, "oneid"

    .line 149
    .line 150
    invoke-interface {v8, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    const-string v10, "md5"

    .line 154
    .line 155
    invoke-interface {v8, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    sget-object v6, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 159
    .line 160
    const-string v10, "X-Crypto-Pub-Key"

    .line 161
    .line 162
    const-string v11, "X-Testing-Group-V2-Tag"

    .line 163
    .line 164
    const-string v12, "_mzip_"

    .line 165
    .line 166
    const-string v13, "mode"

    .line 167
    .line 168
    const/4 v14, 0x0

    .line 169
    if-ne v2, v6, :cond_4

    .line 170
    .line 171
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/ABManager$Mode;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-interface {v8, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    const-string v5, "request"

    .line 183
    .line 184
    if-eqz v0, :cond_3

    .line 185
    .line 186
    const-string v0, "deviceid"

    .line 187
    .line 188
    invoke-static {v5, v0, v14}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 189
    .line 190
    .line 191
    new-instance v0, Ll/i2;

    .line 192
    .line 193
    invoke-direct {v0, v1}, Ll/i2;-><init>(Ll/l2;)V

    .line 194
    .line 195
    .line 196
    invoke-static {v0}, Ll/zp50;->h(Ll/r1m;)V

    .line 197
    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_3
    invoke-static {v5, v9, v14}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 201
    .line 202
    .line 203
    :goto_3
    invoke-virtual {v1, v8}, Ll/l2;->J(Ljava/util/Map;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v7, v12, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 208
    .line 209
    .line 210
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v7}, Ll/rnl$a;->d()Ll/rnl;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    invoke-virtual {v0, v5}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-instance v5, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    invoke-virtual {v0, v5}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    sget-object v5, Ll/l2;->b:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v0, v10, v5}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    :goto_4
    move-object v5, v0

    .line 255
    goto/16 :goto_5

    .line 256
    .line 257
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 258
    .line 259
    if-ne v2, v0, :cond_5

    .line 260
    .line 261
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/ABManager$Mode;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v5

    .line 265
    invoke-interface {v8, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1, v8}, Ll/l2;->J(Ljava/util/Map;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-virtual {v7, v12, v5}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 273
    .line 274
    .line 275
    sget-object v5, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 276
    .line 277
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    invoke-virtual {v7}, Ll/rnl$a;->d()Ll/rnl;

    .line 282
    .line 283
    .line 284
    move-result-object v6

    .line 285
    invoke-virtual {v5, v6}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    new-instance v6, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {v6, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {v5, v0}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    sget-object v5, Ll/l2;->b:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v0, v10, v5}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    goto :goto_4

    .line 320
    :cond_5
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/ABManager$Mode;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-interface {v8, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1, v8}, Ll/l2;->J(Ljava/util/Map;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v7, v12, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 332
    .line 333
    .line 334
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 335
    .line 336
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-virtual {v7}, Ll/rnl$a;->d()Ll/rnl;

    .line 341
    .line 342
    .line 343
    move-result-object v5

    .line 344
    invoke-virtual {v0, v5}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    new-instance v5, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v5

    .line 360
    invoke-virtual {v0, v5}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    sget-object v5, Ll/l2;->b:Ljava/lang/String;

    .line 369
    .line 370
    invoke-virtual {v0, v10, v5}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    goto :goto_4

    .line 379
    :goto_5
    :try_start_0
    invoke-virtual {v1, v5, v4}, Ll/l2;->b0(Ll/x1d0;Ljava/lang/String;)Ll/x1d0;

    .line 380
    .line 381
    .line 382
    move-result-object v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    goto :goto_6

    .line 384
    :catch_0
    move-exception v0

    .line 385
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 386
    .line 387
    .line 388
    :goto_6
    invoke-static {v2}, Ll/l2;->Z(Lcom/p1/mobile/putong/api/ABManager$Mode;)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v5}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/api/api/Network;->addLocationHeader(Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;

    .line 396
    .line 397
    .line 398
    const/4 v4, 0x0

    .line 399
    :try_start_1
    sget-object v0, Ll/uqb0;->D:Ll/rg50;

    .line 400
    .line 401
    invoke-virtual {v0, v5}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-interface {v0}, Ll/ry3;->execute()Ll/i5d0;

    .line 406
    .line 407
    .line 408
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 409
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 410
    .line 411
    .line 412
    move-object v15, v4

    .line 413
    move-object v4, v0

    .line 414
    move-object v0, v15

    .line 415
    goto :goto_9

    .line 416
    :catchall_0
    move-exception v0

    .line 417
    goto :goto_7

    .line 418
    :catch_1
    move-exception v0

    .line 419
    goto :goto_8

    .line 420
    :goto_7
    invoke-static {v4}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 421
    .line 422
    .line 423
    throw v0

    .line 424
    :goto_8
    invoke-static {v4}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 425
    .line 426
    .line 427
    :goto_9
    if-nez v4, :cond_6

    .line 428
    .line 429
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 430
    .line 431
    .line 432
    move-result-wide v5

    .line 433
    sub-long v5, v5, p2

    .line 434
    .line 435
    invoke-static {v2, v5, v6, v0}, Ll/l2;->X(Lcom/p1/mobile/putong/api/ABManager$Mode;JLjava/lang/Exception;)V

    .line 436
    .line 437
    .line 438
    goto :goto_a

    .line 439
    :cond_6
    iget-boolean v0, v1, Ll/l2;->a:Z

    .line 440
    .line 441
    if-eqz v0, :cond_7

    .line 442
    .line 443
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 444
    .line 445
    .line 446
    move-result-wide v0

    .line 447
    sub-long v0, v0, p2

    .line 448
    .line 449
    invoke-static {v2, v0, v1, v14}, Ll/l2;->Y(Lcom/p1/mobile/putong/api/ABManager$Mode;JZ)V

    .line 450
    .line 451
    .line 452
    :cond_7
    :goto_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 453
    .line 454
    const-string v1, "raw_testGroup end fromCallable\uff0cthread="

    .line 455
    .line 456
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-static {v3, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    if-eqz v4, :cond_8

    .line 474
    .line 475
    const/4 v14, 0x1

    .line 476
    :cond_8
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    return-object v0
.end method

.method public final synthetic R(J)Ljava/lang/Boolean;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 2
    .line 3
    const-wide v4, 0x7fffffffffffffffL

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-wide v2, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/l2;->S(Lcom/p1/mobile/putong/api/ABManager$Mode;JJ)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final S(Lcom/p1/mobile/putong/api/ABManager$Mode;JJ)Ljava/lang/Boolean;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "raw_testGroup start thread="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[putong-common][ab]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, p3}, Ll/l2;->M(Lcom/p1/mobile/putong/api/ABManager$Mode;J)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p1}, Ll/l2;->L(Lcom/p1/mobile/putong/api/ABManager$Mode;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {p2, p3}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    sget-object p3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 37
    .line 38
    invoke-virtual {p2, p4, p5, p3}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p2, p3}, Lrx/c;->onErrorResumeNext(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Lrx/c;->toList()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Lrx/c;->toBlocking()Ll/o43;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Ll/o43;->b()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    check-cast p2, Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const/4 p3, 0x0

    .line 69
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result p4

    .line 73
    if-eqz p4, :cond_1

    .line 74
    .line 75
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    check-cast p4, Ll/pf60;

    .line 80
    .line 81
    iget-object p5, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast p5, Ljava/lang/CharSequence;

    .line 84
    .line 85
    const-string v0, "old"

    .line 86
    .line 87
    invoke-static {p5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p5

    .line 91
    if-eqz p5, :cond_0

    .line 92
    .line 93
    iget-object p3, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast p3, Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    goto :goto_0

    .line 102
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/ABManager;->F(Lcom/p1/mobile/putong/api/ABManager$Mode;)V

    .line 103
    .line 104
    .line 105
    iput-boolean p3, p0, Ll/l2;->a:Z

    .line 106
    .line 107
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public T()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->d0()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "device_ab"

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->j()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string v1, "odevs"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :catch_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    new-instance v2, Ll/k2;

    .line 28
    .line 29
    invoke-direct {v2, p0, v0, v1}, Ll/k2;-><init>(Ll/l2;J)V

    .line 30
    .line 31
    .line 32
    invoke-static {v2}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance v2, Ll/b2;

    .line 51
    .line 52
    invoke-direct {v2, v0, v1}, Ll/b2;-><init>(J)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public U()V
    .locals 11

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 12
    .line 13
    invoke-interface {v2}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 24
    .line 25
    invoke-interface {v2}, Ll/bn5;->signedIn_()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-static {v2}, Lcom/p1/mobile/putong/api/ABManager;->X(Z)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->f0()V

    .line 36
    .line 37
    .line 38
    const-string v2, "uid"

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    const-string v4, "request"

    .line 42
    .line 43
    invoke-static {v4, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v7

    .line 50
    sget-object v6, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 51
    .line 52
    const-wide/16 v9, 0x5dc

    .line 53
    .line 54
    move-object v5, p0

    .line 55
    invoke-virtual/range {v5 .. v10}, Ll/l2;->S(Lcom/p1/mobile/putong/api/ABManager$Mode;JJ)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->z()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    sub-long/2addr v3, v7

    .line 76
    invoke-static {v6, v3, v4, v2}, Ll/l2;->Y(Lcom/p1/mobile/putong/api/ABManager$Mode;JZ)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->z()Z

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "waited uidTestGroup for "

    .line 86
    .line 87
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    sub-long/2addr v2, v0

    .line 95
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v0, " ms\uff0cthread="

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string v0, "[putong-common][ab]"

    .line 115
    .line 116
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public V()V
    .locals 9

    .line 1
    const-string v0, "user"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "request"

    .line 5
    .line 6
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    sget-object v4, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 14
    .line 15
    const-wide/16 v7, 0x5dc

    .line 16
    .line 17
    move-object v3, p0

    .line 18
    invoke-virtual/range {v3 .. v8}, Ll/l2;->S(Lcom/p1/mobile/putong/api/ABManager$Mode;JJ)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->v(I)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/g2;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/g2;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-wide/16 v2, 0x1f4

    .line 57
    .line 58
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3, v7}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lrx/c;->toBlocking()Ll/o43;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {v1, v2}, Ll/o43;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 74
    .line 75
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    :cond_0
    if-eqz p0, :cond_1

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_1

    .line 92
    .line 93
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 94
    .line 95
    .line 96
    move-result-wide v1

    .line 97
    sub-long/2addr v1, v5

    .line 98
    invoke-static {v4, v1, v2, v0}, Ll/l2;->Y(Lcom/p1/mobile/putong/api/ABManager$Mode;JZ)V

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public W(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h2;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/h2;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Ll/xi5;->w()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public a0()Lrx/c;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/j2;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final b0(Ll/x1d0;Ljava/lang/String;)Ll/x1d0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "MAC "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/rnl;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, p2, v2}, Lcom/p1/mobile/putong/api/api/Network;->fakeToken(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :try_start_0
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-string v0, "Authorization"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 44
    .line 45
    .line 46
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    return-object p0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    const/16 p2, 0x32

    .line 50
    .line 51
    invoke-static {p0, p2}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method
