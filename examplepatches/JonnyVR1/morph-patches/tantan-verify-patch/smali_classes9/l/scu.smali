.class public Ll/scu;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    new-instance p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 10
    .line 11
    const-string v0, "system"

    .line 12
    .line 13
    invoke-direct {p3, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;->getContent()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->setContent(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->setTemplateId(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 7

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/zod;->d()Ll/m500;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p3, v2}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0, p3}, Ll/f7t;->A(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    iget-object v0, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iget-object v0, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p3, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;->setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 48
    .line 49
    :goto_0
    move-object v3, p3

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    iget-object v0, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;->setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 72
    .line 73
    invoke-static {p3}, Ll/f7t;->x(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonScene:Ljava/lang/String;

    .line 78
    .line 79
    move-object v3, v0

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    invoke-static {p3}, Ll/f7t;->x(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonScene:Ljava/lang/String;

    .line 92
    .line 93
    :cond_2
    const/4 p3, 0x0

    .line 94
    goto :goto_0

    .line 95
    :goto_1
    const/4 v4, 0x0

    .line 96
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    move-object v0, p0

    .line 101
    move-object v1, p1

    .line 102
    invoke-virtual/range {v0 .. v5}, Ll/mq2;->n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 107
    .line 108
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.live.systemMsg"

    .line 2
    .line 3
    return-object p0
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
    const-string p0, "live.voiceRoom.systemMessage"

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/scu;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic w(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/scu;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/scu;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSystemMessage;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p1, "no_care"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p1, p1}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
