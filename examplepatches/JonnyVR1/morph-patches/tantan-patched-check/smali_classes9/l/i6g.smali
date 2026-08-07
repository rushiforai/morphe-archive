.class public Ll/i6g;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

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
    iput-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final e0(Ll/teg$a;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    iget-object v0, p1, Ll/teg$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "fanBaseScore-audience-day-fanbaseuserscore"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R3:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v0, p1, Ll/teg$a;->b:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "business-audience-month-fanbaseuseractive"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T3:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    iget-object p1, p1, Ll/teg$a;->b:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "gift-audience-day-fanbaseusergift"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 48
    .line 49
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ll/civ;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W3:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V3:I

    .line 65
    .line 66
    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    const-string p0, "%s"

    .line 72
    .line 73
    return-object p0
.end method

.method public f0(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)Ll/dig;
    .locals 3

    .line 1
    iget-object p0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/d3q;

    .line 18
    .line 19
    instance-of v1, v0, Ll/dig;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    check-cast v0, Ll/dig;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/dig;->L()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ll/dig;->R(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public g0(Ll/teg;Ll/yhg;Ll/lag;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/vx2;

    .line 7
    .line 8
    invoke-virtual {p3}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p1}, Ll/teg;->c()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p1}, Ll/teg;->b()Ljava/util/Map;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v3, 0x4

    .line 21
    invoke-direct {v0, v1, v3, v2, p1}, Ll/vx2;-><init>(ZIILjava/util/Map;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/eig;

    .line 30
    .line 31
    invoke-direct {p1, p3}, Ll/eig;-><init>(Ll/lag;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/eig;->H(Ll/yhg;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->users:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    new-instance p1, Ll/qhg;

    .line 55
    .line 56
    invoke-direct {p1, p3}, Ll/qhg;-><init>(Ll/lag;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ll/qhg;->J(Ll/yhg;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-virtual {p2}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->users:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 88
    .line 89
    new-instance v1, Ll/dig;

    .line 90
    .line 91
    invoke-direct {v1, p3}, Ll/dig;-><init>(Ll/lag;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ll/yhg;->a()Ll/cm0;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v1, v0, v2}, Ll/dig;->Q(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Ll/cm0;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public h0(Ll/mag;Ll/teg;Ll/tk2;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/vx2;

    .line 7
    .line 8
    invoke-virtual {p3}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p2}, Ll/teg;->c()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p2}, Ll/teg;->b()Ljava/util/Map;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    const/4 v4, 0x3

    .line 21
    invoke-direct {v0, v1, v4, v2, v3}, Ll/vx2;-><init>(ZIILjava/util/Map;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/teg;->a()Ll/teg$a;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1}, Ll/mag;->b()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/mag;->b()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    move v2, v1

    .line 49
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v2, v3, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    move-object v6, v3

    .line 60
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 61
    .line 62
    iget-object v3, v6, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, v3}, Ll/mag;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    iget-object v3, v6, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 71
    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, v3}, Ll/mag;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    iget-object v3, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 79
    .line 80
    new-instance v4, Ll/zx2;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/mag;->a()Ll/cm0;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    invoke-virtual {p0, p2}, Ll/i6g;->e0(Ll/teg$a;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    move-object v5, p3

    .line 91
    invoke-direct/range {v4 .. v10}, Ll/zx2;-><init>(Ll/ner;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Ll/cm0;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 101
    .line 102
    new-instance p3, Ll/tlj;

    .line 103
    .line 104
    invoke-direct {p3}, Ll/tlj;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_1
    iget-object p1, p2, Ll/teg$a;->b:Ljava/lang/String;

    .line 111
    .line 112
    const-string p3, "fanBaseScore-audience-day-fanbaseuserscore"

    .line 113
    .line 114
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->U3:I

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_2
    iget-object p1, p2, Ll/teg$a;->b:Ljava/lang/String;

    .line 124
    .line 125
    const-string p3, "business-audience-month-fanbaseuseractive"

    .line 126
    .line 127
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_3

    .line 132
    .line 133
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->S3:I

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_3
    iget-object p1, p2, Ll/teg$a;->b:Ljava/lang/String;

    .line 137
    .line 138
    const-string p2, "gift-audience-day-fanbaseusergift"

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_5

    .line 145
    .line 146
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 147
    .line 148
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Ll/civ;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->X3:I

    .line 161
    .line 162
    :goto_1
    move v1, p1

    .line 163
    goto :goto_2

    .line 164
    :cond_4
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q3:I

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_5
    :goto_2
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 168
    .line 169
    new-instance p2, Ll/tx2;

    .line 170
    .line 171
    sget-object p3, Ll/zrv;->e:Landroid/app/Application;

    .line 172
    .line 173
    invoke-virtual {p3, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    invoke-direct {p2, p3}, Ll/tx2;-><init>(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 184
    .line 185
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public i0(ZLl/teg;Ll/tk2;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/vx2;

    .line 7
    .line 8
    invoke-virtual {p3}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x3

    .line 17
    :goto_0
    invoke-virtual {p2}, Ll/teg;->c()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p2}, Ll/teg;->b()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-direct {v0, p3, v1, v2, p2}, Ll/vx2;-><init>(ZIILjava/util/Map;)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x1

    .line 34
    :goto_1
    const/4 p3, 0x7

    .line 35
    if-ge p2, p3, :cond_2

    .line 36
    .line 37
    iget-object p3, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    new-instance v0, Ll/wx2;

    .line 42
    .line 43
    const/4 v1, -0x1

    .line 44
    invoke-direct {v0, v1}, Ll/wx2;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_1
    new-instance v0, Ll/wx2;

    .line 52
    .line 53
    invoke-direct {v0, p2}, Ll/wx2;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object p1, p0, Ll/i6g;->j:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
