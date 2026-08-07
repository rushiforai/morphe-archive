.class public final Ll/gyy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/atx0;


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gyy0;->a:Ll/atx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/atx0;->zzl()Ll/qsx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/gyy0;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/gyy0;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Ll/gyy0;->a:Ll/atx0;

    .line 22
    .line 23
    const-wide/16 v2, 0x1

    .line 24
    .line 25
    const-string v4, "_cc"

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/atx0;->A()Ll/ajx0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/ajx0;->y:Ll/bmx0;

    .line 35
    .line 36
    invoke-virtual {v0, v5}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Landroid/os/Bundle;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "source"

    .line 45
    .line 46
    const-string v5, "(not set)"

    .line 47
    .line 48
    invoke-virtual {v0, v1, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "medium"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const-string v1, "_cis"

    .line 57
    .line 58
    const-string v5, "intent"

    .line 59
    .line 60
    invoke-virtual {v0, v1, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v4, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/gyy0;->a:Ll/atx0;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/atx0;->C()Lcom/google/android/gms/measurement/internal/g;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "auto"

    .line 73
    .line 74
    const-string v3, "_cmpx"

    .line 75
    .line 76
    invoke-virtual {v1, v2, v3, v0}, Lcom/google/android/gms/measurement/internal/g;->V0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_3

    .line 80
    .line 81
    :cond_1
    invoke-virtual {v1}, Ll/atx0;->A()Ll/ajx0;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v0, v0, Ll/ajx0;->y:Ll/bmx0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/bmx0;->a()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    iget-object v6, p0, Ll/gyy0;->a:Ll/atx0;

    .line 96
    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    invoke-virtual {v6}, Ll/atx0;->zzj()Ll/d6x0;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/d6x0;->C()Ll/l8x0;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "Cache still valid but referrer not found"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_2
    invoke-virtual {v6}, Ll/atx0;->A()Ll/ajx0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-object v1, v1, Ll/ajx0;->z:Ll/zjx0;

    .line 118
    .line 119
    invoke-virtual {v1}, Ll/zjx0;->a()J

    .line 120
    .line 121
    .line 122
    move-result-wide v6

    .line 123
    const-wide/32 v8, 0x36ee80

    .line 124
    .line 125
    .line 126
    div-long/2addr v6, v8

    .line 127
    sub-long/2addr v6, v2

    .line 128
    mul-long/2addr v6, v8

    .line 129
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    new-instance v1, Landroid/os/Bundle;

    .line 134
    .line 135
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 136
    .line 137
    .line 138
    new-instance v2, Landroid/util/Pair;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-direct {v2, v3, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 156
    .line 157
    .line 158
    move-result v8

    .line 159
    if-eqz v8, :cond_3

    .line 160
    .line 161
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    check-cast v8, Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v0, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    invoke-virtual {v1, v8, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_3
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v0, Landroid/os/Bundle;

    .line 178
    .line 179
    invoke-virtual {v0, v4, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 180
    .line 181
    .line 182
    iget-object v0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 183
    .line 184
    if-nez v0, :cond_4

    .line 185
    .line 186
    const-string v0, "app"

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_4
    check-cast v0, Ljava/lang/String;

    .line 190
    .line 191
    :goto_1
    iget-object v1, p0, Ll/gyy0;->a:Ll/atx0;

    .line 192
    .line 193
    invoke-virtual {v1}, Ll/atx0;->C()Lcom/google/android/gms/measurement/internal/g;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 198
    .line 199
    check-cast v2, Landroid/os/Bundle;

    .line 200
    .line 201
    const-string v3, "_cmp"

    .line 202
    .line 203
    invoke-virtual {v1, v0, v3, v2}, Lcom/google/android/gms/measurement/internal/g;->V0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 204
    .line 205
    .line 206
    :goto_2
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/atx0;->A()Ll/ajx0;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v0, v0, Ll/ajx0;->y:Ll/bmx0;

    .line 213
    .line 214
    invoke-virtual {v0, v5}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    :goto_3
    iget-object p0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 218
    .line 219
    invoke-virtual {p0}, Ll/atx0;->A()Ll/ajx0;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    iget-object p0, p0, Ll/ajx0;->z:Ll/zjx0;

    .line 224
    .line 225
    const-wide/16 v0, 0x0

    .line 226
    .line 227
    invoke-virtual {p0, v0, v1}, Ll/zjx0;->b(J)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final b(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/atx0;->zzl()Ll/qsx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/atx0;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_5

    .line 17
    .line 18
    if-eqz p2, :cond_4

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    :cond_1
    const-string p1, "auto"

    .line 36
    .line 37
    :cond_2
    new-instance v0, Landroid/net/Uri$Builder;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_2

    .line 82
    :cond_4
    :goto_1
    const/4 p1, 0x0

    .line 83
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-nez p2, :cond_5

    .line 88
    .line 89
    iget-object p2, p0, Ll/gyy0;->a:Ll/atx0;

    .line 90
    .line 91
    invoke-virtual {p2}, Ll/atx0;->A()Ll/ajx0;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget-object p2, p2, Ll/ajx0;->y:Ll/bmx0;

    .line 96
    .line 97
    invoke-virtual {p2, p1}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/gyy0;->a:Ll/atx0;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/atx0;->A()Ll/ajx0;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Ll/ajx0;->z:Ll/zjx0;

    .line 107
    .line 108
    iget-object p0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 115
    .line 116
    .line 117
    move-result-wide v0

    .line 118
    invoke-virtual {p1, v0, v1}, Ll/zjx0;->b(J)V

    .line 119
    .line 120
    .line 121
    :cond_5
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gyy0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gyy0;->e()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/atx0;->A()Ll/ajx0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/ajx0;->y:Ll/bmx0;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final d()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/atx0;->A()Ll/ajx0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Ll/ajx0;->z:Ll/zjx0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zjx0;->a()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-lez p0, :cond_0

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

.method public final e()Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/gyy0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    iget-object v0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/atx0;->A()Ll/ajx0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Ll/ajx0;->z:Ll/zjx0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/zjx0;->a()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    sub-long/2addr v2, v4

    .line 32
    iget-object p0, p0, Ll/gyy0;->a:Ll/atx0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/atx0;->u()Ll/ajr0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v0, 0x0

    .line 39
    sget-object v4, Ll/whs0;->W:Ll/zpw0;

    .line 40
    .line 41
    invoke-virtual {p0, v0, v4}, Ll/ajr0;->u(Ljava/lang/String;Ll/zpw0;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v4

    .line 45
    cmp-long p0, v2, v4

    .line 46
    .line 47
    if-lez p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    return v1
.end method
