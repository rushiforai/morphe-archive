.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c;
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

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com"

    .line 11
    .line 12
    :goto_0
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/friendship-test/index.html?speed=true&_bid=1004496&hideNavigationBar=1&hideNotch=1&pageFrom=introduce_card"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    const/4 v6, 0x1

    .line 19
    const/4 v7, 0x0

    .line 20
    const-string v3, ""

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    move-object v2, p0

    .line 24
    invoke-static/range {v2 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object p0, p0, Ll/dkb;->C4:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-gez p0, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    iget-object p0, p0, Ll/dkb;->D4:Ll/jxd0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    return v0

    .line 46
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->l2:Ll/cf7;

    .line 49
    .line 50
    iget v1, p0, Ll/cf7;->T:I

    .line 51
    .line 52
    const/4 v2, 0x5

    .line 53
    const/4 v3, 0x1

    .line 54
    if-lt v1, v2, :cond_2

    .line 55
    .line 56
    move v1, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v1, v0

    .line 59
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    invoke-virtual {p0, v4, v5}, Ll/cf7;->a3(J)J

    .line 64
    .line 65
    .line 66
    move-result-wide v4

    .line 67
    const-wide/16 v6, 0x1388

    .line 68
    .line 69
    cmp-long p0, v4, v6

    .line 70
    .line 71
    if-ltz p0, :cond_3

    .line 72
    .line 73
    move p0, v3

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    move p0, v0

    .line 76
    :goto_1
    if-nez v1, :cond_4

    .line 77
    .line 78
    if-eqz p0, :cond_6

    .line 79
    .line 80
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    new-instance v1, Ll/l8l$c;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/l8l$c;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    const-string v2, "\u597d\u53cb\u9ed8\u5951\u5927\u6d4b\u8bd5"

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ll/l8l$c;->s(Ljava/lang/String;)Ll/l8l$c;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-string v2, "\u8ba9\u670b\u53cb\u731c\u731c\u54ea\u4e9b\u4f1a\u662f\u4f60\u559c\u6b22\u7684\u4eba"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ll/l8l$c;->r(Ljava/lang/String;)Ll/l8l$c;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "\u53bb\u770b\u770b"

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Ll/l8l$c;->n(Ljava/lang/String;)Ll/l8l$c;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkNCWTRSNFBYSDM3WEIyTURHQUc3RFpRVU9DM0w1SzE0IiwidyI6NTY1LCJoIjo2MzcsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMjM1NDA0Nzk1NjAzOTAyMTk0NH0.webp"

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ll/l8l$c;->p(Ljava/lang/String;)Ll/l8l$c;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v2, "FFFE7E1D"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ll/l8l$c;->m(Ljava/lang/String;)Ll/l8l$c;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    new-instance v2, Ll/gaj;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/gaj;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ll/l8l$c;->l(Ljava/lang/Runnable;)Ll/l8l$c;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    const-string v2, "p_friendship_test_popup"

    .line 137
    .line 138
    invoke-virtual {v1, v2}, Ll/l8l$c;->q(Ljava/lang/String;)Ll/l8l$c;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    const-string v2, "e_friendship_test_popup_enter"

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Ll/l8l$c;->o(Ljava/lang/String;)Ll/l8l$c;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Ll/l8l$c;->k()Ll/l8l;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_5

    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    sget-object v4, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->FRIEND_TACIT:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 167
    .line 168
    const/16 v5, 0x4e20

    .line 169
    .line 170
    invoke-virtual {v2, v4, p0, v1, v5}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_5
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-static {v1}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {p0, v1}, Ll/cl80;->q(Ll/al80;)V

    .line 183
    .line 184
    .line 185
    :goto_2
    iput-boolean v3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 190
    .line 191
    iget-object p0, p0, Ll/dkb;->C4:Ll/byd0;

    .line 192
    .line 193
    invoke-static {}, Ll/pzi0;->o()J

    .line 194
    .line 195
    .line 196
    move-result-wide v1

    .line 197
    const-wide/32 v3, 0x5265c00

    .line 198
    .line 199
    .line 200
    add-long/2addr v1, v3

    .line 201
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 211
    .line 212
    iget-object p0, p0, Ll/dkb;->D4:Ll/jxd0;

    .line 213
    .line 214
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 215
    .line 216
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    :cond_6
    return v0
.end method
