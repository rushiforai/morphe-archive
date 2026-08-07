.class public final Ll/l4y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mdj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/mdj<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzno;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Lcom/google/android/gms/measurement/internal/zzno;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 2
    .line 3
    iput-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/ajx0;->E()Landroid/util/SparseArray;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 12
    .line 13
    iget v2, v1, Lcom/google/android/gms/measurement/internal/zzno;->zzc:I

    .line 14
    .line 15
    iget-wide v3, v1, Lcom/google/android/gms/measurement/internal/zzno;->zzb:J

    .line 16
    .line 17
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v0}, Ll/ajx0;->p(Landroid/util/SparseArray;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/g;->R(Lcom/google/android/gms/measurement/internal/g;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/whs0;->O0:Ll/zpw0;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/g;->B0()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "registerTriggerAsync failed with throwable"

    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v1, Ll/whs0;->M0:Ll/zpw0;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x2

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 61
    .line 62
    invoke-static {v0, p1}, Lcom/google/android/gms/measurement/internal/g;->w(Lcom/google/android/gms/measurement/internal/g;Ljava/lang/Throwable;)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    move v0, v1

    .line 68
    :goto_0
    const/4 v2, 0x1

    .line 69
    sub-int/2addr v0, v2

    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    if-eq v0, v2, :cond_3

    .line 73
    .line 74
    if-eq v0, v1, :cond_2

    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 88
    .line 89
    invoke-virtual {v1}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v3, "registerTriggerAsync failed. Dropping URI. App ID, Throwable"

    .line 102
    .line 103
    invoke-virtual {v0, v3, v1, p1}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ll/l4y0;->a()V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 110
    .line 111
    invoke-static {p1, v2}, Lcom/google/android/gms/measurement/internal/g;->M(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/g;->B0()V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_3
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/g;->u0()Ljava/util/PriorityQueue;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v1, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/g;->v(Lcom/google/android/gms/measurement/internal/g;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object v1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 138
    .line 139
    const/16 v3, 0x20

    .line 140
    .line 141
    if-le v0, v3, :cond_4

    .line 142
    .line 143
    invoke-static {v1, v2}, Lcom/google/android/gms/measurement/internal/g;->M(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {p1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    const-string v1, "registerTriggerAsync failed. May try later. App ID, throwable"

    .line 179
    .line 180
    invoke-virtual {v0, v1, p0, p1}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_4
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object v1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 193
    .line 194
    invoke-virtual {v1}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-static {v1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iget-object v3, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 207
    .line 208
    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/g;->v(Lcom/google/android/gms/measurement/internal/g;)I

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    invoke-static {v3}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {p1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    const-string v4, "registerTriggerAsync failed. App ID, delay in seconds, throwable"

    .line 229
    .line 230
    invoke-virtual {v0, v4, v1, v3, p1}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 234
    .line 235
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/g;->v(Lcom/google/android/gms/measurement/internal/g;)I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    invoke-static {p1, v0}, Lcom/google/android/gms/measurement/internal/g;->J0(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 240
    .line 241
    .line 242
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 243
    .line 244
    invoke-static {p0}, Lcom/google/android/gms/measurement/internal/g;->v(Lcom/google/android/gms/measurement/internal/g;)I

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    shl-int/2addr p1, v2

    .line 249
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/g;->M(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_5
    iget-object v0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 254
    .line 255
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-object v1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 264
    .line 265
    invoke-virtual {v1}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/c;->z()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-static {v1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    invoke-static {p1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    const-string v3, "registerTriggerAsync failed with retriable error. Will try later. App ID, throwable"

    .line 286
    .line 287
    invoke-virtual {v0, v3, v1, p1}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 291
    .line 292
    invoke-static {p1, v2}, Lcom/google/android/gms/measurement/internal/g;->M(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 296
    .line 297
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/g;->u0()Ljava/util/PriorityQueue;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    iget-object p0, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 302
    .line 303
    invoke-virtual {p1, p0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/yyx0;->a()Ll/ajr0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Ll/whs0;->O0:Ll/zpw0;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/l4y0;->a()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 25
    .line 26
    invoke-static {p1, v0}, Lcom/google/android/gms/measurement/internal/g;->R(Lcom/google/android/gms/measurement/internal/g;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-static {p1, v0}, Lcom/google/android/gms/measurement/internal/g;->M(Lcom/google/android/gms/measurement/internal/g;I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/d6x0;->z()Ll/l8x0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzno;->zza:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "Successfully registered trigger URI"

    .line 50
    .line 51
    invoke-virtual {p1, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/g;->B0()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 61
    .line 62
    invoke-static {p1, v0}, Lcom/google/android/gms/measurement/internal/g;->R(Lcom/google/android/gms/measurement/internal/g;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/g;->B0()V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/l4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Ll/d6x0;->z()Ll/l8x0;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object p0, p0, Ll/l4y0;->a:Lcom/google/android/gms/measurement/internal/zzno;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzno;->zza:Ljava/lang/String;

    .line 83
    .line 84
    const-string v0, "registerTriggerAsync ran. uri"

    .line 85
    .line 86
    invoke-virtual {p1, v0, p0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
