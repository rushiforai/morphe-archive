.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final TAG:Ljava/lang/String; = "OnlineMatchPushUser"


# instance fields
.field public action:Ljava/lang/String;

.field public age:Ljava/lang/String;

.field public avatarUrl:Ljava/lang/String;

.field public birthday:J

.field public biz:Ljava/lang/String;

.field public broadcastId:Ljava/lang/String;

.field public city:Ljava/lang/String;

.field public createTime:J

.field public distance:I

.field public fitReason:Ljava/lang/String;

.field public friendPurpose:Ljava/lang/String;

.field public fromUser:Z

.field public gender:Ljava/lang/String;

.field public gid:Ljava/lang/String;

.field public historyBroadcastTime:J

.field public isAudioBroadcast:Z

.field public isBell:Z

.field public isGreet:Z

.field public isMaleQuickChatRing:Z

.field public isSpeedMatch:Z

.field public isSquareDataWrapper:Z

.field public isUserInSquare:Z

.field public matchPercent:I

.field public matchTopic:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public oneside:Z

.field public poolID:Ljava/lang/String;

.field public queryToken:Ljava/lang/String;

.field public radioType:Ljava/lang/String;

.field public rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

.field public ruleKey:Ljava/lang/String;

.field public secretKey:Ljava/lang/String;

.field public showTime:J

.field public stage:Ljava/lang/String;

.field public timeRemaining:I

.field public tracker:Ljava/lang/String;

.field public user:Lcom/p1/mobile/putong/data/User;

.field public userId:Ljava/lang/String;

.field public userTagList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation
.end field

.field public zodiacFitPercent:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->timeRemaining:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->historyBroadcastTime:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->showTime:J

    .line 12
    .line 13
    const-string v0, "unknown_"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public isFemale()Z
    .locals 1

    .line 1
    const-string v0, "female"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public transDataFromPush(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->queryToken:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->poolID:Ljava/lang/String;

    .line 36
    .line 37
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 38
    .line 39
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->birthday:J

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->broadcastId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gid:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->ruleKey:Ljava/lang/String;

    .line 52
    .line 53
    new-instance v1, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    const-string v2, ""

    .line 67
    .line 68
    if-nez v1, :cond_0

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 71
    .line 72
    new-instance v3, Lcom/p1/mobile/putong/data/Tag;

    .line 73
    .line 74
    iget-object v4, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {v3, v2, v4}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_1

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 91
    .line 92
    new-instance v3, Lcom/p1/mobile/putong/data/Tag;

    .line 93
    .line 94
    iget-object v4, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {v3, v2, v4}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-nez v1, :cond_2

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 111
    .line 112
    new-instance v3, Lcom/p1/mobile/putong/data/Tag;

    .line 113
    .line 114
    iget-object v4, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 115
    .line 116
    invoke-direct {v3, v2, v4}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 123
    .line 124
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    .line 125
    .line 126
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isGreet:Z

    .line 127
    .line 128
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_7

    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    const/4 v2, 0x1

    .line 142
    const/4 v3, -0x1

    .line 143
    sparse-switch v1, :sswitch_data_0

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :sswitch_0
    const-string v1, "quickchat.oneside"

    .line 148
    .line 149
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-nez p1, :cond_3

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_3
    const/4 v3, 0x3

    .line 157
    goto :goto_0

    .line 158
    :sswitch_1
    const-string v1, "voicechat.broadcast"

    .line 159
    .line 160
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-nez p1, :cond_4

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_4
    const/4 v3, 0x2

    .line 168
    goto :goto_0

    .line 169
    :sswitch_2
    const-string v1, "quickchat.bell"

    .line 170
    .line 171
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-nez p1, :cond_5

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_5
    move v3, v2

    .line 179
    goto :goto_0

    .line 180
    :sswitch_3
    const-string v1, "quickchat.speed-push"

    .line 181
    .line 182
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-nez p1, :cond_6

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_6
    const/4 v3, 0x0

    .line 190
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :pswitch_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 195
    .line 196
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->stage:Ljava/lang/String;

    .line 197
    .line 198
    const-string v1, "answer"

    .line 199
    .line 200
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isGreet:Z

    .line 205
    .line 206
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->biz:Ljava/lang/String;

    .line 209
    .line 210
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->oneside:Z

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :pswitch_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :pswitch_2
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 217
    .line 218
    goto :goto_1

    .line 219
    :pswitch_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSpeedMatch:Z

    .line 220
    .line 221
    :cond_7
    :goto_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 222
    .line 223
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 224
    .line 225
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 226
    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->matchTopic:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {}, Ll/pzi0;->o()J

    .line 230
    .line 231
    .line 232
    move-result-wide v1

    .line 233
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->createTime:J

    .line 234
    .line 235
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 236
    .line 237
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 238
    .line 239
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 240
    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 242
    .line 243
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 244
    .line 245
    const-string v1, "male"

    .line 246
    .line 247
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 252
    .line 253
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 254
    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->fitReason:Ljava/lang/String;

    .line 256
    .line 257
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 258
    .line 259
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->zodiacFitPercent:Ljava/lang/String;

    .line 260
    .line 261
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 262
    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->friendPurpose:Ljava/lang/String;

    .line 264
    .line 265
    return-void

    .line 266
    nop

    .line 267
    :sswitch_data_0
    .sparse-switch
        -0x6714f457 -> :sswitch_3
        -0x1661b974 -> :sswitch_2
        -0xeeb9ca3 -> :sswitch_1
        0x28625e94 -> :sswitch_0
    .end sparse-switch

    .line 268
    .line 269
    .line 270
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public transDataFromUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->createTime:J

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 61
    .line 62
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 63
    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 65
    .line 66
    return-void
.end method
