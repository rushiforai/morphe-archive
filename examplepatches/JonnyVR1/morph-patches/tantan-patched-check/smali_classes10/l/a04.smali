.class public Ll/a04;
.super Ll/z44;
.source "SourceFile"


# instance fields
.field public k:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/n54;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/z44;-><init>(Ll/dum;Ll/n54;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private J4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/a04;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z44;->j:Ll/n54;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/qvd;->h()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/z44;->j:Ll/n54;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/n54;->Z3()Ll/qvd;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/qvd;->i()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/th0$a;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-direct {v2, v3}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget v3, Ll/n9c0;->p0:I

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    sget v4, Ll/n9c0;->X0:I

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    new-instance v3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v4, "switchToVideo no videoCall"

    .line 53
    .line 54
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    if-nez v1, :cond_0

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 v4, 0x0

    .line 64
    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-static {v3}, Ll/g64;->d(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->F1:I

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 85
    .line 86
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v2, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->q2:I

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    new-instance v3, Ll/tz3;

    .line 105
    .line 106
    invoke-direct {v3, p0, v0}, Ll/tz3;-><init>(Ll/a04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G1:I

    .line 118
    .line 119
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 124
    .line 125
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v2, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D1:I

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 150
    .line 151
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 152
    .line 153
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v2, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->s2:I

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/uz3;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/uz3;-><init>(Ll/a04;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 177
    .line 178
    .line 179
    :goto_1
    invoke-virtual {v2}, Ll/th0$a;->a()Ll/th0;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public static synthetic n4(Ll/a04;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->y4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic o4(Ll/a04;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a04;->x4()V

    return-void
.end method

.method public static synthetic p4(Ll/a04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a04;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q4(Ll/a04;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->C4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic r4(Ll/a04;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->z4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s4(Ll/a04;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->B4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic t4(Ll/a04;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->A4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic u4(Ll/a04;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a04;->E4(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic B4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Long;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->V1:I

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Ll/a04;->w4(ZI)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic D4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a04;->G4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final F4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->U3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/yz3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/yz3;-><init>(Ll/a04;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/zz3;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/zz3;-><init>(Ll/a04;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public G4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->j6(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/wz3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wz3;-><init>(Ll/a04;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/xz3;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/xz3;-><init>(Ll/a04;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final H4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 9

    .line 1
    invoke-static {p1}, Ll/u54;->n(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-static {p1}, Ll/u54;->m(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1}, Ll/u54;->o(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/a04;->k:Ll/kcg0;

    .line 23
    .line 24
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V1:I

    .line 28
    .line 29
    invoke-virtual {p0, v2, p1}, Ll/a04;->w4(ZI)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->M6:I

    .line 34
    .line 35
    invoke-virtual {p0, v1, p1}, Ll/a04;->w4(ZI)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    long-to-double v3, v3

    .line 44
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 45
    .line 46
    long-to-double v5, v5

    .line 47
    const-wide v7, 0x412e848000000000L    # 1000000.0

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    div-double/2addr v5, v7

    .line 53
    sub-double/2addr v3, v5

    .line 54
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/vwt;->T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->videoCancel:Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;

    .line 63
    .line 64
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->interval:I

    .line 65
    .line 66
    mul-int/lit16 p1, p1, 0x3e8

    .line 67
    .line 68
    int-to-double v5, p1

    .line 69
    cmpl-double p1, v3, v5

    .line 70
    .line 71
    if-ltz p1, :cond_3

    .line 72
    .line 73
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V1:I

    .line 74
    .line 75
    invoke-virtual {p0, v1, p1}, Ll/a04;->w4(ZI)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 80
    .line 81
    check-cast p1, Ll/n44;

    .line 82
    .line 83
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/vwt;->T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->videoCancel:Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->title:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, v2, v0}, Ll/n44;->p(ZLjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Ll/vwt;->T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->videoCancel:Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;

    .line 107
    .line 108
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->interval:I

    .line 109
    .line 110
    mul-int/lit16 p1, p1, 0x3e8

    .line 111
    .line 112
    double-to-int v0, v3

    .line 113
    sub-int/2addr p1, v0

    .line 114
    invoke-virtual {p0, p1}, Ll/a04;->I4(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public I4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a04;->k:Ll/kcg0;

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
    div-int/lit16 p1, p1, 0x3e8

    .line 11
    .line 12
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/sz3;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/sz3;-><init>(Ll/a04;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/a04;->k:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method

.method public S3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/z44;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/a04;->k:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public U3()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->r2:I

    .line 27
    .line 28
    iget-object v0, v0, Ll/h64;->b:Ljava/lang/String;

    .line 29
    .line 30
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public W3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-static {v0}, Ll/u54;->n(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 10
    .line 11
    invoke-static {v0}, Ll/u54;->m(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 18
    .line 19
    invoke-static {v0}, Ll/u54;->o(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-direct {p0}, Ll/a04;->J4()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/a04;->v4()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/z44;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/a04;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final v4()V
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
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q1:I

    .line 16
    .line 17
    new-instance v2, Ll/vz3;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/vz3;-><init>(Ll/a04;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I1:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public w4(ZI)V
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/n44;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p1, p0}, Ll/n44;->p(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a04;->F4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
