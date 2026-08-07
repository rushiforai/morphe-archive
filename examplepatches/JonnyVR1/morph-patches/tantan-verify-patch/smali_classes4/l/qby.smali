.class public Ll/qby;
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
    iput-object p1, p0, Ll/qby;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V
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
    return-void

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
    return-void

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
    return-void

    .line 72
    :cond_5
    if-eqz p4, :cond_6

    .line 73
    .line 74
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    const-string p1, "liked"

    .line 77
    .line 78
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Ll/cey;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    .line 83
    .line 84
    .line 85
    :cond_6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qby;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qby;->from()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b(ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/qby;->a()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
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
    const/4 v7, 0x1

    .line 88
    move-object v0, p0

    .line 89
    move-object/from16 v5, p7

    .line 90
    .line 91
    move v2, v12

    .line 92
    move-object v4, v13

    .line 93
    move v1, v14

    .line 94
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    move-object/from16 v11, p1

    .line 99
    .line 100
    invoke-virtual {v11, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance v9, Ll/pby;

    .line 105
    .line 106
    move-object/from16 v10, p7

    .line 107
    .line 108
    invoke-direct/range {v9 .. v14}, Ll/pby;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;Z)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/fjf0;

    .line 112
    .line 113
    invoke-direct {v0}, Ll/fjf0;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v9, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public from()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_meet_view,e_whoiliked_card,sayhi_superlike"

    .line 2
    .line 3
    return-object p0
.end method
