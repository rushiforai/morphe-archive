.class public final Ll/xov0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/ebt0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public b:Ll/fx0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final c:Ljava/util/concurrent/ScheduledExecutorService;

.field public final d:Ll/xvw0;

.field public final e:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/sgs0;->G2:Ll/dgs0;

    .line 5
    .line 6
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {p1}, Ll/ex0;->a(Landroid/content/Context;)Ll/fx0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/xov0;->b:Ll/fx0;

    .line 27
    .line 28
    :cond_0
    iput-object p1, p0, Ll/xov0;->e:Landroid/content/Context;

    .line 29
    .line 30
    iput-object p2, p0, Ll/xov0;->a:Ll/ebt0;

    .line 31
    .line 32
    iput-object p3, p0, Ll/xov0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 33
    .line 34
    iput-object p4, p0, Ll/xov0;->d:Ll/xvw0;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0xb

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->C2:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, -0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    sget-object v0, Ll/sgs0;->H2:Ll/dgs0;

    .line 22
    .line 23
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    sget-object v0, Ll/sgs0;->D2:Ll/dgs0;

    .line 40
    .line 41
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Ll/xov0;->b:Ll/fx0;

    .line 58
    .line 59
    invoke-interface {p0}, Ll/fx0;->a()Lcom/google/android/gms/tasks/Task;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0, v2}, Ll/olw0;->a(Lcom/google/android/gms/tasks/Task;Ll/ig4;)Ll/hpr;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget-object v0, Ll/uov0;->a:Ll/uov0;

    .line 68
    .line 69
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 70
    .line 71
    invoke-static {p0, v0, v1}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_0
    sget-object v0, Ll/sgs0;->G2:Ll/dgs0;

    .line 77
    .line 78
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    iget-object v0, p0, Ll/xov0;->e:Landroid/content/Context;

    .line 95
    .line 96
    invoke-static {v0}, Ll/y8w0;->a(Landroid/content/Context;)Lcom/google/android/gms/tasks/Task;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Ll/xov0;->b:Ll/fx0;

    .line 102
    .line 103
    invoke-interface {v0}, Ll/fx0;->a()Lcom/google/android/gms/tasks/Task;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    :goto_0
    if-nez v0, :cond_2

    .line 108
    .line 109
    new-instance p0, Ll/yov0;

    .line 110
    .line 111
    invoke-direct {p0, v2, v1}, Ll/yov0;-><init>(Ljava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_2
    invoke-static {v0, v2}, Ll/olw0;->a(Lcom/google/android/gms/tasks/Task;Ll/ig4;)Ll/hpr;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget-object v1, Ll/vov0;->a:Ll/vov0;

    .line 124
    .line 125
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 126
    .line 127
    invoke-static {v0, v1, v2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget-object v1, Ll/sgs0;->E2:Ll/dgs0;

    .line 132
    .line 133
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_3

    .line 148
    .line 149
    sget-object v1, Ll/sgs0;->F2:Ll/dgs0;

    .line 150
    .line 151
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    check-cast v1, Ljava/lang/Long;

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 162
    .line 163
    .line 164
    move-result-wide v1

    .line 165
    iget-object v3, p0, Ll/xov0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 166
    .line 167
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 168
    .line 169
    invoke-static {v0, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    :cond_3
    new-instance v1, Ll/wov0;

    .line 174
    .line 175
    invoke-direct {v1, p0}, Ll/wov0;-><init>(Ll/xov0;)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/xov0;->d:Ll/xvw0;

    .line 179
    .line 180
    const-class v2, Ljava/lang/Exception;

    .line 181
    .line 182
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :cond_4
    new-instance p0, Ll/yov0;

    .line 188
    .line 189
    invoke-direct {p0, v2, v1}, Ll/yov0;-><init>(Ljava/lang/String;I)V

    .line 190
    .line 191
    .line 192
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0
.end method
