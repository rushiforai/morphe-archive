.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k1;
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k1;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k1;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

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
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/uih0;->z0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 17
    .line 18
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->a()Lcom/p1/mobile/putong/core/api/e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e0;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    return v0

    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 61
    .line 62
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 63
    .line 64
    if-eq p0, v1, :cond_2

    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 73
    .line 74
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVipCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 75
    .line 76
    if-eq p0, v1, :cond_2

    .line 77
    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->SeeSuggestCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 87
    .line 88
    if-eq p0, v1, :cond_2

    .line 89
    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 97
    .line 98
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 99
    .line 100
    if-eq p0, v1, :cond_2

    .line 101
    .line 102
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->FakeCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 111
    .line 112
    if-ne p0, v1, :cond_3

    .line 113
    .line 114
    :cond_2
    return v0

    .line 115
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 116
    .line 117
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_7

    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_7

    .line 134
    .line 135
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_4

    .line 146
    .line 147
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 154
    .line 155
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 156
    .line 157
    if-eq p0, v1, :cond_7

    .line 158
    .line 159
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 166
    .line 167
    const-string v1, "-145"

    .line 168
    .line 169
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_7

    .line 174
    .line 175
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 176
    .line 177
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 178
    .line 179
    if-ne p0, v0, :cond_5

    .line 180
    .line 181
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {p0}, Ll/uih0;->Y0()V

    .line 186
    .line 187
    .line 188
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 189
    .line 190
    if-ne p0, v0, :cond_6

    .line 191
    .line 192
    const-string p0, "left"

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_6
    const-string p0, "right"

    .line 196
    .line 197
    :goto_0
    const-string p1, "is_which_direction"

    .line 198
    .line 199
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    filled-new-array {p0}, [Ll/pf60;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    const-string p1, "e_new_user_guide_to_swipe_right"

    .line 208
    .line 209
    const-string v0, "p_suggest_users_home_view"

    .line 210
    .line 211
    invoke-static {p1, v0, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 212
    .line 213
    .line 214
    const/4 p0, 0x1

    .line 215
    return p0

    .line 216
    :cond_7
    return v0
.end method
