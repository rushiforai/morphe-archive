.class public Ll/roe0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/roe0;Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->g4(Ll/uoe0;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic K3(Ll/roe0;Ll/uoe0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->k4(Ll/uoe0;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L3(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uoe0;->s:Ll/y20;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic M3(Ll/roe0;Ljava/lang/String;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/roe0;->j4(Ljava/lang/String;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)V

    return-void
.end method

.method public static synthetic N3(Ll/roe0;Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->m4(Ll/uoe0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O3(Ll/roe0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/roe0;->e4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic P3(Ll/roe0;Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->h4(Ll/uoe0;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R3(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uoe0;->s:Ll/y20;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic S3(Ll/roe0;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->l4(Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic T3(Ll/roe0;Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/roe0;->i4(Ll/uoe0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U3(Ll/roe0;Ll/hne0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/roe0;->f4(Ll/hne0;)V

    return-void
.end method

.method private V3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uoe0;Ll/voe0;)V
    .locals 3

    .line 1
    new-instance v0, Ll/ine0;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, v1, v2}, Ll/ine0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p2, Ll/uoe0;->m:Ll/cqj;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/uoe0;->m()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-static {p2}, Ll/foc0;->a(Ll/uoe0;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Ll/ine0;->e(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Ll/foc0;->b(Ll/uoe0;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ll/ine0;->f(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p3, p2}, Ll/voe0;->a(Ll/uoe0;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ll/ine0;->e(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3, p2}, Ll/voe0;->b(Ll/uoe0;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Ll/ine0;->f(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-virtual {v1}, Ll/cqj;->b()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-eqz p0, :cond_2

    .line 75
    .line 76
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_2

    .line 83
    .line 84
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/ine0;->e(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ll/ine0;->f(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string p0, "extra_type_normal"

    .line 95
    .line 96
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 97
    .line 98
    :cond_2
    :goto_1
    invoke-virtual {p3}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 105
    .line 106
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 107
    .line 108
    iget-object p0, p2, Ll/uoe0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 109
    .line 110
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->drawParam:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 111
    .line 112
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 113
    .line 114
    return-void
.end method

.method private W3(Ll/uoe0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p1, Ll/uoe0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p1, Ll/uoe0;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p1, Ll/uoe0;->c:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v0, Ll/ju70;

    .line 38
    .line 39
    const/16 v1, 0x2bd

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/ju70;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/String;

    .line 49
    .line 50
    iput-object v0, p1, Ll/uoe0;->g:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v0, Ll/rs10;

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ll/rs10;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    iput-object v0, p1, Ll/uoe0;->h:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/uoe0;->h()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v2, p1, Ll/uoe0;->h:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_1

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_1

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iput-object v2, p1, Ll/uoe0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

    .line 88
    .line 89
    iput-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;->userId:Ljava/lang/String;

    .line 90
    .line 91
    new-instance v2, Ll/ss10;

    .line 92
    .line 93
    invoke-direct {v2, v1}, Ll/ss10;-><init>(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2, v0}, Ll/ss10;->e(Ljava/lang/String;)Ll/ss10;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/Boolean;

    .line 105
    .line 106
    iget-object v2, p1, Ll/uoe0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_0

    .line 113
    .line 114
    const-string v0, "player"

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    const-string v0, "spectator"

    .line 118
    .line 119
    :goto_0
    iput-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;->role:Ljava/lang/String;

    .line 120
    .line 121
    :cond_1
    iget-object v0, p1, Ll/uoe0;->n:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_2

    .line 128
    .line 129
    new-instance v0, Ll/csj;

    .line 130
    .line 131
    invoke-direct {v0, v1}, Ll/csj;-><init>(I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Ll/wpj;

    .line 139
    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/wpj;->b()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iput-object v1, p1, Ll/uoe0;->n:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/wpj;->a()Ll/cqj;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p1, Ll/uoe0;->m:Ll/cqj;

    .line 153
    .line 154
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    instance-of v0, v0, Ll/mc50;

    .line 159
    .line 160
    if-eqz v0, :cond_3

    .line 161
    .line 162
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Ll/mc50;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    if-eqz v0, :cond_3

    .line 173
    .line 174
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 175
    .line 176
    iput-object v1, p1, Ll/uoe0;->a:Ljava/lang/String;

    .line 177
    .line 178
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v1, p1, Ll/uoe0;->b:Ljava/lang/String;

    .line 181
    .line 182
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 183
    .line 184
    iput-object v1, p1, Ll/uoe0;->c:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->anchorId:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->roomId:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->liveId:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 221
    .line 222
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->programId:Ljava/lang/String;

    .line 223
    .line 224
    iput-object v1, p1, Ll/uoe0;->O:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 225
    .line 226
    :cond_3
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_6

    .line 231
    .line 232
    iget-object v0, p1, Ll/uoe0;->m:Ll/cqj;

    .line 233
    .line 234
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-eqz v0, :cond_4

    .line 239
    .line 240
    iget-object v0, p1, Ll/uoe0;->m:Ll/cqj;

    .line 241
    .line 242
    invoke-virtual {v0}, Ll/cqj;->d()Ll/p54;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    goto :goto_1

    .line 247
    :cond_4
    const/4 v0, 0x0

    .line 248
    :goto_1
    if-nez v0, :cond_5

    .line 249
    .line 250
    invoke-static {p0}, Ll/ve10;->f(Ll/i6t;)Ll/p54;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    :cond_5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_6

    .line 259
    .line 260
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {v1, v0}, Ll/ve10;->b(Ll/oo2;Ll/p54;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iput-object v0, p1, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 269
    .line 270
    :cond_6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p1, p0}, Ll/uoe0;->r(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method private Z3(Ll/uoe0;)V
    .locals 5

    .line 1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/civ;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p1, Ll/uoe0;->D:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/uoe0;->i()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 30
    .line 31
    iget v1, p1, Ll/uoe0;->f:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    double-to-long v0, v0

    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->showSendFirstGiftDlg()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-instance v3, Ll/r7f0;

    .line 49
    .line 50
    invoke-direct {v3}, Ll/r7f0;-><init>()V

    .line 51
    .line 52
    .line 53
    new-instance v4, Ll/coe0;

    .line 54
    .line 55
    invoke-direct {v4, p0, p1}, Ll/coe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v4}, Ll/r7f0;->e(Ll/y20;)Ll/r7f0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance v3, Ll/eoe0;

    .line 63
    .line 64
    invoke-direct {v3, p1}, Ll/eoe0;-><init>(Ll/uoe0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v3}, Ll/r7f0;->d(Ll/y20;)Ll/r7f0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v0, v1}, Ll/r7f0;->f(J)Ll/r7f0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v2, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    invoke-virtual {p0, p1}, Ll/roe0;->Y3(Ll/uoe0;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private a4(Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v1, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v2, 0xa1b8

    .line 11
    .line 12
    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    const v2, 0xa21b

    .line 16
    .line 17
    .line 18
    if-gt v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGiftByPositionGiftId()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object v0, p1, Ll/uoe0;->d:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    packed-switch v1, :pswitch_data_0

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    const/4 v3, 0x0

    .line 46
    packed-switch v1, :pswitch_data_1

    .line 47
    .line 48
    .line 49
    packed-switch v1, :pswitch_data_2

    .line 50
    .line 51
    .line 52
    packed-switch v1, :pswitch_data_3

    .line 53
    .line 54
    .line 55
    packed-switch v1, :pswitch_data_4

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :pswitch_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :pswitch_1
    iget-object p0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p0, v3, v2}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :pswitch_2
    iget-object p0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0}, Ll/cpj;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-eqz p0, :cond_1

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0, v3, v2}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :pswitch_3
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 90
    .line 91
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f5:I

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :pswitch_4
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 102
    .line 103
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g5:I

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :pswitch_5
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 114
    .line 115
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ea:I

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :pswitch_6
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 126
    .line 127
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cb:I

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :pswitch_7
    invoke-direct {p0, p1}, Ll/roe0;->o4(Ll/uoe0;)V

    .line 138
    .line 139
    .line 140
    :cond_1
    :goto_0
    iget-object p0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 141
    .line 142
    invoke-static {p0, p2}, Ll/muj;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p1, Ll/uoe0;->r:Ll/y20;

    .line 146
    .line 147
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :pswitch_data_0
    .packed-switch 0xa03d
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :pswitch_data_1
    .packed-switch 0xa0f1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_2
    .packed-switch 0xa154
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    :pswitch_data_3
    .packed-switch 0xa15b
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0xa164
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private c4(Ll/uoe0;Ll/voe0;)V
    .locals 4

    .line 1
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 50
    .line 51
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 52
    .line 53
    iput-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 60
    .line 61
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/oo2;->W0()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasVoiceMode:Z

    .line 72
    .line 73
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tradeNo:Ljava/lang/String;

    .line 92
    .line 93
    :cond_1
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 110
    .line 111
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->effectExt:Ljava/lang/String;

    .line 112
    .line 113
    :cond_2
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 130
    .line 131
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 132
    .line 133
    :cond_3
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 138
    .line 139
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_4

    .line 144
    .line 145
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 150
    .line 151
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 152
    .line 153
    :cond_4
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 158
    .line 159
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_5

    .line 164
    .line 165
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 172
    .line 173
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 174
    .line 175
    :cond_5
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 180
    .line 181
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_6

    .line 186
    .line 187
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 192
    .line 193
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 194
    .line 195
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 196
    .line 197
    :cond_6
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 202
    .line 203
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_7

    .line 208
    .line 209
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 214
    .line 215
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 216
    .line 217
    :cond_7
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 222
    .line 223
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-eqz v0, :cond_8

    .line 228
    .line 229
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 234
    .line 235
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 236
    .line 237
    :cond_8
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 242
    .line 243
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_9

    .line 248
    .line 249
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 254
    .line 255
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 256
    .line 257
    :cond_9
    invoke-direct {p0, v1, p1, p2}, Ll/roe0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uoe0;Ll/voe0;)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 261
    .line 262
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    invoke-static {v1, v0, v2, v3}, Ll/rre;->v(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;Z)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {v0, v1}, Ll/oo2;->E1(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-virtual {p2}, Ll/voe0;->c()J

    .line 285
    .line 286
    .line 287
    move-result-wide v2

    .line 288
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v0, v2}, Ll/oo2;->C1(Ljava/lang/Long;)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p1, Ll/uoe0;->q:Ll/y20;

    .line 296
    .line 297
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    iget-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 301
    .line 302
    if-eqz v0, :cond_a

    .line 303
    .line 304
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ConsumeAlertEvent:Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;

    .line 309
    .line 310
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ConsumeAlertEvent;->showConsumeAlertDialog()Ll/v3f$c;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 315
    .line 316
    .line 317
    :cond_a
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 318
    .line 319
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_b

    .line 324
    .line 325
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 326
    .line 327
    invoke-virtual {p0, v0}, Ll/roe0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 328
    .line 329
    .line 330
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 331
    .line 332
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 337
    .line 338
    invoke-static {v0, v1}, Ll/muj;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 339
    .line 340
    .line 341
    :cond_b
    invoke-direct {p0, p1, p2}, Ll/roe0;->n4(Ll/uoe0;Ll/voe0;)V

    .line 342
    .line 343
    .line 344
    return-void
.end method

.method private d4(Ll/uoe0;)Z
    .locals 9

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p0, "\u8b66\u544a\u26a0\ufe0f\uff0c\u793c\u7269\u5bf9\u8c61\u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5"

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget v2, p1, Ll/uoe0;->f:I

    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    double-to-long v2, v2

    .line 19
    invoke-virtual {p1}, Ll/uoe0;->l()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    iget-wide v5, p0, Ll/roe0;->i:J

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    if-eqz v4, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iget v0, p1, Ll/uoe0;->f:I

    .line 33
    .line 34
    int-to-long v7, v0

    .line 35
    mul-long/2addr v2, v7

    .line 36
    invoke-virtual {p1}, Ll/uoe0;->e()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    int-to-long v7, p1

    .line 45
    mul-long/2addr v2, v7

    .line 46
    cmp-long p1, v5, v2

    .line 47
    .line 48
    if-ltz p1, :cond_1

    .line 49
    .line 50
    return p0

    .line 51
    :cond_1
    return v1

    .line 52
    :cond_2
    cmp-long p1, v5, v2

    .line 53
    .line 54
    if-gez p1, :cond_4

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    return v1

    .line 64
    :cond_4
    :goto_0
    return p0
.end method

.method private synthetic e4(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/roe0;->i:J

    .line 6
    .line 7
    return-void
.end method

.method private synthetic f4(Ll/hne0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/hne0;->a:Ll/uoe0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/roe0;->q4(Ll/uoe0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private n4(Ll/uoe0;Ll/voe0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGiftSuccess()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/woe0;

    .line 16
    .line 17
    invoke-direct {v0, p1, p2}, Ll/woe0;-><init>(Ll/uoe0;Ll/voe0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private o4(Ll/uoe0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/uoe0;->n:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "source_voice_ktv_quick_gift"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "e_audio_ktv_panel"

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p1, Ll/uoe0;->n:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "source_voice_gift_guide"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v0, "e_audio_pay_guide"

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget-boolean v0, p1, Ll/uoe0;->p:Z

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v0, "liveFastGiftClick"

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const-string v0, "liveGiftSuitClick"

    .line 35
    .line 36
    iget-object v1, p1, Ll/uoe0;->A:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    const-string v0, "liveGiftGuardClick"

    .line 45
    .line 46
    iget-object v1, p1, Ll/uoe0;->A:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const-string v0, "liveGiftBarGiftClick"

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    :goto_0
    iget-object v0, p1, Ll/uoe0;->A:Ljava/lang/String;

    .line 59
    .line 60
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGoWallet()Ll/v3f$d;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance v1, Ll/ox50;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/ox50;-><init>()V

    .line 73
    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    invoke-virtual {v1, v2}, Ll/ox50;->d(Z)Ll/ox50;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1, p1}, Ll/ox50;->e(Ll/uoe0;)Ll/ox50;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v0}, Ll/ox50;->f(Ljava/lang/String;)Ll/ox50;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private p4(Ll/uoe0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/roe0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    invoke-static {v0}, Ll/muj;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/wxj;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/wxj;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ll/uoe0;->s(Ll/wxj;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ll/f3e;->a(Ll/uoe0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/oo2;->O0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Ll/uoe0;->v(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/uoe0;->l()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/roe0;->r4(Ll/uoe0;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-direct {p0, p1}, Ll/roe0;->s4(Ll/uoe0;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    return-void
.end method

.method private s4(Ll/uoe0;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/aiv;->q1(Ll/uoe0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/goe0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/goe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/ioe0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/ioe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->t1()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/xne0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/xne0;-><init>(Ll/roe0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/aoe0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/aoe0;-><init>(Ll/roe0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final X3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    new-instance v2, Ll/hv70;

    .line 14
    .line 15
    const/16 v3, 0x2bc

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ll/hv70;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    new-instance v4, Ll/uu70;

    .line 31
    .line 32
    invoke-direct {v4, v3}, Ll/uu70;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v4}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/String;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 45
    .line 46
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->xa:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0, v3, v1}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 67
    .line 68
    .line 69
    return v1

    .line 70
    :cond_1
    return v3
.end method

.method public final Y3(Ll/uoe0;)V
    .locals 5

    .line 1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/civ;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPaidGift()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-boolean v0, p1, Ll/uoe0;->C:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/uoe0;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 34
    .line 35
    iget v1, p1, Ll/uoe0;->f:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    double-to-long v0, v0

    .line 42
    invoke-virtual {p1}, Ll/uoe0;->e()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/uoe0;->e()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    int-to-long v2, v2

    .line 61
    mul-long/2addr v0, v2

    .line 62
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->showSendFirstGiftDlg()Ll/v3f$d;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    new-instance v3, Ll/r7f0;

    .line 73
    .line 74
    invoke-direct {v3}, Ll/r7f0;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v4, Ll/koe0;

    .line 78
    .line 79
    invoke-direct {v4, p0, p1}, Ll/koe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v4}, Ll/r7f0;->e(Ll/y20;)Ll/r7f0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance v3, Ll/moe0;

    .line 87
    .line 88
    invoke-direct {v3, p1}, Ll/moe0;-><init>(Ll/uoe0;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v3}, Ll/r7f0;->d(Ll/y20;)Ll/r7f0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v0, v1}, Ll/r7f0;->f(J)Ll/r7f0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v2, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    invoke-direct {p0, p1}, Ll/roe0;->p4(Ll/uoe0;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final b4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideFastGiftPrice()Ll/v3f$c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic g4(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 8
    .line 9
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Ll/civ;

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ll/civ;->w(Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-direct {p0, p1}, Ll/roe0;->p4(Ll/uoe0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic h4(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 8
    .line 9
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Ll/civ;

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ll/civ;->u(Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-direct {p0, p1}, Ll/roe0;->p4(Ll/uoe0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic i4(Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/roe0;->a4(Ll/uoe0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j4(Ljava/lang/String;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)V
    .locals 2

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 4
    .line 5
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftBatchOriginalId:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ll/voe0;

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ll/voe0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p3}, Ll/voe0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p2, p1}, Ll/roe0;->c4(Ll/uoe0;Ll/voe0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic k4(Ll/uoe0;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/zne0;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, p1}, Ll/zne0;-><init>(Ll/roe0;Ljava/lang/String;Ll/uoe0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic l4(Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 1

    .line 1
    new-instance v0, Ll/voe0;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/voe0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/roe0;->c4(Ll/uoe0;Ll/voe0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m4(Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/roe0;->a4(Ll/uoe0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q4(Ll/uoe0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/uoe0;->n:Ljava/lang/String;

    .line 6
    .line 7
    const-string v3, "voiceLiveMain"

    .line 8
    .line 9
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, v1, Ll/uoe0;->n:Ljava/lang/String;

    .line 16
    .line 17
    const-string v3, "voiceLiveVice"

    .line 18
    .line 19
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    new-instance v2, Ll/vme0;

    .line 30
    .line 31
    const/16 v3, 0x2bc

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ll/vme0;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/util/Collection;

    .line 41
    .line 42
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G:I

    .line 49
    .line 50
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 59
    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    iget-object v2, v1, Ll/uoe0;->d:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 72
    .line 73
    if-nez v2, :cond_6

    .line 74
    .line 75
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 76
    .line 77
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ll/hiv;

    .line 82
    .line 83
    iget-object v3, v1, Ll/uoe0;->d:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iput-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 90
    .line 91
    iget-object v2, v1, Ll/uoe0;->d:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v2}, Ll/muj;->X(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 97
    .line 98
    if-nez v2, :cond_4

    .line 99
    .line 100
    iget-object v0, v1, Ll/uoe0;->r:Ll/y20;

    .line 101
    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    new-instance v2, Ljava/lang/Throwable;

    .line 105
    .line 106
    const-string v3, "can\'t find gift item by id"

    .line 107
    .line 108
    invoke-direct {v2, v3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v0, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iget-object v0, v1, Ll/uoe0;->d:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v0}, Ll/muj;->Y(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    iget-object v2, v1, Ll/uoe0;->N:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-nez v2, :cond_5

    .line 127
    .line 128
    iget-object v3, v1, Ll/uoe0;->N:Ljava/lang/String;

    .line 129
    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    iget-object v4, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 136
    .line 137
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 138
    .line 139
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v4, ""

    .line 143
    .line 144
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    new-instance v2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    iget-object v6, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 157
    .line 158
    invoke-virtual {v6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 159
    .line 160
    .line 161
    move-result-wide v6

    .line 162
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 173
    .line 174
    iget-object v7, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 175
    .line 176
    iget-object v8, v1, Ll/uoe0;->o:Ljava/lang/String;

    .line 177
    .line 178
    invoke-direct/range {p0 .. p1}, Ll/roe0;->d4(Ll/uoe0;)Z

    .line 179
    .line 180
    .line 181
    move-result v9

    .line 182
    move-object v4, v3

    .line 183
    invoke-static/range {v3 .. v9}, Ll/j1k;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 184
    .line 185
    .line 186
    :cond_5
    iget-object v10, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 187
    .line 188
    iget-object v11, v1, Ll/uoe0;->u:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v12, v1, Ll/uoe0;->t:Ljava/lang/String;

    .line 191
    .line 192
    new-instance v2, Ll/xpj;

    .line 193
    .line 194
    const/16 v3, 0x2bd

    .line 195
    .line 196
    invoke-direct {v2, v3}, Ll/xpj;-><init>(I)V

    .line 197
    .line 198
    .line 199
    iget-object v4, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 200
    .line 201
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 202
    .line 203
    .line 204
    move-result-wide v4

    .line 205
    long-to-double v4, v4

    .line 206
    invoke-virtual {v2, v4, v5}, Ll/xpj;->e(D)Ll/xpj;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    check-cast v2, Ljava/lang/Boolean;

    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 217
    .line 218
    .line 219
    move-result v13

    .line 220
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v14

    .line 224
    new-instance v2, Ll/ywj;

    .line 225
    .line 226
    invoke-direct {v2, v3}, Ll/ywj;-><init>(I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    move-object/from16 v16, v2

    .line 234
    .line 235
    check-cast v16, Ljava/lang/String;

    .line 236
    .line 237
    const/4 v15, 0x1

    .line 238
    invoke-static/range {v10 .. v16}, Ll/qzj;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :cond_6
    invoke-direct/range {p0 .. p1}, Ll/roe0;->W3(Ll/uoe0;)V

    .line 242
    .line 243
    .line 244
    invoke-direct/range {p0 .. p1}, Ll/roe0;->d4(Ll/uoe0;)Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-nez v2, :cond_7

    .line 249
    .line 250
    invoke-direct/range {p0 .. p1}, Ll/roe0;->o4(Ll/uoe0;)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_7
    invoke-direct/range {p0 .. p1}, Ll/roe0;->Z3(Ll/uoe0;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public final r4(Ll/uoe0;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/aiv;->r1(Ll/uoe0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ooe0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/ooe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/qoe0;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/qoe0;-><init>(Ll/roe0;Ll/uoe0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
