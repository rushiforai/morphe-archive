.class public Ll/pzn;
.super Ll/txs;
.source "SourceFile"


# instance fields
.field public f:Ll/kcg0;

.field public final g:Ll/b8o;

.field public h:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Ll/b8o;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/pzn;->h:Z

    .line 6
    .line 7
    iput-object p3, p0, Ll/pzn;->g:Ll/b8o;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Q2(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzn;->h3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    return-void
.end method

.method public static synthetic R2(Ll/pzn;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->d3(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic S2(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    return-void
.end method

.method public static synthetic T2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "square-multi-call"

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

.method public static synthetic U2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fm3;->i:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    return-object p0
.end method

.method public static synthetic V2(Ll/pzn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->f3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic W2(Ll/pzn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->e3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X2(Ll/pzn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->g3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Y2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->a7()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic a3(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzn;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "square-intlGame"

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

.method private c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V
    .locals 5

    .line 1
    if-lez p3, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x2

    .line 18
    const/4 v1, 0x3

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, -0x1

    .line 22
    sparse-switch p2, :sswitch_data_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :sswitch_0
    const-string p2, "liveIcon"

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_1
    const-string p2, "guild"

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v4, v0

    .line 47
    goto :goto_0

    .line 48
    :sswitch_2
    const-string p2, "redDot"

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    move v4, v3

    .line 58
    goto :goto_0

    .line 59
    :sswitch_3
    const-string p2, "number"

    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v4, v2

    .line 69
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :pswitch_0
    aget p0, p1, v2

    .line 74
    .line 75
    add-int/2addr p0, v3

    .line 76
    aput p0, p1, v2

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_1
    aget p0, p1, v1

    .line 80
    .line 81
    add-int/2addr p0, p3

    .line 82
    aput p0, p1, v1

    .line 83
    .line 84
    return-void

    .line 85
    :pswitch_2
    aget p0, p1, v0

    .line 86
    .line 87
    add-int/2addr p0, v3

    .line 88
    aput p0, p1, v0

    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_3
    aget p0, p1, v3

    .line 92
    .line 93
    add-int/2addr p0, p3

    .line 94
    aput p0, p1, v3

    .line 95
    .line 96
    :cond_5
    :goto_1
    return-void

    .line 97
    :sswitch_data_0
    .sparse-switch
        -0x3da724b7 -> :sswitch_3
        -0x37b9c108 -> :sswitch_2
        0x5e23bf3 -> :sswitch_1
        0x547b0b85 -> :sswitch_0
    .end sparse-switch

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private m3()Z
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bk3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bk3;->a:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    return p0
.end method

.method private n3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/mqr;->j()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/fm3;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/fm3;->d()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/y6u;->b()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method


# virtual methods
.method public T()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/fk3;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/fk3;->h()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/itd0;->c:Ll/itd0;

    .line 21
    .line 22
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ll/gm3;

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/gm3;->d()Lrx/subjects/a;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v3, p0, Ll/pzn;->g:Ll/b8o;

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/b8o;->l()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    new-instance v4, Ll/czn;

    .line 39
    .line 40
    invoke-direct {v4}, Ll/czn;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v2, v3, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v0, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v2, Ll/gzn;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/gzn;-><init>(Ll/pzn;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Ll/hzn;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Ll/hzn;-><init>(Ll/pzn;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/y6u;->t()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ll/gm3;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v2, Ll/izn;

    .line 98
    .line 99
    invoke-direct {v2, p0}, Ll/izn;-><init>(Ll/pzn;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/vwt;->j6()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/4 v2, 0x1

    .line 116
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v2, Ll/jzn;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/jzn;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    :cond_0
    invoke-static {}, Ll/mbs;->v()Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v2, Ll/kzn;

    .line 145
    .line 146
    invoke-direct {v2}, Ll/kzn;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v2, Ll/lzn;

    .line 154
    .line 155
    invoke-direct {v2}, Ll/lzn;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v2, Ll/mzn;

    .line 163
    .line 164
    invoke-direct {v2, p0}, Ll/mzn;-><init>(Ll/pzn;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Ll/gm3;

    .line 179
    .line 180
    invoke-virtual {v0}, Ll/gm3;->b()Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/nzn;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/nzn;-><init>(Ll/pzn;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final synthetic d3(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 4
    .line 5
    invoke-static {}, Ll/y6u;->t()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/pzn;->q3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic e3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p1, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/fm3;

    .line 8
    .line 9
    iget-object p1, p1, Ll/fm3;->i:Ll/jxd0;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic g3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p1, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/fk3;->i()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic h3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 4
    .line 5
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 6
    .line 7
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->voiceLiveTextRedDot:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->voiceLiveTextRedDot:Ljava/util/List;

    .line 12
    .line 13
    iget p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentUnReadCon:I

    .line 14
    .line 15
    iput p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentUnReadCon:I

    .line 16
    .line 17
    iget-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentRedDotType:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->momentRedDotType:Ljava/lang/String;

    .line 20
    .line 21
    sget-object p2, Ll/itd0;->c:Ll/itd0;

    .line 22
    .line 23
    invoke-static {p2}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Ll/gm3;

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/gm3;->h()Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic i3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzn;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j3()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->needShowActivitiesRedDot()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final k3()Z
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fm3;->i:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/vwt;->a7()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pzn;->f:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;[I)V
    .locals 4

    .line 1
    const/4 p1, 0x3

    .line 2
    aget v0, p2, p1

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, -0x1

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v3, v3, v3, v0}, Ll/pzn;->t3(IIII)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 17
    .line 18
    aget p2, p2, v2

    .line 19
    .line 20
    invoke-static {p1, v0, p2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, v0, v1}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0, v3, v3, v3, v1}, Ll/pzn;->t3(IIII)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 39
    .line 40
    aget v1, p2, v2

    .line 41
    .line 42
    aget p1, p2, p1

    .line 43
    .line 44
    add-int/2addr v1, p1

    .line 45
    invoke-static {p0, v0, v1}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final p3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;[I)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    const/4 v2, -0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 11
    .line 12
    sub-int v4, v1, p1

    .line 13
    .line 14
    invoke-virtual {p0, v1, p1, v4, v2}, Ll/pzn;->t3(IIII)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 22
    .line 23
    aget p2, p2, v0

    .line 24
    .line 25
    invoke-static {p1, v1, p2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0, v1, v3}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0, v1, v2, v3, v2}, Ll/pzn;->t3(IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 44
    .line 45
    invoke-static {p1, v1, v3}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x2

    .line 49
    aget p1, p2, p1

    .line 50
    .line 51
    if-lez p1, :cond_1

    .line 52
    .line 53
    aget p1, p2, v0

    .line 54
    .line 55
    invoke-virtual {p0, p1, v2, v3, v2}, Ll/pzn;->t3(IIII)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1, v1, v0}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0, v1, v3}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0, v1, v3}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final q3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->requestVoiceRedDot()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ezn;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ezn;-><init>(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/fzn;

    .line 11
    .line 12
    invoke-direct {v2, p0, p1}, Ll/fzn;-><init>(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/pzn;->f:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public final r3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    filled-new-array {v0, v0, v0, v0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 7
    .line 8
    invoke-virtual {v2}, Ll/vwt;->gb()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->liveTabUnread:I

    .line 13
    .line 14
    invoke-direct {p0, v1, v2, v3}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 15
    .line 16
    .line 17
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/vwt;->s3()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 24
    .line 25
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->squareDetailUnread:I

    .line 26
    .line 27
    invoke-direct {p0, v1, v2, v3}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/pzn;->j3()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-direct {p0}, Ll/pzn;->m3()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const-string v4, "redDot"

    .line 39
    .line 40
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-direct {p0, v1, v5, v2}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 45
    .line 46
    .line 47
    const-string v5, "guild"

    .line 48
    .line 49
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    iget v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->guildLiveRedDot:I

    .line 54
    .line 55
    invoke-direct {p0, v1, v5, v6}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 56
    .line 57
    .line 58
    iget v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->guildLiveRedDot:I

    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    if-lez v5, :cond_0

    .line 62
    .line 63
    aget v5, v1, v6

    .line 64
    .line 65
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 66
    .line 67
    iget v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 68
    .line 69
    sub-int/2addr v5, v7

    .line 70
    if-nez v5, :cond_0

    .line 71
    .line 72
    iget-boolean v5, p0, Ll/pzn;->h:Z

    .line 73
    .line 74
    if-eqz v5, :cond_0

    .line 75
    .line 76
    iput-boolean v0, p0, Ll/pzn;->h:Z

    .line 77
    .line 78
    const-string v5, "square-multi-call"

    .line 79
    .line 80
    invoke-static {v5}, Ll/t4u;->p(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    iget-object v5, p0, Ll/pzn;->g:Ll/b8o;

    .line 84
    .line 85
    invoke-virtual {v5}, Ll/b8o;->h()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    new-instance v7, Ll/ozn;

    .line 90
    .line 91
    invoke-direct {v7}, Ll/ozn;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v5, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 99
    .line 100
    const-string v7, "number"

    .line 101
    .line 102
    if-nez v5, :cond_1

    .line 103
    .line 104
    invoke-static {v7}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    iget v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->guildLiveRedDot:I

    .line 109
    .line 110
    invoke-direct {p0, v1, v5, v8}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object v5, p0, Ll/pzn;->g:Ll/b8o;

    .line 114
    .line 115
    invoke-virtual {v5}, Ll/b8o;->h()Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    new-instance v8, Ll/dzn;

    .line 120
    .line 121
    invoke-direct {v8}, Ll/dzn;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {v5, v8}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 129
    .line 130
    if-eqz v5, :cond_5

    .line 131
    .line 132
    sget-object v8, Ll/itd0;->c:Ll/itd0;

    .line 133
    .line 134
    invoke-static {v8}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v8

    .line 138
    check-cast v8, Ll/gm3;

    .line 139
    .line 140
    invoke-virtual {v8}, Ll/gm3;->c()Ljava/lang/Boolean;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    if-eqz v8, :cond_2

    .line 145
    .line 146
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    goto :goto_0

    .line 151
    :cond_2
    sget-object v8, Ll/itd0;->e:Ll/itd0;

    .line 152
    .line 153
    invoke-static {v8}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    check-cast v8, Ll/fm3;

    .line 158
    .line 159
    iget-object v8, v8, Ll/fm3;->k:Ll/jxd0;

    .line 160
    .line 161
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    check-cast v8, Ljava/lang/Boolean;

    .line 166
    .line 167
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    if-eqz v8, :cond_3

    .line 172
    .line 173
    iget-boolean v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 174
    .line 175
    if-eqz v5, :cond_4

    .line 176
    .line 177
    :cond_3
    move v0, v6

    .line 178
    :cond_4
    :goto_0
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    invoke-direct {p0, v1, v5, v0}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 183
    .line 184
    .line 185
    :cond_5
    if-eqz v2, :cond_6

    .line 186
    .line 187
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 188
    .line 189
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Ll/fk3;

    .line 194
    .line 195
    const-string v2, "live_tab_red_dot"

    .line 196
    .line 197
    invoke-virtual {v0, v2}, Ll/fk3;->I(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_6
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-direct {p0, v1, v0, v3}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 205
    .line 206
    .line 207
    invoke-static {}, Ll/y6u;->t()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 212
    .line 213
    invoke-virtual {v2}, Ll/vwt;->V5()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-eqz v0, :cond_8

    .line 218
    .line 219
    if-eqz v2, :cond_7

    .line 220
    .line 221
    invoke-static {v7}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 226
    .line 227
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 228
    .line 229
    invoke-direct {p0, v1, v0, v2}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_7
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 238
    .line 239
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 240
    .line 241
    invoke-direct {p0, v1, v0, v2}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 242
    .line 243
    .line 244
    :goto_1
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->voiceLiveTextRedDot:Ljava/util/List;

    .line 249
    .line 250
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    xor-int/2addr v2, v6

    .line 255
    invoke-direct {p0, v1, v0, v2}, Ll/pzn;->c3([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 256
    .line 257
    .line 258
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->toJson()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0, p1, v1}, Ll/pzn;->p3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;[I)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p0, p1, v1}, Ll/pzn;->o3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;[I)V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public final s3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pzn;->k3()Z

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
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {p1, v0, v2}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0, v0, v1}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 33
    .line 34
    invoke-static {p1, v0, v1}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v0, v1}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;->showRedDot()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {p0}, Ll/pzn;->n3()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/pzn;->r3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final t3(IIII)V
    .locals 1

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fk3;->t()Ll/lc3;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/lc3;->b()Ll/lc3;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/lc3;->c(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/fk3;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/fk3;->R(Ll/lc3;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
