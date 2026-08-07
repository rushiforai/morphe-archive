.class public Ll/yt0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile d:Ll/yt0; = null

.field public static e:I = 0x0

.field public static f:I = 0x1

.field public static g:I = 0x2


# instance fields
.field private a:Z

.field private b:Ll/qp20;

.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/yt0;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public static g()Ll/yt0;
    .locals 2

    .line 1
    sget-object v0, Ll/yt0;->d:Ll/yt0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/yt0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/yt0;->d:Ll/yt0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/yt0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/yt0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/yt0;->d:Ll/yt0;

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
    sget-object v0, Ll/yt0;->d:Ll/yt0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/pgy;->e()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->a()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    float-to-int p0, p0

    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/medialog/BatteryMetrics;->getBatteryInfo()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/medialog/BatteryMetrics;->getBatteryRemin()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/medialog/BatteryMetrics;->getBatteryStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public e()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/pgy;->l()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->b()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    float-to-int p0, p0

    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public f()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/qp20;->c()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/medialog/BatteryMetrics;->getIpAddr()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/kuf;->h()Ll/kuf;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/kuf;->i()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    div-int/lit8 p0, p0, 0x5

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/qp20;->f()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public j()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/kuf;->h()Ll/kuf;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/kuf;->i()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->g()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public k()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/qp20;->h()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/medialog/BatteryMetrics;->getThermalOfBattery()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public m()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/pgy;->j()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->i()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    float-to-int p0, p0

    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public n()J
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/pgy;->m()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->d()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-long v0, p0

    .line 23
    return-wide v0

    .line 24
    :cond_1
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    return-wide v0
.end method

.method public o()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/pgy;->i()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yt0;->b:Ll/qp20;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qp20;->e()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public p(Landroid/content/Context;I)V
    .locals 8

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->Q0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Ll/yt0;->a:Z

    .line 10
    .line 11
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "enableApmPlugin:"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v2, p0, Ll/yt0;->a:Z

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "ApmManager"

    .line 32
    .line 33
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Ll/yt0;->b:Ll/qp20;

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    new-instance v0, Ll/qp20;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/qp20;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/yt0;->b:Ll/qp20;

    .line 54
    .line 55
    :cond_0
    iget v0, p0, Ll/yt0;->c:I

    .line 56
    .line 57
    const/4 v1, -0x1

    .line 58
    if-ne v0, v1, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v3, "startTrace === "

    .line 67
    .line 68
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iput p2, p0, Ll/yt0;->c:I

    .line 86
    .line 87
    iget-object p2, p0, Ll/yt0;->b:Ll/qp20;

    .line 88
    .line 89
    new-instance v0, Ll/zt0;

    .line 90
    .line 91
    const/4 v6, 0x1

    .line 92
    const/4 v7, 0x1

    .line 93
    const/4 v1, 0x1

    .line 94
    const-wide/16 v2, 0x2710

    .line 95
    .line 96
    const/4 v4, 0x1

    .line 97
    const/4 v5, 0x1

    .line 98
    invoke-direct/range {v0 .. v7}, Ll/zt0;-><init>(ZJZZZZ)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p2, p1, v0}, Ll/qp20;->j(Landroid/content/Context;Ll/zt0;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    sget v0, Ll/yt0;->e:I

    .line 106
    .line 107
    if-eq p2, v0, :cond_3

    .line 108
    .line 109
    sget v0, Ll/yt0;->f:I

    .line 110
    .line 111
    if-ne p2, v0, :cond_4

    .line 112
    .line 113
    :cond_3
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p2, p1}, Ll/pgy;->n(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p2}, Ll/pgy;->r()V

    .line 125
    .line 126
    .line 127
    :cond_4
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2, p1}, Lcom/immomo/medialog/BatteryMetrics;->init(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :catch_0
    move-exception v0

    .line 136
    move-object p1, v0

    .line 137
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v1, "init error: "

    .line 144
    .line 145
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const-string v0, "BatteryMetrics"

    .line 156
    .line 157
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p2, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    :goto_1
    iget-boolean p0, p0, Ll/yt0;->a:Z

    .line 165
    .line 166
    if-nez p0, :cond_5

    .line 167
    .line 168
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0}, Ll/csx;->S0()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_5

    .line 177
    .line 178
    invoke-static {}, Ll/kuf;->h()Ll/kuf;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Ll/kuf;->m()V

    .line 183
    .line 184
    .line 185
    :cond_5
    return-void
.end method

.method public q(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/yt0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/yt0;->b:Ll/qp20;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget v1, p0, Ll/yt0;->c:I

    .line 10
    .line 11
    if-ne v1, p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/qp20;->k()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/yt0;->b:Ll/qp20;

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Ll/yt0;->c:I

    .line 21
    .line 22
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "stopTrace === "

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v1, "ApmManager"

    .line 41
    .line 42
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/pgy;->s()V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/immomo/medialog/BatteryMetrics;->uninit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :catch_0
    move-exception p1

    .line 66
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v2, "uninit error: "

    .line 73
    .line 74
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v1, "BatteryMetrics"

    .line 85
    .line 86
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-boolean p0, p0, Ll/yt0;->a:Z

    .line 94
    .line 95
    if-nez p0, :cond_2

    .line 96
    .line 97
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ll/csx;->S0()Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_2

    .line 106
    .line 107
    invoke-static {}, Ll/kuf;->h()Ll/kuf;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Ll/kuf;->n()V

    .line 112
    .line 113
    .line 114
    :cond_2
    return-void
.end method
