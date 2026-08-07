.class public Ll/pey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fzl;


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->H3()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/ela;->r3()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/bdr;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    iget-object p1, p5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 17
    .line 18
    const-string p5, "matched"

    .line 19
    .line 20
    invoke-static {p1, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Ll/cey;->k(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    if-nez p4, :cond_3

    .line 33
    .line 34
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0}, Ll/cey;->k(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_4

    .line 45
    .line 46
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    const-string p1, "lettered"

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p0, p1}, Ll/cey;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    if-eqz p2, :cond_5

    .line 59
    .line 60
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    const-string p1, "superliked"

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p0, p1}, Ll/cey;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    const-string p1, "liked"

    .line 75
    .line 76
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p0, p1}, Ll/cey;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    .line 81
    .line 82
    .line 83
    :goto_1
    invoke-static {}, Ll/joa;->H3()Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_6

    .line 88
    .line 89
    invoke-static {}, Ll/ela;->r3()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-lez p0, :cond_6

    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 100
    .line 101
    .line 102
    :cond_6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pey;->from()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->r1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)Z
    .locals 4

    .line 1
    iget-object p3, p5, Lcom/p1/mobile/putong/core/data/PickInfo;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 2
    .line 3
    const-string p4, "masking"

    .line 4
    .line 5
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 p4, 0x1

    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pey;->a()V

    .line 13
    .line 14
    .line 15
    return p4

    .line 16
    :cond_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/joa;->H3()Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-nez p3, :cond_1

    .line 23
    .line 24
    return p4

    .line 25
    :cond_1
    invoke-static {}, Ll/joa;->H3()Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_2

    .line 30
    .line 31
    invoke-static {}, Ll/ela;->r3()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-gtz p3, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/pey;->a()V

    .line 38
    .line 39
    .line 40
    return p4

    .line 41
    :cond_2
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 48
    .line 49
    const-string p5, "e_picks_card_superlike"

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    iget p1, p3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 54
    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    const-wide/16 v2, 0x0

    .line 62
    .line 63
    cmp-long p1, v0, v2

    .line 64
    .line 65
    if-lez p1, :cond_3

    .line 66
    .line 67
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    iget-object p0, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-static {p0, p5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return p4

    .line 81
    :cond_3
    if-eqz p2, :cond_a

    .line 82
    .line 83
    invoke-static {}, Ll/a5i0;->x0()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-gtz p1, :cond_a

    .line 88
    .line 89
    invoke-static {}, Ll/joa;->f4()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_7

    .line 94
    .line 95
    invoke-static {}, Ll/joa;->H3()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_5

    .line 100
    .line 101
    invoke-static {}, Ll/ela;->r3()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-lez p1, :cond_4

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_4
    invoke-virtual {p0}, Ll/pey;->a()V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_5
    :goto_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p0, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 129
    .line 130
    invoke-interface {p1, p0, p5, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    iget-object p1, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/pey;->from()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_7
    invoke-static {}, Ll/joa;->H3()Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_9

    .line 149
    .line 150
    invoke-static {}, Ll/ela;->r3()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-lez p1, :cond_8

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_8
    invoke-virtual {p0}, Ll/pey;->a()V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_9
    :goto_1
    iget-object p1, p0, Ll/pey;->a:Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/pey;->from()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :goto_2
    return p4

    .line 171
    :cond_a
    const/4 p0, 0x0

    .line 172
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)V
    .locals 15

    .line 1
    new-instance v3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p0, "sourcepage"

    .line 7
    .line 8
    const-string v0, "mymeet"

    .line 9
    .line 10
    invoke-interface {v3, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-object/from16 p0, p6

    .line 14
    .line 15
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 19
    .line 20
    .line 21
    move-result-object v8

    .line 22
    new-instance v1, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    move/from16 v14, p3

    .line 40
    .line 41
    invoke-virtual {v1, v14}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    move/from16 v2, p5

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    move/from16 v12, p4

    .line 52
    .line 53
    invoke-virtual {v1, v12}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    move-object/from16 v13, p2

    .line 58
    .line 59
    iget-object v2, v13, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 78
    .line 79
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    const/4 v9, 0x0

    .line 88
    move-object/from16 v0, p8

    .line 89
    .line 90
    iget-object v10, v0, Lcom/p1/mobile/putong/core/data/PickInfo;->picksTracker:Ljava/lang/String;

    .line 91
    .line 92
    const/4 v7, 0x1

    .line 93
    move-object v0, p0

    .line 94
    move-object/from16 v5, p7

    .line 95
    .line 96
    move v2, v12

    .line 97
    move-object v4, v13

    .line 98
    move v1, v14

    .line 99
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    move-object/from16 v11, p1

    .line 104
    .line 105
    invoke-virtual {v11, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance v9, Ll/ney;

    .line 110
    .line 111
    move-object/from16 v10, p7

    .line 112
    .line 113
    invoke-direct/range {v9 .. v14}, Ll/ney;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;Z)V

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/oey;

    .line 117
    .line 118
    invoke-direct {v0}, Ll/oey;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v9, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public from()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_meet_view,e_picks_feed_card,like_swipe"

    .line 2
    .line 3
    return-object p0
.end method
