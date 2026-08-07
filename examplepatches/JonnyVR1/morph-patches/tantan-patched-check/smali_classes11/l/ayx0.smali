.class public final Ll/ayx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/List<",
        "Lcom/google/android/gms/measurement/internal/zzno;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Ll/iux0;


# direct methods
.method public constructor <init>(Ll/iux0;Lcom/google/android/gms/measurement/internal/zzo;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/ayx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ayx0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ayx0;->c:Ll/iux0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ayx0;->c:Ll/iux0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->u0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ayx0;->c:Ll/iux0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/ayx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 17
    .line 18
    iget-object p0, p0, Ll/ayx0;->b:Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->zzl()Ll/qsx0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ll/yyx0;->h()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/spy0;->a()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_4

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->d0()Ll/ajr0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, v1, Lcom/google/android/gms/measurement/internal/zzo;->zza:Ljava/lang/String;

    .line 38
    .line 39
    sget-object v4, Ll/whs0;->I0:Ll/zpw0;

    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Ll/ajr0;->z(Ljava/lang/String;Ll/zpw0;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_4

    .line 46
    .line 47
    iget-object v2, v1, Lcom/google/android/gms/measurement/internal/zzo;->zza:Ljava/lang/String;

    .line 48
    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    goto/16 :goto_3

    .line 52
    .line 53
    :cond_0
    if-eqz p0, :cond_3

    .line 54
    .line 55
    const-string v2, "uriSources"

    .line 56
    .line 57
    invoke-virtual {p0, v2}, Landroid/os/BaseBundle;->getIntArray(Ljava/lang/String;)[I

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const-string v3, "uriTimestamps"

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->getLongArray(Ljava/lang/String;)[J

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    array-length v3, p0

    .line 72
    array-length v4, v2

    .line 73
    if-eq v3, v4, :cond_1

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    const/4 v3, 0x0

    .line 77
    :goto_0
    array-length v4, v2

    .line 78
    if-ge v3, v4, :cond_3

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->g0()Ll/opr0;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iget-object v5, v1, Lcom/google/android/gms/measurement/internal/zzo;->zza:Ljava/lang/String;

    .line 85
    .line 86
    aget v6, v2, v3

    .line 87
    .line 88
    aget-wide v7, p0, v3

    .line 89
    .line 90
    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ll/yyx0;->h()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4}, Ll/njy0;->o()V

    .line 97
    .line 98
    .line 99
    :try_start_0
    invoke-virtual {v4}, Ll/opr0;->v()Landroid/database/sqlite/SQLiteDatabase;

    .line 100
    .line 101
    .line 102
    move-result-object v9

    .line 103
    const-string v10, "trigger_uris"

    .line 104
    .line 105
    const-string v11, "app_id=? and source=? and timestamp_millis<=?"

    .line 106
    .line 107
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v12

    .line 111
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v13

    .line 115
    filled-new-array {v5, v12, v13}, [Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    invoke-virtual {v9, v10, v11, v12}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v9

    .line 123
    invoke-virtual {v4}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    invoke-virtual {v10}, Ll/d6x0;->E()Ll/l8x0;

    .line 128
    .line 129
    .line 130
    move-result-object v10

    .line 131
    new-instance v11, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v12, "Pruned "

    .line 134
    .line 135
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v9, " trigger URIs. appId, source, timestamp"

    .line 142
    .line 143
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-virtual {v10, v9, v5, v6, v7}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :catch_0
    move-exception v6

    .line 163
    invoke-virtual {v4}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v4}, Ll/d6x0;->A()Ll/l8x0;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    const-string v7, "Error pruning trigger URIs. appId"

    .line 172
    .line 173
    invoke-static {v5}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v4, v7, v5, v6}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_2
    :goto_2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->zzj()Ll/d6x0;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    const-string v2, "Uri sources and timestamps do not match"

    .line 192
    .line 193
    invoke-virtual {p0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->g0()Ll/opr0;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzo;->zza:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p0, v0}, Ll/opr0;->R0(Ljava/lang/String;)Ljava/util/List;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0

    .line 207
    :cond_4
    :goto_3
    new-instance p0, Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .line 211
    .line 212
    return-object p0
.end method
