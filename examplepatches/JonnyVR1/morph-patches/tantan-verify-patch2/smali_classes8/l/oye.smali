.class public Ll/oye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qbm;


# instance fields
.field public final a:Ll/yxz;

.field public final b:Ll/tvz;

.field public c:I


# direct methods
.method public constructor <init>(Ll/yxz;Ll/tvz;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/oye;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/oye;->a:Ll/yxz;

    .line 8
    .line 9
    iput-object p2, p0, Ll/oye;->b:Ll/tvz;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ll/oye;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oye;->h()Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/oye;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oye;->i(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b()Lrx/c;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mye;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mye;-><init>(Ll/oye;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/nye;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/nye;-><init>(Ll/oye;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final e()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oye;->b:Ll/tvz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final f(Ljava/util/List;Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/oye;->e()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/oye;->e()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move-object v0, v1

    .line 32
    :goto_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x0

    .line 37
    if-nez v2, :cond_2

    .line 38
    .line 39
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->aEmojiIceBreakingNoReplyTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 52
    .line 53
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 56
    .line 57
    iget-object v5, v4, Lcom/p1/mobile/putong/core/api/g;->N0:Ll/vxd0;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/g;->M0:Ll/byd0;

    .line 60
    .line 61
    invoke-static {}, Ll/h39;->v()Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    iget v6, v6, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;->max_times_of_showing_recommend_sticker_b:I

    .line 66
    .line 67
    invoke-virtual {p0, v2, v5, v4, v6}, Ll/oye;->g(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;I)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->A2()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    const/4 v2, 0x4

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    move v2, v3

    .line 82
    :goto_1
    if-nez v2, :cond_7

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_7

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->A2()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_7

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->aEmojiIceBreakingMessageTimeLimitTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 97
    .line 98
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 101
    .line 102
    iget-object v5, v4, Lcom/p1/mobile/putong/core/api/g;->P0:Ll/vxd0;

    .line 103
    .line 104
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/g;->O0:Ll/byd0;

    .line 105
    .line 106
    invoke-static {}, Ll/h39;->v()Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    iget v6, v6, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;->max_times_of_showing_recommend_sticker_c:I

    .line 111
    .line 112
    invoke-virtual {p0, v0, v5, v4, v6}, Ll/oye;->g(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;I)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-nez p0, :cond_4

    .line 123
    .line 124
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_4

    .line 129
    .line 130
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 135
    .line 136
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 137
    .line 138
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 143
    .line 144
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 145
    .line 146
    cmpl-double p0, v0, v4

    .line 147
    .line 148
    if-lez p0, :cond_3

    .line 149
    .line 150
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 155
    .line 156
    :goto_2
    move-object v1, p0

    .line 157
    goto :goto_3

    .line 158
    :cond_3
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-nez p0, :cond_5

    .line 170
    .line 171
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    move-object v1, p0

    .line 176
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_5
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-nez p0, :cond_6

    .line 184
    .line 185
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    move-object v1, p0

    .line 190
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 191
    .line 192
    :cond_6
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    if-eqz p0, :cond_7

    .line 197
    .line 198
    invoke-static {}, Ll/pzi0;->o()J

    .line 199
    .line 200
    .line 201
    move-result-wide p0

    .line 202
    long-to-double p0, p0

    .line 203
    iget-wide v0, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 204
    .line 205
    sub-double/2addr p0, v0

    .line 206
    invoke-static {}, Ll/h39;->v()Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    iget p2, p2, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;->max_days_since_last_message:I

    .line 211
    .line 212
    int-to-long v0, p2

    .line 213
    const-wide/32 v3, 0x5265c00

    .line 214
    .line 215
    .line 216
    mul-long/2addr v0, v3

    .line 217
    long-to-double v0, v0

    .line 218
    cmpl-double p0, p0, v0

    .line 219
    .line 220
    if-lez p0, :cond_7

    .line 221
    .line 222
    const/4 p0, 0x5

    .line 223
    return p0

    .line 224
    :cond_7
    return v2
.end method

.method public final g(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;I)Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/oye;->b:Ll/tvz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-long p0, p0

    .line 12
    const-wide/16 v0, 0x3e8

    .line 13
    .line 14
    mul-long/2addr p0, v0

    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {p0, p1, v0, v1}, Ll/pzi0;->C(JJ)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/lang/Long;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {}, Ll/pzi0;->o()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 p3, 0x1

    .line 42
    const/4 v0, 0x0

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-ge p1, p4, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move p1, v0

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    move p1, p3

    .line 61
    :goto_1
    if-nez p0, :cond_2

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    return p3

    .line 66
    :cond_2
    return v0
.end method

.method public final synthetic h()Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    iget-object v1, p0, Ll/oye;->b:Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 24
    .line 25
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 26
    .line 27
    iget-object v2, p0, Ll/oye;->b:Ll/tvz;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object p0, p0, Ll/oye;->b:Ll/tvz;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, v2, p0}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public handle()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oye;->a:Ll/yxz;

    .line 2
    .line 3
    iget p0, p0, Ll/oye;->c:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/yxz;->g5(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final synthetic i(Ll/pf60;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    invoke-static {}, Ll/h39;->k()Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->NONE:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 14
    .line 15
    if-eq v1, v2, :cond_3

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, Ll/oye;->b:Ll/tvz;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 36
    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->TEXT_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 40
    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_0
    invoke-static {}, Ll/h39;->G()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Ll/oye;->f(Ljava/util/List;Ljava/util/List;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/oye;->j(Ljava/util/List;Ljava/util/List;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    :goto_0
    iput p1, p0, Ll/oye;->c:I

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const/4 p0, 0x0

    .line 66
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    :goto_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 72
    .line 73
    return-object p0
.end method

.method public final j(Ljava/util/List;Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 v0, 0x0

    .line 20
    if-nez p0, :cond_2

    .line 21
    .line 22
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 33
    .line 34
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 35
    .line 36
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 41
    .line 42
    iget-wide v1, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 43
    .line 44
    cmpl-double p0, p0, v1

    .line 45
    .line 46
    if-lez p0, :cond_2

    .line 47
    .line 48
    :cond_1
    const/4 p0, 0x3

    .line 49
    return p0

    .line 50
    :cond_2
    return v0
.end method
