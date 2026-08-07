.class public Ll/rgr;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/d;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v3, 0x1

    .line 14
    const/4 v4, 0x1

    .line 15
    move-object v8, p0

    .line 16
    move-object v1, p2

    .line 17
    move-object v2, p3

    .line 18
    move/from16 v5, p4

    .line 19
    .line 20
    move-object/from16 v6, p5

    .line 21
    .line 22
    move-object/from16 v7, p6

    .line 23
    .line 24
    move-object/from16 v9, p7

    .line 25
    .line 26
    move-object/from16 v10, p8

    .line 27
    .line 28
    move-object/from16 v11, p9

    .line 29
    .line 30
    invoke-static/range {v1 .. v11}, Ll/rgr;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLl/y20;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->Y0()V

    .line 6
    .line 7
    .line 8
    invoke-static/range {p0 .. p6}, Ll/rgr;->q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(ZLcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 3

    .line 1
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v1, "matched"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 27
    .line 28
    const-string v2, "superLikedEach"

    .line 29
    .line 30
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/16 v1, 0xd

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 54
    .line 55
    const-string v2, "superLiked"

    .line 56
    .line 57
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    const/16 v1, 0xc

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/16 v1, 0xb

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 86
    .line 87
    const-string v0, "secretcrush"

    .line 88
    .line 89
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_3

    .line 94
    .line 95
    const/4 v1, 0x1

    .line 96
    :cond_3
    :goto_0
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 97
    .line 98
    filled-new-array {p0}, [Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 116
    .line 117
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 121
    .line 122
    .line 123
    :cond_4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_5

    .line 128
    .line 129
    invoke-interface {p2, p3, p4}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_5
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->Y0()V

    .line 6
    .line 7
    .line 8
    invoke-static/range {p0 .. p6}, Ll/rgr;->q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 9

    .line 1
    move-object/from16 v5, p9

    .line 2
    .line 3
    iget-object v0, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    const-string v8, "matched"

    .line 6
    .line 7
    invoke-static {v0, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/spl0;->U()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget-object v0, Ll/s0e0;->INSTANCE:Ll/s0e0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/s0e0;->e()V

    .line 29
    .line 30
    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 37
    .line 38
    iput v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 39
    .line 40
    move-object v0, p0

    .line 41
    move-object v1, p1

    .line 42
    move v2, p2

    .line 43
    move v3, p3

    .line 44
    move v4, p4

    .line 45
    move-object v6, p5

    .line 46
    move-object v7, p6

    .line 47
    invoke-static/range {v0 .. v7}, Ll/rgr;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    if-eqz p2, :cond_2

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 56
    .line 57
    iget p4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 58
    .line 59
    add-int/lit8 p4, p4, 0x1

    .line 60
    .line 61
    iput p4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 62
    .line 63
    iget p4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 64
    .line 65
    add-int/lit8 p4, p4, 0x1

    .line 66
    .line 67
    iput p4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 68
    .line 69
    :cond_2
    invoke-static {}, Ll/spl0;->U()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    sget-object p0, Ll/s0e0;->INSTANCE:Ll/s0e0;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/s0e0;->d()V

    .line 80
    .line 81
    .line 82
    :cond_3
    sget-object p0, Ll/s0e0;->INSTANCE:Ll/s0e0;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/s0e0;->a()Z

    .line 85
    .line 86
    .line 87
    move-result p4

    .line 88
    if-eqz p4, :cond_4

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/s0e0;->c()V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0, v5, p1, p2, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->processMomentLikeStatusChanged(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 98
    .line 99
    .line 100
    invoke-static/range {p7 .. p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_5

    .line 105
    .line 106
    move-object/from16 p0, p7

    .line 107
    .line 108
    invoke-interface {p0, v5}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    :cond_5
    const-string p0, "success"

    .line 112
    .line 113
    move-object/from16 p2, p8

    .line 114
    .line 115
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_8

    .line 127
    .line 128
    iget-object p0, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 129
    .line 130
    invoke-static {p0, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_6

    .line 135
    .line 136
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->h0:Lrx/subjects/b;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 143
    .line 144
    iget-object p2, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 145
    .line 146
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_6
    if-eqz p3, :cond_7

    .line 155
    .line 156
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->h0:Lrx/subjects/b;

    .line 161
    .line 162
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 163
    .line 164
    const-string p2, "superliked"

    .line 165
    .line 166
    invoke-static {p2}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->h0:Lrx/subjects/b;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 185
    .line 186
    iget-object p2, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 187
    .line 188
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    :cond_8
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/d;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v3, 0x1

    .line 14
    const/4 v4, 0x1

    .line 15
    move-object v8, p0

    .line 16
    move-object v1, p2

    .line 17
    move-object v2, p3

    .line 18
    move/from16 v5, p4

    .line 19
    .line 20
    move-object/from16 v6, p5

    .line 21
    .line 22
    move-object/from16 v7, p6

    .line 23
    .line 24
    move-object/from16 v9, p7

    .line 25
    .line 26
    move-object/from16 v10, p8

    .line 27
    .line 28
    move-object/from16 v11, p9

    .line 29
    .line 30
    invoke-static/range {v1 .. v11}, Ll/rgr;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLl/y20;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 3

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v1, "matched"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->D8(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v2, "superLikedEach"

    .line 36
    .line 37
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    if-ne v0, v2, :cond_0

    .line 42
    .line 43
    const/16 v1, 0xd

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v2, "superLiked"

    .line 61
    .line 62
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    if-ne v0, v2, :cond_1

    .line 67
    .line 68
    const/16 v1, 0xb

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v2, "secretcrush"

    .line 86
    .line 87
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    if-ne v0, v2, :cond_2

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    :cond_2
    :goto_0
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 95
    .line 96
    filled-new-array {v0}, [Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v2, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_4

    .line 121
    .line 122
    invoke-interface {p2, p0, p3}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v3, 0x3f4ccccd    # 0.8f

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/high16 v4, 0x42200000    # 40.0f

    .line 26
    .line 27
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    sub-int/2addr v3, v4

    .line 32
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/16 v1, 0x312

    .line 57
    .line 58
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZZLjava/lang/String;Ll/rcj;Lcom/p1/mobile/putong/core/newui/home/d;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZZ",
            "Ljava/lang/String;",
            "Ll/rcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string p4, "failDataError"

    .line 2
    .line 3
    const/4 p5, 0x0

    .line 4
    if-eqz p0, :cond_c

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_3

    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {p8, p4}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return p5

    .line 22
    :cond_1
    iget-object p4, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 45
    .line 46
    .line 47
    const-string p0, "failJailedUser"

    .line 48
    .line 49
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return p5

    .line 53
    :cond_2
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 54
    .line 55
    const-string v3, "hidden"

    .line 56
    .line 57
    invoke-static {v3}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    sget-object v2, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Ljava/lang/Integer;

    .line 74
    .line 75
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {v3}, Ll/dkb;->I7()Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_3

    .line 88
    .line 89
    invoke-static {p0}, Ll/rgr;->s(Lcom/p1/mobile/android/app/Act;)V

    .line 90
    .line 91
    .line 92
    const-string p0, "failFakeUser"

    .line 93
    .line 94
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return p5

    .line 98
    :cond_3
    if-eqz p3, :cond_6

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {v0}, Ll/a5i0;->w0(I)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_6

    .line 109
    .line 110
    sget-object p2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 111
    .line 112
    invoke-static {v1, p2}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-nez p2, :cond_4

    .line 117
    .line 118
    invoke-static {}, Ll/d79;->b0()Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_5

    .line 123
    .line 124
    :cond_4
    move-object v0, p0

    .line 125
    move-object p0, p6

    .line 126
    goto :goto_0

    .line 127
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 128
    .line 129
    const/4 v4, 0x0

    .line 130
    const/4 v5, 0x0

    .line 131
    const/4 v3, 0x0

    .line 132
    move-object v0, p0

    .line 133
    move-object v6, p1

    .line 134
    move-object v1, p6

    .line 135
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 136
    .line 137
    .line 138
    const-string p0, "failLessVipSuperLike"

    .line 139
    .line 140
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :goto_0
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    const-string p0, "failExhaustSuperlike"

    .line 148
    .line 149
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :goto_1
    return p5

    .line 153
    :cond_6
    move-object v0, p0

    .line 154
    move-object v6, p1

    .line 155
    move-object p0, p6

    .line 156
    iget p1, p4, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 157
    .line 158
    if-nez p1, :cond_8

    .line 159
    .line 160
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 161
    .line 162
    .line 163
    move-result-wide v2

    .line 164
    const-wide/16 v4, 0x0

    .line 165
    .line 166
    cmp-long p1, v2, v4

    .line 167
    .line 168
    if-lez p1, :cond_8

    .line 169
    .line 170
    if-eqz p2, :cond_8

    .line 171
    .line 172
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 173
    .line 174
    invoke-static {v1, p1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-nez p1, :cond_7

    .line 179
    .line 180
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 181
    .line 182
    const/4 v4, 0x0

    .line 183
    const/4 v5, 0x0

    .line 184
    const/4 v3, 0x0

    .line 185
    move-object v1, p0

    .line 186
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_7
    new-instance p0, Ll/rgr$a;

    .line 191
    .line 192
    invoke-direct {p0, p4, v0}, Ll/rgr$a;-><init>(Lcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Ll/rgr$a;->run()V

    .line 196
    .line 197
    .line 198
    :goto_2
    const-string p0, "failExhaustSwipe"

    .line 199
    .line 200
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return p5

    .line 204
    :cond_8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 205
    .line 206
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    check-cast p0, Ljava/lang/Boolean;

    .line 215
    .line 216
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_9

    .line 221
    .line 222
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 225
    .line 226
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v0:Ll/jxd0;

    .line 227
    .line 228
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    check-cast p0, Ljava/lang/Boolean;

    .line 233
    .line 234
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    if-nez p0, :cond_a

    .line 239
    .line 240
    :cond_9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p0

    .line 244
    if-eqz p0, :cond_a

    .line 245
    .line 246
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 249
    .line 250
    .line 251
    move-result-wide p0

    .line 252
    long-to-double p0, p0

    .line 253
    iget-wide v0, v1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 254
    .line 255
    sub-double/2addr p0, v0

    .line 256
    const-wide v0, 0x41aee62800000000L    # 2.592E8

    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    cmpl-double p0, p0, v0

    .line 262
    .line 263
    if-ltz p0, :cond_a

    .line 264
    .line 265
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 266
    .line 267
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 268
    .line 269
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v0:Ll/jxd0;

    .line 270
    .line 271
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 277
    .line 278
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 279
    .line 280
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 281
    .line 282
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    :cond_a
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    if-eqz p0, :cond_b

    .line 290
    .line 291
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    invoke-interface {p7, p0, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    check-cast p0, Ljava/lang/Boolean;

    .line 304
    .line 305
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    if-eqz p0, :cond_b

    .line 310
    .line 311
    const-string p0, "failFirstSwipe"

    .line 312
    .line 313
    invoke-static {p8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    return p5

    .line 317
    :cond_b
    const/4 p0, 0x1

    .line 318
    return p0

    .line 319
    :cond_c
    :goto_3
    invoke-static {p8, p4}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    return p5
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLl/y20;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2
    invoke-static/range {p10 .. p10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    move-object/from16 v3, p10

    .line 3
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    invoke-static/range {p9 .. p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p2, :cond_0

    if-eqz p3, :cond_1

    .line 5
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Y2:I

    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 6
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 7
    invoke-virtual {v9, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    move-result-object v7

    .line 9
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 10
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    const-string v5, "click"

    .line 12
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/home/d;->g()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    .line 13
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    .line 15
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    if-eqz v10, :cond_2

    .line 17
    const-string v0, "voiceLive"

    invoke-virtual {v10, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/DclExtensions;->new_()Lcom/p1/mobile/putong/data/DclExtensions;

    move-result-object v0

    iput-object v0, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 19
    invoke-static {v10}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    move-result-object v0

    .line 20
    iget-object v5, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    const-string v6, "voiceLiveId"

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/p1/mobile/putong/data/DclExtensions;->voiceLiveId:Ljava/lang/String;

    .line 21
    iget-object v5, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    const-string v6, "voiceRoomId"

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/p1/mobile/putong/data/DclExtensions;->voiceRoomId:Ljava/lang/String;

    .line 22
    iget-object v5, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    const-string v6, "businessType"

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/p1/mobile/putong/data/DclExtensions;->businessType:Ljava/lang/String;

    .line 23
    iget-object v5, v7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    const-string v6, "liveLikeSource"

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/DclExtensions;->liveLikeSource:Ljava/lang/String;

    .line 24
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 25
    invoke-static {v10}, Ll/rgr;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    move-result-object v6

    move-object v8, v7

    const/4 v7, 0x1

    move-object v4, p1

    move v1, p2

    move v2, p3

    move-object/from16 v5, p9

    .line 26
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;)Lrx/c;

    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v11

    new-instance v0, Ll/mgr;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move-object v7, v8

    move-object v6, v10

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v9}, Ll/mgr;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;)V

    new-instance v1, Ll/ngr;

    move-object/from16 v2, p6

    invoke-direct {v1, v2, v9}, Ll/ngr;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 28
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v0

    .line 29
    invoke-virtual {v11, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public static m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;
    .locals 1

    .line 1
    const-string v0, "from_find_partner"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "partner"

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "unknown_"

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Ljava/lang/String;",
            "Ll/rcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeExtraData;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v13, 0x0

    move-object v0, p0

    move-object v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    .line 1
    invoke-static/range {v0 .. v13}, Ll/rgr;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Z

    move-result p0

    return p0
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Z
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Ljava/lang/String;",
            "Ll/rcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeExtraData;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    move/from16 v3, p3

    move-object/from16 v0, p9

    move-object/from16 v1, p10

    .line 1
    invoke-static {v0, p1, p2, v3, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->b(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/LikeExtraData;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v1

    const/4 v11, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p2

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object v8, v1

    move-object v1, p1

    .line 2
    invoke-static/range {v0 .. v8}, Ll/rgr;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZZLjava/lang/String;Ll/rcj;Lcom/p1/mobile/putong/core/newui/home/d;)Z

    move-result v4

    move-object v1, v8

    if-nez v4, :cond_1

    return v11

    .line 3
    :cond_1
    const-string v12, "tantanCoin"

    if-eqz p3, :cond_2

    .line 4
    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ll/egr;

    move-object v3, p0

    move-object v4, p1

    move/from16 v5, p4

    move-object/from16 v8, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v9, p11

    move-object/from16 v10, p12

    move-object/from16 v2, p13

    invoke-direct/range {v0 .. v10}, Ll/egr;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-static {p0, v0}, Ll/a5i0;->E1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    invoke-static {v1, v12}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    :cond_2
    if-eqz p3, :cond_3

    .line 7
    invoke-static {}, Ll/d79;->j0()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    move-object v0, p0

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v8, p5

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move-object/from16 v9, p11

    move-object/from16 v10, p12

    move-object v7, v1

    move-object v1, p1

    goto :goto_1

    :cond_4
    :goto_0
    new-instance v0, Ll/fgr;

    move-object v3, p0

    move-object v4, p1

    move/from16 v5, p4

    move-object/from16 v8, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v9, p11

    move-object/from16 v10, p12

    move-object/from16 v2, p13

    invoke-direct/range {v0 .. v10}, Ll/fgr;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    invoke-static {p0, v0}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 9
    invoke-static {v1, v12}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    .line 10
    :goto_1
    invoke-static/range {v0 .. v10}, Ll/rgr;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLl/y20;Ll/y20;Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    .line 11
    :cond_5
    :goto_2
    const-string p0, "failDataError"

    invoke-static {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;)V
    .locals 2

    .line 1
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string p4, "matched"

    .line 4
    .line 5
    invoke-static {p2, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_8

    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object p4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    if-eqz p4, :cond_0

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 28
    .line 29
    const-string p4, "dismissed"

    .line 30
    .line 31
    invoke-static {p2, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    goto/16 :goto_2

    .line 38
    .line 39
    :cond_0
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 40
    .line 41
    const-string p4, "xmasActivity"

    .line 42
    .line 43
    invoke-static {p4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 44
    .line 45
    .line 46
    move-result-object p4

    .line 47
    invoke-interface {p2, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_8

    .line 52
    .line 53
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    const/4 p4, 0x0

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    check-cast p2, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 69
    .line 70
    const-string v0, "superLikedEach"

    .line 71
    .line 72
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_1

    .line 77
    .line 78
    const/16 p4, 0xd

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    const/16 v0, 0xc

    .line 88
    .line 89
    if-eqz p2, :cond_3

    .line 90
    .line 91
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    check-cast p2, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 98
    .line 99
    const-string v1, "superLiked"

    .line 100
    .line 101
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-eqz p2, :cond_3

    .line 106
    .line 107
    if-eqz p3, :cond_2

    .line 108
    .line 109
    :goto_0
    move p4, v0

    .line 110
    goto :goto_1

    .line 111
    :cond_2
    const/16 p4, 0xb

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_3
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-eqz p2, :cond_4

    .line 121
    .line 122
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    check-cast p2, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 129
    .line 130
    const-string v1, "secretcrush"

    .line 131
    .line 132
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    if-eqz p2, :cond_4

    .line 137
    .line 138
    const/4 p4, 0x1

    .line 139
    goto :goto_1

    .line 140
    :cond_4
    if-eqz p3, :cond_5

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_5
    :goto_1
    invoke-static {}, Ll/s7a;->h()Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_6

    .line 148
    .line 149
    sget-object p2, Ll/k8e0;->a:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p2, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    if-eqz p2, :cond_6

    .line 156
    .line 157
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    filled-new-array {p1}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 168
    .line 169
    check-cast p2, Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-static {p0, p1, p4, p2, p6}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 176
    .line 177
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    if-nez p2, :cond_7

    .line 197
    .line 198
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-eqz p2, :cond_7

    .line 203
    .line 204
    iget-object p2, p7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 205
    .line 206
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    if-eqz p2, :cond_7

    .line 211
    .line 212
    iget-object p2, p7, Lcom/p1/mobile/putong/data/LikeExtraData;->liveExtraInfo:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 213
    .line 214
    iget-object p2, p2, Lcom/p1/mobile/putong/data/DclExtensions;->liveLikeSource:Ljava/lang/String;

    .line 215
    .line 216
    const-string p3, "profileCard"

    .line 217
    .line 218
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    :cond_7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 222
    .line 223
    filled-new-array {p1}, [Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 232
    .line 233
    check-cast p2, Ljava/util/ArrayList;

    .line 234
    .line 235
    invoke-static {p0, p1, p4, p2, p6}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 240
    .line 241
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 245
    .line 246
    .line 247
    :cond_8
    :goto_2
    return-void
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, v5, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 51
    .line 52
    const-string v1, "likers"

    .line 53
    .line 54
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    move-object v4, p1

    .line 59
    move v1, p2

    .line 60
    move v2, p3

    .line 61
    move-object v3, p5

    .line 62
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance p2, Ll/kgr;

    .line 71
    .line 72
    invoke-direct {p2, v2, p0, p6, v4}, Ll/kgr;-><init>(ZLcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/User;)V

    .line 73
    .line 74
    .line 75
    new-instance p0, Ll/lgr;

    .line 76
    .line 77
    invoke-direct {p0, p4}, Ll/lgr;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/z20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;)V"
        }
    .end annotation

    .line 1
    move v4, p3

    .line 2
    move-object v0, p4

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p4, v1, p2, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    new-instance v6, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v7, "X-Testing-Variance"

    .line 14
    .line 15
    const-string v8, "relationshipUI:seeWhoLikedMe"

    .line 16
    .line 17
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string v7, "sourcepage"

    .line 21
    .line 22
    const-string v8, "seewholikeme"

    .line 23
    .line 24
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string v7, "actiontype"

    .line 28
    .line 29
    const-string v8, ""

    .line 30
    .line 31
    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    const/4 v7, 0x1

    .line 38
    if-eqz v4, :cond_7

    .line 39
    .line 40
    invoke-static {}, Ll/dk90;->i()Z

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    if-nez v8, :cond_2

    .line 45
    .line 46
    invoke-static {}, Ll/a5i0;->L1()Z

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    if-eqz v8, :cond_2

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const-string v1, "p_suggest_users_home_view,e_superlike,click"

    .line 67
    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    invoke-static {}, Ll/d79;->b0()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    const/4 v5, 0x0

    .line 81
    const/4 v3, 0x0

    .line 82
    move-object v0, p0

    .line 83
    move-object v6, p1

    .line 84
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    :goto_0
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    invoke-virtual {v8}, Ll/a5i0;->j1()Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-eqz v8, :cond_5

    .line 101
    .line 102
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    iget-object v9, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v8, v9}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    invoke-virtual {v9}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v9

    .line 120
    invoke-interface {v9}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mf()Z

    .line 121
    .line 122
    .line 123
    move-result v9

    .line 124
    if-eqz v9, :cond_3

    .line 125
    .line 126
    invoke-static {}, Ll/a5i0;->v0()I

    .line 127
    .line 128
    .line 129
    move-result v9

    .line 130
    if-le v8, v9, :cond_3

    .line 131
    .line 132
    invoke-static {}, Ll/a5i0;->x0()I

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-gt v8, v9, :cond_3

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_3
    invoke-static {}, Ll/a5i0;->L1()Z

    .line 140
    .line 141
    .line 142
    move-result v9

    .line 143
    if-eqz v9, :cond_5

    .line 144
    .line 145
    invoke-static {}, Ll/a5i0;->J1()Z

    .line 146
    .line 147
    .line 148
    move-result v9

    .line 149
    if-eqz v9, :cond_5

    .line 150
    .line 151
    :goto_1
    const/4 v9, 0x0

    .line 152
    if-le v8, v7, :cond_4

    .line 153
    .line 154
    new-instance v0, Ll/ggr;

    .line 155
    .line 156
    move-object v1, p0

    .line 157
    move-object v2, p1

    .line 158
    move v3, p2

    .line 159
    move-object/from16 v7, p5

    .line 160
    .line 161
    invoke-direct/range {v0 .. v7}, Ll/ggr;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V

    .line 162
    .line 163
    .line 164
    move-object v1, v0

    .line 165
    invoke-static {p0, v8, v1, v9}, Ll/o5h0;->w(Lcom/p1/mobile/android/app/Act;ILl/x20;Ll/x20;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_4
    sget-object v8, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 170
    .line 171
    new-instance v0, Ll/hgr;

    .line 172
    .line 173
    move-object v1, p0

    .line 174
    move-object v2, p1

    .line 175
    move v3, p2

    .line 176
    move v4, p3

    .line 177
    move-object/from16 v7, p5

    .line 178
    .line 179
    invoke-direct/range {v0 .. v7}, Ll/hgr;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p0, v8, v0, v9}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_5
    invoke-static {}, Ll/joa;->M3()Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-nez v3, :cond_6

    .line 191
    .line 192
    invoke-static {}, Ll/dk90;->i()Z

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    if-eqz v3, :cond_7

    .line 197
    .line 198
    :cond_6
    invoke-static {}, Ll/a5i0;->L1()Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    if-eqz v3, :cond_7

    .line 203
    .line 204
    invoke-static {}, Ll/a5i0;->J1()Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-nez v3, :cond_7

    .line 209
    .line 210
    invoke-static {p0, p4}, Ll/a5i0;->w1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    :cond_7
    if-eqz p2, :cond_8

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 217
    .line 218
    .line 219
    move-result-object v8

    .line 220
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 221
    .line 222
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SEE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 226
    .line 227
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isBoostResultRev(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iput-object v0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 262
    .line 263
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 264
    .line 265
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 266
    .line 267
    const-string v1, "mymeet"

    .line 268
    .line 269
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    const/4 v9, 0x0

    .line 274
    const/4 v10, 0x0

    .line 275
    const/4 v1, 0x1

    .line 276
    const/4 v3, 0x0

    .line 277
    const-string v5, ""

    .line 278
    .line 279
    const/4 v7, 0x1

    .line 280
    move v2, v4

    .line 281
    move-object v4, p1

    .line 282
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    new-instance v1, Ll/igr;

    .line 291
    .line 292
    move-object/from16 v7, p5

    .line 293
    .line 294
    invoke-direct {v1, p1, p0, v7}, Ll/igr;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;)V

    .line 295
    .line 296
    .line 297
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_8
    move-object v0, p0

    .line 306
    move-object v1, p1

    .line 307
    move v2, p2

    .line 308
    move v3, v4

    .line 309
    move-object v4, v5

    .line 310
    move-object v5, v6

    .line 311
    move-object/from16 v6, p5

    .line 312
    .line 313
    invoke-static/range {v0 .. v6}, Ll/rgr;->q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/util/Map;Ll/z20;)V

    .line 314
    .line 315
    .line 316
    return-void
.end method

.method public static s(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/kec0;->Ee:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;->a(ZLcom/p1/mobile/putong/data/Media;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/jl80$a;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v4}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/jgr;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/jgr;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 67
    .line 68
    .line 69
    return-void
.end method
