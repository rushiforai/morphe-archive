.class public Ll/d880;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public j:Ll/s680;

.field public k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

.field public l:Ll/kcg0;

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Ll/s680;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/d880;->j:Ll/s680;

    .line 7
    .line 8
    return-void
.end method

.method private B4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d880;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/dw40;

    .line 11
    .line 12
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/s780;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/s780;-><init>(Ll/d880;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/d880;->l:Ll/kcg0;

    .line 36
    .line 37
    return-void
.end method

.method private C4(Ljava/lang/Long;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->startTs:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    long-to-double v1, v1

    .line 20
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    const-wide v5, 0x412e848000000000L    # 1000000.0

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    div-double/2addr v3, v5

    .line 34
    sub-double/2addr v1, v3

    .line 35
    double-to-long v0, v1

    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 37
    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->duration:I

    .line 39
    .line 40
    int-to-long v3, p1

    .line 41
    const-wide/16 v5, 0x3e8

    .line 42
    .line 43
    div-long/2addr v0, v5

    .line 44
    sub-long/2addr v3, v0

    .line 45
    long-to-int p1, v3

    .line 46
    rem-int/lit8 v0, p1, 0xf

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "process module remainTime = "

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    const/4 v0, 0x0

    .line 68
    if-gez p1, :cond_2

    .line 69
    .line 70
    iget-object v1, p0, Ll/d880;->l:Ll/kcg0;

    .line 71
    .line 72
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/d880;->j:Ll/s680;

    .line 76
    .line 77
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_TIME_OUT:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->setExtra(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o0(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    iget-object v1, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 97
    .line 98
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o0(I)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object v1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_3

    .line 108
    .line 109
    const/16 v1, 0xa

    .line 110
    .line 111
    if-gt p1, v1, :cond_3

    .line 112
    .line 113
    iget-object v1, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 114
    .line 115
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->l0(I)V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-object v1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPunishing()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_4

    .line 125
    .line 126
    const/16 v1, 0x14

    .line 127
    .line 128
    if-gt p1, v1, :cond_4

    .line 129
    .line 130
    iget-object v1, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->j0(Z)V

    .line 133
    .line 134
    .line 135
    :cond_4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ll/vwt;->V4()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_5

    .line 152
    .line 153
    int-to-long v0, p1

    .line 154
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ll/vwt;->U4()J

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    cmp-long p1, v0, v2

    .line 163
    .line 164
    if-gtz p1, :cond_5

    .line 165
    .line 166
    new-instance p1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v0, "winTimesTag on:"

    .line 169
    .line 170
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Ll/vwt;->V4()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v0, ",showTagBeforeEnd:"

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Ll/vwt;->U4()J

    .line 194
    .line 195
    .line 196
    move-result-wide v0

    .line 197
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    const-string v0, "LivePkConstant"

    .line 205
    .line 206
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object p0, p0, Ll/d880;->j:Ll/s680;

    .line 210
    .line 211
    invoke-virtual {p0}, Ll/s680;->d4()V

    .line 212
    .line 213
    .line 214
    :cond_5
    :goto_1
    return-void
.end method

.method public static synthetic J3(Ll/d880;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->r4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/d880;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d880;->i4()V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isFollowForbidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H4:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, ""

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic N3(Ll/d880;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d880;->q4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/d880;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d880;->p4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic R3(Ll/d880;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d880;->C4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic S3(Ll/d880;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->n4(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/d880;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->k4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic U3(Ll/d880;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d880;->c4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic V3(Ll/d880;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d880;->o4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/d880;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->s4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic X3(Ll/d880;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->l4(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/d880;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->j4(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "pk_punish_motion"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b4(Ll/d880;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/d880;->m4(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V

    return-void
.end method

.method private c4(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "addPkMotion path="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/d880;->m:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/xxh0;->a()Ll/xxh0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1, p1}, Ll/xxh0;->b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    new-instance v0, Ll/k210;

    .line 35
    .line 36
    const/16 v1, 0x258

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/uzl;

    .line 46
    .line 47
    const/16 v0, 0x3e9

    .line 48
    .line 49
    invoke-interface {p0, v0, p1}, Ll/uzl;->B(ILl/wxh0;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method private i4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 9
    .line 10
    new-instance v1, Ll/t780;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/t780;-><init>(Ll/d880;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 20
    .line 21
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "onlive"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "e_pk_gotoliveroom_button"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Ll/d880;->j:Ll/s680;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v1, v2}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ll/dw40;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 73
    .line 74
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Ll/dw40;

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/oo2;->o0()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ll/dw40;

    .line 96
    .line 97
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Ll/dw40;

    .line 110
    .line 111
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 116
    .line 117
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Ll/dw40;

    .line 128
    .line 129
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method private synthetic o4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method private synthetic p4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object p1, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/jfv;

    .line 8
    .line 9
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/d880;->h4(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->s(ZLcom/p1/mobile/putong/data/User;Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private synthetic q4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/d880;->m:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/d880;->m:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/d880;->c4(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public A4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d4(J)V
    .locals 3

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Ll/g980;->n()Ll/g980;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v2, Ll/r780;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/r780;-><init>(Ll/d880;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0, p1, p2, v2}, Ll/g980;->k(Ljava/lang/String;JLl/y20;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public e4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d880;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    iput-object v0, p0, Ll/d880;->m:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f4(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, v0, v1}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "live_pk_main"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Ll/d880;->j:Ll/s680;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {v0, p1}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object p1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Ll/dw40;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    const-string v9, "live_pk_main"

    .line 77
    .line 78
    const/4 v4, 0x1

    .line 79
    const-string v5, "liveRoom"

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    invoke-virtual/range {v1 .. v9}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance v0, Ll/l780;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/l780;-><init>(Ll/d880;)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Ll/u780;

    .line 104
    .line 105
    invoke-direct {p0}, Ll/u780;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public g4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/n780;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/n780;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/o780;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/o780;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/p780;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/p780;-><init>(Ll/d880;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/q780;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/q780;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public h4(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Followship;->isFollowed(Lcom/p1/mobile/putong/data/Followship;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d880;->h4(Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->s(ZLcom/p1/mobile/putong/data/User;Z)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/jfv;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic m4(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 2

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;->getUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;->getPoints()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;->getUserId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;->getContributionsList()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    .line 54
    .line 55
    .line 56
    move-result-object p5

    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;->getUserId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p5, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->userId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p5, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->name:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;->getImage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p5, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->image:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;->getPoint()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    iput-wide v0, p5, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->point:J

    .line 80
    .line 81
    if-eqz p0, :cond_0

    .line 82
    .line 83
    invoke-interface {p3, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    invoke-interface {p4, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 6
    .line 7
    iget-object v0, p0, Ll/d880;->l:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d880;->j:Ll/s680;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ha80;->S3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d880;->u4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/jfv;->g()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/y780;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/y780;-><init>(Ll/d880;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/z780;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/z780;-><init>(Ll/d880;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/a880;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/a880;-><init>(Ll/d880;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/dw40;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/b880;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/b880;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/c880;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/c880;-><init>(Ll/d880;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/m780;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/m780;-><init>(Ll/d880;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public t4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public u4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;->getPkId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 24
    .line 25
    invoke-static {}, Ll/g980;->n()Ll/g980;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;->getMotionId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->getPkMvpGrade()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    new-instance p1, Ll/r780;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Ll/r780;-><init>(Ll/d880;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0, v2, v3, p1}, Ll/g980;->k(Ljava/lang/String;JLl/y20;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public v4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d880;->j:Ll/s680;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/s680;->c4()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Q()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/d880;->l:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/d880;->m:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public w4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v4, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v5, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v6, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->userPoints:Ljava/util/List;

    .line 27
    .line 28
    new-instance v1, Ll/v780;

    .line 29
    .line 30
    move-object v2, p0

    .line 31
    invoke-direct/range {v1 .. v6}, Ll/v780;-><init>(Ll/d880;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, v2, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    iget-object p0, v2, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->points:Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->userId:Ljava/util/List;

    .line 54
    .line 55
    iput-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->point:Ljava/util/List;

    .line 56
    .line 57
    :cond_1
    iget-object p0, v2, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 58
    .line 59
    iget-object p1, v2, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Y(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, v2, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 69
    .line 70
    const/4 v9, 0x0

    .line 71
    const/4 v10, 0x0

    .line 72
    const/4 v8, 0x0

    .line 73
    move-object v7, v6

    .line 74
    move-object v6, v5

    .line 75
    move-object v5, p0

    .line 76
    invoke-virtual/range {v5 .. v10}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->W(Ljava/util/List;Ljava/util/List;ZZZ)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public x4(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/dw40;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isSameStatus(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isUnknown()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Ll/d880;->g4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iput-object p2, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPreparing()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 61
    .line 62
    iget-object v1, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p3, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->R(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZZ)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v0, 0x0

    .line 68
    .line 69
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-direct {p0, p1}, Ll/d880;->C4(Ljava/lang/Long;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Ll/d880;->B4()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/d880;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 80
    .line 81
    invoke-static {p2, p0, p3}, Ll/n180;->p(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    :cond_3
    :goto_0
    return-void
.end method

.method public y4(Ll/x20;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ua:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 16
    .line 17
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/bri0;

    .line 21
    .line 22
    invoke-direct {v2, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Ll/d880;->t4()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/d880;->j:Ll/s680;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/s680;->U3()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iget-object p0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {v0, v1, p0}, Ll/vwt;->g5(IZ)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public z4()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 9
    .line 10
    new-instance v1, Ll/w780;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/w780;-><init>(Ll/d880;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 32
    .line 33
    const/16 v3, 0x258

    .line 34
    .line 35
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iget-object v4, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v4, "live"

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Ll/dw40;

    .line 59
    .line 60
    invoke-virtual {v4}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v5, p0, Ll/d880;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 67
    .line 68
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-static {p0, v4, v5, v3}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "pkAnchor"

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    const-string v3, "pk"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 95
    .line 96
    new-instance v4, Ll/x780;

    .line 97
    .line 98
    invoke-direct {v4, p0}, Ll/x780;-><init>(Ll/d880;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v3, v0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->jumpToOtherRoom(Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
