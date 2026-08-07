.class public final Ll/riy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/thy0;


# direct methods
.method public constructor <init>(Ll/thy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/riy0;->a:Ll/thy0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {v0, v1, v2}, Ll/ajx0;->t(J)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/ajx0;->n:Ll/dhx0;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Ll/dhx0;->a(Z)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 41
    .line 42
    invoke-direct {v0}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 46
    .line 47
    .line 48
    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 49
    .line 50
    const/16 v1, 0x64

    .line 51
    .line 52
    if-ne v0, v1, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "Detected application was in foreground"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-virtual {p0, v0, v1, v2}, Ll/riy0;->c(JZ)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public final b(JZ)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/thy0;->B(Ll/thy0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1, p2}, Ll/ajx0;->t(J)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Ll/ajx0;->n:Ll/dhx0;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Ll/dhx0;->a(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/c;->C()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v0, v0, Ll/ajx0;->r:Ll/zjx0;

    .line 51
    .line 52
    invoke-virtual {v0, p1, p2}, Ll/zjx0;->b(J)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/riy0;->a:Ll/thy0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Ll/ajx0;->n:Ll/dhx0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/dhx0;->b()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0, p1, p2, p3}, Ll/riy0;->c(JZ)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public final c(JZ)V
    .locals 12
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 7
    .line 8
    iget-object p3, p3, Ll/yyx0;->a:Ll/atx0;

    .line 9
    .line 10
    invoke-virtual {p3}, Ll/atx0;->k()Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_0
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 19
    .line 20
    invoke-virtual {p3}, Ll/yyx0;->d()Ll/ajx0;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    iget-object p3, p3, Ll/ajx0;->r:Ll/zjx0;

    .line 25
    .line 26
    invoke-virtual {p3, p1, p2}, Ll/zjx0;->b(J)V

    .line 27
    .line 28
    .line 29
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 30
    .line 31
    invoke-virtual {p3}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 40
    .line 41
    invoke-virtual {p3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p3}, Ll/d6x0;->E()Ll/l8x0;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v2, "Session started, time"

    .line 50
    .line 51
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p3, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v0, 0x3e8

    .line 59
    .line 60
    div-long v0, p1, v0

    .line 61
    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object p3, p0, Ll/riy0;->a:Ll/thy0;

    .line 67
    .line 68
    invoke-virtual {p3}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-string v3, "auto"

    .line 73
    .line 74
    const-string v4, "_sid"

    .line 75
    .line 76
    move-wide v6, p1

    .line 77
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/g;->b0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;J)V

    .line 78
    .line 79
    .line 80
    move-wide v9, v6

    .line 81
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/yyx0;->d()Ll/ajx0;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p1, p1, Ll/ajx0;->s:Ll/zjx0;

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1}, Ll/zjx0;->b(J)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/yyx0;->d()Ll/ajx0;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p1, p1, Ll/ajx0;->n:Ll/dhx0;

    .line 99
    .line 100
    const/4 p2, 0x0

    .line 101
    invoke-virtual {p1, p2}, Ll/dhx0;->a(Z)V

    .line 102
    .line 103
    .line 104
    new-instance v11, Landroid/os/Bundle;

    .line 105
    .line 106
    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string p1, "_sid"

    .line 110
    .line 111
    invoke-virtual {v11, p1, v0, v1}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    const-string v7, "auto"

    .line 121
    .line 122
    const-string v8, "_s"

    .line 123
    .line 124
    invoke-virtual/range {v6 .. v11}, Lcom/google/android/gms/measurement/internal/g;->V(Ljava/lang/String;Ljava/lang/String;JLandroid/os/Bundle;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/yyx0;->d()Ll/ajx0;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object p1, p1, Ll/ajx0;->x:Ll/bmx0;

    .line 134
    .line 135
    invoke-virtual {p1}, Ll/bmx0;->a()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    if-nez p2, :cond_1

    .line 144
    .line 145
    new-instance v11, Landroid/os/Bundle;

    .line 146
    .line 147
    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string p2, "_ffr"

    .line 151
    .line 152
    invoke-virtual {v11, p2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/riy0;->a:Ll/thy0;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    const-string v7, "auto"

    .line 162
    .line 163
    const-string v8, "_ssr"

    .line 164
    .line 165
    invoke-virtual/range {v6 .. v11}, Lcom/google/android/gms/measurement/internal/g;->V(Ljava/lang/String;Ljava/lang/String;JLandroid/os/Bundle;)V

    .line 166
    .line 167
    .line 168
    :cond_1
    :goto_0
    return-void
.end method
