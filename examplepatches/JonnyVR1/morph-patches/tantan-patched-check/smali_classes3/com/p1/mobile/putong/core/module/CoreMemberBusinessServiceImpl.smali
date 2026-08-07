.class public Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreMemberBusinessService"
    path = "/member_business_service/service"
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

.method public static synthetic F(Ll/cwl;)V
    .locals 7

    .line 1
    invoke-interface {p0}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/16 v1, 0x312

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/cwl;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    const-string v0, "matched"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_5

    .line 15
    .line 16
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 v0, 0x0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 32
    .line 33
    const-string v1, "superLikedEach"

    .line 34
    .line 35
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/16 v0, 0xd

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 59
    .line 60
    const-string v1, "superLiked"

    .line 61
    .line 62
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    const/16 v0, 0xc

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/16 v0, 0xb

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    iget-object p0, p6, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 91
    .line 92
    const-string p1, "secretcrush"

    .line 93
    .line 94
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_3

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    :cond_3
    :goto_0
    if-eqz p2, :cond_4

    .line 102
    .line 103
    invoke-interface {p3}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p3, p0}, Ll/dwl;->L(Lcom/p1/mobile/putong/data/User;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    invoke-interface {p4}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-interface {p4}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object p2, p6, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 120
    .line 121
    filled-new-array {p2}, [Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    new-instance p4, Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-static {p1, p2, v0, p4}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 139
    .line 140
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_5
    if-eqz p5, :cond_6

    .line 148
    .line 149
    sget p0, Lcom/p1/mobile/putong/core/R$string;->v4:I

    .line 150
    .line 151
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 152
    .line 153
    .line 154
    :cond_6
    :goto_1
    invoke-interface {p3}, Ll/dwl;->getFrom()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p1, "from_meet"

    .line 159
    .line 160
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-eqz p0, :cond_8

    .line 165
    .line 166
    if-nez p5, :cond_7

    .line 167
    .line 168
    invoke-interface {p3}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {p0}, Ll/cey;->k(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_7
    invoke-interface {p3}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 183
    .line 184
    iget-object p1, p6, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 185
    .line 186
    invoke-static {p0, p1}, Ll/cey;->l(Ljava/lang/String;Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    .line 187
    .line 188
    .line 189
    :cond_8
    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/newui/home/d;Ll/an70;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/an70;->l()Ll/eo70;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p12}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->o0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->l0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/ewl;Ll/cwl;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->n0(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/ewl;Ll/cwl;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    const-string p3, "success"

    .line 2
    .line 3
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->m0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;->b:Lv/VRelative;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move-object v0, p0

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v1, 0x312

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Boolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    const-string v0, "matched"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_5

    .line 15
    .line 16
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p4, 0x0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "superLikedEach"

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-ne p0, v0, :cond_0

    .line 38
    .line 39
    const/16 p4, 0xd

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "superLiked"

    .line 57
    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-ne p0, v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    const/16 p0, 0xc

    .line 71
    .line 72
    :goto_0
    move p4, p0

    .line 73
    goto :goto_1

    .line 74
    :cond_1
    const/16 p0, 0xb

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p1, "secretcrush"

    .line 92
    .line 93
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-ne p0, p1, :cond_3

    .line 98
    .line 99
    const/4 p4, 0x1

    .line 100
    :cond_3
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_4

    .line 113
    .line 114
    invoke-static {p2, p3}, Ll/pci;->J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 119
    .line 120
    filled-new-array {p0}, [Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    new-instance p1, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {p2, p0, p4, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    new-instance p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 138
    .line 139
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_5
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-eqz p0, :cond_6

    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-eqz p0, :cond_6

    .line 157
    .line 158
    invoke-static {p2}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 159
    .line 160
    .line 161
    :cond_6
    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    const-string v0, "matched"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_4

    .line 15
    .line 16
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p3, 0x0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 32
    .line 33
    const-string p4, "superLikedEach"

    .line 34
    .line 35
    invoke-static {p0, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/16 p3, 0xd

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 59
    .line 60
    const-string p4, "superLiked"

    .line 61
    .line 62
    invoke-static {p0, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    const/16 p3, 0xc

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/16 p3, 0xb

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 91
    .line 92
    const-string p1, "secretcrush"

    .line 93
    .line 94
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_3

    .line 99
    .line 100
    const/4 p3, 0x1

    .line 101
    :cond_3
    :goto_0
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 102
    .line 103
    filled-new-array {p0}, [Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance p1, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {p2, p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 121
    .line 122
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_4
    if-eqz p3, :cond_6

    .line 130
    .line 131
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_5

    .line 136
    .line 137
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Y2:I

    .line 138
    .line 139
    invoke-virtual {p2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_5
    invoke-static {p2}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 148
    .line 149
    .line 150
    :cond_6
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->h0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ela;->A3()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->k0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method


# virtual methods
.method public An(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/r8n;->c(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Ll/r8n;->n(Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public Bi(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tl9;->b()Ll/skk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iput-object p1, p0, Ll/skk0;->c:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    return-void
.end method

.method public Ej(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Ll/x20;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZI",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p8, p3, p1, p2, p6}, Ll/imh0;->h(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p8, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->MEET:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 6
    .line 7
    invoke-virtual {p0, p8}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    const-string p4, "seewholikeme"

    .line 17
    .line 18
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->D(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p4, "relationshipUI:seeWhoLikedMe"

    .line 22
    .line 23
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->F(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move p4, p3

    .line 27
    move-object p3, p0

    .line 28
    move p0, p1

    .line 29
    move p1, p2

    .line 30
    move p2, p4

    .line 31
    move-object p4, p6

    .line 32
    move-object p5, p7

    .line 33
    move-object p6, p9

    .line 34
    move-object p7, p10

    .line 35
    invoke-static/range {p0 .. p7}, Ll/imh0;->k(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public Jb(Lcom/p1/mobile/android/app/Act;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    if-ne p2, p0, :cond_0

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p3, p0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Ml(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Ljava/lang/String;",
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

    .line 1
    new-instance v0, Ll/fs9;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move/from16 v4, p3

    .line 8
    .line 9
    move/from16 v5, p4

    .line 10
    .line 11
    move/from16 v6, p5

    .line 12
    .line 13
    move-object/from16 v7, p6

    .line 14
    .line 15
    move-object/from16 v8, p7

    .line 16
    .line 17
    move-object/from16 v9, p8

    .line 18
    .line 19
    move-object/from16 v10, p9

    .line 20
    .line 21
    move-object/from16 v11, p10

    .line 22
    .line 23
    move-object/from16 v12, p11

    .line 24
    .line 25
    move-object/from16 v13, p12

    .line 26
    .line 27
    invoke-direct/range {v0 .. v13}, Ll/fs9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v3, v0}, Ll/imh0;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/rcj;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    move-object v1, p1

    .line 35
    move/from16 v4, p4

    .line 36
    .line 37
    move/from16 v5, p5

    .line 38
    .line 39
    move-object/from16 v6, p6

    .line 40
    .line 41
    move-object v2, v3

    .line 42
    move/from16 v3, p3

    .line 43
    .line 44
    invoke-static/range {v1 .. v13}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method public O6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6d0;->j0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Pb(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Ll/x20;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZI",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p8, p3, p1, p2, p6}, Ll/imh0;->h(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p8, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->NEARBY:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 6
    .line 7
    invoke-virtual {p0, p8}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    const-string p4, "nearby"

    .line 17
    .line 18
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->D(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move p4, p3

    .line 22
    move-object p3, p0

    .line 23
    move p0, p1

    .line 24
    move p1, p2

    .line 25
    move p2, p4

    .line 26
    move-object p4, p6

    .line 27
    move-object p5, p7

    .line 28
    move-object p6, p9

    .line 29
    move-object p7, p10

    .line 30
    invoke-static/range {p0 .. p7}, Ll/imh0;->k(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public Qd(Lcom/p1/mobile/android/app/Act;ZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ljava/lang/String;Ll/y20;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "ZZI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)Z"
        }
    .end annotation

    move/from16 v9, p2

    move/from16 v10, p3

    move-object/from16 v6, p7

    move-object/from16 v0, p9

    .line 1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    move-object v11, v2

    goto :goto_1

    .line 2
    :cond_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    goto :goto_0

    .line 3
    :goto_1
    const-string v2, "p_intl_like_i_sent,e_intl_i_like_photo,swipe_like"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    xor-int/lit8 v4, v2, 0x1

    if-nez v2, :cond_1

    .line 4
    const-string v2, "p_suggest_user_profile_info_view"

    goto :goto_2

    .line 5
    :cond_1
    const-string v2, "p_who_i_liked"

    .line 6
    :goto_2
    invoke-static {v2, v4, v9, v10, v6}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v2

    move/from16 v3, p4

    .line 7
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v2

    move-object/from16 v3, p5

    .line 8
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v5

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    .line 10
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->WHO_I_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    invoke-virtual {v5, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 11
    invoke-static {}, Ll/joa;->f4()Z

    move-result v3

    const/4 v12, 0x0

    if-eqz v3, :cond_3

    if-eqz v10, :cond_3

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    invoke-virtual {v1}, Ll/z99;->k3()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->unlimit_free_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 p2, p1

    move-object/from16 p3, v0

    move-object/from16 p6, v1

    move-object/from16 p7, v2

    move-object/from16 p4, v3

    move-object/from16 p5, v4

    invoke-static/range {p2 .. p7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    goto :goto_3

    :cond_2
    move-object v13, v0

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {p1, v13, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    :goto_3
    return v12

    :cond_3
    move-object v13, v0

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 17
    const-string v0, "failJailedUser"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    .line 18
    :cond_4
    new-instance v0, Ll/ps9;

    invoke-direct {v0, p1}, Ll/ps9;-><init>(Lcom/p1/mobile/android/app/Act;)V

    invoke-static {p1, v0}, Ll/qtk;->F0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)Z

    move-result v0

    const-string v7, "failFakeUser"

    if-eqz v0, :cond_5

    .line 19
    invoke-static {v5, v7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    .line 20
    :cond_5
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 21
    invoke-static {v5, v7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 22
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    return v12

    :cond_6
    if-nez v9, :cond_7

    if-eqz v10, :cond_8

    :cond_7
    if-nez v1, :cond_8

    .line 23
    const-string v0, "failDataError"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    :cond_8
    if-eqz v10, :cond_9

    .line 24
    invoke-static {}, Ll/d79;->U()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 25
    new-instance v0, Ll/non$a;

    iget-object v1, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Ll/non$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    invoke-static {p1, v0, v2}, Ll/non;->g(Lcom/p1/mobile/android/app/Act;Ll/non$a;Ljava/lang/String;)V

    return v12

    :cond_9
    if-eqz v10, :cond_a

    .line 27
    new-instance v0, Ll/qs9;

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v7, p8

    move-object/from16 v8, p10

    move-object v2, v5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v8}, Ll/qs9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V

    move-object v5, v2

    .line 28
    invoke-static {p1, v0}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_a

    return v12

    :cond_a
    if-eqz v10, :cond_b

    .line 29
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    move-result v0

    invoke-static {v0}, Ll/a5i0;->w0(I)I

    move-result v0

    if-nez v0, :cond_b

    .line 30
    invoke-static {p1, v13}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 31
    const-string v0, "failExhaustSuperlike"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    :cond_b
    move-object v0, p0

    move-object v1, p1

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move v2, v9

    move v3, v10

    move-object/from16 v9, p10

    .line 32
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->c0(Lcom/p1/mobile/android/app/Act;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V

    const/4 v0, 0x1

    return v0
.end method

.method public Qe(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0}, Ll/b83;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Ll/pcj;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Ra(Lv/VRelative;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;)V
    .locals 2
    .param p1    # Lv/VRelative;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/pn90;

    .line 2
    .line 3
    new-instance p1, Ll/es9;

    .line 4
    .line 5
    invoke-direct {p1, p4}, Ll/es9;-><init>(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p4, p1}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/gra;->L3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/16 p4, 0x18

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    const-string v1, "from_picks"

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {p2, p3, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p2, p0, p4}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {p2, p3, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2, p1, p4, p0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public Ss(Ll/nnr;)V
    .locals 0

    .line 1
    iget-object p0, p1, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget p1, Ll/dbc0;->Sr:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/is9;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/is9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Yq(ILandroid/content/Intent;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-static {p3, p0}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public a9(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public be(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)Z
    .locals 13

    move/from16 v3, p3

    move/from16 v5, p4

    move/from16 v6, p5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    move-object v9, v1

    goto :goto_1

    .line 2
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    goto :goto_0

    :goto_1
    if-eqz v6, :cond_1

    .line 3
    const-string v1, "p_suggest_user_profile_info_view"

    :goto_2
    move-object/from16 v7, p9

    goto :goto_3

    .line 4
    :cond_1
    const-string v1, "p_who_i_liked"

    goto :goto_2

    .line 5
    :goto_3
    invoke-static {v1, v6, v3, v5, v7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v1

    move/from16 v2, p6

    .line 6
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v1

    move-object/from16 v2, p7

    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v2

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->WHO_I_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    move-result v4

    const/4 v11, 0x0

    if-eqz v4, :cond_2

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 12
    invoke-interface {p2}, Ll/gwl;->notifyDataSetChanged()V

    .line 13
    const-string p0, "failJailedUser"

    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    .line 14
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 15
    const-string p0, "failFakeUser"

    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 16
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    return v11

    .line 17
    :cond_3
    invoke-static {}, Ll/joa;->f4()Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz v5, :cond_4

    .line 18
    invoke-interface {p2, v6}, Ll/gwl;->G2(Z)Ljava/lang/String;

    move-result-object p0

    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return v11

    :cond_4
    if-nez v3, :cond_5

    if-eqz v5, :cond_6

    :cond_5
    if-nez v0, :cond_6

    .line 20
    const-string p0, "failDataError"

    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    :cond_6
    if-eqz v5, :cond_7

    .line 21
    invoke-static/range {p8 .. p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 22
    invoke-static {}, Ll/joa;->E3()Z

    move-result v0

    if-nez v0, :cond_7

    .line 23
    invoke-static {}, Ll/a5i0;->G()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 24
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    move-result-object v0

    invoke-virtual {v0}, Ll/a5i0;->e1()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 25
    sget-object v12, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LETTER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    new-instance v0, Ll/ks9;

    move-object v1, p0

    move-object/from16 v8, p8

    move-object/from16 v10, p10

    move v4, v3

    move-object v9, v7

    move-object v3, p2

    move-object v7, v2

    move-object v2, p1

    invoke-direct/range {v0 .. v10}, Ll/ks9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 26
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ll/ls9;

    invoke-direct {p0, p2}, Ll/ls9;-><init>(Ll/gwl;)V

    .line 27
    invoke-static {p1, v12, v0, p0}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    return v11

    :cond_7
    move-object v6, v2

    if-eqz p4, :cond_8

    .line 28
    invoke-static/range {p8 .. p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    new-instance v0, Ll/ms9;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move/from16 v5, p5

    move-object/from16 v7, p9

    move-object/from16 v8, p10

    move-object v2, v6

    move-object/from16 v6, p8

    invoke-direct/range {v0 .. v8}, Ll/ms9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    move-object v6, v2

    .line 29
    invoke-static {p1, v0}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_9

    return v11

    :cond_8
    move/from16 v5, p5

    :cond_9
    if-eqz p4, :cond_a

    .line 30
    invoke-static/range {p8 .. p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 31
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    move-result v0

    invoke-static {v0}, Ll/a5i0;->w0(I)I

    move-result v0

    if-nez v0, :cond_a

    .line 32
    invoke-interface {p2, v5}, Ll/gwl;->G2(Z)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 33
    const-string p0, "failExhaustSuperlike"

    invoke-static {v6, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    :cond_a
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    .line 34
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->d0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    const/4 p0, 0x1

    return p0
.end method

.method public bj()I
    .locals 0

    .line 1
    const/16 p0, 0x18

    return p0
.end method

.method public bo()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "currentImageIndex"

    .line 2
    .line 3
    return-object p0
.end method

.method public final c0(Lcom/p1/mobile/android/app/Act;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "ZZZ",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 p0, p5

    .line 2
    .line 3
    move-object/from16 v9, p8

    .line 4
    .line 5
    move-object/from16 v10, p9

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, v9, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 63
    .line 64
    const-string v1, "myLiked"

    .line 65
    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    const/4 v7, 0x1

    .line 71
    const/4 v3, 0x0

    .line 72
    move v1, p2

    .line 73
    move v2, p3

    .line 74
    move-object/from16 v5, p6

    .line 75
    .line 76
    move-object/from16 v4, p7

    .line 77
    .line 78
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    new-instance v0, Ll/gs9;

    .line 87
    .line 88
    invoke-direct {v0, p0, p3, p1}, Ll/gs9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;)V

    .line 89
    .line 90
    .line 91
    new-instance p1, Ll/hs9;

    .line 92
    .line 93
    invoke-direct {p1, p0}, Ll/hs9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    if-eqz v10, :cond_0

    .line 104
    .line 105
    invoke-interface {v10, v9}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    :cond_0
    return-void
.end method

.method public cb(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/User;)Z
    .locals 12

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    move-object/from16 v10, p5

    .line 18
    .line 19
    invoke-static {v0, v1, v2, v3, v10}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x0

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    return v2

    .line 39
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->INTL_VISITOR:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 40
    .line 41
    iput-object v1, v6, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 62
    .line 63
    .line 64
    const-string p0, "failJailedUser"

    .line 65
    .line 66
    invoke-static {v6, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return v2

    .line 70
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    const-string p0, "failFakeUser"

    .line 77
    .line 78
    invoke-static {v6, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 82
    .line 83
    .line 84
    return v2

    .line 85
    :cond_2
    invoke-static {}, Ll/joa;->M3()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    const/4 v3, 0x0

    .line 90
    const-string v4, "p_intl_visitors_list,e_intl_visitors_list_check_btn,check"

    .line 91
    .line 92
    if-nez v0, :cond_3

    .line 93
    .line 94
    sget-object p0, Ll/rop;->INSTANCE:Ll/rop;

    .line 95
    .line 96
    invoke-virtual {p0, p1, v4, v3}, Ll/rop;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 97
    .line 98
    .line 99
    return v2

    .line 100
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    iget v0, v1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 107
    .line 108
    if-nez v0, :cond_4

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 111
    .line 112
    .line 113
    move-result-wide v0

    .line 114
    const-wide/16 v7, 0x0

    .line 115
    .line 116
    cmp-long v0, v0, v7

    .line 117
    .line 118
    if-lez v0, :cond_4

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 121
    .line 122
    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_4

    .line 127
    .line 128
    sget-object p0, Ll/rop;->INSTANCE:Ll/rop;

    .line 129
    .line 130
    invoke-virtual {p0, p1, v4, v3}, Ll/rop;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 131
    .line 132
    .line 133
    return v2

    .line 134
    :cond_4
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_7

    .line 139
    .line 140
    invoke-static {}, Ll/a5i0;->x0()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-gtz v0, :cond_7

    .line 145
    .line 146
    invoke-static {}, Ll/joa;->M3()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_5

    .line 151
    .line 152
    sget-object p0, Ll/rop;->INSTANCE:Ll/rop;

    .line 153
    .line 154
    invoke-virtual {p0, p1, v4, v3}, Ll/rop;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_5
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_6

    .line 163
    .line 164
    const-string p0, "p_who_i_liked,e_iliked_superlike,click"

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_6
    const-string p0, "p_who_i_liked,e_card,swipe_like"

    .line 168
    .line 169
    :goto_0
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    const-string p0, "failExhaustSuperlike"

    .line 173
    .line 174
    invoke-static {v6, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :goto_1
    return v2

    .line 178
    :cond_7
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_8

    .line 183
    .line 184
    new-instance v4, Ll/js9;

    .line 185
    .line 186
    move-object v5, p0

    .line 187
    move-object v7, p1

    .line 188
    move-object v8, p2

    .line 189
    move-object v9, p3

    .line 190
    move-object v11, v10

    .line 191
    move-object/from16 v10, p4

    .line 192
    .line 193
    invoke-direct/range {v4 .. v11}, Ll/js9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/User;)V

    .line 194
    .line 195
    .line 196
    invoke-static {p1, v4}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_8

    .line 201
    .line 202
    return v2

    .line 203
    :cond_8
    move-object v4, p0

    .line 204
    move-object v5, p1

    .line 205
    move-object v7, p3

    .line 206
    move-object/from16 v8, p4

    .line 207
    .line 208
    move-object/from16 v10, p5

    .line 209
    .line 210
    move-object v9, v6

    .line 211
    move-object v6, p2

    .line 212
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;)V

    .line 213
    .line 214
    .line 215
    const/4 p0, 0x1

    .line 216
    return p0
.end method

.method public ch()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "currentImageUrl"

    .line 2
    .line 3
    return-object p0
.end method

.method public final d0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 9

    .line 1
    move-object/from16 p0, p9

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 4
    .line 5
    .line 6
    move-result-object v8

    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object p5

    .line 32
    invoke-virtual {p5, p4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p5, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p5

    .line 42
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p5, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object p5

    .line 50
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 51
    .line 52
    .line 53
    move-result-object p5

    .line 54
    iput-object p5, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 55
    .line 56
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, p5, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 59
    .line 60
    const-string p5, "myLiked"

    .line 61
    .line 62
    invoke-static {p5}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    const/4 v7, 0x1

    .line 67
    const/4 v3, 0x0

    .line 68
    move v1, p3

    .line 69
    move v2, p4

    .line 70
    move-object/from16 v5, p7

    .line 71
    .line 72
    move-object/from16 v4, p8

    .line 73
    .line 74
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p5

    .line 78
    invoke-interface {p2, p5}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p5

    .line 82
    new-instance v0, Ll/cs9;

    .line 83
    .line 84
    move-object v3, p1

    .line 85
    move v4, p3

    .line 86
    move-object v1, p6

    .line 87
    invoke-direct/range {v0 .. v5}, Ll/cs9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/ds9;

    .line 91
    .line 92
    invoke-direct {p1, p6}, Ll/ds9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p5, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-interface {p2, p4, v5, p0}, Ll/gwl;->w0(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;)V
    .locals 13

    .line 1
    move-object/from16 v1, p5

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 4
    .line 5
    .line 6
    move-result-object v10

    .line 7
    new-instance p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    move-object/from16 v4, p6

    .line 47
    .line 48
    iget-object v0, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iput-object p0, v10, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    const-string p0, "intl_visitor"

    .line 81
    .line 82
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    const/4 v11, 0x0

    .line 87
    const/4 v12, 0x0

    .line 88
    const/4 v5, 0x0

    .line 89
    const/4 v7, 0x0

    .line 90
    const/4 v9, 0x1

    .line 91
    move-object/from16 v6, p6

    .line 92
    .line 93
    invoke-virtual/range {v2 .. v12}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance v0, Ll/as9;

    .line 102
    .line 103
    move-object v3, p1

    .line 104
    move-object v5, p2

    .line 105
    move-object/from16 v2, p3

    .line 106
    .line 107
    move-object/from16 v4, p6

    .line 108
    .line 109
    invoke-direct/range {v0 .. v5}, Ll/as9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Boolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Ll/bs9;

    .line 113
    .line 114
    invoke-direct {p1, v1}, Ll/bs9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final f0(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PicksUser;Lcom/p1/mobile/android/app/Act;Ll/an70;Ll/sm70;)V
    .locals 22

    move-object/from16 v2, p4

    move-object/from16 v10, p7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    invoke-direct {v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 3
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    move/from16 v6, p1

    .line 4
    invoke-virtual {v1, v6}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    move/from16 v3, p3

    .line 5
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    move/from16 v13, p2

    .line 6
    invoke-virtual {v1, v13}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 7
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    .line 8
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 10
    invoke-static {}, Ll/joa;->H3()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Ll/ela;->r3()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    move v9, v1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 11
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v11, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    const-string v1, "picks"

    .line 12
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    move-result-object v17

    const/16 v20, 0x0

    iget-object v1, v10, Lcom/p1/mobile/putong/core/data/PicksUser;->picksTracker:Ljava/lang/String;

    const/4 v14, 0x0

    const/16 v18, 0x1

    move-object/from16 v15, p5

    move-object/from16 v16, p6

    move-object/from16 v19, v0

    move-object/from16 v21, v1

    move v12, v6

    .line 13
    invoke-virtual/range {v11 .. v21}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    move-result-object v0

    move-object/from16 v4, p8

    .line 14
    invoke-virtual {v4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v11

    new-instance v0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;

    move-object/from16 v1, p0

    move/from16 v6, p1

    move/from16 v3, p2

    move-object/from16 v5, p5

    move-object/from16 v8, p6

    move-object/from16 v7, p9

    invoke-direct/range {v0 .. v9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/an70;Ljava/lang/String;Z)V

    new-instance v1, Ll/xr9;

    invoke-direct {v1, v2, v7}, Ll/xr9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;Ll/an70;)V

    .line 15
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v0

    .line 16
    invoke-virtual {v11, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    move-object/from16 v1, p0

    move-object/from16 v0, p10

    .line 17
    invoke-virtual {v1, v10, v7, v0}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->r0(Lcom/p1/mobile/putong/core/data/PicksUser;Ll/an70;Ll/sm70;)V

    return-void
.end method

.method public fe(ZZZZILjava/lang/String;Ll/dwl;Ll/ewl;Ll/cwl;)Z
    .locals 16

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v6, p3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    move-object v4, v3

    goto :goto_0

    .line 2
    :cond_0
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    :goto_0
    if-nez v0, :cond_1

    :goto_1
    move-object v11, v3

    goto :goto_2

    .line 3
    :cond_1
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    goto :goto_1

    :goto_2
    if-eqz v6, :cond_2

    .line 4
    const-string v3, "p_suggest_user_profile_info_view"

    goto :goto_3

    .line 5
    :cond_2
    const-string v3, "p_see_who_likes_me_view"

    .line 6
    :goto_3
    invoke-interface/range {p7 .. p7}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 7
    invoke-static {v3, v6, v1, v2, v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v3

    move/from16 v5, p5

    .line 8
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v3

    move-object/from16 v5, p6

    .line 9
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v5

    .line 10
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    move-result v7

    const/4 v12, 0x0

    if-eqz v7, :cond_3

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 13
    invoke-interface/range {p9 .. p9}, Ll/cwl;->notifyDataSetChanged()V

    .line 14
    const-string v0, "failJailedUser"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    .line 15
    :cond_3
    invoke-interface/range {p9 .. p9}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v7

    new-instance v8, Ll/ns9;

    move-object/from16 v10, p9

    invoke-direct {v8, v10}, Ll/ns9;-><init>(Ll/cwl;)V

    .line 16
    invoke-static {v7, v8}, Ll/qtk;->F0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)Z

    move-result v7

    const-string v8, "failFakeUser"

    const/4 v13, 0x1

    if-eqz v7, :cond_5

    .line 17
    invoke-static {v5, v8}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 18
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 19
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/View;->setClickable(Z)V

    :cond_4
    return v12

    .line 20
    :cond_5
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 21
    invoke-static {v5, v8}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 22
    invoke-interface {v10}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    invoke-static {v0}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    return v12

    :cond_6
    if-nez v1, :cond_7

    if-eqz v2, :cond_8

    :cond_7
    if-nez v0, :cond_8

    .line 23
    const-string v0, "failDataError"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    :cond_8
    if-eqz v1, :cond_a

    .line 24
    iget v0, v4, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    if-nez v0, :cond_a

    .line 25
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    move-result-wide v7

    const-wide/16 v14, 0x0

    cmp-long v0, v7, v14

    if-lez v0, :cond_a

    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    invoke-static {v3, v0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 27
    invoke-interface {v10}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    const/4 v2, 0x0

    .line 28
    invoke-interface/range {p7 .. p7}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    .line 29
    const-string v4, "p_home,likelimit"

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 p0, v0

    move-object/from16 p2, v1

    move/from16 p5, v2

    move-object/from16 p6, v3

    move-object/from16 p1, v4

    move-object/from16 p3, v6

    move-object/from16 p4, v7

    invoke-static/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 30
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 31
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/View;->setClickable(Z)V

    .line 32
    :cond_9
    const-string v0, "failExhaustSwipe"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    :cond_a
    if-eqz v2, :cond_c

    .line 33
    invoke-interface {v10}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    new-instance v3, Ll/os9;

    move-object/from16 v4, p0

    move/from16 v7, p4

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v3 .. v10}, Ll/os9;-><init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/ewl;Ll/cwl;)V

    .line 34
    invoke-static {v0, v3}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 35
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 36
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/View;->setClickable(Z)V

    .line 37
    :cond_b
    const-string v0, "tantanCoin"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v12

    :cond_c
    if-eqz v2, :cond_10

    .line 38
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    move-result v0

    invoke-static {v0}, Ll/a5i0;->w0(I)I

    move-result v0

    if-nez v0, :cond_10

    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 40
    invoke-static {}, Ll/d79;->b0()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_4

    .line 41
    :cond_d
    invoke-interface/range {p9 .. p9}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    const/4 v2, 0x0

    .line 42
    invoke-interface/range {p7 .. p7}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    .line 43
    const-string v4, "p_see_who_likes_me_view,e_superlike,click"

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 p0, v0

    move-object/from16 p2, v1

    move/from16 p5, v2

    move-object/from16 p6, v3

    move-object/from16 p1, v4

    move-object/from16 p3, v6

    move-object/from16 p4, v7

    invoke-static/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 44
    const-string v0, "failLessVipSuperLike"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    goto :goto_5

    .line 45
    :cond_e
    :goto_4
    invoke-interface/range {p9 .. p9}, Ll/cwl;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    const-string v1, "p_see_who_likes_me_view,e_superlike,click"

    .line 46
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 47
    const-string v0, "failExhaustSuperlike"

    invoke-static {v5, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 48
    :goto_5
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 49
    invoke-interface/range {p7 .. p7}, Ll/dwl;->s()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/View;->setClickable(Z)V

    :cond_f
    return v12

    :cond_10
    move-object/from16 v0, p0

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    .line 50
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->g0(ZZZZLcom/p1/mobile/putong/core/newui/home/d;Ll/dwl;Ll/ewl;Ll/cwl;)V

    return v13
.end method

.method public final g0(ZZZZLcom/p1/mobile/putong/core/newui/home/d;Ll/dwl;Ll/ewl;Ll/cwl;)V
    .locals 7

    .line 1
    new-instance v3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p0, "X-Testing-Variance"

    .line 7
    .line 8
    const-string v0, "relationshipUI:seeWhoLikedMe"

    .line 9
    .line 10
    invoke-interface {v3, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string p0, "sourcepage"

    .line 14
    .line 15
    const-string v0, "seewholikeme"

    .line 16
    .line 17
    invoke-interface {v3, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    const-string p0, "click"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "swipe"

    .line 26
    .line 27
    :goto_0
    const-string v0, "actiontype"

    .line 28
    .line 29
    invoke-interface {v3, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p5, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    new-instance p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p6}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iput-object p0, v5, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 89
    .line 90
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 93
    .line 94
    invoke-interface {p6}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    const-string p0, "likers"

    .line 99
    .line 100
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    move v1, p1

    .line 105
    move v2, p2

    .line 106
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p8, p0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-instance v0, Ll/yr9;

    .line 115
    .line 116
    move v3, p4

    .line 117
    move-object v4, p6

    .line 118
    move-object v5, p8

    .line 119
    move v6, v1

    .line 120
    move-object v1, p5

    .line 121
    invoke-direct/range {v0 .. v6}, Ll/yr9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/cwl;Z)V

    .line 122
    .line 123
    .line 124
    move-object p1, v1

    .line 125
    move v1, v6

    .line 126
    new-instance p2, Ll/zr9;

    .line 127
    .line 128
    invoke-direct {p2, p1}, Ll/zr9;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    invoke-interface {v4}, Ll/dwl;->k()Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {v5, p0, v1}, Ll/cwl;->A1(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-eqz p0, :cond_3

    .line 147
    .line 148
    invoke-interface {v4}, Ll/dwl;->l()I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    const/4 p1, 0x1

    .line 153
    sub-int/2addr p0, p1

    .line 154
    invoke-interface {v4, p0}, Ll/dwl;->J(I)V

    .line 155
    .line 156
    .line 157
    invoke-interface {v4}, Ll/dwl;->l()I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-gtz p0, :cond_2

    .line 162
    .line 163
    invoke-interface {v5}, Ll/cwl;->O2()I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    const/4 p2, 0x0

    .line 168
    if-gt p0, p1, :cond_1

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_1
    move p1, p2

    .line 172
    :goto_1
    invoke-interface {p7, p2, p1}, Ll/ewl;->a(ZZ)V

    .line 173
    .line 174
    .line 175
    :cond_2
    invoke-interface {v4}, Ll/dwl;->l()I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    invoke-interface {v4, p0}, Ll/dwl;->P(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    goto :goto_2

    .line 184
    :cond_3
    invoke-interface {v4}, Ll/dwl;->l()I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    invoke-interface {v4, p0}, Ll/dwl;->P(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    :goto_2
    invoke-interface {p7, p0}, Ll/ewl;->setTitle(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public ge(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x1

    .line 6
    move-object v0, p0

    .line 7
    move-object v5, p1

    .line 8
    move-object v1, p2

    .line 9
    move v4, p3

    .line 10
    move-object v6, p4

    .line 11
    move-object v7, p5

    .line 12
    move-object/from16 v8, p6

    .line 13
    .line 14
    move-object/from16 v9, p7

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->c0(Lcom/p1/mobile/android/app/Act;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->U0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p0 .. p9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->d0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ll/gwl;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    const/4 v4, 0x1

    .line 6
    move-object v0, p0

    .line 7
    move-object v6, p1

    .line 8
    move-object v1, p2

    .line 9
    move-object v2, p3

    .line 10
    move v5, p4

    .line 11
    move-object v7, p5

    .line 12
    move-object/from16 v8, p6

    .line 13
    .line 14
    move-object/from16 v9, p7

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->d0(Lcom/p1/mobile/android/app/Act;Ll/gwl;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public lm(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Ll/d810;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    move-object v0, p5

    .line 5
    move-object p5, p1

    .line 6
    move-object p1, p2

    .line 7
    move-object p2, p3

    .line 8
    move-object p3, p4

    .line 9
    move-object p4, v0

    .line 10
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m6(Ll/nnr;)V
    .locals 0

    .line 1
    iget-object p0, p1, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/newui/home/d;ZZLl/dwl;Ll/ewl;Ll/cwl;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x1

    .line 6
    move-object v0, p0

    .line 7
    move-object v5, p1

    .line 8
    move v3, p2

    .line 9
    move v4, p3

    .line 10
    move-object v6, p4

    .line 11
    move-object v7, p5

    .line 12
    move-object v8, p6

    .line 13
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->g0(ZZZZLcom/p1/mobile/putong/core/newui/home/d;Ll/dwl;Ll/ewl;Ll/cwl;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public n9(Ll/nnr;)V
    .locals 2

    .line 1
    iget-object p0, p1, Ll/nnr;->f:Lv/VText_AutoFit;

    .line 2
    .line 3
    const v0, -0x66dededf

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p1, Ll/nnr;->f:Lv/VText_AutoFit;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    const/high16 v1, 0x41800000    # 16.0f

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget v0, Ll/qa00;->j:I

    .line 24
    .line 25
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 26
    .line 27
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    .line 29
    iget-object v0, p1, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p1, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 35
    .line 36
    sget p1, Ll/dbc0;->Sr:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p12}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->Ml(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public on(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/data/PicksUser;Ljava/lang/String;Ll/jic0;Ll/y20;Ll/x20;)Z
    .locals 0
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Lcom/p1/mobile/android/app/Frag;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Lcom/p1/mobile/putong/core/data/PicksUser;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ll/jic0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p12    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZI",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/android/app/Frag;",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            "Ljava/lang/String;",
            "Ll/jic0;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/qo70;->Companion:Ll/qo70$a;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p13}, Ll/qo70$a;->f(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/data/PicksUser;Ljava/lang/String;Ll/jic0;Ll/y20;Ll/x20;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public pc()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "heart_confession_content"

    .line 2
    .line 3
    return-object p0
.end method

.method public final r0(Lcom/p1/mobile/putong/core/data/PicksUser;Ll/an70;Ll/sm70;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/an70;->l()Ll/eo70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/eo70;->M(Lcom/p1/mobile/putong/core/data/PicksUser;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/ela;->I3(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3}, Ll/sm70;->l0()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/lit8 p0, p0, 0x1

    .line 25
    .line 26
    invoke-virtual {p3, p0}, Ll/sm70;->r0(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public tq(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Ljava/lang/String;",
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

    .line 1
    move-object p0, p1

    .line 2
    move-object p1, p2

    .line 3
    move p2, p3

    .line 4
    move p3, p4

    .line 5
    move p4, p5

    .line 6
    move-object p5, p6

    .line 7
    const/4 p6, 0x0

    .line 8
    invoke-static/range {p0 .. p12}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public vk(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/an70;Lcom/p1/mobile/putong/core/data/PicksUser;Ll/sm70;)Z
    .locals 16
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Lcom/p1/mobile/putong/core/data/PicksUser;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v5, p6

    move-object/from16 v8, p8

    move-object/from16 v7, p10

    .line 1
    invoke-virtual {v8}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    move-result-object v4

    .line 2
    iget-object v6, v7, Lcom/p1/mobile/putong/core/data/PicksUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    const-string v9, "masking"

    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "grayed"

    goto :goto_0

    :cond_0
    const-string v6, "clear"

    .line 3
    :goto_0
    const-string v10, "picks_card_type"

    invoke-static {v10, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v6

    const-string v10, "other_user_id"

    iget-object v11, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    invoke-static {v10, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v10

    if-eqz v1, :cond_1

    .line 5
    const-string v11, "like"

    goto :goto_1

    :cond_1
    const-string v11, "dislike"

    :goto_1
    const-string v12, "direction"

    invoke-static {v12, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v11

    filled-new-array {v6, v10, v11}, [Ll/pf60;

    move-result-object v6

    .line 6
    const-string v10, "e_picks_module_card"

    invoke-static {v10, v4, v6}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    .line 8
    invoke-virtual {v8}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v3, v1, v2, v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v6

    move/from16 v10, p4

    .line 9
    invoke-virtual {v6, v10}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v6

    move-object/from16 v10, p5

    .line 10
    invoke-virtual {v6, v10}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    move-result-object v6

    .line 11
    sget-object v10, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PICKS:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    iput-object v10, v6, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 12
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    move-result v10

    const/4 v11, 0x0

    if-eqz v10, :cond_2

    .line 13
    invoke-virtual/range {p9 .. p9}, Ll/an70;->l()Ll/eo70;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 15
    const-string v0, "failJailedUser"

    invoke-static {v6, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return v11

    .line 16
    :cond_2
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 17
    const-string v0, "failFakeUser"

    invoke-static {v6, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 18
    invoke-static {v8}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    return v11

    .line 19
    :cond_3
    invoke-virtual/range {p11 .. p11}, Ll/sm70;->l0()I

    move-result v10

    const/4 v12, 0x4

    if-ge v10, v12, :cond_13

    invoke-virtual/range {p9 .. p9}, Ll/an70;->l()Ll/eo70;

    move-result-object v10

    invoke-virtual {v10}, Ll/eo70;->L()I

    move-result v10

    if-gt v10, v12, :cond_4

    goto/16 :goto_6

    .line 20
    :cond_4
    iget-object v10, v7, Lcom/p1/mobile/putong/core/data/PicksUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    invoke-static {v10, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    const-string v10, "picks_module_card"

    if-eqz v9, :cond_5

    .line 21
    invoke-virtual {v0, v10, v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->X8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    invoke-virtual/range {p9 .. p9}, Ll/an70;->l()Ll/eo70;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return v11

    :cond_5
    if-nez v1, :cond_6

    .line 23
    invoke-static {}, Ll/joa;->H3()Z

    move-result v9

    if-nez v9, :cond_6

    .line 24
    invoke-virtual/range {p9 .. p9}, Ll/an70;->l()Ll/eo70;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return v11

    .line 25
    :cond_6
    invoke-static {}, Ll/joa;->H3()Z

    move-result v9

    if-nez v9, :cond_7

    invoke-static {}, Ll/ela;->r3()I

    move-result v9

    if-gtz v9, :cond_7

    .line 26
    invoke-virtual {v0, v10, v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->X8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 27
    invoke-virtual/range {p9 .. p9}, Ll/an70;->l()Ll/eo70;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return v11

    .line 28
    :cond_7
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v9

    .line 29
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    if-eqz v1, :cond_9

    .line 30
    iget v12, v9, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    if-nez v12, :cond_9

    .line 31
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v9, v12, v14

    if-lez v9, :cond_9

    sget-object v9, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    invoke-static {v4, v9}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    if-eqz v3, :cond_8

    goto :goto_2

    .line 35
    :cond_8
    const-string v10, ""

    :goto_2
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    invoke-interface {v0, v8, v10, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return v11

    :cond_9
    const/4 v12, 0x1

    if-eqz v2, :cond_12

    .line 37
    invoke-static/range {p7 .. p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 38
    invoke-static {}, Ll/a5i0;->x0()I

    move-result v9

    if-gtz v9, :cond_12

    .line 39
    invoke-static {}, Ll/joa;->f4()Z

    move-result v1

    const/4 v2, 0x2

    const-string v5, "p_navigation_ilike,card_button_pull"

    if-eqz v1, :cond_e

    .line 40
    invoke-static {}, Ll/joa;->H3()Z

    move-result v1

    if-nez v1, :cond_b

    invoke-static {}, Ll/ela;->r3()I

    move-result v1

    if-lez v1, :cond_a

    goto :goto_3

    .line 41
    :cond_a
    invoke-virtual {v0, v10, v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->X8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    goto :goto_5

    .line 42
    :cond_b
    :goto_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v4, v0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 43
    invoke-static {}, Ll/d79;->b0()Z

    move-result v0

    if-nez v0, :cond_c

    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    const-string v1, "e_picks_card_superlike"

    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    invoke-interface {v0, v8, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    goto :goto_5

    :cond_c
    if-eqz v3, :cond_d

    move v12, v2

    .line 47
    :cond_d
    invoke-static {v5, v12}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 48
    invoke-static {v8, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    goto :goto_5

    .line 49
    :cond_e
    invoke-static {}, Ll/joa;->H3()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-static {}, Ll/ela;->r3()I

    move-result v1

    if-lez v1, :cond_f

    goto :goto_4

    .line 50
    :cond_f
    invoke-virtual {v0, v10, v8}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->X8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    goto :goto_5

    :cond_10
    :goto_4
    if-eqz v3, :cond_11

    move v12, v2

    .line 51
    :cond_11
    invoke-static {v5, v12}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-static {v8, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    :goto_5
    return v11

    :cond_12
    move-object/from16 v9, p9

    move-object/from16 v10, p11

    move-object v4, v6

    move-object/from16 v6, p7

    .line 53
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->f0(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PicksUser;Lcom/p1/mobile/android/app/Act;Ll/an70;Ll/sm70;)V

    return v12

    .line 54
    :cond_13
    :goto_6
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;

    invoke-direct {v0, v8, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 55
    invoke-virtual {v8, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 56
    invoke-virtual/range {p9 .. p9}, Ll/an70;->k()V

    return v11
.end method

.method public yk(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/dtf0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/dtf0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dtf0;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
