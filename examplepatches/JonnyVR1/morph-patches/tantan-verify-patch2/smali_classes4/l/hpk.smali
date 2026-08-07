.class public Ll/hpk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ppk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Links;

.field public b:Lcom/p1/mobile/putong/core/data/GroupTab;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->A6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/apk;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/apk;-><init>(Ll/hpk;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/epk;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/epk;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/fpk;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/fpk;-><init>(Ll/hpk;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/gpk;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/gpk;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->f7()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/pok;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/pok;-><init>(Ll/hpk;)V

    .line 86
    .line 87
    .line 88
    new-instance v2, Ll/qok;

    .line 89
    .line 90
    invoke-direct {v2}, Ll/qok;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const/4 v1, 0x1

    .line 113
    if-eqz v0, :cond_0

    .line 114
    .line 115
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Landroid/util/Pair;

    .line 128
    .line 129
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 130
    .line 131
    if-eqz v0, :cond_0

    .line 132
    .line 133
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Landroid/util/Pair;

    .line 146
    .line 147
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v0, Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_0

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-interface {v0}, Ll/r97;->x2()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_1

    .line 170
    .line 171
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 172
    .line 173
    check-cast v0, Ll/ppk;

    .line 174
    .line 175
    invoke-virtual {v0}, Ll/ppk;->f()V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 179
    .line 180
    check-cast v0, Ll/ppk;

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ll/ppk;->n(Z)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Ll/hpk;->P0()V

    .line 186
    .line 187
    .line 188
    :cond_1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    new-instance v1, Ll/rok;

    .line 201
    .line 202
    invoke-direct {v1}, Ll/rok;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    new-instance v1, Ll/sok;

    .line 210
    .line 211
    invoke-direct {v1}, Ll/sok;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    new-instance v1, Ll/tok;

    .line 219
    .line 220
    invoke-direct {v1, p0}, Ll/tok;-><init>(Ll/hpk;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 228
    .line 229
    .line 230
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 233
    .line 234
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->H8()Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    new-instance v1, Ll/uok;

    .line 243
    .line 244
    invoke-direct {v1, p0}, Ll/uok;-><init>(Ll/hpk;)V

    .line 245
    .line 246
    .line 247
    new-instance v2, Ll/bpk;

    .line 248
    .line 249
    invoke-direct {v2}, Ll/bpk;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 257
    .line 258
    .line 259
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 260
    .line 261
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 262
    .line 263
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->U8()Lrx/c;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ll/hpk;->R0()V

    .line 267
    .line 268
    .line 269
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-interface {v0}, Ll/r97;->x2()Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-eqz v0, :cond_2

    .line 282
    .line 283
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    new-instance v1, Ll/cpk;

    .line 288
    .line 289
    invoke-direct {v1}, Ll/cpk;-><init>()V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    new-instance v1, Ll/dpk;

    .line 297
    .line 298
    invoke-direct {v1, p0}, Ll/dpk;-><init>(Ll/hpk;)V

    .line 299
    .line 300
    .line 301
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 306
    .line 307
    .line 308
    :cond_2
    return-void
.end method

.method private synthetic J0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ppk;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ppk;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/hpk;->C0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g0(Ll/hpk;Lcom/p1/mobile/putong/core/data/GroupTab;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hpk;->O0(Lcom/p1/mobile/putong/core/data/GroupTab;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h0(Ll/hpk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->L0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/hpk;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->F0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Ll/hpk;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->I0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic l0(Ll/hpk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hpk;->J0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic n0(Ll/hpk;Lcom/p1/mobile/putong/core/data/NotificationCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->E0(Lcom/p1/mobile/putong/core/data/NotificationCounter;)V

    return-void
.end method

.method public static synthetic o0(Ll/hpk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ll/hpk;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->G0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t0(Ll/hpk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->D0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic u0(Ll/hpk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpk;->H0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic x0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/util/Pair;

    .line 28
    .line 29
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p0, Ljava/util/Collection;

    .line 32
    .line 33
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 43
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public static synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hpk;->a:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hpk;->a:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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

.method public final synthetic D0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ppk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ppk;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/core/data/NotificationCounter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ppk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ppk;->s(Lcom/p1/mobile/putong/core/data/NotificationCounter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hpk;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 12
    .line 13
    iget-object p0, p0, Ll/hpk;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/e;->f9(Lcom/p1/mobile/putong/core/data/GroupTab;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic G0(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/hpk;->a:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/ppk;

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ppk;->l(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic H0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->x2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/hpk;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 31
    .line 32
    iput-object v0, p0, Ll/hpk;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 33
    .line 34
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/ppk;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/ppk;->m(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic I0(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ppk;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/ppk;->n(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hpk;->P0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ppk;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/ppk;->n(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/ppk;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Ll/ppk;->n(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/core/data/GroupTab;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/e;->i9()Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/data/GroupTab;->id:I

    .line 12
    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/GroupTab;->id:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "group_chat_type"

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupTab;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "e_group_chat_type_tab"

    .line 35
    .line 36
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/e;->f9(Lcom/p1/mobile/putong/core/data/GroupTab;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p1, Ll/ppk;

    .line 45
    .line 46
    sget-object p2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Ll/ppk;->l(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p1, Ll/ppk;

    .line 54
    .line 55
    const/4 p2, 0x1

    .line 56
    invoke-virtual {p1, p2}, Ll/ppk;->n(Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/hpk;->P0()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public P0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->q6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/yok;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/yok;-><init>(Ll/hpk;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/zok;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/zok;-><init>(Ll/hpk;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public Q0(Lcom/p1/mobile/putong/core/newui/group/GroupTabItemView;Lcom/p1/mobile/putong/core/data/GroupTab;)V
    .locals 1

    .line 1
    new-instance v0, Ll/vok;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/vok;-><init>(Ll/hpk;Lcom/p1/mobile/putong/core/data/GroupTab;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ppk;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ppk;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    new-array v0, v0, [Ll/sfj0$a;

    .line 17
    .line 18
    const-string v1, "e_group_notice_red_number_bubble"

    .line 19
    .line 20
    invoke-static {v1, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ook;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ook;-><init>(Ll/hpk;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_chat_square"

    .line 2
    .line 3
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->L6()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/util/Pair;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 35
    .line 36
    iput-object v0, p0, Ll/hpk;->a:Lcom/p1/mobile/putong/data/Links;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/e;->r6(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/wok;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/wok;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/xok;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/xok;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public z0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/jek;->g(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/ppk;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ppk;->i()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const-string v1, "is_red_bubble"

    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v1, "e_group_notice_entrance"

    .line 39
    .line 40
    invoke-static {v1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
