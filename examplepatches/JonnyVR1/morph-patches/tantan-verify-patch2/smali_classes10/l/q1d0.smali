.class public Ll/q1d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/kcg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ya:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->f7:I

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 41
    .line 42
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->D6:I

    .line 43
    .line 44
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const/4 v0, 0x4

    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 58
    .line 59
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->A:I

    .line 60
    .line 61
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 75
    .line 76
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->B6:I

    .line 77
    .line 78
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    const/4 v0, 0x6

    .line 87
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 92
    .line 93
    sget v7, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pd:I

    .line 94
    .line 95
    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    const/16 v0, 0xb

    .line 104
    .line 105
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 110
    .line 111
    sget v8, Lcom/p1/mobile/putong/live/livingroom/R$string;->xb:I

    .line 112
    .line 113
    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    const/16 v0, 0x8

    .line 122
    .line 123
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 128
    .line 129
    sget v9, Lcom/p1/mobile/putong/live/livingroom/R$string;->E6:I

    .line 130
    .line 131
    invoke-virtual {v1, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v9

    .line 139
    const/4 v0, 0x7

    .line 140
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 145
    .line 146
    sget v10, Lcom/p1/mobile/putong/live/livingroom/R$string;->te:I

    .line 147
    .line 148
    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object v10

    .line 156
    filled-new-array/range {v2 .. v10}, [Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sput-object v0, Ll/q1d0;->c:Ljava/util/List;

    .line 165
    .line 166
    const/16 v0, 0xc

    .line 167
    .line 168
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 173
    .line 174
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->vb:I

    .line 175
    .line 176
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const/16 v1, 0xd

    .line 185
    .line 186
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 191
    .line 192
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->ub:I

    .line 193
    .line 194
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const/16 v3, 0xe

    .line 203
    .line 204
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    sget-object v4, Ll/zrv;->e:Landroid/app/Application;

    .line 209
    .line 210
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->wb:I

    .line 211
    .line 212
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    filled-new-array {v0, v2, v4}, [Ll/pf60;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    sput-object v0, Ll/q1d0;->d:Ljava/util/List;

    .line 229
    .line 230
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 231
    .line 232
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ub:I

    .line 233
    .line 234
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 243
    .line 244
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->wb:I

    .line 245
    .line 246
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    sput-object v0, Ll/q1d0;->e:Ljava/util/List;

    .line 263
    .line 264
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/q1d0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q1d0;->o(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/q1d0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q1d0;->n(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/q1d0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q1d0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/pf60;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic f(Ll/q1d0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p13}, Ll/q1d0;->m(Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic g(Ll/q1d0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q1d0;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method


# virtual methods
.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1d0;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/q1d0;->b:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJZLjava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->liveId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->seq:J

    .line 11
    .line 12
    iput p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->type:I

    .line 13
    .line 14
    iput-object p3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->reportedUserId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p9, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->fakeId:Ljava/lang/String;

    .line 17
    .line 18
    iput p10, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->roomType:I

    .line 19
    .line 20
    iget-object p1, p0, Ll/q1d0;->b:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    if-eqz p7, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->a7(Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Z6(Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :goto_0
    new-instance p2, Ll/m1d0;

    .line 37
    .line 38
    invoke-direct {p2, p0, p8}, Ll/m1d0;-><init>(Ll/q1d0;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Ll/n1d0;

    .line 46
    .line 47
    invoke-direct {p2, p0}, Ll/n1d0;-><init>(Ll/q1d0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance p2, Ll/o1d0;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Ll/o1d0;-><init>(Ll/q1d0;)V

    .line 57
    .line 58
    .line 59
    new-instance p3, Ll/p1d0;

    .line 60
    .line 61
    invoke-direct {p3}, Ll/p1d0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Ll/q1d0;->b:Ll/kcg0;

    .line 73
    .line 74
    return-void
.end method

.method public final j(Ll/nsv;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Ll/e3t;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/e3t;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3t;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, ""

    .line 17
    .line 18
    return-object p0
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/q1d0;->p(Lcom/p1/mobile/putong/data/Meta;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1d0;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 12

    .line 1
    invoke-virtual {p3}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    move-object/from16 v0, p4

    move/from16 v1, p12

    .line 2
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/pf60;

    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 3
    invoke-virtual {p0, p3}, Ll/q1d0;->j(Ll/nsv;)Ljava/lang/String;

    move-result-object v10

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v6, p5

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v11, p9

    .line 4
    invoke-virtual/range {v1 .. v11}, Ll/q1d0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJZLjava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public final synthetic n(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1d0;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/q1d0;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/Meta;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Meta;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p2, "Meta is Null"

    .line 6
    .line 7
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/q1d0;->o(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 15
    .line 16
    const/16 p1, 0xc8

    .line 17
    .line 18
    if-lt p0, p1, :cond_1

    .line 19
    .line 20
    const/16 p1, 0x12c

    .line 21
    .line 22
    if-ge p0, p1, :cond_1

    .line 23
    .line 24
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/16 p1, 0x190

    .line 29
    .line 30
    if-lt p0, p1, :cond_2

    .line 31
    .line 32
    const/16 p1, 0x258

    .line 33
    .line 34
    if-ge p0, p1, :cond_2

    .line 35
    .line 36
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ll/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;I)V
    .locals 12
    .param p2    # Ll/nsv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JZ",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p7, :cond_1

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Ll/q1d0;->c:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_0
    move-object v5, v0

    goto :goto_1

    .line 3
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {v0}, Ll/wrv;->I()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    const-string v1, "indonesia"

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Ll/q1d0;->d:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 6
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Ll/q1d0;->e:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 7
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Ll/q1d0;->d:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 8
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v0

    new-instance v1, Ll/j1d0;

    invoke-direct {v1}, Ll/j1d0;-><init>()V

    .line 9
    invoke-static {v5, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v11

    new-instance v0, Ll/k1d0;

    move-object v1, p0

    move-object v4, p2

    move-object v2, p3

    move-object/from16 v3, p4

    move-wide/from16 v6, p5

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Ll/k1d0;-><init>(Ll/q1d0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;I)V

    .line 10
    invoke-virtual {v11, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v0

    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v0

    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v0

    new-instance v2, Ll/l1d0;

    invoke-direct {v2, p0}, Ll/l1d0;-><init>(Ll/q1d0;)V

    .line 13
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    move-result-object v0

    iput-object v0, p0, Ll/q1d0;->a:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method
