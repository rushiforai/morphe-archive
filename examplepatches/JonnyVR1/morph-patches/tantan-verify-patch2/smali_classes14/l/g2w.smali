.class public abstract Ll/g2w;
.super Ll/m4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/google/protobuf/q;",
        ">",
        "Ll/m4w<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m4w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/protobuf/q;Ll/pq60;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    iget-object v2, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->hasPush()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    iget-object v2, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessage;->new_()Lcom/p1/mobile/putong/data/PushMessage;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/m4w;->c()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1, p2}, Ll/g2w;->h(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/g2w;->g(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 54
    .line 55
    .line 56
    return v1

    .line 57
    :cond_1
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-interface {p0}, Ll/exl;->b()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessage;->new_()Lcom/p1/mobile/putong/data/PushMessage;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v2, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/m4w;->c()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0, v0, p2, p1}, Ll/g2w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->hasPush()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    iget-object p1, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_2

    .line 117
    .line 118
    invoke-virtual {p0, v0, p2}, Ll/g2w;->h(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    invoke-virtual {p0, v0}, Ll/g2w;->g(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 122
    .line 123
    .line 124
    return v1

    .line 125
    :cond_3
    return v0
.end method

.method public g(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessage;->toJson()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const-string v1, "longlink"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0, v1}, Ll/cmb0;->w(Ljava/lang/String;ZLjava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;)V
    .locals 3

    .line 1
    iget-object p0, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getReqId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getLink()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessageCustomMap()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessageCustomMap()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    .line 42
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 51
    .line 52
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    :goto_0
    new-instance v0, Ljava/util/HashMap;

    .line 60
    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    :goto_1
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getValue()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getValue()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getValue()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getValue()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getSilent()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getSilentAggregation()Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getStackId()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    iput p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 119
    .line 120
    new-instance p2, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 121
    .line 122
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getId()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 136
    .line 137
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getType()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 148
    .line 149
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 150
    .line 151
    new-instance v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getParent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getId()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getParent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getType()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iput-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getCreateTime()J

    .line 189
    .line 190
    .line 191
    move-result-wide v0

    .line 192
    long-to-double v0, v0

    .line 193
    iput-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getPriority()I

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    iput p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getPrimaryPicture()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 206
    .line 207
    return-void
.end method

.method public abstract populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PushMessage;",
            "Ll/pq60;",
            "TT;)V"
        }
    .end annotation
.end method
