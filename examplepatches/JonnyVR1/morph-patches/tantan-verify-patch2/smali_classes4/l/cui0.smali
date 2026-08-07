.class public abstract Ll/cui0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Ll/sfh0$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/sfh0$a;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sfh0$a;->a:Ll/tel;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/tel;->H2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;Ll/sfh0$a;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 7

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 17
    .line 18
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 19
    .line 20
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    long-to-double v2, v2

    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 28
    .line 29
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 30
    .line 31
    sub-double/2addr v2, v4

    .line 32
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    div-double/2addr v2, v4

    .line 38
    double-to-long v2, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-wide/16 v2, 0x0

    .line 41
    .line 42
    move v0, v1

    .line 43
    :goto_0
    iget-object v4, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 44
    .line 45
    new-instance v5, Ll/pf60;

    .line 46
    .line 47
    const-string v6, "distance_content"

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-direct {v5, v6, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 60
    .line 61
    new-instance v4, Ll/pf60;

    .line 62
    .line 63
    const-string v5, "time_content"

    .line 64
    .line 65
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-direct {v4, v5, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 73
    .line 74
    .line 75
    iget-object v0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 76
    .line 77
    iget-object v2, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 78
    .line 79
    const-string v3, "success"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v3}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 85
    .line 86
    const-string v2, "matched"

    .line 87
    .line 88
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_6

    .line 93
    .line 94
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 95
    .line 96
    const-string v2, "xmasActivity"

    .line 97
    .line 98
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_8

    .line 107
    .line 108
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 123
    .line 124
    const-string v2, "superLikedEach"

    .line 125
    .line 126
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_1

    .line 131
    .line 132
    const/16 v1, 0xd

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    const/16 v2, 0xc

    .line 142
    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 152
    .line 153
    const-string v3, "superLiked"

    .line 154
    .line 155
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_3

    .line 160
    .line 161
    if-eqz p2, :cond_2

    .line 162
    .line 163
    :goto_1
    move v1, v2

    .line 164
    goto :goto_2

    .line 165
    :cond_2
    const/16 v1, 0xb

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_3
    if-eqz p2, :cond_4

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_4
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    iget-object v0, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 184
    .line 185
    if-eqz p2, :cond_5

    .line 186
    .line 187
    invoke-virtual {v0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {p1, p0, v1}, Ll/pci;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_5
    invoke-virtual {v0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-nez p2, :cond_8

    .line 204
    .line 205
    iget-object p2, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 206
    .line 207
    invoke-virtual {p2}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 212
    .line 213
    filled-new-array {p0}, [Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 222
    .line 223
    check-cast p3, Ljava/util/ArrayList;

    .line 224
    .line 225
    const/4 v0, 0x0

    .line 226
    invoke-static {p2, p0, v1, p3, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    iget-object p1, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 231
    .line 232
    invoke-virtual {p1}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 237
    .line 238
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-eqz p2, :cond_8

    .line 256
    .line 257
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 262
    .line 263
    iget-object p3, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 264
    .line 265
    invoke-virtual {p3}, Ll/tel;->v1()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    invoke-static {p3}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 270
    .line 271
    .line 272
    move-result p3

    .line 273
    if-nez p3, :cond_7

    .line 274
    .line 275
    iget-object p3, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 276
    .line 277
    invoke-virtual {p3}, Ll/tel;->v1()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p3

    .line 281
    invoke-static {p2}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p3

    .line 293
    if-nez p3, :cond_7

    .line 294
    .line 295
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 296
    .line 297
    iget-object v0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 298
    .line 299
    invoke-virtual {v0}, Ll/tel;->v1()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p3, v0}, Ll/fsb0;->R(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    :cond_7
    iget-object p3, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 307
    .line 308
    invoke-static {p2}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 309
    .line 310
    .line 311
    move-result-object p2

    .line 312
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-virtual {p3, p2}, Ll/tel;->L2(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    goto :goto_3

    .line 320
    :cond_8
    return-void
.end method


# virtual methods
.method public e()Lcom/p1/mobile/putong/data/Counter;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f(ZZLcom/p1/mobile/putong/data/User;Ljava/util/Map;ZZLl/sfh0$a;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;ZZ",
            "Ll/sfh0$a;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 p0, p7

    .line 2
    .line 3
    iget-object v0, p0, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 4
    .line 5
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/sfh0$a;->b:Ll/yfl;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    move/from16 v1, p5

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz p6, :cond_1

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PROFILE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "p_activity_momentcard_view"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 77
    .line 78
    iget-object v0, p0, Ll/sfh0$a;->c:Ll/ik4;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v10

    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 87
    .line 88
    iput-object v10, v1, Lcom/p1/mobile/putong/core/api/b0;->T:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 89
    .line 90
    if-nez v10, :cond_2

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    const-string v0, "home"

    .line 94
    .line 95
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    iget-object v0, p0, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/d;->i()I

    .line 102
    .line 103
    .line 104
    move-result v9

    .line 105
    const/4 v5, 0x0

    .line 106
    const/4 v7, 0x1

    .line 107
    move v2, p1

    .line 108
    move v3, p2

    .line 109
    move-object v4, p4

    .line 110
    invoke-virtual/range {v1 .. v10}, Lcom/p1/mobile/putong/core/api/b0;->P3(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance p4, Ll/aui0;

    .line 115
    .line 116
    invoke-direct {p4, p3, p0, p2}, Ll/aui0;-><init>(Lcom/p1/mobile/putong/data/User;Ll/sfh0$a;Z)V

    .line 117
    .line 118
    .line 119
    new-instance p2, Ll/bui0;

    .line 120
    .line 121
    invoke-direct {p2, p0}, Ll/bui0;-><init>(Ll/sfh0$a;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p4, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/sfh0$a;->b:Ll/yfl;

    .line 132
    .line 133
    iget-object p1, p1, Ll/yfl;->W:Ll/v740;

    .line 134
    .line 135
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_5

    .line 140
    .line 141
    iget-object p1, p0, Ll/sfh0$a;->b:Ll/yfl;

    .line 142
    .line 143
    iget-object p1, p1, Ll/yfl;->W:Ll/v740;

    .line 144
    .line 145
    iget-object p1, p1, Ll/v740;->c:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    const/4 p2, 0x6

    .line 152
    if-ne p1, p2, :cond_3

    .line 153
    .line 154
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 155
    .line 156
    const-wide/32 p1, 0x2bf20

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/location/a;->u(J)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    const/4 p2, 0x5

    .line 164
    if-eq p1, p2, :cond_4

    .line 165
    .line 166
    const/4 p2, 0x3

    .line 167
    if-eq p1, p2, :cond_4

    .line 168
    .line 169
    const/4 p2, 0x1

    .line 170
    if-eq p1, p2, :cond_4

    .line 171
    .line 172
    if-nez p1, :cond_5

    .line 173
    .line 174
    :cond_4
    iget-object p0, p0, Ll/sfh0$a;->a:Ll/tel;

    .line 175
    .line 176
    const/4 p1, 0x0

    .line 177
    invoke-virtual {p0, p1}, Ll/tel;->F2(Z)V

    .line 178
    .line 179
    .line 180
    :cond_5
    :goto_2
    return-void
.end method

.method public g(Ll/sfh0$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method
