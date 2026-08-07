.class public final Ll/khv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final a:Ll/lcw0;

.field public final b:Ll/k6u0;

.field public final c:Ll/uew0;

.field public final d:Ll/yew0;

.field public final e:Ljava/util/concurrent/Executor;

.field public final f:Ljava/util/concurrent/ScheduledExecutorService;

.field public final g:Ll/nzt0;

.field public final h:Ll/ehv0;

.field public final i:Ll/tcv0;

.field public final j:Landroid/content/Context;

.field public final k:Ll/cew0;

.field public final l:Ll/igv0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/lcw0;Ll/ehv0;Ll/k6u0;Ll/uew0;Ll/yew0;Ll/nzt0;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Ll/tcv0;Ll/cew0;Ll/igv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/khv0;->j:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/khv0;->a:Ll/lcw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/khv0;->h:Ll/ehv0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/khv0;->b:Ll/k6u0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/khv0;->c:Ll/uew0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/khv0;->d:Ll/yew0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/khv0;->g:Ll/nzt0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/khv0;->e:Ljava/util/concurrent/Executor;

    .line 19
    .line 20
    iput-object p9, p0, Ll/khv0;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 21
    .line 22
    iput-object p10, p0, Ll/khv0;->i:Ll/tcv0;

    .line 23
    .line 24
    iput-object p11, p0, Ll/khv0;->k:Ll/cew0;

    .line 25
    .line 26
    iput-object p12, p0, Ll/khv0;->l:Ll/igv0;

    .line 27
    .line 28
    return-void
.end method

.method public static b(Ll/b7w0;)Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->u5:Ll/dgs0;

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
    const-string v1, "No fill."

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eq v2, v0, :cond_0

    .line 21
    .line 22
    const-string v0, "No ad config."

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v0, v1

    .line 26
    :goto_0
    iget-object v2, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 27
    .line 28
    iget-object v2, v2, Ll/a7w0;->b:Ll/t6w0;

    .line 29
    .line 30
    iget v2, v2, Ll/t6w0;->e:I

    .line 31
    .line 32
    if-eqz v2, :cond_3

    .line 33
    .line 34
    const/16 v3, 0xc8

    .line 35
    .line 36
    const/16 v4, 0x12c

    .line 37
    .line 38
    if-lt v2, v3, :cond_1

    .line 39
    .line 40
    if-ge v2, v4, :cond_1

    .line 41
    .line 42
    sget-object v2, Ll/sgs0;->t5:Ll/dgs0;

    .line 43
    .line 44
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    if-lt v2, v4, :cond_2

    .line 62
    .line 63
    const/16 v0, 0x190

    .line 64
    .line 65
    if-ge v2, v0, :cond_2

    .line 66
    .line 67
    const-string v1, "No location header to follow redirect or too many redirects."

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v1, "Received error HTTP response code: "

    .line 73
    .line 74
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move-object v1, v0

    .line 86
    :goto_1
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 87
    .line 88
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 89
    .line 90
    iget-object p0, p0, Ll/t6w0;->i:Ll/s6w0;

    .line 91
    .line 92
    if-eqz p0, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/s6w0;->a()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_4
    return-object v1
.end method


