.class public abstract Ll/mq2;
.super Ll/l4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P::",
        "Lcom/google/protobuf/q;",
        ">",
        "Ll/l4w<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ljava/lang/Boolean;

.field public c:Ll/zod;

.field public d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public e:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/l4w;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "no_care"

    .line 5
    .line 6
    iput-object v0, p0, Ll/mq2;->a:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    iput-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object p1, p0, Ll/mq2;->c:Ll/zod;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/protobuf/q;Ll/pq60;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mq2;->g(Lcom/google/protobuf/q;Ll/pq60;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mq2;->v()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mq2;->s()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public abstract b()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TP;>;"
        }
    .end annotation
.end method

.method public d(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)Lcom/google/protobuf/q;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->hasData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mq2;->b()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getData()Lcom/google/protobuf/Any;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Ll/qq60;->b(Ljava/lang/Class;Lcom/google/protobuf/Any;)Lcom/google/protobuf/q;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_COMMON:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/google/protobuf/q;Ll/pq60;)V
    .locals 1

    .line 1
    iget-object p1, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p2, Ll/pq60;->b:Lcom/google/protobuf/q;

    .line 8
    .line 9
    sget-object v0, Ll/p1w;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, v0}, Ll/mq2;->y(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/mq2;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Ljava/lang/String;
    .locals 0
    .param p1    # Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->messageUserId:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const-string p0, ""

    .line 14
    .line 15
    return-object p0
.end method

.method public final j(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Ll/mq2;->k(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public k(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 4

    .line 1
    const/16 v0, 0x22

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getValue()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    if-nez v3, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUsername()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-string p0, ""

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUsername()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p3, ":"

    .line 40
    .line 41
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_0
    new-instance p3, Landroid/text/SpannableStringBuilder;

    .line 49
    .line 50
    new-instance v3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getValue()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-direct {p3, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    new-instance p0, Landroid/text/style/AbsoluteSizeSpan;

    .line 73
    .line 74
    sget p2, Ll/e810;->a:I

    .line 75
    .line 76
    invoke-direct {p0, p2, v2}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-virtual {p3, p0, v1, p2, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage(Z)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    filled-new-array {p3}, [Landroid/text/SpannableStringBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSpan(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    sget p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->NORMAL_CHAT_CATEGORY:I

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/mq2;->c:Ll/zod;

    .line 118
    .line 119
    invoke-static {p1, p3, p0}, Ll/j3w;->b(Ljava/lang/String;ILl/zod;)V

    .line 120
    .line 121
    .line 122
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 123
    .line 124
    sget-object p2, Ll/zrv;->e:Landroid/app/Application;

    .line 125
    .line 126
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->r7:I

    .line 127
    .line 128
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-direct {p0, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    new-instance p2, Landroid/text/style/AbsoluteSizeSpan;

    .line 136
    .line 137
    sget p3, Ll/e810;->a:I

    .line 138
    .line 139
    invoke-direct {p2, p3, v2}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    invoke-virtual {p0, p2, v1, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage(Z)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    sget p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->NORMAL_CHAT_CATEGORY:I

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    filled-new-array {p0}, [Landroid/text/SpannableStringBuilder;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSpan(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0
.end method

.method public l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 10

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, -0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object/from16 v6, p6

    .line 10
    .line 11
    move-object/from16 v7, p7

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v9}, Ll/mq2;->m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Ll/mq2;->j(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/zod;->d()Ll/m500;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p3}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p4, "template \u4e3a\u7a7a \uff01\uff01\uff01\uff01\uff01 ID = "

    .line 23
    .line 24
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p4, "[err]"

    .line 35
    .line 36
    invoke-static {p4, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2, p3}, Ll/mq2;->j(Ljava/lang/String;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 45
    .line 46
    invoke-virtual {p3}, Ll/zod;->d()Ll/m500;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    if-nez p4, :cond_2

    .line 51
    .line 52
    const-wide/16 v1, 0x0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-wide v1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->grade:J

    .line 56
    .line 57
    :goto_0
    new-instance v3, Ll/hzc0;

    .line 58
    .line 59
    invoke-direct {v3}, Ll/hzc0;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v4, p0, Ll/mq2;->c:Ll/zod;

    .line 63
    .line 64
    invoke-virtual {v4}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    iput-object v4, v3, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 69
    .line 70
    iput-object p5, v3, Ll/hzc0;->b:Ljava/lang/String;

    .line 71
    .line 72
    iput-wide v1, v3, Ll/hzc0;->c:J

    .line 73
    .line 74
    iput-object p1, v3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 75
    .line 76
    invoke-virtual {p0, p1, p7}, Ll/mq2;->i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v3, Ll/hzc0;->i:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p4, :cond_3

    .line 83
    .line 84
    iget-object p0, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userIdentity:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_3

    .line 91
    .line 92
    iget-object p0, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userIdentity:Ljava/lang/String;

    .line 93
    .line 94
    iput-object p0, v3, Ll/hzc0;->k:Ljava/lang/String;

    .line 95
    .line 96
    :cond_3
    if-eqz p7, :cond_5

    .line 97
    .line 98
    iget-object p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceGiftItems:Ljava/util/List;

    .line 99
    .line 100
    iput-object p0, v3, Ll/hzc0;->h:Ljava/util/List;

    .line 101
    .line 102
    iget-object p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserId:Ljava/lang/String;

    .line 103
    .line 104
    iput-object p0, v3, Ll/hzc0;->g:Ljava/lang/String;

    .line 105
    .line 106
    iget p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceFollowSource:I

    .line 107
    .line 108
    iput p0, v3, Ll/hzc0;->e:I

    .line 109
    .line 110
    iget-boolean p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isVoiceCallApplyMessage:Z

    .line 111
    .line 112
    iput-boolean p0, v3, Ll/hzc0;->j:Z

    .line 113
    .line 114
    iget-object p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 115
    .line 116
    if-eqz p0, :cond_4

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 119
    .line 120
    iput-object p0, v3, Ll/hzc0;->f:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    invoke-static {p6, v0, p7}, Ll/f7t;->g(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v0}, Ll/f7t;->x(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iput-object p0, p7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonScene:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p1, :cond_5

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserIdentity()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iput-object p0, v3, Ll/hzc0;->k:Ljava/lang/String;

    .line 138
    .line 139
    :cond_5
    if-nez p1, :cond_6

    .line 140
    .line 141
    const/4 p0, 0x0

    .line 142
    goto :goto_1

    .line 143
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    :goto_1
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    iget p5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->category:I

    .line 152
    .line 153
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget-object p5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->format:Ljava/util/List;

    .line 158
    .line 159
    invoke-virtual {p3, p6, p5, v3}, Ll/m500;->e(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSpan(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    iget-object p3, v3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 168
    .line 169
    if-eqz p3, :cond_7

    .line 170
    .line 171
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 172
    .line 173
    .line 174
    move-result-object p3

    .line 175
    if-eqz p3, :cond_7

    .line 176
    .line 177
    iget-object p3, v3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 178
    .line 179
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getTraceInfo()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result p3

    .line 191
    if-nez p3, :cond_7

    .line 192
    .line 193
    iget-object p3, v3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 194
    .line 195
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 196
    .line 197
    .line 198
    move-result-object p3

    .line 199
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getTraceInfo()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p3

    .line 203
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->traceJson:Ljava/lang/String;

    .line 204
    .line 205
    :cond_7
    const/4 p3, -0x1

    .line 206
    if-eq p9, p3, :cond_8

    .line 207
    .line 208
    invoke-virtual {p0, p9}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 209
    .line 210
    .line 211
    :cond_8
    if-eqz p7, :cond_9

    .line 212
    .line 213
    invoke-virtual {p0, p7}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setExtInfo(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 214
    .line 215
    .line 216
    :cond_9
    if-eqz p4, :cond_a

    .line 217
    .line 218
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setUser(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 219
    .line 220
    .line 221
    :cond_a
    if-eqz p1, :cond_b

    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getSeq()J

    .line 224
    .line 225
    .line 226
    move-result-wide p3

    .line 227
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSeq(J)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getChatShadingConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 231
    .line 232
    .line 233
    move-result-object p3

    .line 234
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setChatShadeConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getCreatedTime()J

    .line 238
    .line 239
    .line 240
    move-result-wide p3

    .line 241
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCreateTime(J)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getPreSeq()J

    .line 245
    .line 246
    .line 247
    move-result-wide p3

    .line 248
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setPreSeq(J)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getPreTimestamp()J

    .line 252
    .line 253
    .line 254
    move-result-wide p3

    .line 255
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setPreMessageTime(J)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserIdentity()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p3

    .line 262
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setUserIdentity(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_b
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, p8}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSharedVoiceLiveInfo(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;)V

    .line 269
    .line 270
    .line 271
    if-eqz p1, :cond_d

    .line 272
    .line 273
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->hasExtInfo()Z

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    if-eqz p2, :cond_d

    .line 278
    .line 279
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getGroupControl()Z

    .line 284
    .line 285
    .line 286
    move-result p3

    .line 287
    if-eqz p3, :cond_c

    .line 288
    .line 289
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getGroupType()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p3

    .line 293
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLiveMessageType(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    :cond_c
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getColorfulMode()Z

    .line 297
    .line 298
    .line 299
    move-result p2

    .line 300
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setOpenGradientFlow(Z)V

    .line 301
    .line 302
    .line 303
    :cond_d
    if-eqz p1, :cond_e

    .line 304
    .line 305
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getValue()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p2

    .line 309
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setMessageContent(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getSource()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->source:Ljava/lang/String;

    .line 317
    .line 318
    :cond_e
    return-object p0
.end method

.method public n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/mq2;->o(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public o(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 5
    .line 6
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 17
    .line 18
    .line 19
    move-object v10, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v10, v0

    .line 22
    :goto_0
    if-nez p4, :cond_1

    .line 23
    .line 24
    :goto_1
    move-object v11, v0

    .line 25
    goto :goto_2

    .line 26
    :cond_1
    invoke-virtual/range {p4 .. p4}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_1

    .line 31
    :goto_2
    const/4 v7, 0x0

    .line 32
    move-object v6, p0

    .line 33
    move-object v8, p1

    .line 34
    move/from16 v9, p2

    .line 35
    .line 36
    move-object/from16 v12, p5

    .line 37
    .line 38
    move-object/from16 v13, p6

    .line 39
    .line 40
    invoke-virtual/range {v6 .. v13}, Ll/mq2;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final p(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "no_care"

    .line 2
    .line 3
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public abstract q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p3}, Ll/mq2;->p(Ljava/lang/String;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 32
    .line 33
    invoke-virtual {p3}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 38
    .line 39
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, p3, p1}, Ll/mq2;->p(Ljava/lang/String;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/mq2;->c:Ll/zod;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2}, Ll/mq2;->p(Ljava/lang/String;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_0

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_0
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/zod;->b()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/mq2;->e:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zod;->b()Lrx/subjects/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/mq2;->e:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/mq2;->e:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/zod;->c()Ll/cxl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/mq2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/mq2;->c:Ll/zod;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zod;->c()Ll/cxl;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/mq2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/cxl;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/mq2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/mq2;->u()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mq2;->t()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public w(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TP;",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TP;",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public y(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/mq2;
    .locals 2

    .line 1
    invoke-virtual {p0, p2, p3}, Ll/mq2;->q(Lcom/google/protobuf/q;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "ObserverHandler="

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", message="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "[live]msg_observer_handler"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/mq2;->f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/mq2;->e()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0, p1, p2, p3}, Ll/mq2;->w(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Ll/mq2;->e:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 79
    .line 80
    invoke-virtual {p0, p1, p2, p3}, Ll/mq2;->x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Ll/mq2;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 85
    .line 86
    :cond_1
    return-object p0
.end method
