.class public abstract Ll/erh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Ll/frh$a;",
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

.method public static synthetic c(Ll/frh$a;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/frh$a;->g:Ll/ttl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Ll/ttl;->a2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;Ll/frh$a;ZLcom/p1/mobile/putong/data/Relationship;)V
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
    iget-object v4, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

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
    iget-object v0, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

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
    iget-object v0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 76
    .line 77
    iget-object v2, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 78
    .line 79
    const-string v3, "success"

    .line 80
    .line 81
    invoke-interface {v0, v2, v3}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

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
    iget-object v0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 95
    .line 96
    invoke-interface {v0}, Ll/ttl;->h0()V

    .line 97
    .line 98
    .line 99
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 100
    .line 101
    const-string v2, "xmasActivity"

    .line 102
    .line 103
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_6

    .line 112
    .line 113
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_1

    .line 120
    .line 121
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 128
    .line 129
    const-string v2, "superLikedEach"

    .line 130
    .line 131
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_1

    .line 136
    .line 137
    const/16 v1, 0xd

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    const/16 v2, 0xc

    .line 147
    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 157
    .line 158
    const-string v3, "superLiked"

    .line 159
    .line 160
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_3

    .line 165
    .line 166
    if-eqz p2, :cond_2

    .line 167
    .line 168
    :goto_1
    move v1, v2

    .line 169
    goto :goto_2

    .line 170
    :cond_2
    const/16 v1, 0xb

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_3
    if-eqz p2, :cond_4

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_4
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iget-object v0, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    if-eqz p2, :cond_5

    .line 191
    .line 192
    invoke-static {v0, p0, v1}, Ll/pci;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    if-nez p2, :cond_6

    .line 201
    .line 202
    iget-object p2, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 203
    .line 204
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 205
    .line 206
    filled-new-array {p0}, [Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 215
    .line 216
    check-cast p3, Ljava/util/ArrayList;

    .line 217
    .line 218
    const/4 v0, 0x0

    .line 219
    invoke-static {p2, p0, v1, p3, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    iget-object p1, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 224
    .line 225
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 226
    .line 227
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 231
    .line 232
    .line 233
    :cond_6
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

.method public f(ZZLcom/p1/mobile/putong/data/User;Ljava/util/Map;ZLl/frh$a;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Ll/frh$a;",
            ")V"
        }
    .end annotation

    .line 1
    move/from16 v2, p2

    .line 2
    .line 3
    move-object/from16 v4, p3

    .line 4
    .line 5
    move-object/from16 p0, p6

    .line 6
    .line 7
    iget-object v0, p0, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 8
    .line 9
    move-object/from16 v3, p4

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 15
    .line 16
    .line 17
    move-result-object v8

    .line 18
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    move/from16 v1, p5

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v5, p0, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 52
    .line 53
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 66
    .line 67
    if-nez v4, :cond_0

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 73
    .line 74
    iget-object v5, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v5}, Ll/ela;->t3(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v5, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v5}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v12

    .line 90
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 93
    .line 94
    const-string v5, "poi"

    .line 95
    .line 96
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iget-object v5, p0, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 101
    .line 102
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/home/d;->i()I

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    const/4 v11, 0x1

    .line 107
    const/4 v13, 0x0

    .line 108
    const-string v5, ""

    .line 109
    .line 110
    const/4 v7, 0x1

    .line 111
    move v1, p1

    .line 112
    invoke-virtual/range {v0 .. v13}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a8(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;ZIZ)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/crh;

    .line 117
    .line 118
    invoke-direct {v1, v4, p0, v2}, Ll/crh;-><init>(Lcom/p1/mobile/putong/data/User;Ll/frh$a;Z)V

    .line 119
    .line 120
    .line 121
    new-instance v2, Ll/drh;

    .line 122
    .line 123
    invoke-direct {v2, p0}, Ll/drh;-><init>(Ll/frh$a;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public g(Ll/frh$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

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
