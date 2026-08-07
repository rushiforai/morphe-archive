.class public Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    return-void
.end method

.method private setLeave(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->f:Lv/VText;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m6q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(J)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long p1, p1, v0

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->setLeave(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p1, 0x1

    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->setLeave(Z)V

    .line 21
    .line 22
    .line 23
    const-string p0, "\u5339\u914d\u5df2\u89e3\u9664\uff0c\u5bf9\u65b9\u5df2\u7ecf\u79bb\u5f00\u4e86\u5bf9\u8bdd"

    .line 24
    .line 25
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/n100;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_b

    .line 15
    .line 16
    if-eqz p2, :cond_b

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 21
    .line 22
    if-eqz v0, :cond_b

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto/16 :goto_5

    .line 31
    .line 32
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 35
    .line 36
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    .line 54
    .line 55
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 65
    .line 66
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 75
    .line 76
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 77
    .line 78
    xor-int/2addr v2, v1

    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string v0, "heartbeat_notify"

    .line 94
    .line 95
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 100
    .line 101
    const-string v3, "\u53d1\u9001\u6d88\u606f\u5373\u53ef\u89e3\u9501\u9650\u65f6"

    .line 102
    .line 103
    const/4 v4, 0x0

    .line 104
    if-eqz p1, :cond_5

    .line 105
    .line 106
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 107
    .line 108
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 109
    .line 110
    if-eqz p1, :cond_3

    .line 111
    .line 112
    const-string p1, "\u5feb\u53bb\u6253\u4e2a\u62db\u547c\u5427\uff5e"

    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_4

    .line 122
    .line 123
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 124
    .line 125
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->Z2:I

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_4
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 135
    .line 136
    :goto_1
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_5
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 140
    .line 141
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 142
    .line 143
    if-eqz p1, :cond_8

    .line 144
    .line 145
    const/4 p1, 0x2

    .line 146
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 147
    .line 148
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitMatch()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_7

    .line 153
    .line 154
    if-eqz v2, :cond_6

    .line 155
    .line 156
    const-string p1, "\u4e3b\u52a8\u56de\u5e94\u5373\u53ef\u89e3\u9664\u9650\u65f6\uff0c\u5feb\u548c\u5979\u804a\u804a\u5427\uff01"

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_6
    const-string p1, "\u4e3b\u52a8\u56de\u5e94\u5373\u53ef\u89e3\u9664\u9650\u65f6\uff0c\u5feb\u548c\u4ed6\u804a\u804a\u5427\uff01"

    .line 160
    .line 161
    :goto_2
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_7
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_8
    const-string p1, "\u6253\u62db\u547c\u6210\u529f"

    .line 168
    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->g:Ljava/lang/String;

    .line 170
    .line 171
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 172
    .line 173
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->e:Landroid/view/View;

    .line 174
    .line 175
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 179
    .line 180
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 181
    .line 182
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 183
    .line 184
    double-to-long v2, v2

    .line 185
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 186
    .line 187
    const-string v0, "default"

    .line 188
    .line 189
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-eqz p1, :cond_9

    .line 198
    .line 199
    invoke-static {}, Ll/pzi0;->o()J

    .line 200
    .line 201
    .line 202
    move-result-wide v5

    .line 203
    cmp-long p1, v2, v5

    .line 204
    .line 205
    if-lez p1, :cond_9

    .line 206
    .line 207
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-eqz p1, :cond_9

    .line 212
    .line 213
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 214
    .line 215
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 216
    .line 217
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 218
    .line 219
    double-to-long v2, v2

    .line 220
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->b(J)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->f:Lv/VText;

    .line 225
    .line 226
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 230
    .line 231
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 232
    .line 233
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 234
    .line 235
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 236
    .line 237
    double-to-long v2, v2

    .line 238
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->e(Ljava/lang/String;J)V

    .line 239
    .line 240
    .line 241
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->setLeave(Z)V

    .line 242
    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_9
    const/4 p1, 0x3

    .line 246
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 247
    .line 248
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->setLeave(Z)V

    .line 249
    .line 250
    .line 251
    :goto_4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-eqz p1, :cond_a

    .line 256
    .line 257
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 258
    .line 259
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-eqz p1, :cond_a

    .line 264
    .line 265
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 266
    .line 267
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 268
    .line 269
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-eqz p1, :cond_a

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 284
    .line 285
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 286
    .line 287
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 288
    .line 289
    invoke-interface {p1, p2}, Ll/r97;->i1(Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    :cond_a
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->d(Ll/n100;I)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_b
    :goto_5
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->setLeave(Z)V

    .line 298
    .line 299
    .line 300
    return-void
.end method

.method public final d(Ll/n100;I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "HEARTBEAT_NOTIFY_MV_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string p1, "receiver_user_id"

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->h:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->i:I

    .line 50
    .line 51
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v0, "love_sign_chat_guide"

    .line 56
    .line 57
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "signal_resource"

    .line 62
    .line 63
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    filled-new-array {p1, p0, p2}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "e_chat_love_signal"

    .line 76
    .line 77
    const-string p2, "p_chat_view"

    .line 78
    .line 79
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final e(Ljava/lang/String;J)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "message_heartbeat_countdown_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c0$a;->c(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p2}, Ll/r97;->u()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    const-wide/16 p2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-wide/16 p2, 0x3c

    .line 58
    .line 59
    :goto_0
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 64
    .line 65
    .line 66
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->b:Lv/VImage;

    .line 32
    .line 33
    sget v1, Ll/ibc0;->B0:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->c:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/g9c0;->g:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->d:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget v2, Ll/g9c0;->i:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->f:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget v1, Ll/g9c0;->i:I

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->b(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotifyNewUi;->f:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
