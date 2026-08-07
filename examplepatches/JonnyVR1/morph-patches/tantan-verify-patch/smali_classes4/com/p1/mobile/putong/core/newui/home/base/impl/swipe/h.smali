.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/a0g;->N()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/a0g;->K()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 30
    .line 31
    iget-object p0, p0, Ll/r4a;->i:Ll/byd0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Long;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmp-long v0, v0, v2

    .line 46
    .line 47
    if-lez v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    const-wide/16 v4, 0xa

    .line 54
    .line 55
    rem-long/2addr v0, v4

    .line 56
    cmp-long p0, v0, v2

    .line 57
    .line 58
    if-nez p0, :cond_0

    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "repeatPictureDlg"

    .line 67
    .line 68
    invoke-static {p0, v0}, Ll/a0g;->S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    invoke-static {}, Ll/gra;->G2()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_1

    .line 76
    .line 77
    invoke-static {}, Ll/gra;->H2()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 86
    .line 87
    if-eq p0, v0, :cond_2

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 90
    .line 91
    if-ne p0, v0, :cond_3

    .line 92
    .line 93
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-nez p0, :cond_3

    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    iget-object p0, p0, Ll/dkb;->W6:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 112
    .line 113
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_3

    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 122
    .line 123
    iget-object p0, p0, Ll/dkb;->W6:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 124
    .line 125
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->isGetSumPopCount:Z

    .line 126
    .line 127
    if-eqz p0, :cond_3

    .line 128
    .line 129
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-eqz p0, :cond_3

    .line 138
    .line 139
    invoke-static {}, Ll/joa;->n4()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_3

    .line 144
    .line 145
    invoke-static {}, Ll/joa;->M3()Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-nez p0, :cond_3

    .line 150
    .line 151
    invoke-static {}, Ll/joa;->G3()Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_3

    .line 156
    .line 157
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 162
    .line 163
    iget p0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->netPictureSwipeLimit:I

    .line 164
    .line 165
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 168
    .line 169
    iget-object v0, v0, Ll/r4a;->i:Ll/byd0;

    .line 170
    .line 171
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Ljava/lang/Long;

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 178
    .line 179
    .line 180
    move-result-wide v0

    .line 181
    int-to-long v2, p0

    .line 182
    cmp-long p0, v0, v2

    .line 183
    .line 184
    if-ltz p0, :cond_3

    .line 185
    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    const-string p1, "swipeLimitDlg"

    .line 193
    .line 194
    invoke-static {p0, p1}, Ll/a0g;->S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    const/4 p0, 0x1

    .line 198
    return p0

    .line 199
    :cond_3
    const/4 p0, 0x0

    .line 200
    return p0
.end method