# virtual methods
.method public final synthetic a(Ll/q6w0;Ll/b7w0;Ll/pcv0;Ljava/lang/Throwable;)Ll/hpr;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p4, p0, Ll/khv0;->j:Landroid/content/Context;

    .line 2
    .line 3
    const/16 v0, 0xc

    .line 4
    .line 5
    invoke-static {p4, v0}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    iget-object v0, p1, Ll/q6w0;->F:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p4, v0}, Ll/rdw0;->z(Ljava/lang/String;)Ll/rdw0;

    .line 12
    .line 13
    .line 14
    invoke-interface {p4}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 15
    .line 16
    .line 17
    invoke-interface {p3, p2, p1}, Ll/pcv0;->b(Ll/b7w0;Ll/q6w0;)Ll/hpr;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    iget v0, p1, Ll/q6w0;->S:I

    .line 22
    .line 23
    int-to-long v0, v0

    .line 24
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 25
    .line 26
    iget-object v3, p0, Ll/khv0;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    .line 28
    invoke-static {p3, v0, v1, v2, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    iget-object v0, p0, Ll/khv0;->c:Ll/uew0;

    .line 33
    .line 34
    iget-object v1, p0, Ll/khv0;->h:Ll/ehv0;

    .line 35
    .line 36
    invoke-virtual {v1, p2, p1, p3, v0}, Ll/ehv0;->f(Ll/b7w0;Ll/q6w0;Ll/hpr;Ll/uew0;)Ll/hpr;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/khv0;->k:Ll/cew0;

    .line 40
    .line 41
    invoke-static {p3, p0, p4}, Ll/bew0;->a(Ll/hpr;Ll/cew0;Ll/rdw0;)V

    .line 42
    .line 43
    .line 44
    return-object p3
.end method

.method public final synthetic zza(Ljava/lang/Object;)Ll/hpr;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/b7w0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/khv0;->b(Ll/b7w0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/a7w0;->b:Ll/t6w0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/khv0;->i:Ll/tcv0;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ll/tcv0;->i(Ll/t6w0;)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Ll/sgs0;->h8:Ll/dgs0;

    .line 17
    .line 18
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, 0x3

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 36
    .line 37
    iget-object v1, v1, Ll/a7w0;->b:Ll/t6w0;

    .line 38
    .line 39
    iget v1, v1, Ll/t6w0;->e:I

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const/16 v3, 0xc8

    .line 44
    .line 45
    if-lt v1, v3, :cond_0

    .line 46
    .line 47
    const/16 v3, 0x12c

    .line 48
    .line 49
    if-lt v1, v3, :cond_1

    .line 50
    .line 51
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 52
    .line 53
    invoke-direct {p0, v2, v0}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_1
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 62
    .line 63
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 64
    .line 65
    sget-object v1, Ll/sgs0;->s3:Ll/dgs0;

    .line 66
    .line 67
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    const/4 v3, 0x1

    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    iget-object v0, v0, Ll/t6w0;->o:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_2

    .line 91
    .line 92
    iget-object v1, p0, Ll/khv0;->i:Ll/tcv0;

    .line 93
    .line 94
    iget-object v4, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 95
    .line 96
    iget-object v4, v4, Ll/a7w0;->a:Ljava/util/List;

    .line 97
    .line 98
    invoke-virtual {v1, v0, v4}, Ll/tcv0;->h(Ljava/lang/String;Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 103
    .line 104
    iget-object v0, v0, Ll/a7w0;->a:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_5

    .line 115
    .line 116
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Ll/q6w0;

    .line 121
    .line 122
    iget-object v4, p0, Ll/khv0;->i:Ll/tcv0;

    .line 123
    .line 124
    invoke-virtual {v4, v1}, Ll/tcv0;->d(Ll/q6w0;)V

    .line 125
    .line 126
    .line 127
    iget-object v4, v1, Ll/q6w0;->a:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_4

    .line 138
    .line 139
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Ljava/lang/String;

    .line 144
    .line 145
    iget-object v6, p0, Ll/khv0;->g:Ll/nzt0;

    .line 146
    .line 147
    iget v7, v1, Ll/q6w0;->b:I

    .line 148
    .line 149
    invoke-interface {v6, v7, v5}, Ll/nzt0;->d(ILjava/lang/String;)Ll/pcv0;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    if-eqz v5, :cond_3

    .line 154
    .line 155
    invoke-interface {v5, p1, v1}, Ll/pcv0;->a(Ll/b7w0;Ll/q6w0;)Z

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    if-eqz v5, :cond_3

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_4
    iget-object v4, p0, Ll/khv0;->i:Ll/tcv0;

    .line 163
    .line 164
    const-wide/16 v5, 0x0

    .line 165
    .line 166
    const/4 v7, 0x0

    .line 167
    invoke-static {v3, v7, v7}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    invoke-virtual {v4, v1, v5, v6, v7}, Ll/tcv0;->f(Ll/q6w0;JLcom/google/android/gms/ads/internal/client/zze;)V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/khv0;->b:Ll/k6u0;

    .line 176
    .line 177
    iget-object v1, p0, Ll/khv0;->d:Ll/yew0;

    .line 178
    .line 179
    iget-object v4, p0, Ll/khv0;->c:Ll/uew0;

    .line 180
    .line 181
    new-instance v5, Ll/hut0;

    .line 182
    .line 183
    invoke-direct {v5, p1, v1, v4}, Ll/hut0;-><init>(Ll/b7w0;Ll/yew0;Ll/uew0;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Ll/khv0;->e:Ljava/util/concurrent/Executor;

    .line 187
    .line 188
    invoke-virtual {v0, v5, v1}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 192
    .line 193
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 194
    .line 195
    iget v0, v0, Ll/t6w0;->p:I

    .line 196
    .line 197
    if-le v0, v3, :cond_6

    .line 198
    .line 199
    iget-object p0, p0, Ll/khv0;->l:Ll/igv0;

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Ll/igv0;->b(Ll/b7w0;)Ll/hpr;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    return-object p0

    .line 206
    :cond_6
    invoke-static {p1}, Ll/khv0;->b(Ll/b7w0;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget-object v1, p0, Ll/khv0;->a:Ll/lcw0;

    .line 211
    .line 212
    sget-object v3, Lcom/google/android/gms/internal/ads/zzflg;->zzn:Lcom/google/android/gms/internal/ads/zzflg;

    .line 213
    .line 214
    new-instance v4, Lcom/google/android/gms/internal/ads/zzeml;

    .line 215
    .line 216
    invoke-direct {v4, v2, v0}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v4}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v0, v3, v1}, Ll/rbw0;->c(Ll/hpr;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/dcw0;->a()Ll/mbw0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v1, p0, Ll/khv0;->h:Ll/ehv0;

    .line 232
    .line 233
    invoke-virtual {v1}, Ll/ehv0;->l()V

    .line 234
    .line 235
    .line 236
    iget-object v1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 237
    .line 238
    iget-object v1, v1, Ll/a7w0;->a:Ljava/util/List;

    .line 239
    .line 240
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    const/4 v2, 0x0

    .line 245
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    if-eqz v3, :cond_9

    .line 250
    .line 251
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    check-cast v3, Ll/q6w0;

    .line 256
    .line 257
    iget-object v4, v3, Ll/q6w0;->a:Ljava/util/List;

    .line 258
    .line 259
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    :cond_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    if-eqz v5, :cond_8

    .line 268
    .line 269
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    check-cast v5, Ljava/lang/String;

    .line 274
    .line 275
    iget-object v6, p0, Ll/khv0;->g:Ll/nzt0;

    .line 276
    .line 277
    iget v7, v3, Ll/q6w0;->b:I

    .line 278
    .line 279
    invoke-interface {v6, v7, v5}, Ll/nzt0;->d(ILjava/lang/String;)Ll/pcv0;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    if-eqz v6, :cond_7

    .line 284
    .line 285
    invoke-interface {v6, p1, v3}, Ll/pcv0;->a(Ll/b7w0;Ll/q6w0;)Z

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    if-eqz v7, :cond_7

    .line 290
    .line 291
    iget-object v4, p0, Ll/khv0;->a:Ll/lcw0;

    .line 292
    .line 293
    sget-object v7, Lcom/google/android/gms/internal/ads/zzflg;->zzo:Lcom/google/android/gms/internal/ads/zzflg;

    .line 294
    .line 295
    invoke-virtual {v4, v7, v0}, Ll/ecw0;->b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    new-instance v4, Ljava/lang/StringBuilder;

    .line 300
    .line 301
    const-string v7, "render-config-"

    .line 302
    .line 303
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    const-string v7, "-"

    .line 310
    .line 311
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    invoke-virtual {v0, v4}, Ll/dcw0;->h(Ljava/lang/String;)Ll/dcw0;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    new-instance v4, Ll/ihv0;

    .line 326
    .line 327
    invoke-direct {v4, p0, v3, p1, v6}, Ll/ihv0;-><init>(Ll/khv0;Ll/q6w0;Ll/b7w0;Ll/pcv0;)V

    .line 328
    .line 329
    .line 330
    const-class v3, Ljava/lang/Throwable;

    .line 331
    .line 332
    invoke-virtual {v0, v3, v4}, Ll/dcw0;->c(Ljava/lang/Class;Ll/xuw0;)Ll/dcw0;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v0}, Ll/dcw0;->a()Ll/mbw0;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    :cond_8
    add-int/lit8 v2, v2, 0x1

    .line 341
    .line 342
    goto :goto_2

    .line 343
    :cond_9
    iget-object p1, p0, Ll/khv0;->h:Ll/ehv0;

    .line 344
    .line 345
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    new-instance v1, Ll/jhv0;

    .line 349
    .line 350
    invoke-direct {v1, p1}, Ll/jhv0;-><init>(Ll/ehv0;)V

    .line 351
    .line 352
    .line 353
    iget-object p0, p0, Ll/khv0;->e:Ljava/util/concurrent/Executor;

    .line 354
    .line 355
    invoke-interface {v0, v1, p0}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 356
    .line 357
    .line 358
    return-object v0
.end method
