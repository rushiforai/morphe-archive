.class public final Ll/hus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/avs0;

.field public final synthetic b:Ll/ots0;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:J

.field public final synthetic e:Ll/bvs0;


# direct methods
.method public constructor <init>(Ll/bvs0;Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/hus0;->a:Ll/avs0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/hus0;->b:Ll/ots0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/hus0;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-wide p5, p0, Ll/hus0;->d:J

    .line 8
    .line 9
    iput-object p1, p0, Ll/hus0;->e:Ll/bvs0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    const-string v0, "Could not finish the full JS engine loading in "

    .line 2
    .line 3
    const-string v1, ". While waiting for the /jsLoaded gmsg, observed the loadNewJavascriptEngine latency is "

    .line 4
    .line 5
    const-string v2, "loadJavascriptEngine > ADMOB_UI_HANDLER.postDelayed: Trying to acquire lock"

    .line 6
    .line 7
    invoke-static {v2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/hus0;->e:Ll/bvs0;

    .line 11
    .line 12
    invoke-static {v2}, Ll/bvs0;->f(Ll/bvs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    const-string v3, "loadJavascriptEngine > ADMOB_UI_HANDLER.postDelayed: Lock acquired"

    .line 18
    .line 19
    invoke-static {v3}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/hus0;->a:Ll/avs0;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/kdt0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, -0x1

    .line 29
    if-eq v3, v4, :cond_2

    .line 30
    .line 31
    iget-object v3, p0, Ll/hus0;->a:Ll/avs0;

    .line 32
    .line 33
    invoke-virtual {v3}, Ll/kdt0;->a()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x1

    .line 38
    if-ne v3, v4, :cond_0

    .line 39
    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_0
    iget-object v3, p0, Ll/hus0;->a:Ll/avs0;

    .line 43
    .line 44
    invoke-virtual {v3}, Ll/kdt0;->c()V

    .line 45
    .line 46
    .line 47
    sget-object v3, Ll/oct0;->e:Ll/xvw0;

    .line 48
    .line 49
    iget-object v4, p0, Ll/hus0;->b:Ll/ots0;

    .line 50
    .line 51
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    new-instance v5, Ll/gus0;

    .line 55
    .line 56
    invoke-direct {v5, v4}, Ll/gus0;-><init>(Ll/ots0;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v3, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    sget-object v3, Ll/sgs0;->d:Ll/dgs0;

    .line 63
    .line 64
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iget-object v4, p0, Ll/hus0;->a:Ll/avs0;

    .line 77
    .line 78
    invoke-virtual {v4}, Ll/kdt0;->a()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    iget-object v5, p0, Ll/hus0;->e:Ll/bvs0;

    .line 83
    .line 84
    invoke-static {v5}, Ll/bvs0;->a(Ll/bvs0;)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    iget-object v6, p0, Ll/hus0;->c:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_1

    .line 95
    .line 96
    const-string v1, ". Still waiting for the engine to be loaded"

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    goto :goto_2

    .line 101
    :cond_1
    iget-object v6, p0, Ll/hus0;->c:Ljava/util/ArrayList;

    .line 102
    .line 103
    const/4 v7, 0x0

    .line 104
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-virtual {v1, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    :goto_0
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-interface {v6}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v6

    .line 124
    iget-wide v8, p0, Ll/hus0;->d:J

    .line 125
    .line 126
    sub-long/2addr v6, v8

    .line 127
    new-instance p0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v0, " ms. JS engine session reference status(fullLoadTimeout) is "

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v0, ". Update status(fullLoadTimeout) is "

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v0, " ms. Total latency(fullLoadTimeout) is "

    .line 155
    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v0, " ms at timeout. Rejecting."

    .line 163
    .line 164
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    const-string p0, "loadJavascriptEngine > ADMOB_UI_HANDLER.postDelayed: Lock released"

    .line 176
    .line 177
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_2
    :goto_1
    :try_start_1
    const-string p0, "loadJavascriptEngine > ADMOB_UI_HANDLER.postDelayed: Lock released, the promise is already settled"

    .line 182
    .line 183
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    monitor-exit v2

    .line 187
    return-void

    .line 188
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 189
    throw p0
.end method
