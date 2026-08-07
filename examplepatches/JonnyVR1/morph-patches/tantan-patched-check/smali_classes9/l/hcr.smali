.class public Ll/hcr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

.field public b:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 285
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/hcr;->d:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 28
    .line 29
    :goto_0
    iput-object p2, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 30
    .line 31
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_1

    .line 40
    .line 41
    iget-object p2, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p2, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 67
    .line 68
    sget-object v1, Ll/htd0;->b:Ll/htd0;

    .line 69
    .line 70
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ll/jfv;

    .line 75
    .line 76
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/vwt;->u7()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 99
    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    sget-object v1, Ll/htd0;->c:Ll/htd0;

    .line 103
    .line 104
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Ll/hiv;

    .line 109
    .line 110
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 113
    .line 114
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 115
    .line 116
    invoke-virtual {v1, v2, v3}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 124
    .line 125
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 126
    .line 127
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-nez p2, :cond_4

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 136
    .line 137
    new-instance p2, Ll/fcr;

    .line 138
    .line 139
    invoke-direct {p2, p0}, Ll/fcr;-><init>(Ll/hcr;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 143
    .line 144
    .line 145
    :cond_4
    iget-object p1, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 146
    .line 147
    if-eqz p1, :cond_7

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 150
    .line 151
    if-eqz p1, :cond_7

    .line 152
    .line 153
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-nez p1, :cond_7

    .line 160
    .line 161
    iget-object p1, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 164
    .line 165
    sget-object p2, Ll/htd0;->b:Ll/htd0;

    .line 166
    .line 167
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    check-cast p2, Ll/jfv;

    .line 172
    .line 173
    iget-object v0, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {p2, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 184
    .line 185
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Ll/vwt;->u7()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_5

    .line 194
    .line 195
    iget-object p1, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 198
    .line 199
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 200
    .line 201
    if-eqz p2, :cond_5

    .line 202
    .line 203
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 204
    .line 205
    if-eqz p2, :cond_5

    .line 206
    .line 207
    sget-object p2, Ll/htd0;->c:Ll/htd0;

    .line 208
    .line 209
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    check-cast p2, Ll/hiv;

    .line 214
    .line 215
    iget-object v0, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 216
    .line 217
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 222
    .line 223
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 224
    .line 225
    invoke-virtual {p2, v0, v1}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 230
    .line 231
    :cond_5
    iget-object p1, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 232
    .line 233
    iget-object p2, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 234
    .line 235
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 236
    .line 237
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iget-object p2, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 244
    .line 245
    if-eqz p1, :cond_6

    .line 246
    .line 247
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 248
    .line 249
    invoke-static {p1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iget-object p2, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 254
    .line 255
    iget-object v0, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 256
    .line 257
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 258
    .line 259
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object p2

    .line 265
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 266
    .line 267
    invoke-virtual {p1, p2}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    iput-object p1, p0, Ll/hcr;->b:Ll/nsv;

    .line 272
    .line 273
    return-void

    .line 274
    :cond_6
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 275
    .line 276
    invoke-static {p1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    iput-object p1, p0, Ll/hcr;->b:Ll/nsv;

    .line 281
    .line 282
    :cond_7
    return-void
.end method

.method public static synthetic a(Ll/hcr;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hcr;->g(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method


# virtual methods
.method public b()Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hcr;->b:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v0, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/gcr;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/gcr;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 61
    .line 62
    iget-object v3, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 63
    .line 64
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    invoke-static {v2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iget-object v4, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 85
    .line 86
    invoke-virtual {v3, v2}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    invoke-static {v2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0
.end method

.method public d()Ljava/util/ArrayList;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hcr;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hcr;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method
