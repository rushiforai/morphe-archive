.class public Ll/snm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

.field public c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public d:Ljava/lang/Boolean;

.field public e:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/snm;->d:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object v0, p0, Ll/snm;->e:Ljava/lang/Boolean;

    .line 9
    .line 10
    iput-object p1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Ll/snm;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/snm;->n(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic j(Ll/snm;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/snm;->m(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/kec0;->p4:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget-object p3, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p3, :cond_1

    .line 18
    .line 19
    iget-object p3, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 24
    .line 25
    .line 26
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 27
    .line 28
    if-eqz p3, :cond_1

    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/snm;->b:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 45
    .line 46
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 47
    .line 48
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-nez p3, :cond_0

    .line 53
    .line 54
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    if-ge p2, p3, :cond_0

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 69
    .line 70
    iput-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Ll/snm;->b:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 81
    .line 82
    iget-object p2, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 83
    .line 84
    iget-object p3, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 85
    .line 86
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 87
    .line 88
    invoke-virtual {p1, p2, p0, p3}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->v(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 10

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-eq p1, p2, :cond_1

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p2, 0x1

    .line 13
    :goto_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v0, p0, Ll/snm;->e:Ljava/lang/Boolean;

    .line 16
    .line 17
    iget-object v1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_4

    .line 24
    .line 25
    iget-object v1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    iget-object v1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_4

    .line 48
    .line 49
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 50
    .line 51
    if-ne p1, v1, :cond_2

    .line 52
    .line 53
    const-string p1, "left"

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_2
    if-ne p1, v1, :cond_3

    .line 57
    .line 58
    const-string p1, "right"

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    const-string p1, "up"

    .line 62
    .line 63
    :goto_2
    iget-object v1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "receiver_user_id"

    .line 74
    .line 75
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "remainingtimes"

    .line 88
    .line 89
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    const-string v1, "love_sign_content"

    .line 94
    .line 95
    const-string v2, ""

    .line 96
    .line 97
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    const-string v1, "swipe_directions"

    .line 102
    .line 103
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-static {}, Ll/upm;->Q()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    const-string v1, "signal_resource"

    .line 116
    .line 117
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/pzi0;->o()J

    .line 127
    .line 128
    .line 129
    move-result-wide v1

    .line 130
    iget-object v8, p0, Ll/snm;->b:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    .line 131
    .line 132
    iget-wide v8, v8, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->u:J

    .line 133
    .line 134
    sub-long/2addr v1, v8

    .line 135
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const-string v1, "accept_duration"

    .line 143
    .line 144
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    filled-new-array/range {v3 .. v8}, [Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v1, "e_love_signal_card"

    .line 153
    .line 154
    const-string v2, "p_suggest_users_home_view"

    .line 155
    .line 156
    invoke-static {v1, v2, p1}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 157
    .line 158
    .line 159
    :cond_4
    invoke-static {}, Ll/gra;->L1()Z

    .line 160
    .line 161
    .line 162
    if-eqz p2, :cond_6

    .line 163
    .line 164
    iget-object p1, p0, Ll/snm;->d:Ljava/lang/Boolean;

    .line 165
    .line 166
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-nez p1, :cond_5

    .line 171
    .line 172
    iget-object p1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p1}, Ll/upm;->E(Lcom/p1/mobile/android/app/Act;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_7

    .line 183
    .line 184
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 185
    .line 186
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_7

    .line 191
    .line 192
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 195
    .line 196
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_7

    .line 201
    .line 202
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 203
    .line 204
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-eqz p1, :cond_7

    .line 215
    .line 216
    iget-object p1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 217
    .line 218
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    if-eqz p1, :cond_7

    .line 223
    .line 224
    iget-object p1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 233
    .line 234
    iget-object v0, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 235
    .line 236
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {p2, v0}, Ll/f49;->v3(Ljava/lang/String;)Lrx/c;

    .line 245
    .line 246
    .line 247
    move-result-object p2

    .line 248
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    new-instance p2, Ll/onm;

    .line 253
    .line 254
    invoke-direct {p2, p0}, Ll/onm;-><init>(Ll/snm;)V

    .line 255
    .line 256
    .line 257
    new-instance v0, Ll/pnm;

    .line 258
    .line 259
    invoke-direct {v0}, Ll/pnm;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 263
    .line 264
    .line 265
    move-result-object p2

    .line 266
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 267
    .line 268
    .line 269
    goto :goto_3

    .line 270
    :cond_5
    iput-object v0, p0, Ll/snm;->d:Ljava/lang/Boolean;

    .line 271
    .line 272
    invoke-virtual {p0}, Ll/snm;->l()V

    .line 273
    .line 274
    .line 275
    goto :goto_3

    .line 276
    :cond_6
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 277
    .line 278
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    if-eqz p1, :cond_7

    .line 283
    .line 284
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 285
    .line 286
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 287
    .line 288
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    if-eqz p1, :cond_7

    .line 293
    .line 294
    iget-object p1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 295
    .line 296
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 297
    .line 298
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    if-eqz p1, :cond_7

    .line 307
    .line 308
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 309
    .line 310
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 311
    .line 312
    iget-object p2, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 313
    .line 314
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 315
    .line 316
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {p1, p2}, Ll/f49;->Y3(Ljava/lang/String;)Lrx/c;

    .line 323
    .line 324
    .line 325
    :cond_7
    :goto_3
    iget-object p0, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 326
    .line 327
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 328
    .line 329
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 330
    .line 331
    .line 332
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 333
    .line 334
    invoke-static {p0}, Ll/upm;->J(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 335
    .line 336
    .line 337
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 338
    .line 339
    return-object p0
.end method

.method public final l()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object p0, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->userId:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v8, 0x0

    .line 20
    const/16 v9, 0x22

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const/4 v5, 0x0

    .line 24
    const/4 v6, 0x0

    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-static/range {v2 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic m(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/snm;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->matched:Z

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/snm;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    iget-object v1, p0, Ll/snm;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance v0, Ll/qnm;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/qnm;-><init>(Ll/snm;)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ll/rnm;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/rnm;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    const-string p0, "\u5bf9\u65b9\u4fe1\u53f7\u6ce2\u52a8\uff0c\u6682\u65f6\u65e0\u6cd5\u63a5\u6536"

    .line 76
    .line 77
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
