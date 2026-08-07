.class public Ll/w250;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:J = 0x5265c00L

.field public static volatile c:Ll/w250;


# instance fields
.field public a:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/w250;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public static a()Ll/w250;
    .locals 2

    .line 1
    sget-object v0, Ll/w250;->c:Ll/w250;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/w250;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/w250;->c:Ll/w250;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/w250;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/w250;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/w250;->c:Ll/w250;

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
    sget-object v0, Ll/w250;->c:Ll/w250;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

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

.method public c()Z
    .locals 5

    .line 1
    iget p0, p0, Ll/w250;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object p0, p0, Ll/dkb;->p0:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    cmp-long p0, v1, v3

    .line 28
    .line 29
    if-gez p0, :cond_1

    .line 30
    .line 31
    return v0

    .line 32
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    iget-object p0, p0, Ll/dkb;->n0:Ll/byd0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    const/4 p0, 0x1

    .line 53
    invoke-static {v1, v2, v3, v4, p0}, Ll/tzi0;->h(JJI)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    return v0

    .line 60
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget-object v2, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 65
    .line 66
    if-eq v1, v2, :cond_3

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 71
    .line 72
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    return v0

    .line 83
    :cond_3
    return p0
.end method

.method public d(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object p0, p0, Ll/dkb;->r0:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    const/4 p0, 0x1

    .line 22
    invoke-static {v0, v1, v2, v3, p0}, Ll/tzi0;->h(JJI)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p1, p1, Ll/dkb;->r0:Ll/byd0;

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    iget-object p1, p1, Ll/dkb;->q0:Ll/xyd0;

    .line 50
    .line 51
    new-instance v0, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object p1, p1, Ll/dkb;->s0:Ll/xyd0;

    .line 64
    .line 65
    new-instance v0, Ljava/util/HashSet;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return p0

    .line 74
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object v0, v0, Ll/dkb;->s0:Ll/xyd0;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Ljava/util/HashSet;

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/4 v1, 0x0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    return v1

    .line 94
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    iget-object v0, v0, Ll/dkb;->q0:Ll/xyd0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/util/HashSet;

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_2

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 115
    .line 116
    iget-object p1, p1, Ll/dkb;->q0:Ll/xyd0;

    .line 117
    .line 118
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Ljava/util/HashSet;

    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    const/4 v0, 0x2

    .line 129
    if-lt p1, v0, :cond_2

    .line 130
    .line 131
    return v1

    .line 132
    :cond_2
    return p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w250;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Z)Z
    .locals 5

    .line 1
    iget p0, p0, Ll/w250;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/r4a;->d:Ll/byd0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    const-wide/16 v3, 0x1

    .line 23
    .line 24
    cmp-long p0, v1, v3

    .line 25
    .line 26
    if-gez p0, :cond_0

    .line 27
    .line 28
    return v0

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 34
    .line 35
    if-eq p0, v1, :cond_1

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    return v0

    .line 52
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-object p0, p0, Ll/dkb;->j0:Ll/byd0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/lang/Long;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 69
    .line 70
    .line 71
    move-result-wide v3

    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-static {v1, v2, v3, v4, p0}, Ll/tzi0;->h(JJI)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_2

    .line 78
    .line 79
    return v0

    .line 80
    :cond_2
    invoke-static {}, Ll/pzi0;->o()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    iget-object v3, v3, Ll/dkb;->l0:Ll/byd0;

    .line 89
    .line 90
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    cmp-long v1, v1, v3

    .line 101
    .line 102
    if-gez v1, :cond_3

    .line 103
    .line 104
    return v0

    .line 105
    :cond_3
    if-eqz p2, :cond_4

    .line 106
    .line 107
    invoke-static {p1, v0}, Ll/iz40;->G(Lcom/p1/mobile/android/app/Act;Z)V

    .line 108
    .line 109
    .line 110
    :cond_4
    return p0
.end method

.method public g()Z
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->o0:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/gra;->u()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lt v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ""

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {}, Ll/gra;->q()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lt v0, v1, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/gra;->u()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ge v0, v1, :cond_1

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    iget-object v0, v0, Ll/dkb;->p0:Ll/byd0;

    .line 71
    .line 72
    invoke-static {}, Ll/pzi0;->o()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    invoke-static {}, Ll/gra;->r()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    int-to-long v3, v3

    .line 81
    sget-wide v5, Ll/w250;->b:J

    .line 82
    .line 83
    mul-long/2addr v3, v5

    .line 84
    add-long/2addr v1, v3

    .line 85
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    invoke-static {}, Ll/gra;->u()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-ne v0, v1, :cond_2

    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 102
    .line 103
    iget-object v0, v0, Ll/dkb;->p0:Ll/byd0;

    .line 104
    .line 105
    invoke-static {}, Ll/pzi0;->o()J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    invoke-static {}, Ll/gra;->v()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    int-to-long v3, v3

    .line 114
    sget-wide v5, Ll/w250;->b:J

    .line 115
    .line 116
    mul-long/2addr v3, v5

    .line 117
    add-long/2addr v1, v3

    .line 118
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 128
    .line 129
    iget-object v0, v0, Ll/dkb;->o0:Ll/xyd0;

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    const/4 p0, 0x0

    .line 135
    return p0
.end method

.method public h()V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->k0:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/gra;->s()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lt v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ""

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v1, 0x1

    .line 55
    if-lt v0, v1, :cond_1

    .line 56
    .line 57
    invoke-static {}, Ll/gra;->s()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-ge v0, v1, :cond_1

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v0, v0, Ll/dkb;->l0:Ll/byd0;

    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v1

    .line 73
    invoke-static {}, Ll/gra;->w()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    int-to-long v3, v3

    .line 78
    sget-wide v5, Ll/w250;->b:J

    .line 79
    .line 80
    mul-long/2addr v3, v5

    .line 81
    add-long/2addr v1, v3

    .line 82
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-static {}, Ll/gra;->s()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-ne v0, v1, :cond_2

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    iget-object v0, v0, Ll/dkb;->l0:Ll/byd0;

    .line 101
    .line 102
    invoke-static {}, Ll/pzi0;->o()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-static {}, Ll/gra;->t()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    int-to-long v3, v3

    .line 111
    sget-wide v5, Ll/w250;->b:J

    .line 112
    .line 113
    mul-long/2addr v3, v5

    .line 114
    add-long/2addr v1, v3

    .line 115
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 125
    .line 126
    iget-object v0, v0, Ll/dkb;->k0:Ll/xyd0;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    return-void
.end method
