.class public final Ll/liy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public b:J
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final c:Ll/l2s0;

.field public final synthetic d:Ll/thy0;


# direct methods
.method public constructor <init>(Ll/thy0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/liy0;->d:Ll/thy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/uiy0;

    .line 7
    .line 8
    iget-object v1, p1, Ll/yyx0;->a:Ll/atx0;

    .line 9
    .line 10
    invoke-direct {v0, p0, v1}, Ll/uiy0;-><init>(Ll/liy0;Ll/hzx0;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/liy0;->c:Ll/l2s0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Ll/liy0;->a:J

    .line 24
    .line 25
    iput-wide v0, p0, Ll/liy0;->b:J

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic c(Ll/liy0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v2, v2, v0, v1}, Ll/liy0;->d(ZZJ)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/v1v0;->i()Ll/n9s0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/liy0;->d:Ll/thy0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-virtual {v0, v1, v2}, Ll/n9s0;->p(J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public final a(J)J
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/liy0;->b:J

    .line 2
    .line 3
    sub-long v0, p1, v0

    .line 4
    .line 5
    iput-wide p1, p0, Ll/liy0;->b:J

    .line 6
    .line 7
    return-wide v0
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/liy0;->c:Ll/l2s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l2s0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Ll/whs0;->c1:Ll/zpw0;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iput-wide v0, p0, Ll/liy0;->a:J

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    iput-wide v0, p0, Ll/liy0;->a:J

    .line 36
    .line 37
    :goto_0
    iget-wide v0, p0, Ll/liy0;->a:J

    .line 38
    .line 39
    iput-wide v0, p0, Ll/liy0;->b:J

    .line 40
    .line 41
    return-void
.end method

.method public final d(ZZJ)Z
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/kix0;->p()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/atx0;->k()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/ajx0;->r:Ll/zjx0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/liy0;->d:Ll/thy0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    invoke-virtual {v0, v1, v2}, Ll/zjx0;->b(J)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-wide v0, p0, Ll/liy0;->a:J

    .line 43
    .line 44
    sub-long v0, p3, v0

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    const-wide/16 v2, 0x3e8

    .line 49
    .line 50
    cmp-long p1, v0, v2

    .line 51
    .line 52
    if-gez p1, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Ll/liy0;->d:Ll/thy0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "Screen exposed for less than 1000 ms. Event not sent. time"

    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0, p1, p2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    return p0

    .line 75
    :cond_1
    if-nez p2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0, p3, p4}, Ll/liy0;->a(J)J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    :cond_2
    iget-object p1, p0, Ll/liy0;->d:Ll/thy0;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v2, "Recording user engagement, ms"

    .line 92
    .line 93
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {p1, v2, v3}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    new-instance p1, Landroid/os/Bundle;

    .line 101
    .line 102
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v2, "_et"

    .line 106
    .line 107
    invoke-virtual {p1, v2, v0, v1}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ll/ajr0;->P()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/4 v1, 0x1

    .line 121
    xor-int/2addr v0, v1

    .line 122
    iget-object v2, p0, Ll/liy0;->d:Ll/thy0;

    .line 123
    .line 124
    invoke-virtual {v2}, Ll/v1v0;->m()Ll/say0;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2, v0}, Ll/say0;->x(Z)Ll/way0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-static {v0, p1, v1}, Ll/hny0;->S(Ll/way0;Landroid/os/Bundle;Z)V

    .line 133
    .line 134
    .line 135
    if-nez p2, :cond_3

    .line 136
    .line 137
    iget-object p2, p0, Ll/liy0;->d:Ll/thy0;

    .line 138
    .line 139
    invoke-virtual {p2}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    const-string v0, "auto"

    .line 144
    .line 145
    const-string v2, "_e"

    .line 146
    .line 147
    invoke-virtual {p2, v0, v2, p1}, Lcom/google/android/gms/measurement/internal/g;->V0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 148
    .line 149
    .line 150
    :cond_3
    iput-wide p3, p0, Ll/liy0;->a:J

    .line 151
    .line 152
    iget-object p1, p0, Ll/liy0;->c:Ll/l2s0;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/l2s0;->a()V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Ll/liy0;->c:Ll/l2s0;

    .line 158
    .line 159
    sget-object p1, Ll/whs0;->d0:Ll/zpw0;

    .line 160
    .line 161
    const/4 p2, 0x0

    .line 162
    invoke-virtual {p1, p2}, Ll/zpw0;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Ljava/lang/Long;

    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 169
    .line 170
    .line 171
    move-result-wide p1

    .line 172
    invoke-virtual {p0, p1, p2}, Ll/l2s0;->b(J)V

    .line 173
    .line 174
    .line 175
    return v1
.end method

.method public final e(J)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/liy0;->c:Ll/l2s0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l2s0;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(J)V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/liy0;->d:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/liy0;->c:Ll/l2s0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l2s0;->a()V

    .line 9
    .line 10
    .line 11
    iput-wide p1, p0, Ll/liy0;->a:J

    .line 12
    .line 13
    iput-wide p1, p0, Ll/liy0;->b:J

    .line 14
    .line 15
    return-void
.end method
