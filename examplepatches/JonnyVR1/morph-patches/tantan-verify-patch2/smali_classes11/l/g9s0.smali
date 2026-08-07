.class public final Ll/g9s0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ayv0;

.field public b:Ll/gix0;

.field public c:Ll/sdr0;

.field public final d:Ll/zar0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    new-instance v0, Ll/ayv0;

    invoke-direct {v0}, Ll/ayv0;-><init>()V

    invoke-direct {p0, v0}, Ll/g9s0;-><init>(Ll/ayv0;)V

    return-void
.end method

.method public constructor <init>(Ll/ayv0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 5
    .line 6
    iget-object v0, p1, Ll/ayv0;->b:Ll/gix0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/gix0;->d()Ll/gix0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/g9s0;->b:Ll/gix0;

    .line 13
    .line 14
    new-instance v0, Ll/sdr0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/sdr0;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 20
    .line 21
    new-instance v0, Ll/zar0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/zar0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/g9s0;->d:Ll/zar0;

    .line 27
    .line 28
    new-instance v0, Ll/p9r0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/p9r0;-><init>(Ll/g9s0;)V

    .line 31
    .line 32
    .line 33
    const-string v1, "internal.registerCallback"

    .line 34
    .line 35
    invoke-virtual {p1, v1, v0}, Ll/ayv0;->b(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/m4u0;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/m4u0;-><init>(Ll/g9s0;)V

    .line 41
    .line 42
    .line 43
    const-string p0, "internal.eventLogger"

    .line 44
    .line 45
    invoke-virtual {p1, p0, v0}, Ll/ayv0;->b(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public final a()Ll/sdr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/measurement/k0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/measurement/zzc;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ayv0;->b:Ll/gix0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gix0;->d()Ll/gix0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/g9s0;->b:Ll/gix0;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/k0;->D()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 16
    .line 17
    iget-object v2, p0, Ll/g9s0;->b:Ll/gix0;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    new-array v3, v3, [Lcom/google/android/gms/internal/measurement/zzgd$zzd;

    .line 21
    .line 22
    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [Lcom/google/android/gms/internal/measurement/zzgd$zzd;

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Ll/ayv0;->a(Ll/gix0;[Lcom/google/android/gms/internal/measurement/zzgd$zzd;)Ll/ewr0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Ll/rmr0;

    .line 33
    .line 34
    if-nez v0, :cond_6

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/k0;->B()Lcom/google/android/gms/internal/measurement/i0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/i0;->D()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/google/android/gms/internal/measurement/j0;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/j0;->D()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/j0;->C()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_0

    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/google/android/gms/internal/measurement/zzgd$zzd;

    .line 83
    .line 84
    iget-object v3, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 85
    .line 86
    iget-object v4, p0, Ll/g9s0;->b:Ll/gix0;

    .line 87
    .line 88
    filled-new-array {v2}, [Lcom/google/android/gms/internal/measurement/zzgd$zzd;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v3, v4, v2}, Ll/ayv0;->a(Ll/gix0;[Lcom/google/android/gms/internal/measurement/zzgd$zzd;)Ll/ewr0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    instance-of v3, v2, Ll/avr0;

    .line 97
    .line 98
    if-eqz v3, :cond_4

    .line 99
    .line 100
    iget-object v3, p0, Ll/g9s0;->b:Ll/gix0;

    .line 101
    .line 102
    invoke-virtual {v3, v0}, Ll/gix0;->g(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-nez v4, :cond_1

    .line 107
    .line 108
    const/4 v3, 0x0

    .line 109
    goto :goto_1

    .line 110
    :cond_1
    invoke-virtual {v3, v0}, Ll/gix0;->a(Ljava/lang/String;)Ll/ewr0;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    instance-of v4, v3, Ll/mpr0;

    .line 115
    .line 116
    if-eqz v4, :cond_3

    .line 117
    .line 118
    check-cast v3, Ll/mpr0;

    .line 119
    .line 120
    :goto_1
    if-eqz v3, :cond_2

    .line 121
    .line 122
    iget-object v4, p0, Ll/g9s0;->b:Ll/gix0;

    .line 123
    .line 124
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v3, v4, v2}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 133
    .line 134
    new-instance p1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v1, "Rule function is undefined: "

    .line 137
    .line 138
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw p0

    .line 152
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 153
    .line 154
    new-instance p1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v1, "Invalid function name: "

    .line 157
    .line 158
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    throw p0

    .line 172
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 173
    .line 174
    const-string p1, "Invalid rule definition"

    .line 175
    .line 176
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    throw p0

    .line 180
    :cond_5
    return-void

    .line 181
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 182
    .line 183
    const-string p1, "Program loading failed"

    .line 184
    .line 185
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    throw p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    :catchall_0
    move-exception p0

    .line 190
    new-instance p1, Lcom/google/android/gms/internal/measurement/zzc;

    .line 191
    .line 192
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/measurement/zzc;-><init>(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    throw p1
.end method

.method public final c(Ljava/lang/String;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Callable<",
            "+",
            "Ll/mpr0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ayv0;->b(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ll/efr0;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/measurement/zzc;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/sdr0;->c(Ll/efr0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/g9s0;->a:Ll/ayv0;

    .line 7
    .line 8
    iget-object p1, p1, Ll/ayv0;->c:Ll/gix0;

    .line 9
    .line 10
    const-string v0, "runtime.counter"

    .line 11
    .line 12
    new-instance v1, Ll/glr0;

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v1, v2}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Ll/gix0;->h(Ljava/lang/String;Ll/ewr0;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/g9s0;->d:Ll/zar0;

    .line 27
    .line 28
    iget-object v0, p0, Ll/g9s0;->b:Ll/gix0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/gix0;->d()Ll/gix0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Ll/zar0;->c(Ll/gix0;Ll/sdr0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/g9s0;->g()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/g9s0;->f()Z

    .line 46
    .line 47
    .line 48
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    new-instance p1, Lcom/google/android/gms/internal/measurement/zzc;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/measurement/zzc;-><init>(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public final synthetic e()Ll/mpr0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/i1z0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g9s0;->d:Ll/zar0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/i1z0;-><init>(Ll/zar0;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sdr0;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sdr0;->d()Ll/efr0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/g9s0;->c:Ll/sdr0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sdr0;->a()Ll/efr0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ll/efr0;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method
